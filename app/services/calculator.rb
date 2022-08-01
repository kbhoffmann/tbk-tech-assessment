class Calculator
  include Rates

  attr_reader :property_price, :term, :down_payment, :apy
  
  def initialize(property_price, term, down_payment, credit_score)
    @property_price = property_price.to_i
    @term = term.to_i
    @down_payment = down_payment.to_i
    @apy = Rates.rates(credit_score.to_i)
  end

  MONTHS_IN_A_YEAR = 12

  def mortgage_length
    MONTHS_IN_A_YEAR * term
  end

  def principal_amount
    property_price - down_payment
  end

  def monthly_interest
    ((principal_amount * (interest_rate / 100)) / MONTHS_IN_A_YEAR).round(2)
  end

  def monthly_payment
    if !apy
      not_qualified
    else
      ((principal_amount / mortgage_length) + monthly_interest).round(2) || not_qualified unless interest_rate.nil?
    end
  end

  def not_qualified
    "unfortunately your credit needs improvement before you are eligible for a mortgage"
  end

  def interest_rate
    apy == nil ? not_qualified : apy
  end

  def total_interest(term, monthly_payment)
    return not_qualified unless monthly_payment.to_f.positive?
    (monthly_payment * mortgage_length).round(2)
  end
end
