-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/battlesqui_d/.cache/nvim/packer_hererocks/2.1.1699392533/share/lua/5.1/?.lua;/home/battlesqui_d/.cache/nvim/packer_hererocks/2.1.1699392533/share/lua/5.1/?/init.lua;/home/battlesqui_d/.cache/nvim/packer_hererocks/2.1.1699392533/lib/luarocks/rocks-5.1/?.lua;/home/battlesqui_d/.cache/nvim/packer_hererocks/2.1.1699392533/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/battlesqui_d/.cache/nvim/packer_hererocks/2.1.1699392533/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { 'require("setup.luasnip")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { 'require("setup.barbar")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("setup.indent-blankline")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("setup.lualine")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-cmp"] = {
    config = { 'require("setup.nvim-cmp")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require("setup.colorizer")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("setup.lspconfig")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-reload",
    url = "https://github.com/famiu/nvim-reload"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("setup.nvimtree")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("setup.treesitter")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/parinfer-rust",
    url = "https://github.com/eraserhd/parinfer-rust"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { 'require("setup.discord_presence")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["project.nvim"] = {
    config = { 'require("setup.projectnvim")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("setup.telescope")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require("setup.toggleterm")' },
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/battlesqui_d/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("setup.lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("setup.lualine")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("setup.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("setup.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
require("setup.discord_presence")
time([[Config for presence.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require("setup.luasnip")
time([[Config for LuaSnip]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
require("setup.barbar")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require("setup.colorizer")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("setup.nvimtree")
time([[Config for nvim-tree.lua]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require("setup.projectnvim")
time([[Config for project.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require("setup.toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("setup.indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("setup.nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
