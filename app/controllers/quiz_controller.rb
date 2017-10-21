class QuizController < ApplicationController
  def index
    questionIndex = params[:questionIndex].present? ? params[:questionIndex] : "-1";

    questionIndex = questionIndex.to_i + 1;

    @presenter = presenter(questionIndex);
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
      :form => {
        :action => 'quiz'
      }
    };
  end

end