require "rails_helper"

describe ProjectPriceCalculator, type: :model do
  it "#brand_price" do
    print_jobs = [
      instance_double("print_job", brand_price: 5.57),
      instance_double("print_job", brand_price: 10.0)
    ]
    calc = ProjectPriceCalculator.new(print_jobs: print_jobs)

    expect(calc.brand_price).to eq(15.57)
  end

  it "#envisage_to_my_price" do
    print_jobs = [
      instance_double("print_job", envisage_to_my_price: 5.57),
      instance_double("print_job", envisage_to_my_price: 10.0)
    ]
    calc = ProjectPriceCalculator.new(print_jobs: print_jobs)

    expect(calc.envisage_to_my_price).to eq(15.57)

  end

end
