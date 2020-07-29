vim_emu
=======

Vim Emulation using [Karabiner-Elements](https://github.com/tekezo/Karabiner-Elements) on macOS.

For previous [Karabiner](https://pqrs.org/osx/karabiner/), use [vim_emu for Karabiner](https://github.com/rcmdnk/vim_emu/).

For Windows, try [vim_ahk](https://github.com/rcmdnk/vim_ahk).

## Installation

Install [Karabiner-Elements](https://github.com/tekezo/Karabiner-Elements)
then go [Karabiner-Elements complex_modifications rules by rcmdnk](https://rcmdnk.com/KE-complex_modifications/) and import vim_emu.

There are several options for switching modes and one core  part:

* ESC to enter normal mode
* Ctrl-[ to enter normal mode
* Simultaneous jk to toggle normal-insert mode
* Simultaneous sd to toggle normal-insert mode
* Vim emulation core part

Enable some of these switching options as you like,
and enable **Vim emulation core part**.

Switching options must be placed higher than **Vim emulation core part** in **Enable rules** list.

If you want a menu bar icon to notice the mode,
try [VEM](https://github.com/rcmdnk/VEM).

## Keyboards
Currently, vim_emu supports US.

## Applications

It is enabled for other than applications related to terminal, vim, emacs, browser, remote desktop or virtual machine.

<details>
  <summary>
  Application condition for vim_emu.
  </summary>
  <div>
  <pre><code>
"conditions": [
  {
    "type": "frontmost_application_unless",
    "bundle_identifiers": [
      "^org\\.gnu\\.Emacs$",
      "^org\\.gnu\\.AquamacsEmacs$",
      "^org\\.gnu\\.Aquamacs$",
      "^org\\.pqrs\\.unknownapp.conkeror$",
      "^com\\.microsoft\\.rdc$",
      "^com\\.microsoft\\.rdc\\.mac$",
      "^com\\.microsoft\\.rdc\\.osx\\.beta$",
      "^net\\.sf\\.cord$",
      "^com\\.thinomenon\\.RemoteDesktopConnection$",
      "^com\\.itap-mobile\\.qmote$",
      "^com\\.nulana\\.remotixmac$",
      "^com\\.p5sys\\.jump\\.mac\\.viewer$",
      "^com\\.p5sys\\.jump\\.mac\\.viewer\\.web$",
      "^com\\.vmware\\.horizon$",
      "^com\\.2X\\.Client\\.Mac$",
      "^com\\.googlecode\\.iterm2$",
      "^com\\.apple\\.Terminal$",
      "^co\\.zeit\\.hyperterm$",
      "^co\\.zeit\\.hyper$",
      "^org\\.vim\\.",
      "^com\\.vmware\\.fusion$",
      "^com\\.vmware\\.horizon$",
      "^com\\.vmware\\.view$",
      "^com\\.parallels\\.desktop$",
      "^com\\.parallels\\.vm$",
      "^com\\.parallels\\.desktop\\.console$",
      "^org\\.virtualbox\\.app\\.VirtualBoxVM$",
      "^com\\.vmware\\.proxyApp\\.",
      "^com\\.parallels\\.winapp\\.",
      "^org\\.x\\.X11$",
      "^com\\.apple\\.x11$",
      "^org\\.macosforge\\.xquartz\\.X11$",
      "^org\\.macports\\.X11$",
      "^com\\.microsoft\\.rdc$",
      "^com\\.microsoft\\.rdc\\.mac$",
      "^com\\.microsoft\\.rdc\\.osx\\.beta$",
      "^net\\.sf\\.cord$",
      "^com\\.thinomenon\\.RemoteDesktopConnection$",
      "^com\\.itap-mobile\\.qmote$",
      "^com\\.nulana\\.remotixmac$",
      "^com\\.p5sys\\.jump\\.mac\\.viewer$",
      "^com\\.p5sys\\.jump\\.mac\\.viewer\\.web$",
      "^com\\.vmware\\.horizon$",
      "^com\\.2X\\.Client\\.Mac$",
      "^com\\.vmware\\.fusion$",
      "^com\\.vmware\\.horizon$",
      "^com\\.vmware\\.view$",
      "^com\\.parallels\\.desktop$",
      "^com\\.parallels\\.vm$",
      "^com\\.parallels\\.desktop\\.console$",
      "^org\\.virtualbox\\.app\\.VirtualBoxVM$",
      "^com\\.vmware\\.proxyApp\\.",
      "^com\\.parallels\\.winapp\\.",
      "^org\\.mozilla\\.firefox$",
      "^com\\.google\\.Chrome$",
      "^com\\.apple\\.Safari$"
    ]
  },
]
</code></pre>
  </div>
</details>

## Main Modes
Here are main modes of vim emulation.

|Mode|Description|
|:---|:----------|
|Insert Mode|Normal Mac state.|
|Normal Mode|As in vim, a cursor is moved by hjkl, w, etc... and some vim like commands are available.|
|Visual Mode|There are two visual mode: Character-wise and Line-wisea.|
|Command Mode|Can be used for saving file/quitting.|

An initial state is `Insert Mode`, then `Esc` or `Ctrl-[` brings you to the normal mode.

In the normal mode, `i` is the key to be back to Insert mode.

`v` and `V` are the key to the Character-wise and Line-wise
visual mode, respectively.

After push `:`, a few commands to save/quit are available.

## Available commands at Insert mode
|Key/Commands|Function|
|:----------:|:-------|
|ESC/Ctrl-[| Enter Normal mode.|
|Simultaneous jk/sd| Toggle Normal-Insert mode. Enter Normal mode at Visual mode.|

To use these simultaneous keys, the first key (`j` or `s`) must be pushed first.
In addition, key repeat is disabled for these first keys,
i.e, if you push `j` for a while, only one `j` is sent.

## Available commands at Normal mode
### Mode Change
|Key/Commands|Function|
|:----------:|:-------|
|i/I/a/A/o/O| Enter Insert mode at under the cursor/start of the line/next to the cursor/end of the line/next line/previous line.|
|v/V|Enter Visual mode of Character-wise/Line-wise.|
|:/;|Enter Command line mode|

### Move
|Key/Commands|Function|
|:----------:|:-------|
|h/j/k/l|Left/Down/Up/Right.|
|0/$| Move to the beginning/last of the line (Mac Cmd-left, Cmd-right).|
|^| Move to the first character of the line.|
|+/-| Move to the next/previous line's first character.|
|{/}| Move to the beginning/end of the paragraph (Mac Ctrl-a, Ctrl-e. It works rather like "sentence". Sometime, it is actual sentence rather than 0/$).|
|w/e| Move a word forward (w: the beginning of the word, e: the end of the word).|
|b, ge| Move a word backward (b: the beginning of the word, ge: the end of the word).|
|Ctrl-u/Ctrl-d| Go Up/Down 10 lines.|
|Ctrl-b/Ctrl-f| PageUp/PageDown.|
|gg/G| Go to the top/bottom of the file|

Multiple movement is available with `number` + `<move>`:

* e.g.) `3l` -> move right 3 times.
* e.g.) `4 Ctrl-u` -> got up 40 lines.

Note: This is only for single number, is not available for numbers greater than equal 10.


### Yank/Cut(Delete)/Change/Paste
|Key/Commands|Function|
|:----------:|:-------|
|yy, Y| Copy the line.|
|dd| Cut the line.|
|D| Cut from here to the end of the line.|
|cc| Change the line (enter Insert mode).|
|C| Cut from here to the end of the line and enter Insert mode.|
|x/X| Delete a character under/before the cursor.|
|s/S| Delete/Cut a character/a line under the cursor and enter Insert mode.|
|p/P| Paste to the next/current place. If copy/cut was done with line-wise Visual mode, it pastes to the next/current line. Some commands (such yy/dd) also force to paste as line-wise.|

y/d/c+Move Command can be used, too.
* e.g.) `yw` -> copy next one word.
* e.g.) `d3j` -> delete following 3 lines including current line.

### Others
|Key/Commands|Function|
|:----------:|:-------|
|u(U)/Ctrl-r| Undo/Redo.|
|r/R| Replace one character/multi characters.|
|J| Combine two lines.|
|M| Move current line to the middle. Need enough lines in above/below.|
|.| It is fixed to do: `Replace a following word with a clipboard` (useful to use with a search).|
|/| Start search (search box will be opened)|
|n/N| Search next/previous.|
|*| Search the word under the cursor.|
|ZZ/ZQ|Save and Quit/Quit.|

## Available commands at Visual mode
|Key/Commands|Function|
|:----------:|:-------|
|ESC/Ctrl-[| Enter Normal mode.|
|Move command| Most of move commands in Normal mode are available.|
|y/d/x/c| Copy/Cut/Cut/Cut and insert (`d`=`x`)|
|Y/D/X/C| Move to the end of line, then Copy/Cut/Cut/Cut and insert (`D`=`X`)|
|*| Search the selected word.|

Note: Currently, if you paste lines copied in visual line mode,
there will be one empty line below the content
if the content doesn't include the last line of the text.

## Available commands at Command mode
|Key/Commands|Function|
|:----------:|:-------|
|ESC/Ctrl-[| Enter Normal mode.|
|w + RETURN| Save |
|w + SPACE | Save as |
|w + q| Save and Quit |
|q | Quit |
|h | Open help of the application|
