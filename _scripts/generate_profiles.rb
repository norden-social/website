#!/usr/bin/env ruby
# Skript: generate_profiles.rb
# Holt Mastodon-Profile und erzeugt statisches HTML für die Website

require 'net/http'
require 'json'
require 'uri'

# Hier die Mastodon-Usernamen eintragen (ohne @, z.B. "niklas@norden.social")
USERS = [
  "fihu@norden.social",
  "shortriver@norden.social",
  "mig@norden.social",
  "tofuknacker@norden.social",
  "barning@norden.social"
]

API_BASE = "https://norden.social/api/v1/accounts/lookup?acct="
OUTPUT_FILE = File.expand_path("../_includes/profiles.html", __dir__)

html = "<ul class=\"profiles\">\n"

USERS.each do |user|
  uri = URI(API_BASE + URI.encode_www_form_component(user))
  begin
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      data = JSON.parse(res.body)
      avatar = data["avatar"]
      display_name = data["display_name"]&.gsub(/:[a-z\d_]+:/, '') || user
      acct = data["acct"] || user
      url = data["url"] || "https://norden.social/@#{acct}"
      html << "  <li>\n"
      html << "    <a href=\"#{url}\" rel=\"me noopener noreferrer\" target=\"_blank\">\n"
      html << "      <img src=\"#{avatar}\" alt=\"#{display_name}&#39;s avatar\" loading=\"lazy\">\n"
      html << "      <h3>#{display_name}</h3>\n"
      html << "    </a>\n"
      html << "  </li>\n"
    else
      html << "  <li>#{user} (Profil nicht gefunden)</li>\n"
    end
  rescue => e
    html << "  <li>#{user} (Fehler: #{e.message})</li>\n"
  end
end

html << "</ul>\n"

File.write(OUTPUT_FILE, html)
puts "Profile erfolgreich generiert: #{OUTPUT_FILE}"
