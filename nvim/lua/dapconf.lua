--require('telescope').load_extension('dap')
--require('dap-python').setup('/usr/bin/python3')

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua require"dap".continue()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', opts)
vim.api.nvim_set_keymap('v', '<leader>dhv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", opts)

vim.api.nvim_set_keymap('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)


-- telescope-dap
--vim.api.nvim_set_keymap('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
--vim.api.nvim_set_keymap('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
--vim.api.nvim_set_keymap('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
--vim.api.nvim_set_keymap('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
--vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)

local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}

local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python3'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python3'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}
