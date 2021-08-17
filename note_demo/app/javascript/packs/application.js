// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// fetch 非同步，會生出 promise

document.addEventListener("DOMContentLoaded", () => {
    const btn = document.querySelector("#favorite_note")
    
    if(btn) {
    btn.addEventListener("click", () => {
        console.log(123)
    })
    }
 } )