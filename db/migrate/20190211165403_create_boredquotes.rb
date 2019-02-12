class CreateBoredquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :boredquotes do |t|
      t.string :author
      t.string :quote

      t.timestamps
    end
  end
end
