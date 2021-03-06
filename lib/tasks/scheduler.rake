desc "Task called by the scheduler to delete old records."
task :delete_old_records => :environment do
  puts "Deleting old records."
  Player.where(['created_at < ?', 6.hours.ago]).destroy_all
  puts "Done."
end
