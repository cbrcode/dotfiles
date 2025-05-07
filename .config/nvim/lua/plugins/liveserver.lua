return {
    'barrett-ruth/live-server.nvim',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = function()
        require('live-server').setup({
            args = { '--port=3000', '--browser=explorer.exe' }
        })
    end
}
