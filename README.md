# Neovim Configuration

My personal Neovim setup, built on top of [LazyVim](https://github.com/LazyVim/LazyVim).

This is the configuration I use for day-to-day development, tuned mainly for
frontend work. On top of the LazyVim defaults, I've customised a few things to fit
my workflow:

## Frontend Stack

- **Languages** — TypeScript / TSX, Vue, HTML, CSS / SCSS, JSON, and Tailwind, with
  Treesitter parsers and LSP servers (`vue-language-server`, `tailwindcss`, `emmet`,
  `css-lsp`, `html-lsp`) installed via Mason.
- **Linting & formatting** — ESLint (`eslint_d`) handles JS/TS/Vue, while Prettier
  formats JSON, YAML, CSS/SCSS, HTML, and Markdown. LSP formatting is disabled so
  ESLint stays the single source of truth.
- **Auto tags** — auto-close and auto-rename HTML / Vue / JSX tags, like VSCode.

## Editor

- **File explorer** — snacks explorer, docked on the right, with dotfiles and
  gitignored files visible.
- **VSCode-style diffs** — `mini.diff` for an inline overlay (`<leader>go`), plus a
  tuned `diffopt` (histogram algorithm with char-level highlighting).
- **Completion** — `blink.cmp` with a super-tab keymap.
- **AI assistance** — GitHub Copilot for inline suggestions.
- **Extras** — Go support, Markdown live preview, Wakatime tracking, Harpoon, Flash,
  and a handful of quality-of-life plugins.

## Getting Started

Clone this repository into `~/.config/nvim` and launch Neovim — Lazy will install all
plugins automatically on first start.
