require 'csv'
require_relative './common/base'

desc 'Load Policy table data'
task :load_policies, [] => [:environment] do |task, args|

  begin

    file_path = "#{Rails.root}/files/Policies.csv"
    data = CSV.read(file_path, { headers: true })

    # Iterate rows and map to table cols
    data.each.with_index(1) do |row, i|
      puts "Processing Policy record #{i} of #{data.size}"

      policy_data = Policy.new({
        policy_type: row['Type'],
        division: row['Division'],
        carrier_id: row['CarrierId'],
        client_id: row['ClientId'],
        effective_date: row['EffectiveDate'],
        expiration_date: row['ExpirationDate'],
        written_preminum: row['WrittenPremium'],
        carrier_policy_number: row['CarrierPolicyNumber'],
        expiring: Policy.is_expiring?(row['ExpirationDate'])
      })

      # Check if record saves overwise exit
      DataLoadersBase.model_saved?(policy_data)

      # exit if i == 100
    end

  rescue StandardError => e
    puts "ERROR - #{e.message}"
    # puts '  ' + e.backtrace.join("\n  ")
  end

end
