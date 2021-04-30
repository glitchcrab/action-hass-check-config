# Home Assistant config validation action

This action checks your configuration files against the specified Home Assistant version.

If you have custom_components in your repository it will also install the requirements of those before running the configuration check.

## Basic example

```yaml
name: "run checks"

on:
  pull_request:

jobs:
  check:
    name: Home Assistant config check
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@master
    - name: check config
      uses: glitchcrab/action-hass-check-config@main
```

## Inputs

input | description
-- | --
`version` | The version of Home Assistant to test against, e.g. `2021.1.5` (if not provided, the latest stable version will be used).
`config_path` | Relative path to your configuration if not in the root of the repository.

### Example with inputs

```yaml
name: "run checks"

on:
  pull_request:

jobs:
  check:
    name: Home Assistant config check
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@master
    - name: check config
      uses: glitcrab/action-hass-check-config@main
      with:
        version: 2021.1.5
        config_path: config
```

## Credit

This action is heavily influenced by [ludeeus/action-ha-config-check](https://github.com/ludeeus/action-ha-config-check/)
