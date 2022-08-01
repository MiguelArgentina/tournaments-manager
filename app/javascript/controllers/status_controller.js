import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static values = { url: String }

    connect() {
    }

    toggle(event) {
        fetch(this.urlValue, {
            method: 'PATCH',
            dataType: 'script',
            credentials: "include",
            headers: {
                "X-CSRF-Token": getMetaValue("csrf-token"),
            },
        })


    }
}
function getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
}
