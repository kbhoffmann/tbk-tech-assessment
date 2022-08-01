class Calculator
  include Rates

  def initialize(property_price, term, down_payment, credit_score)
    @property_price = property_price
    @term = term
    @down_payment = down_payment
    @apy = Rates.rates(credit_score)
  end

  def monthly_payment
    if !@apy
      not_qualified
    else
      months_in_a_year = 12
      mortgage_length = months_in_a_year * @term
      principal_amount = @property_price - @down_payment
      monthly_interest = (principal_amount * (interest_rate / 100)) / months_in_a_year
      result = ((principal_amount / mortgage_length) + monthly_interest).round(2) || not_qualified unless interest_rate.nil?
    end
  end

  def not_qualified
    "unfortunately your credit needs improvement before you are eligible for a mortgage"
  end

  def interest_rate
    @apy == nil ? not_qualified : @apy
  end

  def total_interest(term, monthly_payment)
    return not_qualified unless monthly_payment.class == Float
    return not_qualified unless monthly_payment
    months_in_a_year = 12
    mortgage_length = months_in_a_year * term
    (monthly_payment * mortgage_length).round(2)
  end
end
