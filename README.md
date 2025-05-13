# php-dap

A containerized wrapper to use the debug adapter from [vscode-php-debug](https://github.com/xdebug/vscode-php-debug) standalone in any DAP capable editor like for instance [Helix](https://helix-editor.com).

## Installation

You either use the php-dap bash script available in this repository or podman/docker directly:

```bash
$ docker run --rm --network=host ghcr.io/atomicptr/php-dap:latest
```

### Neovim

Assuming you are using [nvim-dap](https://github.com/mfussenegger/nvim-dap)

```lua
local dap = require "dap"

dap.adapters.php = {
    type = "server",
    port = "${port}",
    executable = {
        command = "docker",
        args = { "run", "--rm", "--network=host", "ghcr.io/atomicptr/php-dap:latest", "--server=${port}" },
    },
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,

        -- if you are using xdebug from inside a container (e.g. using ddev)
        -- you need to setup pathMappings
        pathMappings = function()
            local root = vim.fs.root(0, { "composer.json", ".git" })

            return {
                ["/var/www/html"] = root,
            }
        end,
    },
}
```

### Helix

In your Helix languages.toml add this:

```toml
[[language]]
name = "php"

[language.debugger]
name = "php-dap"
transport = "tcp"
command = "docker"
args = ["run", "--rm", "--network=host", "ghcr.io/atomicptr/php-dap:latest"]
port-arg = "--server={}"

[[language.debugger.templates]]
name = "Listen for Xdebug"
request = "launch"
completion = ["ignored"]
args = {}
```

## License

MIT
