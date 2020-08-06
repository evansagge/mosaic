# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data_hash = JSON.parse(File.read(Rails.root.join('db/dataset.json')))

attributes = data_hash.map do |data|
  attributes = {}

  data.map do |key, value|
    key = key.underscore.gsub(' ', '_').gsub(/[\(\)]/, '')

    if key =~ /_date/
      begin
        attributes[key] = Date.strptime(value, '%m/%d/%Y')
      rescue Date::Error
        attributes["#{key}_notes"] = value
      end
    else
      attributes[key] = value
    end
  end

  attributes
end

Project.create(attributes)
