class Client < ApplicationRecord
  has_many :policies, :primary_key => 'client_id'

  scope :total_count, ->(){ self.all.size }

end
