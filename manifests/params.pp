# Class: goaccess::params
#
# This class defines default parameters used by the main module class goaccess
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to goaccess class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class goaccess::params {

  ### Application related parameters

  $dependencies_packages    = $::operatingsystem ? {
    /Debian|Ubuntu/        => ['libncurses5-dev','libncursesw5-dev','libglib2.0-dev','libgeoip-dev'],
    /Fedora|CentOS|RedHat/ => ['ncurses-devel','glib2-devel','GeoIP-devel'],
  }
  $package = 'goaccess'

  # General Settings
  $dependencies_class = 'dependencies'
  $my_class = ''
  $version = 'present'
  $absent = false
  $noops = false

}
