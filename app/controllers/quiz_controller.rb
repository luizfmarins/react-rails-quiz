class QuizController < ApplicationController
  def index
    @presenter = {
      :id => 'op1',
      :question => 'Option 1'
    }
  end
end