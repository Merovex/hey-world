// Use absolute paths for Netlify
import { Application } from '/assets/javascript/stimulus.min.js';
import NewsletterController from '/assets/javascript/controllers/newsletter_controller.js';
import ThemeController from '/assets/javascript/controllers/theme_controller.js';
import HorizontalScrollController from '/assets/javascript/controllers/horizontal_scroll_controller.js';

// Start Stimulus
window.Stimulus = Application.start();

// Register controllers
window.Stimulus.register("newsletter", NewsletterController);
window.Stimulus.register("theme", ThemeController);
window.Stimulus.register("horizontal-scroll", HorizontalScrollController);