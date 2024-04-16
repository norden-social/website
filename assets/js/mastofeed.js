"use strict";

let profiles = document.querySelectorAll('.profiles li');

profiles.forEach(profile => {
    const img = new Image();
    const user = getUser(profile.innerText);
    console.log(user);
    // img.src = user.image;
    // profile.prepend(img);
});

/*
    Create RSS Feed from Leuchtturm
*/
fetch('https://norden.social/@leuchtturm.rss').then(response => response.text()).then(text => new DOMParser().parseFromString(text, 'text/xml')).then(data => {

    let placeContent = document.getElementById('mastofeed');

    data.querySelectorAll('item').forEach(toot => {
        let description = toot.querySelector('description');

        if (description) {
            let element = document.createElement('div');
            element.classList.add('tooted');

            if (description.textContent) {
                let content = document.createElement('div');
                content.classList.add('content');

                content.innerHTML = description.textContent;

                element.insertAdjacentElement('beforeend', content);
            }

            let media = toot.querySelector('content');

            if (media && media.getAttribute('url') && media.getAttribute('medium') == "image") {
                let image = document.createElement('img');
                image.src = media.getAttribute('url');

                element.insertAdjacentElement('beforeend', image);
            }

            let pubDate = toot.querySelector('pubDate');

            if (pubDate && pubDate.textContent) {
                let timeString = new Date(pubDate.textContent).toLocaleString();

                let time = document.createElement('small');

                time.innerText = timeString;

                element.insertAdjacentElement('beforeend', time);
            }

            placeContent.insertAdjacentElement('beforeend', element);
        }
    })

});

function getUser(userName) {
    let user = userName.replace('@','');
    const url = `https://norden.social/api/v2/search?q=${user}&limit=40&type=accounts`;
    let userid;

    let userInfo = {}

    fetch(url).then(request => request.json()).then(data => {

        let accounts = data['accounts'].filter(item => {
            return item.url == `https://norden.social/${userName}`
        });

        if (accounts.length != 1) {
            return false;
        } else {
            userid = accounts[0].id;
            fetch(`https://norden.social/api/v1/accounts/${userid}`).then(request => request.json()).then(data => {
                userInfo.image = data.avatar;
                userInfo.info = data.note
            }).catch(console.error('Keine Info gefunden'))
        }

    }).catch(console.error('Kein Account gefunden'))

    return userInfo;
}