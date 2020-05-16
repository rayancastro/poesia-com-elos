class Order < ApplicationRecord
  validates :checkout_session_id, presence: true
  validates :status, presence: true
end
