# Keybindings Cheatsheet

> **Legend:** `Super` = Windows key · `leader` = Space (in Neovim)

---

## KDE Plasma

### Windows
| Shortcut | Action |
|---|---|
| `Super+Left/Right/Up/Down` | Tile window to side / top / bottom |
| `Super+PageUp` | Maximize window |
| `Super+PageDown` | Minimize window |
| `Super+D` | Peek at desktop |
| `Alt+F4` | Close window |
| `Alt+F3` | Window menu |
| `Meta+Ctrl+Esc` | Kill window (force close) |

### Desktops
| Shortcut | Action |
|---|---|
| `Super+Ctrl+Left/Right` | Switch to previous/next desktop |
| `Super+Ctrl+Up/Down` | Switch desktop up/down |
| `Ctrl+F1/F2/F3/F4` | Jump to desktop 1–4 |
| `Super+Ctrl+Shift+Left/Right` | Move window to previous/next desktop |
| `Super+Ctrl+Shift+Up/Down` | Move window to desktop up/down |

### Window Focus
| Shortcut | Action |
|---|---|
| `Alt+Tab` | Switch windows |
| `Alt+Shift+Tab` | Switch windows (reverse) |
| `Super+Alt+Left/Right/Up/Down` | Focus window in direction |
| `Super+Tab` | Walk through windows |
| `Super+W` | Overview (all windows) |
| `Super+G` | Grid view |
| `Ctrl+F9` | Present windows (current desktop) |
| `Ctrl+F10` | Present windows (all desktops) |

### Taskbar
| Shortcut | Action |
|---|---|
| `Super+1` – `Super+9` | Activate taskbar entry 1–9 |

### Screen / Zoom
| Shortcut | Action |
|---|---|
| `Super++` / `Super+=` | Zoom in |
| `Super+-` | Zoom out |
| `Super+0` | Zoom to actual size |
| `Super+F5/F6` | Move mouse to focus / center |

### Session
| Shortcut | Action |
|---|---|
| `Super+L` | Lock screen |
| `Ctrl+Alt+Del` | Show logout screen |
| `Super+Q` | Show activity switcher |

### Clipboard
| Shortcut | Action |
|---|---|
| `Super+V` | Show clipboard items |
| `Super+Ctrl+X` | Clipboard action popup |

### Audio / Media
| Shortcut | Action |
|---|---|
| `Volume Up/Down` | Change volume |
| `Volume Mute` | Mute |
| `Media Play/Pause/Next/Previous/Stop` | Media control |
| `Microphone Mute` | Mute microphone |

---

## Ghostty Terminal

### Splits
| Shortcut | Action |
|---|---|
| `Ctrl+A > H` | New split left |
| `Ctrl+A > J` | New split down |
| `Ctrl+A > K` | New split up |
| `Ctrl+A > L` | New split right |
| `Ctrl+H` | Focus split left |
| `Ctrl+J` | Focus split below |
| `Ctrl+K` | Focus split above |
| `Ctrl+L` | Focus split right |
| `Ctrl+A > F` | Toggle zoom (fullscreen split) |

### Tabs & Windows
| Shortcut | Action |
|---|---|
| `Ctrl+N` | New window |
| `Ctrl+A > N` | Next tab |
| `Ctrl+A > P` | Previous tab |

### Editing
| Shortcut | Action |
|---|---|
| `Ctrl+Shift+C` | Copy to clipboard |
| `Ctrl+Shift+V` | Paste from clipboard |
| `Ctrl+Shift+K` | Clear screen |

### Misc
| Shortcut | Action |
|---|---|
| `Super+R` | Reload Ghostty config |

---

## Neovim

> `leader` = **Space**

### Navigation
| Shortcut | Action |
|---|---|
| `Ctrl+D` | Scroll down (centered) |
| `Ctrl+U` | Scroll up (centered) |
| `n` / `N` | Next/prev search result (centered) |
| `Ctrl+H/J/K/L` | Move to window left/down/up/right |

### File Explorer
| Shortcut | Action |
|---|---|
| `<leader>pv` | Open netrw |

### Telescope
| Shortcut | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fc` | Git commits |
| `<leader>fs` | Git status |

### Harpoon
| Shortcut | Action |
|---|---|
| `<leader>hm` | Mark file |
| `Ctrl+E` | Toggle harpoon menu |
| `<leader>hn` | Next harpoon file |
| `<leader>hp` | Previous harpoon file |
| `<leader>h1–h4` | Jump to harpoon file 1–4 |

### LSP
| Shortcut | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | References |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format file |
| `[d` / `]d` | Prev/next diagnostic |
| `<leader>e` | Open diagnostic float |
| `<leader>zig` | Restart LSP |

### Completion (in insert mode)
| Shortcut | Action |
|---|---|
| `Ctrl+Space` | Trigger completion |
| `Tab` / `Shift+Tab` | Next/prev suggestion |
| `Ctrl+N` / `Ctrl+P` | Next/prev suggestion |
| `Enter` | Confirm suggestion |
| `Ctrl+E` | Close completion |
| `Ctrl+D` / `Ctrl+F` | Scroll docs up/down |

### Editing
| Shortcut | Action |
|---|---|
| `J` (visual) | Move selection down |
| `K` (visual) | Move selection up |
| `J` (normal) | Join lines (keep cursor) |
| `<leader>p` (visual) | Paste without yanking |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>d` | Delete to void (no yank) |
| `Ctrl+C` (insert) | Escape to normal mode |
| `<leader>w` | Toggle word wrap |
