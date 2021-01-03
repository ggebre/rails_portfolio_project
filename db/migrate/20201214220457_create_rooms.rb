class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :floor
      t.integer :number

      t.timestamps
    end
  end
end
