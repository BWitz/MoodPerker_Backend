class CreateHappyquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :happyquotes do |t|
      t.string :author
      t.string :quote

      t.timestamps
    end
  end
end
