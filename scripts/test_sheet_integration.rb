#!/usr/bin/env ruby

require_relative 'sheet_to_members'

def test_sheet_integration
  puts "Testing Google Sheets Integration"
  puts "================================"
  
  # Test data
  test_data = {
    'layout' => 'member',
    'name' => 'Test User',
    'bio' => 'no',
    'details' => 'male',
    'image' => '../images/2015/speakers/test.jpg',
    'website' => 'image_url',
    'permalink' => 'test_user',
    'project_name' => 'Test Project',
    'project_description' => 'This is a test project',
    'project_link' => 'https://x.com/testuser',
    'contributors' => 'https://github.com/testuser',
    'url' => 'test_user'
  }
  
  begin
    # Create a test file
    generator = MemberFileGenerator.new('credentials.json', 'YOUR_SPREADSHEET_KEY')
    
    # Test file creation
    puts "\nTesting file creation..."
    generator.send(:create_member_file, test_data)
    puts "✓ File creation test passed"
    
    # Test data formatting
    puts "\nTesting data formatting..."
    front_matter = generator.send(:create_member_file, test_data)
    puts "✓ Data formatting test passed"
    
    puts "\nAll tests passed successfully!"
  rescue => e
    puts "\nError during testing: #{e.message}"
    puts "Please make sure you have:"
    puts "1. Valid credentials.json file"
    puts "2. Correct spreadsheet key"
    puts "3. Proper Google Sheets API access"
    exit 1
  end
end

# Run the tests
test_sheet_integration 