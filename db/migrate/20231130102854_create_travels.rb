class CreateTravels < ActiveRecord::Migration[7.1]
  def change
    create_table :travels do |t|
      t.belongs_to :user
      t.string :departure_point
      t.string :destination
      t.decimal :price
      t.date :date
      t.string :phone_number
      t.boolean :is_approved

      t.timestamps
    end
  end
end
