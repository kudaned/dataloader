module DataLoadersBase

  def self.model_saved?(model)
    if model.save
      puts "Saved!"
    else
      puts "#{model.errors.full_messages.join(',')}. Exiting..."
      exit
    end
  end

end
