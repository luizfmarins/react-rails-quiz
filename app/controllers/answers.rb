class Answers

  def initialize()
    @answers = Hash.new
  end

  def setAnswer(questionIndex, answerId)
    @answers[questionIndex] = answerId;
  end
end