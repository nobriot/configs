#!/usr/bin/env python 

#%% Imports

import requests
import sys
import re


#%% Constants
EMOJI_URL = "https://unicode.org/Public/emoji/latest/emoji-test.txt"
OUTPUT_FILE = "emoji-substitutions.code-snippets"
PARSING_REGEX = ".*fully-qualified\s*#\s*(?P<description>(?P<emoji>\S+).*?(?P<alias>[a-zA-Z ]*))\n"

#%% Functions

def main():

  # 1. Download the latest emoji
  req = requests.get(EMOJI_URL)
  if req.status_code != 200:
    print(f"Something went wrong. Could not read URL {EMOJI_URL}",file=sys.stderr)
    exit(1)

  output_text = "{\n // Emoji substitutions for VScode.\n"
  
  # Iterate through emojis, format them into a snippet
  for match in re.finditer(PARSING_REGEX, req.text):
    emoji = match.group("emoji").strip()
    description = match.group("description").strip()
    alias = match.group("alias").strip().lower()
    alias = alias.replace(" ","-")

    snippet = f'''
    "substitute-{alias}": {{
      "prefix": [":{alias}:"],
      "body": ["{emoji}"],
      "description": "{description}"
    }},
    '''
    output_text += snippet

  output_text += "\n\n}\n"

  snippet_file = open(OUTPUT_FILE, "w")
  snippet_file.write(output_text)
  snippet_file.close()

  print(f"Generation done 🙂 - check the {OUTPUT_FILE} file")


#%% Main

if __name__ == "__main__":
  main()
