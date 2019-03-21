Faf
===

[![Gem Version](https://badge.fury.io/rb/faf.svg)](https://badge.fury.io/rb/faf)
[![Build Status](https://travis-ci.org/dblock/faf.svg)](https://travis-ci.org/dblock/faf)

Find Active (Github) Forks.

## Usage

```
gem install faf
```

#### Show Github Forks

The `forks` command shows github forks.

```bash
$ faf forks dblock/fue

https://github.com/zacklayton/fue (21 days and 7 hours ago)
https://github.com/lhmzhou/fue (25 days and 4 hours ago)
```

Limit the number of forks with `--max`.

```bash
$ faf forks --max=3 dblock/slack-gamebot

https://github.com/tarikstafford/slack-gamebot (18 days ago)
https://github.com/dersam/slack-gamebot (30 days and 4 hours ago)
https://github.com/ccadoret/slack-gamebot (50 days and 3 hours ago)
```

#### Get Help

```
faf help
```

Displays additional options.

#### Access Tokens

Faf will prompt you for Github credentials and 2FA, if enabled.

```
$ faf forks dblock/fue
Enter dblock's GitHub password (never stored): ******************
Enter GitHub 2FA code: ******
Token saved to keychain.
```

The access token will be generated with `public_repo` scope and stored in the keychain. It can be later deleted from [here](https://github.com/settings/tokens). You can also skip the prompts and use a previously obtained token with `-t` or by setting the `GITHUB_ACCESS_TOKEN` environment variable.

See [Creating a Personal Access Token for the Command Line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line) for more information about personal tokens.

## Contributing

There are [a few feature requests and known issues](https://github.com/dblock/faf/issues). Please contribute! See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2019, Daniel Doubrovkine.

This project is licensed under the [MIT License](LICENSE.md).
