module Rates
  def Rates.credit_score(score)
    if score >= 800
      "excellent credit"
    elsif score >= 750 && score <= 799
      "great credit"
    elsif score >= 700 && score <= 749
      "good credit"
    elsif score >= 600 && score <= 699
      "okay credit"
    else
      "credit needs work"
    end
  end

  def Rates.rates(score)
    credit = credit_score(score.floor)
    if credit == "excellent credit"
      apy = 2.8
    elsif credit == "great credit"
      apy = 3.3
    elsif credit == "good credit"
      apy = 3.8
    elsif credit == "okay credit"
      apy = 4.0
    else
      apy = nil
    end
    apy
  end
end
