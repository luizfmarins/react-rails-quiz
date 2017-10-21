class QuizController < ApplicationController
  def index
    @presenter = {
      :quizOptions => [
        {
          :id => 'op1',
          :text => 'Option 1'
        },
        {
          :id => 'op2',
          :text => 'Option 2'
        }
      ]
    }
  end
end