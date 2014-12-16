class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :round
      t.string :pick
      t.string :user
      t.string :team
      t.string :player

      t.timestamps null: false
    end
  end
end
