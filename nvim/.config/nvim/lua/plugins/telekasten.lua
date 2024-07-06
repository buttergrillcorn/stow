-- Purpose:
--   1. Demonstrate configuring Telekasten with LazyVim 'plugin configuration' file.
--   2. Add ability to create links to ...
--      - a heading under the cursor
--      - a specific line under the cursor (using a 'block reference')
--      - the file with a description entered at a prompt
--   3. Demonstrate having a main vault and seperate one(s) for work
-- Usage: (look for 'TODO')
--   1. Save as ~/.config/nvim/plugins/telekasten.lua
--   2. Create directories for vault(s)
--   3. Examine and test key mappings
-- Notes:
--   1. Uses 'o' instead of 'z' as the shortcut, easier to remember for 'Obsidian' functionality.
--   2. New functionality shortcuts ...
--      - <leader>oh => Yank link to the heading under cursor
--      - <Leader>oi => Yank 'block reference' link to line under cursor
--      - <Leader>os => Yank link to file, and use description entered by user at a prompt
--   3. Feedback on this is welcome! Just leave a comment :-)
-- References:
--   Telekasten: https://github.com/renerocksai/telekasten.nvim
--   LazyVim: https://www.lazyvim.org
--   Neovim: https://neovim.io

-- Appends a 'block reference' to the line under the cursor, and yanks a link to it.
yank_notelink_id = function()
  local uuid = require("telekasten.utils.files").new_uuid("rand")
  local title = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
  local blockReference = "^" .. uuid
  vim.api.nvim_command("normal! $")
  vim.api.nvim_put({ " " .. blockReference }, "c", true, true)
  local blockReferenceLink = "[[" .. title .. "#" .. blockReference .. "|" .. title .. "]]"
  vim.fn.setreg('"', blockReferenceLink)
  print("yanked " .. blockReferenceLink)
end

-- Prompt user for link description, and yank a link to the file using the description.
yank_notelink_desc = function()
  local title = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
  vim.ui.input({
    prompt = "Description:",
    default = title,
  }, function(description)
    local link
    if description ~= "" then
      link = "[[" .. title .. "|" .. description .. "]]"
    else
      link = "[[" .. title .. "]]"
    end
    vim.fn.setreg('"', link)
    print("yanked " .. link)
  end)
end

-- Yank a link to the heading under the cursor.
yank_notelink_heading = function()
  local title = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")

  local heading = vim.fn.getline(vim.fn.line("."))
  heading = string.gsub(heading, "^[#| ]*", "")

  local headingLink = "[[" .. title .. "#" .. heading .. "|" .. heading .. "]]"
  vim.fn.setreg('"', headingLink)
  print("yanked " .. headingLink)
end

return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  opts = {
    -- TODO: Update with your vault location(s) ...
    home = vim.fn.expand("~/notes"),
    dailies = vim.fn.expand("~/notes/dailies"),
    templates = vim.fn.expand("~/notes/templates"),
    -- TODO: Create templates ...
    template_new_note = vim.fn.expand("~/notes/templates/new-note-template.md"),
    template_new_daily = vim.fn.expand("~/notes/templates/daily-note-template.md"),
    image_subdir = "media",
    tag_notation = "yaml-bare",
    filename_space_subst = "-",
    -- TODO: Example vault for specific company. (Remove 'vaults' if not needed).
    -- vaults = {
    --   company_xyz = { home = vim.fn.expand("~/vaults/company-xyz") },
    -- },
  },
  keys = {
    vim.keymap.set("n", "<leader>o", "<cmd>Telekasten panel<CR>"),
    vim.keymap.set("n", "<C-Enter>", "<cmd>Telekasten toggle_todo<CR>", { desc = "toggle_todo" }),
    vim.keymap.set("n", "<leader>ob", "<cmd>Telekasten show_backlinks<CR>", { desc = "show_backlinks" }),
    vim.keymap.set("n", "<leader>od", "<cmd>Telekasten goto_today<CR>", { desc = "goto_today" }),
    vim.keymap.set("n", "<leader>of", "<cmd>Telekasten find_notes<CR>", { desc = "find_notes" }),
    vim.keymap.set("n", "<leader>og", "<cmd>Telekasten search_notes<CR>", { desc = "search_notes" }),
    vim.keymap.set("n", "<leader>ol", "<cmd>Telekasten insert_link<CR>", { desc = "insert_link" }),
    vim.keymap.set("n", "<leader>on", "<cmd>Telekasten new_note<CR>", { desc = "new_note" }),
    vim.keymap.set("n", "<leader>or", "<cmd>Telekasten rename_note<CR>", { desc = "rename_note" }),
    vim.keymap.set("n", "<leader>ot", "<cmd>Telekasten new_templated_note<CR>", { desc = "new_templated_note" }),
    vim.keymap.set("n", "<leader>oy", "<cmd>Telekasten yank_notelink<CR>", { desc = "yank_notelink" }),
    vim.keymap.set("n", "<leader>oz", "<cmd>Telekasten follow_link<CR>", { desc = "follow_link" }),

    vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>"),

    -- New functionality + key mappings ...

    -- Yank link to the heading under cursor
    vim.keymap.set("n", "<leader>oh", ":lua yank_notelink_heading()<CR>", { desc = "yank_notelink_heading" }),

    -- Yank 'block reference' link to line under cursor
    vim.keymap.set("n", "<Leader>oi", ":lua yank_notelink_id()<CR>", { desc = "yank_notelink_id" }),

    -- Yank link to file, and use description entered by user at a prompt
    vim.keymap.set("n", "<Leader>os", ":lua yank_notelink_desc()<CR>", { desc = "yank_notelink_desc" }),
  },
}
