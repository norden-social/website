# norden.social Blog

This is the official blog for the norden.social Mastodon instance, built with Jekyll and the Minimal Mistakes theme.

## 🚀 Quick Start

### Prerequisites
- Ruby 3.1 or higher
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
├── _config.yml          # Jekyll configuration
├── _data/               # Site data (navigation, UI text)
├── _layouts/            # Layout templates
├── _pages/              # Static pages
├── _posts/              # Blog posts
├── assets/              # CSS, JS, and images
│   ├── css/
│   ├── js/
│   └── img/
├── .github/             # GitHub Actions workflows
└── .devcontainer/       # Development container config
```

## 🛠️ Development

### Adding New Posts
Create new markdown files in `_posts/` with the following front matter:
```yaml
---
title: "Your Post Title"
categories: [category1, category2]
date: YYYY-MM-DD HH:MM:SS
---
```

### Adding New Pages
Create new markdown files in `_pages/` with the following front matter:
```yaml
---
title: "Page Title"
permalink: /page-url/
---
```

### Styling
- Main styles are in `assets/css/main.scss`
- Uses SCSS with variables and mixins
- Follows mobile-first responsive design

### JavaScript
- Custom JavaScript is in `assets/js/masto.js`
- Handles Mastodon API integration for user profiles
- Uses modern ES6+ features with proper error handling

## 🚀 Deployment

The site is automatically deployed to GitHub Pages via GitHub Actions when changes are pushed to the `main` branch.

### Manual Deployment
```bash
bundle exec jekyll build
```

## 🔧 Configuration

### Key Settings in `_config.yml`
- **Theme**: Minimal Mistakes 4.26.2
- **Skin**: "dirt" (customizable)
- **Plugins**: jekyll-feed, jekyll-seo-tag, jekyll-octicons
- **Language**: German (de-DE)

### Environment Variables
- `JEKYLL_ENV`: Set to `production` for builds

## 📱 Features

- **Responsive Design**: Mobile-first approach
- **Accessibility**: WCAG compliant with proper focus states
- **SEO Optimized**: Meta tags, sitemap, robots.txt
- **Performance**: Optimized images, lazy loading
- **Security**: Content Security Policy, XSS protection

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is maintained by norden.social e.V.

## 🆘 Support

For questions or issues:
- Email: moin@norden.social
- Mastodon: @leuchtturm@norden.social
- GitHub Issues: [Create an issue](https://github.com/norden-social/website/issues)
