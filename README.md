# Puppet module: goaccess

This is a Puppet module for goaccess
It provides only package installation and management

Made by Renan Vicente <renanvice@gmail.com> based on Example42 layouts by Alessandro Franceschi / Lab42

Official site: http://www.renanvicente.com

Official git repository: http://github.com/renanvicente/puppet-goaccess

Released under the terms of Apache 2 License.


## USAGE - Basic management

* Install goaccess with default settings

        class { 'goaccess': }

* Install a specific version of goaccess package

        class { 'goaccess':
          version => '0.7.1',
        }

* Remove goaccess resources

        class { 'goaccess':
          absent => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'goaccess':
          noops => true
        }

* Automatically include a custom subclass

        class { 'goaccess':
          my_class => 'renanvicente::my_goaccess',
        }


## TESTING
[![Build Status](https://travis-ci.org/renanvicente/puppet-goaccess.png?branch=master)](https://travis-ci.org/renanvicente/puppet-goaccess)
