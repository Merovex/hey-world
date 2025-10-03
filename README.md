# Hey World Jekyll Theme

A clean, minimal Jekyll theme for authors and bloggers with built-in dark/light mode, newsletter integration, and a focus on content readability.

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "hey-world"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: hey-world
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hey-world

## Usage

### Configuration

Add the following to your `_config.yml`:

```yaml
# Required settings
title: Your Site Title
author: Your Name
author_bio: >-
  A brief bio about yourself. This appears in the header.
email: your-email@example.com
url: "https://yoursite.com"
baseurl: "" # if your site is in a subdirectory

# Optional settings
twitter_username: yourusername
github_username: yourusername

# Newsletter Integration (Buttondown)
buttondown_username: yourusername
```

### Layouts

The theme provides the following layouts:

- `default` - The base layout for all pages
- `home` - Homepage layout with post listing
- `post` - Individual blog post layout
- `page` - Static page layout
- `book` - Book showcase page
- `library_book` - Library book listing
- `library_chapter` - Library chapter layout
- `compress` - HTML compression layout (applied automatically)

### Includes

The theme includes several reusable components:

- `header.html` - Site header with navigation and theme toggle
- `footer.html` - Site footer
- `author-bio.html` - Author biography section
- `author-photo.html` - Author photo component
- `author-section.html` - Full author section
- `newsletter-form.html` - Newsletter subscription form
- `newsletter-cta.html` - Newsletter call-to-action
- `book-newsletter-cta.html` - Book-specific newsletter CTA
- `post-card.html` - Post preview card

### Features

#### Dark/Light Mode Toggle

The theme includes an automatic dark/light mode toggle that saves user preference to localStorage. The toggle appears in the header.

#### Newsletter Integration (Buttondown)

The theme includes built-in Buttondown newsletter integration. To enable it:

1. Add your Buttondown username to `_config.yml`:
   ```yaml
   buttondown_username: yourusername
   ```

2. Include newsletter signup forms in your posts or pages:
   ```liquid
   {% include newsletter-form.html %}        # Full-width newsletter form
   {% include newsletter-cta.html %}         # Compact newsletter CTA
   {% include book-newsletter-cta.html %}    # Book-specific newsletter CTA
   ```

The forms will automatically use your Buttondown username and handle subscriptions through Buttondown's embed API.

#### Responsive Design

The theme is fully responsive and uses CSS custom properties (Open Props) for consistent spacing and typography.

#### CSS Architecture

The theme uses modular CSS files:
- `main.css` - Main styles and imports
- `layout.css` - Layout and grid styles
- `components.css` - Component styles
- `colors-hsl.min.css` - Color system
- Additional CSS files for specific sections (books, library, archive, etc.)

### Customization

#### Colors

Override the default colors by adding custom CSS to your site:

```css
:root {
  --primary-color: your-color;
  --text-color: your-color;
  /* etc. */
}
```

#### Navigation

Edit the navigation links in `_includes/header.html` or override it in your site by creating your own `_includes/header.html`.

#### Fonts

The theme uses system fonts by default. Add your own fonts by including them in your site's `assets/css/` directory.

## Development

To set up your environment to develop this theme, run `bundle install`.

To test the theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/merovex/hey-world.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).