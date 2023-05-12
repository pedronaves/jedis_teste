# frozen_string_literal: true

class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.datetime :birthday, null: false
      t.string :phone_country, null: false
      t.string :phone_area, null: false
      t.string :phone_number, null: false
      t.string :photo, null: false
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
