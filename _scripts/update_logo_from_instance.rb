#!/usr/bin/env ruby
# Skript: update_logo_from_instance.rb
# Holt das Instanz-Logo (avatar_static) und aktualisiert _config.yml automatisch

require 'net/http'
require 'json'
require 'yaml'

API_URL = 'https://norden.social/api/v1/instance/'
CONFIG_PATH = File.expand_path('../_config.yml', __dir__)

# API-Request
uri = URI(API_URL)
res = Net::HTTP.get_response(uri)
if !res.is_a?(Net::HTTPSuccess)
  abort "Fehler beim Abrufen der Instanzdaten: #{res.code}"
end
json = JSON.parse(res.body)

# Das Instanz-Logo ist im Feld 'contact_account' → 'avatar_static'
logo_url = json.dig('contact_account', 'avatar_static')
if !logo_url
  abort 'avatar_static (Instanz-Logo) nicht gefunden!'
end

# YAML laden und ersetzen
config = YAML.load_file(CONFIG_PATH)
config['logo'] = logo_url

# YAML speichern
File.write(CONFIG_PATH, config.to_yaml)
puts "Logo in _config.yml aktualisiert: #{logo_url}"
