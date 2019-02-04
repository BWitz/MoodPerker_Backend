class CreateSadnews < ActiveRecord::Migration[5.2]
  def change
    create_table :sadnews do |t|
      t.string :news_src
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
