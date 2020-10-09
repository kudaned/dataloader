class Policy < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :carrier, optional: true

  scope :total_count, ->(){ self.all.size }
  scope :by_client, ->(client_id){ self.where(client_id: client_id) }

  def self.is_expiring?(exp_date)
    if exp_date.blank?
      return true
    else
      twelve_months_from_now > exp_date.to_date
    end
  end

  def self.twelve_months_from_now
    (Time.now + 12.months).to_date
  end
end
