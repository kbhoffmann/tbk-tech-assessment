module Rates
  EXCELLENT_LOW_END_SCORE = 800
  GREAT_LOW_END_SCORE = 750
  GOOD_LOW_END_SCORE = 700
  OKAY_LOW_END_SCORE = 600

  EXCELLENT_CREDIT_STRING = "excellent credit"
  GREAT_CREDIT_STRING = "great credit"
  GOOD_CREDIT_STRING = "good credit"
  OKAY_CREDIT_STRING = "okay credit"

  def Rates.credit_score(score)
    if score >= EXCELLENT_LOW_END_SCORE
      EXCELLENT_CREDIT_STRING
    elsif score >= GREAT_LOW_END_SCORE && score < EXCELLENT_LOW_END_SCORE
      GREAT_CREDIT_STRING
    elsif score >= GOOD_LOW_END_SCORE && score < GREAT_LOW_END_SCORE
      GOOD_CREDIT_STRING
    elsif score >= OKAY_LOW_END_SCORE && score < GOOD_LOW_END_SCORE
      OKAY_CREDIT_STRING
    else
      "credit needs work"
    end
  end

  def Rates.rates(score)
    credit = credit_score(score.floor)
    if credit == EXCELLENT_CREDIT_STRING
      2.8
    elsif credit == GREAT_CREDIT_STRING
      3.3
    elsif credit == GOOD_CREDIT_STRING
      3.8
    elsif credit == OKAY_CREDIT_STRING
      4.0
    else
      nil
    end
  end
end
