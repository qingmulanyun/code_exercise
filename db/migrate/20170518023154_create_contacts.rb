class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :date
      t.string :number
      t.text :description

      t.timestamps null: false
    end
  end
end
