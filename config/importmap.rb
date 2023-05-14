# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.0/lib/index.js"

pin "datatables.net"              , to: "https://cdn.datatables.net/1.13.1/js/jquery.dataTables.mjs"
pin "datatables.net-bs5"          , to: "https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.mjs"
pin "datatables.net-buttons"      , to: "https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.mjs"
pin "datatables.net-buttons-bs5"  , to: "https://cdn.datatables.net/buttons/2.3.2/js/buttons.bootstrap5.mjs"
pin "datatables.net-buttons-html5", to: "https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.mjs"
pin "jquery"                      , to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
pin "jquery-highlight"            , to: "https://ga.jspm.io/npm:jquery-highlight@3.5.0/jquery.highlight.js"

pin_all_from "app/javascript/custom", under: "custom"