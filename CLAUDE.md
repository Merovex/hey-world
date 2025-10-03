# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Theme Development
- `bundle install` - Install gem dependencies
- `bundle exec jekyll serve` - Start development server at http://localhost:4000
- `bundle exec jekyll build` - Build the Jekyll site to _site directory
- `bundle exec jekyll clean` - Remove built site files from _site

### Gem Management
- `gem build hey-world.gemspec` - Build the theme gem file
- `gem install hey-world-*.gem` - Install the built gem locally

## Architecture

This is a Jekyll theme gem called "Hey World" - a minimal theme for authors and bloggers with dark/light mode support.

### Key Components

**Layouts** (_layouts/):
- `default.html` - Base layout that all other layouts extend
- `compress.html` - HTML compression wrapper applied to all pages
- `home.html`, `post.html`, `page.html` - Content-specific layouts
- `book.html`, `library_book.html`, `library_chapter.html` - Specialized layouts for book/library content

**Includes** (_includes/):
Reusable components for author bios, newsletter forms, headers/footers, and post cards.

**CSS Architecture** (assets/css/):
- Uses Open Props CSS framework for consistent design tokens
- `main.css` imports all other stylesheets
- Component-based CSS files (components.css, post-card.css, newsletter.css, etc.)
- Dark/light mode handled via CSS custom properties in colors-hsl.min.css
- Responsive design via media-queries.css

**JavaScript** (assets/javascript/):
Theme toggle and other interactive features.

### Theme Configuration

Users configure the theme via their site's _config.yml:
- Required: `title`, `author`, `author_bio`, `email`, `url`
- Optional: `twitter_username`, `github_username`
- Theme activation: `theme: hey-world`

### File Structure

This is packaged as a Ruby gem. The gemspec defines which files are included when the theme is distributed:
- Assets (CSS, JS, images)
- Layouts and includes
- Configuration example (_config.yml)
- Documentation (README.md, LICENSE.txt)