class CreateHappynews < ActiveRecord::Migration[5.2]
  def change
    create_table :happynews do |t|
      t.string :news_src
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
