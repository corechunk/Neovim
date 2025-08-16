# Vim Motions and Modes: A Beginner’s Guide

Neovim is built on Vim, a powerful editor that uses **modes** and **motions** to make editing and navigation fast and efficient. This guide introduces the essential modes and commands to help beginners get comfortable with Neovim, focusing on the most important features without overwhelming you.

---

## 🖥️ Vim Modes

Vim’s modes determine how your keystrokes work. Each mode has a unique role, making Vim versatile but different from standard text editors. Here’s what you need to know:

- **Normal Mode**: The default mode when you open Neovim (`nvim`). Use it for navigating, editing, and entering commands.
  - Press `<Esc>` to return to Normal mode from any other mode.
  - Move the cursor with motions like `h`, `j`, `k`, `l` (left, down, up, right).
  - Type `:` to enter commands, like `:w` to save or `:q` to quit.
  - Example: Press `dd` to delete a line, then `p` to paste it.
- **Insert Mode**: For typing text, like in a regular text editor.
  - Enter from Normal mode by pressing `i` (insert before cursor) or `a` (insert after cursor).
  - Press `<Esc>` to return to Normal mode.
  - Example: Press `i`, type “Hello”, then `<Esc>` to stop typing.
- **Visual Mode**: For selecting text to copy, delete, or modify.
  - Enter from Normal mode with `v` (character-wise selection) or `V` (line-wise selection).
  - Use motions to select text, then `y` to copy or `d` to delete.
  - Example: Press `V`, move with `j` to select lines, then `y` to copy.
- **Command-Line Mode**: For typing commands like saving or searching.
  - Enter from Normal mode by pressing `:`.
  - Type a command (e.g., `:w` to save) and press `<Enter>`.
  - Example: Type `:w` to save your file.

*Tip*: The command palette (`Ctrl+Space` in this configuration) lets you search for commands (e.g., `w` for save) without typing `:`, making it easier for beginners.

---

## 🚀 Basic Vim Motions and Commands

Motions and commands in Normal mode let you move the cursor and edit text efficiently. Below are the most important ones for beginners:

| **Key** | **Action**                          |
|---------|-------------------------------------|
| `h`     | Move cursor left                    |
| `j`     | Move cursor down                    |
| `k`     | Move cursor up                      |
| `l`     | Move cursor right                   |
| `w`     | Jump to the start of the next word  |
| `b`     | Jump to the start of the previous word |
| `0`     | Move to the start of the line       |
| `$`     | Move to the end of the line         |
| `gg`    | Go to the first line of the file    |
| `G`     | Go to the last line of the file     |
| `i`     | Enter Insert mode before the cursor |
| `a`     | Enter Insert mode after the cursor  |
| `A`     | Enter Insert mode at the end of the line |
| `d`     | Delete (combine with motions, e.g., `dw` for delete word) |
| `y`     | Yank (copy, e.g., `yw` for copy word) |
| `p`     | Paste after the cursor              |

*Examples*:
- `dw`: Delete a word (e.g., cursor on “hello” deletes it).
- `yy`: Copy the current line.
- `p`: Paste the copied text after the cursor.
- `A`: Move to the end of the line and start typing.
- `/text`: Search for “text” (press `<Enter>`, then `n` for next match).

---

## 🔢 Combining Motions with Numbers

You can combine motions with numbers in Normal mode to repeat actions, making navigation faster. Type a number before a motion to repeat it that many times.

| **Command** | **Action**                          |
|-------------|-------------------------------------|
| `5j`        | Move cursor down 5 lines            |
| `3w`        | Jump to the start of the 3rd word forward |
| `2b`        | Jump to the start of the 2nd word backward |
| `10k`       | Move cursor up 10 lines             |
| `4$`        | Move to the end of the 4th line down |

*Examples*:
- `5j`: Moves the cursor down 5 lines.
- `3w`: Jumps to the 3rd word forward.
- `2yy`: Copies 2 lines.
- `4dw`: Deletes 4 words.

*Tip*: Numbers work with most motions and commands. Try experimenting with small numbers first!

---

## 🛠️ Combining Numbers with Commands

You can combine numbers with commands and text objects (like words or paragraphs) for powerful editing. Text objects include `w` (word), `p` (paragraph), or `s` (sentence). Commands like `d` (delete), `y` (yank/copy), or `c` (change) pair with these objects.

| **Command** | **Action**                          |
|-------------|-------------------------------------|
| `dap`       | Delete around paragraph (entire paragraph, including whitespace) |
| `yap`       | Yank (copy) around paragraph        |
| `dip`       | Delete inside paragraph (paragraph content, excluding whitespace) |
| `3dw`       | Delete 3 words                      |
| `2yy`       | Copy 2 lines                        |
| `c2w`       | Change (delete and enter Insert mode) 2 words |
| `d$`        | Delete from cursor to end of line   |

*Examples*:
- `dap`: Deletes the entire paragraph under the cursor.
- `yap`: Copies the paragraph, which you can paste with `p`.
- `3dw`: Deletes 3 words from the cursor position.
- `c2w`: Deletes 2 words and enters Insert mode to type new text.
- `2dd`: Deletes 2 lines.

*Tip*: “Around” (`a`) includes surrounding whitespace; “inside” (`i`) excludes it. For example, `dip` deletes only the paragraph text, while `dap` includes blank lines around it.

---

## 🎓 Getting Started

- **Try Modes**: Open Neovim (`nvim`), press `i` to type text, `<Esc>` to return to Normal mode, and `:` to enter commands like `:w` (save) or `:q` (quit).
- **Practice Motions**: Use `hjkl` to move, `w` to jump words, or `gg` to go to the file’s start. Try `dw` to delete a word or `yy` to copy a line.
- **Use Command Palette**: Press `Ctrl+Space` to search for commands (e.g., type `w` to save or `q` to quit) without using `:`.
- **Experiment with Numbers**: Try `5j` to move down 5 lines or `3dw` to delete 3 words. Start small to build confidence.
- **Combine Commands**: Use `dap` to delete a paragraph or `2yy` to copy 2 lines, then `p` to paste.
- **Learn More**: Run `:help` in Neovim for detailed docs, or search online for “Vim cheat sheet” for quick references. Websites like [Vim Adventures](https://vim-adventures.com) make learning fun!

This configuration overrides some default behaviors. Check `init_custom.lua` for custom keybindings and settings.

---

[Back to README](../README.md)