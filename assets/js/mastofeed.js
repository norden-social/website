"use strict";

fetch('https://norden.social/@leuchtturm.rss').then(response => response.text()).then(text => new DOMParser().parseFromString(text, 'text/xml')).then(data => {

    let placeContent = document.getElementById('mastofeed');

    if (data.querySelector('image')) {
        let image = data.querySelector('image');        
        let avatar = document.getElementById('mastoavatar');
        
        avatar.src = image.querySelector('url').innerHTML
    }

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