# Changelog

All notable changes to this project will be documented in this file.

## Release 1.0.1

- Fix issue with ssldir determination introduced in 1.0.0
- Set new ssl_dir parameter to /etc/puppetlabs/puppet/ssl - may be overridden
- Now uses a template for the backup script so that ssl_dir can be passed in (Thanks @albatrossflavour!)

## Release 1.0.0

- Attempt to improve reliability of ssldir determination

## Release 0.1.1 2017-09-11

Actually tested on production now.

**Bugfixes**

- Creates the bin directory
- Handles initial commit of json file correctly
- Works in the correct directory

## Release 0.1.0 2017-09-11

**Features**

- Initial version

**Bugfixes**

**Known Issues**

