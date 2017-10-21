class QuizController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    if (isFirstAccess())
      @presenter = presenter(0);
      session[:answers] = Answers.new;
    else
      questionIndex = params[:questionIndex].to_i;
      quizChoice = params[:quizOption];

      if (quizChoice.present?)
        updateAnswer(questionIndex, quizChoice);
        @presenter = presenter(questionIndex + 1);
      else
        @presenter = presenter(questionIndex);
      end
    end
  end

  def presenter(questionIndex)
    return {
      :quizQuestions => [
        {
          :quizOptions => [
            {
              :id => 'op1',
              :text => 'Option 1'
            },
            {
              :id => 'op2',
              :text => 'Option 2'
            }
          ]},
        {
          :quizOptions => [
            {
              :id => 'op3',
              :text => 'Option 3'
            },
            {
              :id => 'op4',
              :text => 'Option 4'
            }
          ]}
      ],
      :questionIndex => questionIndex,
      :isFinalQuestion => questionIndex === 1,
      :form => {
        :nextQuestionAction => 'quiz',
      }
    };
  end

  def create
    questionIndex = params[:questionIndex].to_i;
    quizChoice = params[:quizOption];

    if (quizChoice.present?)
      updateAnswer(questionIndex, quizChoice);

      session[:answers].persist()

      redirect_to '/results'
    else
      redirect_to quiz_path
    end
  end

  def updateAnswer(questionIndex, quizChoice)
    session[:answers].setAnswer(questionIndex, quizChoice);
  end

  def isFirstAccess()
    return !params[:questionIndex].present?;
  end
end