-- Auto-close and auto-rename HTML/Vue/JSX tags (built-in in VSCode)
return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  opts = {
    opts = {
      enable_close = true,          -- Auto close tags <div> -> <div></div>
      enable_rename = true,         -- Auto rename matching tag pairs
      enable_close_on_slash = true, -- Auto close on </
    },
  },
}
