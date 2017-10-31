
# pe_nc_backup

[![build status](https://travis-ci.org/jessereynolds/puppet-pe_nc_backup.svg?branch=master)](https://travis-ci.org/jessereynolds/puppet-pe_nc_backup)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with pe_nc_backup](#setup)
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

- git

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

Class: `pe_nc_backups`

Parameters:

- `path` - path to directory to store the backup git repo, backup script, and log file. Default: `/opt/pe_nc_backup/`. The parent directory must already exist.

## Limitations

Tested on PE 2017.2.3 but should work with all recent versions of PE.

## Development

Contributions welcome!

- Fork it
- make a PR from a feature branch
- include tests if you can

