class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :name, null: false
      t.integer :cpf, null: false
      t.integer :cns, null: false
      t.string :email, null: false
      t.integer :birthday, null: false
      t.integer :phone_country, null: false
      t.integer :phone_area, null: false
      t.integer :phone_number, null: false
      t.string :photo, null: false
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
