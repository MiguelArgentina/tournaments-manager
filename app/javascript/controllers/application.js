import { Application } from "@hotwired/stimulus"
import "bootstrap"
import "@popperjs/core"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
