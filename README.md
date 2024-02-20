# Configs

Just saving a few files here that I find handy having around.

## VSCode snippets

Activate snippets globally for your user with this command on linux:

```bash
cp vscode-snippets/*.code-snippets $HOME/.config/Code/User/snippets
```

### html-emojis.code-snippets

I like to include emojis of different sizes when writing on my website,
and most apps allow you to do something like this `:slightly-smiling-face:`

I just wanted something similar, so the `generate-html-emoji-snippets.py` 
queries the latest list of emojis from [unicode.org](unicode.org), and converts the fully-qualified emojis to a VSCode snippet.

For The prefix is set to `emoji-`, so type this and then you can type the name
of the desired emoji separated with hyphens.

### emoji-substitutions.code-snippets

I also like in some cases to write emojis directly as they are directly
supported in many places.

`emoji-substitutions.code-snippets` allow you to do this. Use the following
command if you want to regenerate it:

```bash
vscode-snippets/generate-emoji-substitutions-snippets.py
```

## Firefox CSS

Configuration for Lichess using Firefox CSS. This 
is a submodule of my [lichess_css repo](https://github.com/nobriot/lichess_css).
