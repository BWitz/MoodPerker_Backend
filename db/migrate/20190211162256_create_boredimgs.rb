class CreateBoredimgs < ActiveRecord::Migration[5.2]
  def change
    create_table :boredimgs do |t|
      t.string :img_url
      t.integer :user_id

      t.timestamps
    end
  end
end
