#!/usr/bin/env ruby

require 'google_drive'
require 'yaml'
require 'fileutils'

class MemberFileGenerator
  def initialize(credentials_path, spreadsheet_key)
    @session = GoogleDrive::Session.from_config(credentials_path)
    @spreadsheet = @session.spreadsheet_by_key(spreadsheet_key)
    @worksheet = @spreadsheet.worksheets.first
  end

  def generate_files
    # Get headers from first row
    headers = @worksheet.rows.first.map(&:downcase)
    
    # Process each row (skip header row)
    @worksheet.rows[1..-1].each do |row|
      next if row.all?(&:empty?) # Skip empty rows
      
      # Create hash from row data
      data = Hash[headers.zip(row)]
      
      # Generate markdown file
      create_member_file(data)
    end
  end

  private

  def create_member_file(data)
    # Create output directory if it doesn't exist
    FileUtils.mkdir_p('_members')
    
    # Generate filename from name
    filename = data['name'].downcase.gsub(/\s+/, '-') + '.md'
    filepath = File.join('_members', filename)
    
    # Prepare front matter
    front_matter = {
      'layout' => 'member',
      'name' => data['name'],
      'title' => data['title'],
      'bio' => data['bio'],
      'image' => data['image'],
      'twitter' => data['twitter'],
      'linkedin' => data['linkedin'],
      'github' => data['github'],
      'groups' => data['groups'].to_s.split(',').map(&:strip),
      'tags' => data['tags'].to_s.split(',').map(&:strip)
    }
    
    # Write to file
    File.open(filepath, 'w') do |f|
      f.puts '---'
      f.puts front_matter.to_yaml
      f.puts '---'
    end
    
    puts "Created: #{filename}"
  end
end

# Usage
if ARGV.length != 2
  puts "Usage: ruby sheet_to_members.rb <credentials_path> <spreadsheet_key>"
  puts "Example: ruby sheet_to_members.rb credentials.json 1ABC...XYZ"
  exit 1
end

credentials_path = ARGV[0]
spreadsheet_key = ARGV[1]

begin
  generator = MemberFileGenerator.new(credentials_path, spreadsheet_key)
  generator.generate_files
  puts "Successfully generated member files!"
rescue => e
  puts "Error: #{e.message}"
  exit 1
end 