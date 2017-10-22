class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :option, index: true
    end
  end
end
