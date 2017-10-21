class Answers

  def initialize()
    @answers = Hash.new
  end

  def setAnswer(questionIndex, answerId)
    @answers[questionIndex] = answerId;
  end

  def persist
    @answers.each { |key, value|
      Answer.create({
                            :question_id => key,
                            :question_answer=> value
                          }
      );
    }
  end
end