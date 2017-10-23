class QuizController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    if (userAlreadyAnswered())
      redirect_to '/results'
    elsif (isFirstAccess())
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
    questions = Question.all.collect {|q|
      questionHash = q.attributes;
      questionHash[:quizOptions] = q.options.collect {|o| o.attributes };
      questionHash;
    };

    return {
      :quizQuestions => questions,
      :questionIndex => questionIndex,
      :isFinalQuestion => questionIndex === questions.length - 1,
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

      cookies[:alreadyAnswered] = 'true'

      redirect_to '/results'
    else
      redirect_to action: "index", questionIndex: params[:questionIndex], quizOption: params[:quizOption]
    end
  end

  def updateAnswer(questionIndex, quizChoice)
    session[:answers].setAnswer(questionIndex, quizChoice);
  end

  def isFirstAccess()
    return !params[:questionIndex].present?;
  end

  def userAlreadyAnswered()
    return cookies[:alreadyAnswered].present?;
  end
end