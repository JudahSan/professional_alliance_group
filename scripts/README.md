# Google Sheets to Member Files Converter

This Ruby script converts data from a Google Sheet into member markdown files for the Professional Alliance website.

## Setup

1. Install the required gems:
   ```bash
   gem install google_drive yaml fileutils
   ```

2. Set up Google Sheets API:
   - Go to the [Google Cloud Console](https://console.cloud.google.com/)
   - Create a new project or select an existing one
   - Enable the Google Sheets API
   - Create credentials (OAuth 2.0 Client ID)
   - Download the credentials and save as `credentials.json` in the scripts directory

3. Prepare your Google Sheet:
   - Create a new Google Sheet
   - Add the following columns (in order):
     - layout (text)
     - name (text)
     - title (text)
     - bio (text)
     - image (text)
     - twitter (text)
     - linkedin (text)
     - github (text)
     - groups (text, comma-separated)
     - tags (text, comma-separated)
   - Share the sheet with the email address associated with your Google Cloud project
   - Copy the spreadsheet key from the URL (the long string between /d/ and /edit)

## Usage

Run the script:
```bash
ruby sheet_to_members.rb credentials.json YOUR_SPREADSHEET_KEY
```

The first time you run the script, it will:
1. Open a browser window for Google authentication
2. Ask you to authorize the application
3. Create a `config.json` file to store your credentials

The script will then:
1. Read data from your Google Sheet
2. Create markdown files in the `_members` directory
3. Name files based on member names (e.g., `alice-smith.md`)

## Google Sheet Format

Example row:
```
layout | name | title | bio | image | twitter | linkedin | github | groups | tags
member | Alice Smith | AI Research Lead | Alice is a leading researcher... | https://... | https://twitter.com/... | https://linkedin.com/... | https://github.com/... | /groups/ai-research-collective | AI, Machine Learning, Research
```

## Notes

- The script will create files in the `_members` directory
- Social media links are optional
- Groups and tags should be comma-separated
- The bio field can contain multiple lines
- File names are generated from member names (lowercase, hyphenated)
- The script uses the first worksheet in the spreadsheet

## Troubleshooting

If you encounter any issues:
1. Make sure your credentials.json file is in the correct location
2. Verify that the spreadsheet is shared with the email associated with your Google Cloud project
3. Check that the spreadsheet key is correct
4. Ensure all required columns are present in the first row of your spreadsheet 