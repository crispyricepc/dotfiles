require('vscode.colors').get_colors()
require('vscode').setup({
    transparent = true,
})
require('vscode').load()

require('lualine').setup {
    sections = { lualine_a = {'g:coc_status', 'bo:filetype'} }
}
require('nvim-tree').setup()
require('trouble').setup {
    position = "bottom",
    auto_open = true,
    auto_close = true,
    height = 10,
    mode = "loclist"
}

local theme = "unknown"
local unameo = io.popen('uname -o')
local ostype = unameo:read('*a'):gsub('[\n\r]', '')
if string.find(ostype, "Darwin") then
    local res = os.execute('defaults read -globalDomain AppleInterfaceStyle 2>/dev/null')
    if res == 0 then
        theme = "dark"
    else
        theme = "light"
    end
else
    local handle = io.popen('gsettings get org.gnome.desktop.interface color-scheme')
    local res = handle:read("*a"):gsub('[\n\r]', '')
    handle:close()

    if string.find(res, "dark") then
        theme = "dark"
    else
        theme = "light"
    end
end
require('vscode').load(theme)
