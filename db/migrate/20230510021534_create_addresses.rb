# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :address
      t.string :address_complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :ibge_code
      t.references :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
