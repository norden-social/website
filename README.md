
# norden.social Blog

This is the official blog of the Mastodon instance norden.social, built with Jekyll and the Minimal Mistakes theme.
The site contains financial reports, status updates, and other information about norden.social.

## 🚀 Quick Start

### Prerequisites
- Ruby 3.1 or higher (recommended: Ruby >= 3.2)
- Bundler
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/norden-social/website.git
   cd website
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Start the development server**
   ```bash
   bundle exec jekyll serve
   ```

4. **Open your browser**
   Navigate to `http://localhost:4000`



## 📁 Project Structure

```
website/
├── _config.yml         # Jekyll configuration
├── _data/              # YAML data (authors, navigation, UI texts)
├── _includes/          # Reusable HTML parts (e.g. profiles)
├── _layouts/           # (empty, layouts provided by the theme)
├── _pages/             # Static pages (Markdown)
├── _plugins/           # Compatibility plugins (e.g. Ruby 3.2)
├── _posts/             # Blog posts (Markdown)
├── _scripts/           # Helper scripts (Ruby)
├── assets/             # CSS, JS, images
│   ├── css/
│   ├── js/
│   └── img/
├── .github/            # GitHub Actions workflows
├── .devcontainer/      # Devcontainer configuration
├── vendor/             # Bundler dependencies (local)
└── _site/              # Build output (generated automatically)
```

## 🛠️ Development


### Adding Blog Posts
Create a Markdown file in `_posts/`. Example front matter:
```yaml
---
title: "Post Title"
categories: [finances, update]
date: YYYY-MM-DD HH:MM:SS
author: Firstname
---
```

### Adding Pages
Create a Markdown file in `_pages/`. Example front matter:
```yaml
---
title: "Page Title"
permalink: /page-url/
---
```

### Styling
- Main styles: `assets/css/main.scss` (SCSS, mobile-first, accessible)

### JavaScript
- Mastodon profiles: `assets/js/masto.js` (dynamically loads profile info)

### Ruby Helper Scripts
- `_scripts/generate_profiles.rb`: Generates static HTML for team profiles from the Mastodon API
- `_scripts/generate_authors.rb`: Generates author pages from `_data/authors.yml`
- `_scripts/update_logo_from_instance.rb`: Fetches the instance logo and updates `_config.yml`

### Plugins
- `_plugins/taint_compat.rb`: Compatibility for Ruby >= 3.2 and Liquid < 5

## 🚀 Deployment

The site is automatically deployed to GitHub Pages via GitHub Actions (branch: `main`).

### Manuelles Deployment (lokal bauen)
```bash
bundle exec jekyll build
```



## 🔧 Configuration

### Key settings in `_config.yml`
- **Theme**: Minimal Mistakes 4.27.3 (remote_theme)
- **Skin**: "dirt" (customizable)
- **Plugins**: jekyll-feed, jekyll-seo-tag, jekyll-octicons, jekyll-include-cache
- **Language**: German (de-DE)
- **Logo**: Automatically updated via script

### Environment variables
- `JEKYLL_ENV=production` for production builds

## 📱 Features

- **Responsive design** (mobile-first, SCSS)
- **Accessibility** (focus, skip links, contrast)
- **SEO** (meta tags, sitemap, robots.txt, OpenGraph)
- **Performance** (optimized images, lazy loading)
- **Security** (CSP, XSS protection, no external trackers)
- **Automatic author and profile pages** (via script)

## 🤝 Contributing

1. Fork the repository
2. Create a branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -m 'New feature'`)
4. Push to your fork (`git push origin feature/new-feature`)
5. Open a pull request

## 📄 License

This project is maintained by norden.social e.V.

## 🆘 Support

For questions or issues:
- Email: moin@norden.social
- Mastodon: [@leuchtturm@norden.social](https://norden.social/@leuchtturm)
- GitHub Issues: [Create an issue](https://github.com/norden-social/website/issues)
