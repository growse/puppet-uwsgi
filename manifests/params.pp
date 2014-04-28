class uwsgi::params {
    case $::operatingsystem {
        /^(Debian|Ubuntu)$/: {
            $package                      = 'uwsgi'
            $app_dir                      = '/etc/uwsgi'
            $plugin_python_package        = 'uwsgi-plugin-python'
            $plugin_rack_ruby_18_package  = 'uwsgi-plugin-rack-ruby1.8'
            $plugin_rack_ruby_191_package = 'uwsgi-plugin-rack-ruby1.9.1'
            $plugin_erlang_package        = 'uwsgi-plugin-erlang'
            $plugin_prefix                = 'uwsgi-plugin-'
        }
        default: {
            notify { "${module_name}_unsupported":
                message => "The ${module_name} module is not supported on ${operatingsystem}",
            }
        }
    }
}
