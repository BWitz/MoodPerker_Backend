class CreateContentnews < ActiveRecord::Migration[5.2]
  def change
    create_table :contentnews do |t|
      t.string :news_src
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
