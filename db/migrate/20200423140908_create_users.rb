# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :image, null: false

      t.timestamps
      t.index :uid, unique: true
    end
  end
end
