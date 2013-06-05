define uwsgi::plugin (
    $ensure        = present,
    $plugin_prefix = undef
) {
    include uwsgi

    if $plugin_prefix {
        $real_plugin_prefix = $plugin_prefix
    } else {
        $real_plugin_prefix = $uwsgi::params::plugin_prefix
    }

    if ! defined(Package["${real_plugin_prefix}${name}"]) {
        package { "${real_plugin_prefix}${name}":
            ensure  => $ensure,
            notify  => Class['uwsgi::service']
        }
    }
}