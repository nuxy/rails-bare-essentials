# rails-bare-essentials

A light-weight, slightly modified [Ruby on Rails](https://rubyonrails.org) project seed.

## Dependencies

- [Visual Studio Code](https://code.visualstudio.com/download)
- [Docker](https://docs.docker.com/get-docker)

### VS Code extensions

- [Remote-Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Launching in Remote-Containers

In the VS Code _Command Palette_ choose "Open Folder in Container" which will launch the server in a Docker container allowing for realtime development and testing.

## Motivation

To put it simply. **I do not like to pollute my local machine with packages used for development**.

Other benefits..

- Integration of VS Code [Dev Container](https://code.visualstudio.com/docs/devcontainers/containers) and related [extensions](https://marketplace.visualstudio.com/VSCode).
- Ability to use a production ready container as my development baseline (example: [ECR amazonlinux](https://gallery.ecr.aws/amazonlinux/amazonlinux))
- Running my application in an isolated with restricted permissions.

## Known issues

### Project files are assigned incorrect priviledges

If you experience this when working between local/remote development environments this is due to the user UID [not being present during build time](https://github.com/microsoft/vscode-remote-release/issues/6834#issuecomment-1158600543). In this case the default `1000` is defined as both the UID/GID for the remote user.  You can override this behavior by updating the following project `devcontainer.json` build arguments or by exporting the UID/GID in your `.bash_profile`.

```json
"build": {
  "dockerfile": "Dockerfile",
  "args": {
    "UID": "${localEnv:UID:1234}", // Default to 1234
    "GID": "${localEnv:GID:1234}"
  }
},
```

## License and Warranty

This package is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose.

_aurelia2-bare-essentials_ is provided under the terms of the [MIT license](http://www.opensource.org/licenses/mit-license.php)

## Author

[Marc S. Brooks](https://github.com/nuxy)
