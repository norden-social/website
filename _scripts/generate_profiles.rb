#!/usr/bin/env ruby
# Skript: generate_profiles.rb
# Holt Mastodon-Profile und erzeugt statisches HTML für die Website

require 'net/http'
require 'json'
require 'uri'
require 'open-uri'
require 'fileutils'
require 'cgi'

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
IMAGES_DIR = File.expand_path("../assets/img/profiles", __dir__)
FileUtils.mkdir_p(IMAGES_DIR)

html = "<ul class=\"profiles\">\n"

USERS.each do |user|
  uri = URI(API_BASE + URI.encode_www_form_component(user))
  begin
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      data = JSON.parse(res.body)
      avatar_url = data["avatar_static"] || data["avatar"]
      display_name = data["display_name"]&.gsub(/:[a-z\d_]+:/, '') || user
      acct = data["acct"] || user
      url = data["url"] || "https://norden.social/@#{acct}"

      # Determine a safe filename for the avatar
      begin
        uri = URI.parse(avatar_url.to_s)
        ext = File.extname(uri.path)
      rescue
        ext = ''
      end
      ext = '.png' if ext.nil? || ext == ''
      safe_acct = acct.gsub(/[^A-Za-z0-9_\-\.]/, '_')
      filename = "#{safe_acct}#{ext}"
      target_path = File.join(IMAGES_DIR, filename)

      downloaded = false
      # Skip download if already present
      if File.exist?(target_path) && File.size(target_path) > 0
        downloaded = true
      else
        3.times do |i|
          begin
            URI.open(avatar_url, redirect: true, open_timeout: 5, read_timeout: 5) do |image|
              File.open(target_path, 'wb') do |out|
                out.write(image.read)
              end
            end
            downloaded = true
            break
          rescue => e
            warn "Download attempt "+(i+1).to_s+" failed for #{avatar_url}: #{e.message}"
            sleep 1
          end
        end
      end

      img_src = downloaded ? "/assets/img/profiles/#{filename}" : avatar_url.to_s

      safe_display = CGI.escapeHTML(display_name.to_s)
      html << "  <li>\n"
      html << "    <a href=\"#{url}\" rel=\"me noopener noreferrer\" target=\"_blank\">\n"
      html << "      <img src=\"#{img_src}\" alt=\"#{safe_display}&#39;s avatar\" loading=\"lazy\">\n"
      html << "      <h3>#{safe_display}</h3>\n"
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
