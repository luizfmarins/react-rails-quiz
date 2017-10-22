class ResultsController < ApplicationController

  def view
    questions = Question.all.collect {|q|
      questionHash = q.attributes;
      questionHash[:options] = q.options.collect {|o|
        optionsHash = o.attributes;
        optionsHash[:choiceNumber] = Answer.where(option_id: o.id).count
        optionsHash;
      };
      questionHash;
    };

    puts questions;

    @presenter = {:results => questions};
  end

end