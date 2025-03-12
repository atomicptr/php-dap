# php-dap

A containerized wrapper to use the debug adapter from [vscode-php-debug](https://github.com/xdebug/vscode-php-debug) standalone in any DAP capable editor like for instance [Helix](https://helix-editor.com).

## Installation

You either use the php-dap bash script available in this repository or podman/docker directly:

```bash
$ docker run --rm -it ghcr.io/atomicptr/php-dap:latest --server=9090
```

### Helix

In your Helix languages.toml add this:

```toml
[[language]]
name = "php"

[language.debugger]
name = "php-dap"
transport = "tcp"
command = "php-dap"
args = []

[[language.debugger.templates]]
name = "Listen for Xdebug"
request = "launch"
completion = ["ignored"]
args = {}
```

## License

MIT
