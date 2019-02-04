class CreateSadimgs < ActiveRecord::Migration[5.2]
  def change
    create_table :sadimgs do |t|
      t.string :img_url
      t.integer :user_id

      t.timestamps
    end
  end
end
