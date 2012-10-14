namespace :data_updater do
  desc 'Load country and currency data'
  task :load_data => :environment do
    # First cleanup existing data
    Country.delete_all
    Currency.delete_all

    # Load data from remote services
    DataUpdater.instance.update
  end
end
