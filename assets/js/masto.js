"use strict";

// Wait for DOM to be ready
document.addEventListener('DOMContentLoaded', function() {
    const profiles = document.querySelectorAll('.profiles li');
    
    if (profiles.length === 0) return;
    
    profiles.forEach(profile => {
        manageUser(profile);
    });
});

async function manageUser(listElement) {
    try {
        // Extract username/handle from the anchor href (more reliable than textContent)
        const link = listElement.querySelector('a');
        if (!link) {
            console.warn('No link element found');
            return;
        }

        // href might be absolute (https://norden.social/@user) or relative (/@user)
        const href = link.getAttribute('href') || link.href || '';
        const parts = href.split('/').filter(Boolean);
        const last = parts.length ? parts[parts.length - 1] : '';
        const user = last.replace(/^@/, '').trim();

        if (!user) {
            console.warn('Invalid username extracted from href:', href);
            return;
        }

        const url = `https://norden.social/api/v1/accounts/lookup?acct=${encodeURIComponent(user)}`;
        
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        
        if (!data || !data.avatar || !data.display_name) {
            console.warn('Invalid data received from API');
            return;
        }
        
        // Create and configure image
        const img = new Image();
        img.src = data.avatar;
        img.alt = `${data.display_name}'s avatar`;
        img.loading = 'lazy'; // Lazy loading for better performance

        // Create heading with sanitized content
        const h3 = document.createElement("h3");
        const displayName = (data.display_name || '').replace(/:[a-z\d_]+:/g, ''); // Remove emoji codes
        h3.textContent = displayName || user; // Fallback to handle if display_name empty

        // Clear existing content and add new elements
        link.innerHTML = '';
        link.appendChild(img);
        link.appendChild(h3);
        
    } catch (error) {
        console.error('Error fetching user data:', error);
        // Optionally show a fallback or error state
    }
}