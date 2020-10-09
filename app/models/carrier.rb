class Carrier < ApplicationRecord
  has_many :policies, :primary_key => 'carrier_id'

  scope :total_count, ->(){ self.all.size }

end
