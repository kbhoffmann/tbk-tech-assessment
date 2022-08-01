require "rails_helper"

RSpec.describe Calculator, type: :service do
  let(:subject) { Calculator.new(property_price, term, down_payment, credit_score) }
  let(:property_price) { 500000 }
  let(:term) { 30 }
  let(:down_payment) { 100000 }
  let(:credit_score) { 700 }

  describe "#initalize" do
    it "creates its own calculate" do
      expect(subject).not_to be_nil
    end
  end

  describe "#not_qualified" do
    let!(:credit_score) { 200 }
    it "returns a string" do
      expect(subject.not_qualified).to eq("unfortunately your credit needs improvement before you are eligible for a mortgage")
    end
  end

  describe "#monthly_payment" do
    context "with above poor credit" do
      it "results return monthly payment" do
        expect(subject.monthly_payment).to eq(2377.67)
      end
    end

    context "with very poor credit" do
      let!(:credit_score) { 599 }
      it "results should return not_qualified" do
        expect(subject.monthly_payment).to eq("unfortunately your credit needs improvement before you are eligible for a mortgage")
      end
    end
  end

  describe "#total_interest" do
    context "monthly_payment exist" do
      let(:monthly_payment) { subject.monthly_payment }
      it "returns amount" do
        expect(subject.total_interest(term, monthly_payment)).to eq(855961.20)
      end
    end

    context "no monthly_payment" do
      let(:monthly_payment) { "this is a cat" }
      it "returns amount" do
        expect(subject.total_interest(term, monthly_payment)).to eq("unfortunately your credit needs improvement before you are eligible for a mortgage")
      end
    end

    context "monthly_payment is 0" do
      let(:monthly_payment) { 0 }
      it "returns amount" do
        expect(subject.total_interest(term, monthly_payment)).to eq("unfortunately your credit needs improvement before you are eligible for a mortgage")
      end
    end
  end

  describe "#mortgage_length" do
    context "mortgage_length exists" do
      let(:term) { 30 }
      it "calculates length of the mortgage" do
        expect(subject.mortgage_length).to eq(360)
      end
    end
  end
end
