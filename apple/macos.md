# MacOS config

## Keyboard speed

I find the keyboard speed a bit slow, took this from [this webpage](https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x)

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
 

```console
defaults read -g InitialKeyRepeat
defaults write -g InitialKeyRepeat -int 10
```

defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

```console
defaults read -g KeyRepeat
defaults write -g KeyRepeat -int 1
```
