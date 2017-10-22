class PopulateQuestion < ActiveRecord::Migration
  def change
    for i in 1..5
      question = Question.create(text: "question #{i}");
      j = 1;
      while(j <= 2 or j <= i)
        questionText = "question #{i} - option #{j}";
        Option.create(text: questionText, question_id: question.id)
        j = j + 1;
      end
    end
  end
end