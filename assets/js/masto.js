"use strict";

let profiles = document.querySelectorAll('.profiles li');

profiles.forEach(profile => {
    manageUser(profile)
});

function manageUser(listElement) {
    const userName = listElement.innerText
    let user = userName.replace('@','');
    const url = `https://norden.social/api/v1/accounts/lookup?acct=${user}`;

    fetch(url).then(request => request.json()).then(data => {
        const link = listElement.querySelector('a');
        let img = new Image();
        img.src = data.avatar

        var h3 = document.createElement("h3");
        let displayName = data.display_name.replace(/:[a-z\d_]+:/,'');
        h3.innerHTML = displayName;

        link.prepend(h3);
        link.prepend(img);
    })
}