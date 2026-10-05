return {
  "okuuva/auto-save.nvim",
  opts = {
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend", "InsertLeave" },
      defer_save = { "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },
  },
}
