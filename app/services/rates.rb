module Rates
  SCORE_800 = 800
  SCORE_750 = 750
  SCORE_700 = 700
  SCORE_600 = 600

  EXCELLENT = "excellent credit"
  GREAT = "great credit"
  GOOD = "good credit"
  OKAY = "okay credit"

  def Rates.credit_score(score)
    if score >= SCORE_800
      EXCELLENT
    elsif score >= SCORE_750 && score < SCORE_800
      GREAT
    elsif score >= SCORE_700 && score < SCORE_750
      GOOD
    elsif score >= SCORE_600 && score < SCORE_700
      OKAY
    else
      "credit needs work"
    end
  end

  def Rates.rates(score)
    credit = credit_score(score.floor)
    if credit == EXCELLENT
      2.8
    elsif credit == GREAT
      3.3
    elsif credit == GOOD
      3.8
    elsif credit == OKAY
      4.0
    else
      nil
    end
  end
end
