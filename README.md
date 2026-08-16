**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

Leader key: `<Space>`

## Java support

Java projects (`*.java`) get full LSP support via [jdtls](https://github.com/eclipse-jdtls/eclipse.jdt.ls), wired up through [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) in `ftplugin/java.lua`. Debugging and test running go through [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui).

- `jdtls`, `java-debug-adapter`, and `java-test` are installed via Mason (`:Mason` to check/reinstall).
- Treesitter's `java` parser is installed for syntax highlighting/indentation.
- Each project gets its own jdtls workspace under `~/.local/share/nvim/jdtls-workspace/<project-name>`, rooted at the nearest `.git`, `mvnw`, `gradlew`, `pom.xml`, or `build.gradle`.
- Configured JDKs: JavaSE-11 and JavaSE-25 (default). Edit the `runtimes` table in `ftplugin/java.lua` if your machine has different JDKs installed.

## Keymaps & shortcuts

### General

| Key | Mode | Action |
|---|---|---|
| `;` | n | Enter command mode (`:`) |
| `jk` | i | Escape insert mode |
| `<C-s>` | n | Save file |
| `<C-c>` | n | Copy whole file |
| `<Esc>` | n | Clear search highlights |
| `<leader>n` | n | Toggle line numbers |
| `<leader>rn` | n | Toggle relative line numbers |
| `<leader>ch` | n | Toggle NvCheatsheet |
| `<leader>fm` | n, x | Format file (conform, with LSP fallback) |
| `<leader>/` | n, v | Toggle comment |
| `<leader>ws` | n | Workspace layout: code split + 2 terminals |

### Window navigation

| Key | Mode | Action |
|---|---|---|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | n | Move to window left/down/up/right |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | t | Switch window from terminal mode |

### Buffers / tabufline

| Key | Mode | Action |
|---|---|---|
| `<leader>b` | n | New buffer |
| `<Tab>` | n | Next buffer |
| `<S-Tab>` | n | Previous buffer |
| `<leader>x` | n | Close buffer |

### File tree

| Key | Mode | Action |
|---|---|---|
| `<C-n>` | n | Toggle nvim-tree |
| `<leader>e` | n | Focus nvim-tree |

### Telescope

| Key | Mode | Action |
|---|---|---|
| `<leader>ff` | n | Find files |
| `<leader>fa` | n | Find all files (incl. hidden/ignored) |
| `<leader>fw` | n | Live grep |
| `<leader>fb` | n | Find buffers |
| `<leader>fh` | n | Help tags |
| `<leader>fo` | n | Recent files |
| `<leader>fz` | n | Fuzzy find in current buffer |
| `<leader>ma` | n | Find marks |
| `<leader>cm` | n | Git commits |
| `<leader>gt` | n | Git status |
| `<leader>pt` | n | Pick hidden terminal |
| `<leader>th` | n | Pick theme |

### Terminal

| Key | Mode | Action |
|---|---|---|
| `<C-x>` | t | Exit terminal mode |
| `<leader>h` | n | New horizontal terminal |
| `<leader>v` | n | New vertical terminal |
| `<A-h>` | n, t | Toggle horizontal terminal |
| `<A-v>` | n, t | Toggle vertical terminal |
| `<A-i>` | n, t | Toggle floating terminal |

### LSP (all languages, incl. Java)

| Key | Mode | Action |
|---|---|---|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `<leader>D` | n | Go to type definition |
| `<leader>ra` | n | Rename symbol |
| `<leader>ds` | n | Diagnostics loc-list |
| `<leader>wa` | n | Add workspace folder |
| `<leader>wr` | n | Remove workspace folder |
| `<leader>wl` | n | List workspace folders |

### Java (jdtls-specific, only active in `.java` buffers)

| Key | Mode | Action |
|---|---|---|
| `<leader>jo` | n | Organize imports |
| `<leader>jv` | n, v | Extract variable |
| `<leader>jc` | n | Extract constant |
| `<leader>jm` | v | Extract method |
| `<leader>jtc` | n | Run test class |
| `<leader>jtm` | n | Run nearest test method |

### Debugging (nvim-dap, used by Java via jdtls)

| Key | Mode | Action |
|---|---|---|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dc` | n | Continue / start debugging |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step over |
| `<leader>dO` | n | Step out |
| `<leader>dr` | n | Toggle REPL |
| `<leader>du` | n | Toggle dap-ui |

### Whichkey

| Key | Mode | Action |
|---|---|---|
| `<leader>wK` | n | Show all keymaps |
| `<leader>wk` | n | Query a keymap |

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
