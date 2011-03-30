Alleycat::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
end

configatron.fq_id     = "LH5XPJ0SUZKOWW1WC4Q1TSW20JV121W53AXVM2ZXCAQGRQQT"
configatron.fq_sec    = "SJCBCL5TT15D34YGAJXTROGMEP0XOINEK3WGT32AVMLGZCKN"

configatron.fb_id     = "190450537663522"
configatron.fb_key    = "c6ae1e78223146b87702442ed202c96e"
configatron.fb_sec    = "1e480dccf8d2571eb19acce4c9a861e1"

configatron.base_url  = "alleycat.com:3000"