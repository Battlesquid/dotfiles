-- https://github.com/bartoszmaka/dotfiles/blob/master/vim/lua/plugins/galaxyline.lua

local vim = vim
local galaxyline = require('galaxyline')

local section = galaxyline.section

local onedark = {
        black = '#0c0e15',
          bg0 = '#1a212e',
          bg1 = '#21283b',
          bg2 = '#283347',
          bg3 = '#2a324a',
         bg_d = '#141b24',
      bg_blue = '#54b0fd',
    bg_yellow = '#f2cc81',
           fg = '#93a4c3',
       purple = '#c75ae8',
        green = '#8bcd5b',
       orange = '#dd9046',
         blue = '#41a7fc',
       yellow = '#efbd5d',
         cyan = '#34bfd0',
          red = '#f65866',
         grey = '#455574',
    dark_cyan = '#1b6a73',
     dark_red = '#992525',
  dark_yellow = '#8f610d',
  dark_purple = '#862aa1',
    diff_add  = '#27341c',
  diff_delete = '#331c1e',
  diff_change = '#102b40',
    diff_text = '#1c4a6e'
}

local colors = {
  bg = onedark.bg0,
  bg_inactive = onedark.bg3,
  fg = onedark.fg,
  fg_focus = '#f8f8f2',
  section_bg = onedark.bg0,
  yellow = onedark.bg_yellow,
  cyan = onedark.cyan,
  green = onedark.green,
  orange = onedark.orange,
  magenta = onedark.purple,
  blue = onedark.blue,
  red = onedark.red,
  black = onedark.black,
}

local buffer_not_empty = function()
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local mode_color = function()
  local mode_colors = {
    n = colors.green,
    i = colors.blue,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

section.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode gui=bold guibg='..mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return '  '..alias_mode..' '
    end,
    separator = ' ',
    highlight = { colors.bg, colors.section_bg },
    separator_highlight = {colors.bg, colors.section_bg },
  },
}

section.left[2] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}

section.left[3] = {
  FileName = {
    provider = function ()
      return vim.fn.expand('%f')
    end,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator_highlight = {colors.fg, colors.section_bg },
  }
}

section.right[1]= {
  LineColumn = {
    provider = function ()
      vim.api.nvim_command('hi GalaxyLineColumn guibg='..mode_color())
      local max_lines = vim.fn.line('$')
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format(" %3d/%d:%d ", line, max_lines, column)
    end,
    separator = ' ',
    highlight = { colors.black, mode_color() },
    separator_highlight = { colors.black, colors.section_bg },
  }
}

section.short_line_left[1] = {
  SpacerInactive = {
    provider = function()
      return '  '
    end,
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = {colors.fg, colors.bg_inactive },
  }
}

section.short_line_left[2] = {
  FileIconInactive = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    separator = ' ',
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color,  colors.bg_inactive },
  }
}
section.short_line_left[3] = {
  FileNameInactive = {
    provider = function ()
      return vim.fn.expand('%f')
    end,
    separator = ' ',
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = { colors.fg, colors.bg_inactive },
  }
}

section.short_line_right[1] = {
  LineColumnInactive = {
    provider = 'LineColumn',
    separator= ' ',
    highlight = { colors.fg, colors.bg_inactive },
    separator_highlight = { colors.fg, colors.bg_inactive },
  }
}

galaxyline.load_galaxyline() 
