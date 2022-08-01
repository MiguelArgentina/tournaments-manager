// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import { $, jQuery } from 'jquery'

// export for others scripts to use
window.$ = $
window.jQuery = jQuery
import * as bootstrap from "bootstrap"
