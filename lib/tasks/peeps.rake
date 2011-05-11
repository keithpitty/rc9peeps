namespace :peeps do
  desc "import peeps data"
  task :import do
    require 'csv'
    csv_text = File.read("/Users/keithpitty/Documents/professional/projects/railscamp9/AttendeesBrief.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      Peep.create!(row.to_hash.symbolize_keys)
    end
  end
end