# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :rooms, id: :uuid do |t|
      t.string :name, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
