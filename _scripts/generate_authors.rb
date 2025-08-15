#!/usr/bin/env ruby
require 'yaml'
require 'fileutils'

root_dir = File.expand_path('..', __dir__)
authors_yml = File.join(root_dir, '_data', 'authors.yml')
pages_dir = File.join(root_dir, '_pages')
FileUtils.mkdir_p(pages_dir)

authors = YAML.load_file(authors_yml)

authors.keys.each do |key|
  slug = key.downcase
  target = File.join(pages_dir, "autor-#{slug}.markdown")
  content = <<~MARKDOWN
    ---
    title: "Artikel von #{key}"
    permalink: /autor/#{slug}/
    layout: single
    author: #{key}
    author_profile: true
    ---

    {% assign author_posts = site.posts | where: "author", page.author %}

    {% if author_posts.size > 0 %}
    <ul>
    {% for post in author_posts %}
      <li><span>{{ post.date | date_to_string }}</span> &nbsp; <a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
    {% else %}
    <p>Keine Artikel gefunden.</p>
    {% endif %}
  MARKDOWN

  File.write(target, content)
end

puts "Generated author pages for #{authors.keys.size} authors."


