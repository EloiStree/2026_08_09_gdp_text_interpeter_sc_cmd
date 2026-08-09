```
git submodule add https://github.com/EloiStree/2026_08_09_gdp_text_interpeter_sc_cmd
```

They are two type of text:
- Command line: The full in has a meaning.
- Short Cut: All the words are split with space and has each a different meaning.
-  
In short cut 1000> is a reserved format for  delaying relatively to previous

Specify: 
- `cmd:` This is a command line
- `sc:` This is a line composed of shortcut

Unspecified texts are consider as a command line.

`In ...| rest`is a CMD reserved format, delaying the rest for later relative to local time.

`S2W` and integer: by default an integer in a short cut format  means send to all UDP and WS targets registered.

`(...)x3`in shortcut means to duplicate 3 time the following before interpreting
`[[ ]]` The text between is to put in the clipboard
`sc: 1000> [cmd: ]` The following is an command line in a shortcut text

