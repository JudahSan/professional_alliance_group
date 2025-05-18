#!/usr/bin/env ruby

require 'yaml'
require 'fileutils'
require 'csv'

# Test data for member files
TEST_DATA = [
  {
    'layout' => 'member',
    'name' => 'Aaron Cruz',
    'title' => 'Ruby Developer',
    'bio' => "Aaron lives in Vienna, Austria where he builds MVPs...",
    'image' => '../images/2015/speakers/aaron_cruz.jpg',
    'twitter' => 'https://x.com/mraaroncruz',
    'github' => 'https://github.com/pferdefleisch',
    'permalink' => 'aaron_cruz',
    'project_name' => 'Ruby in Production',
    'project_description' => 'In this talk we\'ll explore...'
  },
  {
    'layout' => 'member',
    'name' => 'Alvin Kato',
    'title' => 'Software Developer',
    'bio' => "Introduced to programming by a close friend, Alvin abandoned an academic career as an Economist/Statistician for a keyboard and a black screen where he fell in love with ruby and the wonders of rails. His current mission is to transfer this same joy and enthusiasm for coding into the hearts of others.",
    'image' => '../images/2015/speakers/alvin_kato.jpg',
    'twitter' => 'https://x.com/alvinkatojr',
    'project_name' => 'Ruby in Development',
    'project_description' => 'In this talk we\'ll explore...'
  },
  {
    'layout' => 'member',
    'name' => 'Audrey Cheng',
    'title' => 'Ruby Developer',
    'bio' => "Aaron lives in Vienna, Austria where he builds MVPs...",
    'image' => '../images/2015/speakers/audrey.jpg',
    'twitter' => 'https://x.com/mraaroncruz',
    'github' => 'https://github.com/pferdefleisch',
    'permalink' => 'aaron_cruz',
    'project_name' => 'Ruby in Production',
    'project_description' => 'In this talk we\'ll explore...'
  },
  {
    'layout' => 'member',
    'name' => 'Eugene Mutai',
    'title' => 'Software Developer',
    'bio' => "Introduced to programming by a close friend, Alvin abandoned an academic career as an Economist/Statistician for a keyboard and a black screen where he fell in love with ruby and the wonders of rails. His current mission is to transfer this same joy and enthusiasm for coding into the hearts of others.",
    'image' => '../images/2015/speakers/eugene.jpg',
    'twitter' => 'https://x.com/alvinkatojr',
    'project_name' => 'Ruby in Development',
    'project_description' => 'In this talk we\'ll explore...'
  },
  {
    'layout' => 'member',
    'name' => 'Dennis Ondeng',
    'title' => 'Ruby Developer',
    'bio' => "Aaron lives in Vienna, Austria where he builds MVPs...",
    'image' => '../images/2015/speakers/dennis_ondeng.jpg',
    'twitter' => 'https://x.com/mraaroncruz',
    'github' => 'https://github.com/pferdefleisch',
    'permalink' => 'aaron_cruz',
    'project_name' => 'Ruby in Production',
    'project_description' => 'In this talk we\'ll explore...'
  },
  {
    'layout' => 'member',
    'name' => 'Christian Reuterwall',
    'title' => 'Software Developer',
    'bio' => "Introduced to programming by a close friend, Alvin abandoned an academic career as an Economist/Statistician for a keyboard and a black screen where he fell in love with ruby and the wonders of rails. His current mission is to transfer this same joy and enthusiasm for coding into the hearts of others.",
    'image' => '../images/2015/speakers/chris.jpg',
    'twitter' => 'https://x.com/alvinkatojr',
    'project_name' => 'Ruby in Development',
    'project_description' => 'In this talk we\'ll explore...'
  }
]

def create_test_files
  # Create output directory if it doesn't exist
  FileUtils.mkdir_p('_members')
  
  TEST_DATA.each do |data|
    # Generate filename from name or use permalink if available
    filename = if data['permalink']
      "#{data['permalink']}.md"
    else
      data['name'].downcase.gsub(/\s+/, '-') + '.md'
    end
    filepath = File.join('_members', filename)
    
    # Write to file
    File.open(filepath, 'w') do |f|
      f.puts '---'
      f.puts data.to_yaml
      f.puts '---'
    end
    
    puts "Created test file: #{filename}"
  end
end

# Run the test
create_test_files
puts "\nTest files created successfully!"
puts "You can now verify the generated files in the _members directory." 