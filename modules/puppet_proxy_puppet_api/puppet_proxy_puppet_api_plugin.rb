module Proxy::PuppetApi
  class Plugin < Proxy::Provider
    default_settings :puppet_ssl_ca => '/var/lib/puppet/ssl/certs/ca.pem'

    plugin :puppet_proxy_puppet_api, ::Proxy::VERSION

    load_validators :url => ::Proxy::Puppet::Validators::UrlValidator
    load_programmable_settings ::Proxy::PuppetApi::PluginConfiguration
    load_classes ::Proxy::PuppetApi::PluginConfiguration
    load_dependency_injection_wirings ::Proxy::PuppetApi::PluginConfiguration

    validate :puppet_url, :url => true
    validate_readable :puppet_ssl_ca, :puppet_ssl_cert, :puppet_ssl_key
  end
end
