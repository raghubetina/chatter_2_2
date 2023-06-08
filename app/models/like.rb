class Like < ApplicationRecord
  # Direct associations

  belongs_to :post,
             :counter_cache => true

  belongs_to :fan,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    fan.to_s
  end

end
