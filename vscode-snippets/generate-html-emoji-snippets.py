#!/usr/bin/env python 

#%% Imports

import requests
import sys
import re


#%% Constants
EMOJI_URL = "https://unicode.org/Public/emoji/latest/emoji-test.txt"
OUTPUT_FILE = "html-emojis.code-snippets"
PARSING_REGEX = "(?P<code>1F[0-9a-fA-F ]+).*\s*;\s*fully-qualified\s*#(?P<description>.*?(?P<alias>[a-zA-Z ]*))\n"

#%% Functions

def main():

  # 1. Download the latest emoji
  req = requests.get(EMOJI_URL)
  if req.status_code != 200:
    print(f"Something went wrong. Could not read URL {EMOJI_URL}",file=sys.stderr)
    exit(1)

  output_text = "{\n // Emojis for HTML code. With a tab stop at the font-size.\n"
  
  # Iterate through emojis, format them into a snippet
  for match in re.finditer(PARSING_REGEX, req.text):
    code = match.group("code").strip()

    # Code may be multi parts. in this case, we want the HTML to look like this
    # &#x{code-1};&#x{code-2}; - the regex has it this way: code-1 code-2. 
    # The snippet will actually put '&#x' and ';' around the code.
    # We can insert ';&#x' between spaces to make a sequence of unicode escape sequences
    while "  " in code:
      code = code.replace("  "," ")
    code = code.replace(" ",";&#x")

    description = match.group("description").strip()
    alias = match.group("alias").strip().lower()
    alias = alias.replace(" ","-")

    snippet = f'''
    "{alias}": {{
      "scope": "javascript,html,php,phtml",
      "prefix": ["emoji-{alias}"],
      "body": ["<span style=\\"font-size:${{1:20}}px;\\">&#x{code};</span>"],
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
