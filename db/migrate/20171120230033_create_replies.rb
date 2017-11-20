class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :content
      t.timestamps
      t.references :tweet, foreign_key: true
    end
  end
end
