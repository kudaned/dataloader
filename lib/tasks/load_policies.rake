require 'csv'
require_relative './common/base'

def create_new(policy_data)
  if policy['carrier_id'].blank?
    new_policy = CarrierOrphan.new(policy_data)
  elsif policy['client_id'].blank?
    new_policy = ClientOrphan.new(policy_data)
  else
    new_policy = Policy.new(policy_data)
  end
  new_policy
end

desc 'Load Policy table data'
task :load_policies, [] => [:environment] do |task, args|

  begin

    file_path = "#{Rails.root}/files/Policies.csv"
    data = CSV.read(file_path, { headers: true })

    # Iterate rows and map to table cols
    data.each.with_index(1) do |row, i|
      puts "Processing Policy record #{i} of #{data.size}"

      policy_data = {
        policy_type: row['Type'],
        division: row['Division'],
        carrier_id: row['CarrierId'],
        client_id: row['ClientId'],
        effective_date: row['EffectiveDate'],
        expiration_date: row['ExpirationDate'],
        written_preminum: row['WrittenPremium'],
        carrier_policy_number: row['CarrierPolicyNumber'],
        expiring: Policy.is_expiring?(row['ExpirationDate'])
      }

      # Determine if policy has client and carrier data
      new_policy = create_new(policy_data)

      # Check if record saves overwise exit
      DataLoadersBase.model_saved?(new_policy)

      # exit if i == 100
    end

  rescue StandardError => e
    puts "ERROR - #{e.message}"
    # puts '  ' + e.backtrace.join("\n  ")
  end

end
