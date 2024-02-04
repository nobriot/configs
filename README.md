# Configs

Just saving a few files here that I find handy having around.

## VSCode snippets

### html-emojis.code-snippets

I like to include emojis of different sizes when writing on my website,
and most apps allow you to do something like this `:slighly-smiling-face:`

I just wanted something similar, so the `generate-html-emoji-snippets.py` 
queries the latest list of emojis from <unicode.org>, and converts the 
fully-qualified emojis to a VSCode snippet.

The prefix is set to `emoji-`, so type this and then you can type the name
of the desired emoji separated with hyphens.

I like to keep the codes, but the snippet can be modified to insert the emojis
directly instead.
