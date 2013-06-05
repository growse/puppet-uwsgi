Puppet Module for UWSGI
=========================

This module manages UWSGI application configurations. This module is somewhat
biased - It relies on ubuntu's default configuration for uwsgi.

Basic Usage
-----------

    class { 'uwsgi': }

Installing uwsgi plugins
-------------------------------

The easiest way of installing additional uwsgi plugins is using packages
from your distribution .

```
    uwsgi::plugin { 'python':
        ensure => present,
    }
```

Multiple plugins are possible, too.

```
    uwsgi::plugin { ['rack-ruby1.9.1', 'erlang', ]:
        ensure => present,
    }
```

By default, debian based default prefix is 'uwsgi-plugin-'. Specific plugin prefixes could be supplied too.  For example :

```
    uwsgi::plugin { 'plugins':
        ensure => present,
        plugin_prefix => 'uwsgi-infrastructure-'
    }
```

Creating and enabling an application
---------------------------------------

A minimal configuration for a python uwsgi instance.

    uwsgi::app { 'test_site':
        socket    => ":3001",
        plugins   => "python",
        wsgi-file => "/var/www/wsgi.py",
    }

Dependencies
------------

- [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

Copyright and License
---------------------

Copyright (C) 2013 Justin Steward

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
