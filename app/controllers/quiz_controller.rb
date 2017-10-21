class QuizController < ApplicationController

  def index
    if (isFirstAccess())
      @presenter = presenter(0);
      session[:answers] = Answers.new;
    else
      questionIndex = params[:questionIndex].to_i;
      quizChoice = params[:quizOption];

      session[:answers].setAnswer(questionIndex, quizChoice);
      @presenter = presenter(questionIndex+ 1);
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
      :isFinalQuestion => questionIndex === 5,
      :form => {
        :action => 'quiz'
      }
    };
  end

  def isFirstAccess()
    return !params[:questionIndex].present?;
  end
end