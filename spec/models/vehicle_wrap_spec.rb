require 'rails_helper'

RSpec.describe VehicleWrap, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:vehicle_type) }
    it { should validate_presence_of(:description) }
  end

  describe "associations", :association do
    it { should belong_to(:vehicle_type) }
    it { should have_many(:materials).class_name("VehicleWraps::Material") }
    it { should have_many(:supporting_materials).class_name("VehicleWraps::SupportingMaterial") }
    it { should have_many(:labours).class_name("VehicleWraps::Labour") }
    it { should have_many(:sundry_items).class_name("VehicleWraps::SundryItem") }
    it { should have_many(:job_specifications).class_name("VehicleWraps::JobSpecification") }
    it { should have_many(:mileages).class_name("VehicleWraps::Mileage") }
    it { should have_many(:account_managements).class_name("VehicleWraps::AccountManagement") }
    it { should have_many(:designs).class_name("VehicleWraps::Design") }
  end

  it { should delegate_method(:name).to(:vehicle_type).with_prefix }

  describe "price calculator" do
    it "#price_calculator" do
      vehicle_wrap = build_stubbed(:vehicle_wrap)
      expect(vehicle_wrap.price_calculator).to be_an_instance_of(PriceCalculator::VehicleWrap)
    end

    it { should delegate_method(:cost).to(:price_calculator) }
    it { should delegate_method(:envisage_price).to(:price_calculator) }
    it { should delegate_method(:envisage_trade_price).to(:price_calculator) }
    it { should delegate_method(:envisage_to_my_price).to(:price_calculator) }
    it { should delegate_method(:my_price).to(:price_calculator) }
  end
end
