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
        const userName = listElement.textContent?.trim();
        if (!userName) {
            console.warn('No username found in profile element');
            return;
        }
        
        const user = userName.replace('@', '');
        if (!user) {
            console.warn('Invalid username format');
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
        
        const link = listElement.querySelector('a');
        if (!link) {
            console.warn('No link element found');
            return;
        }
        
        // Create and configure image
        const img = new Image();
        img.src = data.avatar;
        img.alt = `${data.display_name}'s avatar`;
        img.loading = 'lazy'; // Lazy loading for better performance
        
        // Create heading with sanitized content
        const h3 = document.createElement("h3");
        const displayName = data.display_name.replace(/:[a-z\d_]+:/g, ''); // Remove emoji codes
        h3.textContent = displayName; // Use textContent instead of innerHTML for security
        
        // Clear existing content and add new elements
        link.innerHTML = '';
        link.appendChild(img);
        link.appendChild(h3);
        
    } catch (error) {
        console.error('Error fetching user data:', error);
        // Optionally show a fallback or error state
    }
}