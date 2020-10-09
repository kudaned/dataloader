require 'csv'

desc 'Load Client table data'
task :load_clients, [] => [:environment] do |task, args|

  begin

    file_path = "#{Rails.root}/files/Clients.csv"
    data = CSV.read(file_path, { headers: true })

    # Iterate rows and map to table cols
    data.each.with_index(1) do |row, i|
      puts "Processing Client record #{i} of #{data.size}"

      client = Client.new({
        client_id: row['Id'],
        name: row['Name'],
        address: row['Address'],
        city: row['City'],
        state: row['State'],
        division: row['Division'],
        major_group: row['Major Group'],
        industry_group: row['Industry Group'],
        sic: row['SIC'],
        description: row['Description']
      })

      # Check if record saves overwise exit
      DataLoadersBase.model_saved?(client)
    end


  rescue StandardError => e
    puts "ERROR - #{e.message}"
    # puts '  ' + e.backtrace.join("\n  ")
  end

end
