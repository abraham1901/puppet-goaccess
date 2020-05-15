# work around to use defined with array
define goaccess::install_dependency(
  $array
){
  if ! defined(Package[$name]) {
    package { $name:
      ensure => $goaccess::manage_package,
      noop   => $goaccess::bool_noops,
    }
  }
}

