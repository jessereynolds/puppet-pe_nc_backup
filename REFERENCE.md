# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`pe_nc_backup`](#pe_nc_backup): Creates backups of Puppet Enterprise's Node Classifier as json in a git repo.

## Classes

### <a name="pe_nc_backup"></a>`pe_nc_backup`

pe_nc_backup

Main entry point to pe_nc_backup

#### Examples

##### 

```puppet
include pe_nc_backup
```

#### Parameters

The following parameters are available in the `pe_nc_backup` class:

* [`path`](#-pe_nc_backup--path)
* [`ssl_dir`](#-pe_nc_backup--ssl_dir)
* [`log_level`](#-pe_nc_backup--log_level)
* [`log_level_stdout`](#-pe_nc_backup--log_level_stdout)
* [`stdout_log`](#-pe_nc_backup--stdout_log)
* [`cron_hour`](#-pe_nc_backup--cron_hour)
* [`cron_minute`](#-pe_nc_backup--cron_minute)

##### <a name="-pe_nc_backup--path"></a>`path`

Data type: `String`

path to directory to store the backup git repo, backup script, and log file.
The parent directory must already exist.

Default value: `'/opt/pe_nc_backup'`

##### <a name="-pe_nc_backup--ssl_dir"></a>`ssl_dir`

Data type: `String`

The path to the Puppet Agent's ssl directory on the PE primary server.

Default value: `'/etc/puppetlabs/puppet/ssl'`

##### <a name="-pe_nc_backup--log_level"></a>`log_level`

Data type: `Enum['debug', 'info', 'warn', 'error', 'fatal']`

The verbosity of the Ruby logger writing to the log file. Possible values: 'debug',
'info', 'warn', 'error', 'fatal'.

Default value: `'info'`

##### <a name="-pe_nc_backup--log_level_stdout"></a>`log_level_stdout`

Data type: `Enum['debug', 'info', 'warn', 'error', 'fatal']`

The verbosity of the Ruby logger writing to STDOUT. Possible values: 'debug',
'info', 'warn', 'error', 'fatal'.

Default value: `'error'`

##### <a name="-pe_nc_backup--stdout_log"></a>`stdout_log`

Data type: `Boolean`

Whether to enable the STDOUT logger.

Default value: `true`

##### <a name="-pe_nc_backup--cron_hour"></a>`cron_hour`

Data type: `String`

The hour for the cron job.

Default value: `'*'`

##### <a name="-pe_nc_backup--cron_minute"></a>`cron_minute`

Data type: `String`

The minute for the cron job.

Default value: `'*/5'`
