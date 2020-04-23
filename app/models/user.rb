# frozen_string_literal: true

class User < ApplicationRecord
  def self.create_or_find_from_auth_hash(auth_hash)
    create_or_find_by!(uid: auth_hash[:uid], image: auth_hash.dig(:info, :image))
  end
end
