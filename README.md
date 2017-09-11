
# pe_nc_backup

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with pe_nc_backup](#setup)
    * [What pe_nc_backup affects](#what-pe_nc_backup-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pe_nc_backup](#beginning-with-pe_nc_backup)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module installs the [ncio](https://rubygems.org/gems/ncio) ruby gem and a cron job to drive it in order to record changes to your Puppet Enterprise Node Classification over time. The data is retrieved as a single JSON file, prettified, and stored in git.

If an ssh private key is present that provides authentication to a remote Git repo this module can also take care of pushing updates from the local git repo to the remote.

## Setup


### Setup Requirements

- ncio ruby gem
- git
- remote git repo

### Beginning with pe_nc_backup

```
include ::pe_nc_backup
```

## Usage

```
class { '::pe_nc_backup':
  path => '/opt/pe_nc_backup',
}
```

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in the README Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

Tested on PE 2017.2.3 but should work with all recent versions of PE.

## Development

Contributions welcome!

- Fork it
- make a PR from a feature branch
- include tests if you can

