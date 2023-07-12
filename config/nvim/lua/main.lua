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

theme = os.execute('defaults read -globalDomain AppleInterfaceStyle 2>/dev/null')
if theme == 0 then
    require('vscode').load('dark')
else
    require('vscode').load('light')
end
