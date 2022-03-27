require 'csv'

CSV.foreach('db/data/station_name.csv', headers: true) do |row|
  Tag.create!(
    tag_name: row['station_name']
  )
end