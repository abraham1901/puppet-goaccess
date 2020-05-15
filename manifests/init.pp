# = Class: goaccess
#
# This is the main goaccess class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, goaccess class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $goaccess_myclass
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $goaccess_absent
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in goaccess::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of goaccess package
#
# [*dependencies_packages*]
#   The name of goaccess dependencies packages
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include goaccess"
# - Call goaccess as a parametrized class
#
# See README for details.
#
#
class goaccess (
  $my_class               = params_lookup( 'my_class' ),
  $version                = params_lookup( 'version' ),
  $absent                 = params_lookup( 'absent' ),
  $noops                  = params_lookup( 'noops' ),
  $package                = params_lookup( 'package' ),
  $dependencies_packages  = params_lookup( 'dependencies_packages' ),
  $release                = $::lsbdistcodename,
) inherits goaccess::params {

  $bool_absent=any2bool($absent)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $goaccess::bool_absent ? {
    true  => 'absent',
    false => $goaccess::version,
  }

  ### Managed resources

  ### DEPENDENCIES class
  if $::operatingsystem =~ /Debian|Ubuntu/ {
    apt::source {'goaccess':
      location => 'http://deb.goaccess.io',
      repos    => 'main',
      release  => $release,
      key      => '790BC7277767219C42C86F933B4FE6ACC0B21F32',
    }
  }
  # a list
  $dependencies_array = $goaccess::dependencies_packages

  if $dependencies_array {

    goaccess::install_dependency { $dependencies_array:    # array
      array => $dependencies_array
    }
  }

  if ! defined(Package[$goaccess::package]) {
    package { $goaccess::package:
      ensure => $goaccess::manage_package,
      noop   => $goaccess::bool_noops,
    }
  }
}

