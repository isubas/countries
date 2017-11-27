#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'yaml'

ROWS = CSV.parse(
  File.read('countries.csv'),
  headers: true,
  header_converters: :symbol
)

def csv_to_json
  File.open('countries.json', 'w') do |f|
    f.puts ROWS.map(&:to_h).to_json
  end
end

def csv_to_yaml
  countries = {}
  ROWS.each { |row| countries[row[:alpha_2]] = row.to_h }

  File.open('countries.yml', 'w') do |f|
    f.puts countries.to_yaml
  end
end

def main
  csv_to_json
  csv_to_yaml
end

main if $PROGRAM_NAME == __FILE__
