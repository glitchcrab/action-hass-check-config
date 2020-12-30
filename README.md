Home Assistant Config Check

This action checks your configuration files against the specified Home Assistant version.

If you have custom_components in your repository it will also install the requirements of those before running the configuration check.

## Basic example

```yaml
name: "Run action"
on:
  push:
    branch:
      - master
  pull_request:
    branch:
      - master

jobs:
  check:
    name: Home Assistant Config Check
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Run Config Check
      uses: glitchcrab/action-ha-config-check@master
```

## Inputs

input | description
-- | --
`version` | The version of Home Assistant to test against, e.g. `0.115.6` (if not provided, the latest stable version will be used).
`config_path` | Relative path to your configuration if not in the root of the repository.

### Example with inputs

```yaml
name: "Run action"
on:
  push:
    branch:
      - master
  pull_request:
    branch:
      - master

jobs:
  check:
    name: Home Assistant Config Check
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Run Config Check
      uses: glitcrab/action-ha-config-check@master
      with:
        version: 0.115.6
        config_path: config
```

## Credit

This action is heavily influenced by [ludeeus/action-ha-config-check](https://github.com/ludeeus/action-ha-config-check/)
