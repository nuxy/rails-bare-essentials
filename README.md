# rails-bare-essentials

A light-weight, slightly modified [Ruby on Rails](https://rubyonrails.org) project seed.

## Dependencies

- [Visual Studio Code](https://code.visualstudio.com/download)
- [Docker](https://docs.docker.com/get-docker)

### VS Code extensions

- [Remote-Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Motivation

To put it simply. **I do not like to pollute my local machine with packages used for development**.

Other benefits..

- Integration of VS Code [Dev Container](https://code.visualstudio.com/docs/devcontainers/containers) and related [extensions](https://marketplace.visualstudio.com/VSCode) (e.g. [Ruby Sorbet](https://marketplace.visualstudio.com/items?itemName=sorbet.sorbet-vscode-extension), [Rails snippets](https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets), etc..)
- Ability to use a production ready container as my development baseline (example: [ECR amazonlinux](https://gallery.ecr.aws/amazonlinux/amazonlinux))
- Running my application in an isolated environment with restricted permissions.
- Knowing users that run this package will be developing in an environment that 100% mirrors my own.

## Generating a new application

In the VS Code _Command Palette_ choose "Open Folder in Container" which will create a new [Rails application](https://guides.rubyonrails.org/command_line.html#creating-a-rails-app) in a Docker container allowing for realtime development and testing.  This process effectively **replaces the current working directory** (this package) with dynamically generated application sources and related dependencies.

At this point it's suggested that you commit these sources to a Git repository.

## Customizing

You can update this build to meet your requirements by updating the Rails [`.railsrc`](https://github.com/nuxy/rails-bare-essentials/blob/develop/.railsrc) and [application template](https://github.com/nuxy/rails-bare-essentials/blob/develop/template.rb). The changes in these files are only included during the [first time initialization](https://containers.dev/implementors/json_reference/#lifecycle-scripts) of a **new** container.

## Known issues

### VS Code crashes on large projects (> 1000 files)

It has been observed in OSX, projects that contain thousands of files _may result_ with random application crashes. Based on the number of background tasks (e.g. [Ruby LSP](https://github.com/Shopify/ruby-lsp?tab=readme-ov-file#ruby-lsp), VS extensions) the frequency of these events increase exponentially. In cases like this I suggest you either upgrade your hardware to account for the slow IO performance or just use [Rubymine](https://www.jetbrains.com/ruby) and save yourself the headache down the road.

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

## References

- [Rails Application templates](https://guides.rubyonrails.org/rails_application_templates.html)
- [Adopting Sorbet](https://sorbet.org/docs/adopting)

## Versioning

This package is maintained under the [Semantic Versioning](https://semver.org) guidelines.

## License and Warranty

This package is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose.

_rails-bare-essentials_ is provided under the terms of the [MIT license](http://www.opensource.org/licenses/mit-license.php)

## Author

[Marc S. Brooks](https://github.com/nuxy)
