class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
    end

    create_table :options do |t|
      t.belongs_to :question, index: true
      t.string :text
    end
  end
end
