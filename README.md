# pe_nc_backup

[![build status](https://travis-ci.org/jessereynolds/puppet-pe_nc_backup.svg?branch=main)](https://travis-ci.org/jessereynolds/puppet-pe_nc_backup)

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pe_nc_backup](#beginning-with-pe_nc_backup)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Description

This module installs the [ncio](https://rubygems.org/gems/ncio) ruby gem and a cron job to drive it in order to record changes to your Puppet Enterprise Node Classification over time. The data is retrieved as a single JSON file, prettified, and stored in git.

If an ssh private key is present that provides authentication to a remote Git repo this module can also take care of pushing updates from the local git repo to the remote.

## Setup

### Setup Requirements

- git must be installed on the PE primary server running `pe_nc_backup`

### Beginning with pe_nc_backup

```
include pe_nc_backup
```

## Usage

```
class { 'pe_nc_backup':
  path => '/opt/pe_nc_backup',
}
```

## Limitations

Currently tested on PE 2019.8.z, PE 2021.7.z, PE 2023.2

PE 2019.8.z (Puppet 6) is not compatible / fails catalog compilation with puppetlabs-vcsrepo 6.0.0 and later due to removal of Puppet 6 support.

## Development

Contributions welcome!

- Fork it
- make a PR from a feature branch
- include tests if you can

Executing the tests:

```
pdk validate
pdk test unit
```

## Release

```
git commit
git tag x.y.z
git push --tags
```

Look for the status of the build of the tag, not of the main branch, on the [travis build page](https://travis-ci.org/jessereynolds/puppet-pe_nc_backup/builds)

Look for the new version on the [Forge page](https://forge.puppet.com/jesse/pe_nc_backup)

Build and deploy takes a couple of minutes.

