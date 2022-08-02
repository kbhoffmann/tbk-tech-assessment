require "rails_helper"

RSpec.describe Rates, type: :service do
  describe "#rates" do
    it "returns rate based on okay or higher score" do
      expect(Rates.rates(699.1)).to eq(4.0)
      expect(Rates.rates(801)).to eq(2.8)
      expect(Rates.rates(799)).to eq(3.3)
      expect(Rates.rates(750)).to eq(3.3)
      expect(Rates.rates(749)).to eq(3.8)
      expect(Rates.rates(700)).to eq(3.8)
      expect(Rates.rates(699)).to eq(4.0)
      expect(Rates.rates(600)).to eq(4.0)
    end
    it "returns nil when poor credit score" do
      expect(Rates.rates(599)).to be_nil
    end
  end

  describe "#credit_score" do
    it "returns rating" do
      expect(Rates.credit_score(800)).to eq("excellent credit")
      expect(Rates.credit_score(750)).to eq("great credit")
      expect(Rates.credit_score(700)).to eq("good credit")
      expect(Rates.credit_score(600)).to eq("okay credit")
      expect(Rates.credit_score(599)).to eq("credit needs work")
    end
  end
end
