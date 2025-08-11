source "https://rubygems.org"

# Jekyll and GitHub Pages
gem "github-pages", group: :jekyll_plugins

# Jekyll plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-octicons", "~> 19.8"
  gem "jekyll-include-cache", "~> 0.2"
end

# Development dependencies
group :development do
  gem "webrick", "~> 1.7"
end

# Platform-specific gems
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
  gem "wdm", "~> 0.1.1"
end

# JRuby-specific gems
platforms :jruby do
  gem "http_parser.rb", "~> 0.6.0"
end