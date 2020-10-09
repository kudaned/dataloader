require 'csv'

desc 'Load Carrier table data'
task :load_carriers, [] => [:environment] do |task, args|

  begin

    file_path = "#{Rails.root}/files/Carriers.csv"
    data = CSV.read(file_path, { headers: true })

    # Iterate rows and map to table cols
    data.each.with_index(1) do |row, i|
      puts "Processing Carrier record #{i} of #{data.size}"

      carrier = Carrier.new({
        carrier_id: row['Id'],
        company_name: row['Company Name'],
        company_address_1: row['Company Address 1'],
        company_address_2: row['Company Address 2'],
        company_city: row['Company City'],
        company_state: row['Company State'],
        company_zip: row['Company Zip']
      })

      # Check if record saves otherwise exit
      DataLoadersBase.model_saved?(carrier)
    end

  rescue StandardError => e
    puts "ERROR - #{e.message}"
    # puts '  ' + e.backtrace.join("\n")
  end

end
