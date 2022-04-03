require 'csv'
# coding: utf-8

CSV.foreach('db/data/station_name.csv', headers: true) do |row|
  Tag.create!(
    :tag_name => row[0]
  )
end
