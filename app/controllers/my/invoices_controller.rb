class My::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.order(updated_at: :desc).page(params[:page]).per(50)
    @total = Invoice.pluck(:amount, :vat).flatten.reduce(0, :+)
    @invoice_search = InvoiceSearch.new
  end

  def update
    invoice = find_invoice
    invoice.update(invoice_params)
    redirect_to my_invoices_path(invoice.project_id), notice: "Invoice marked as paid"
  end

  private

  def find_invoice
    Invoice.friendly.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:paid)
  end
end
