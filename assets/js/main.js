// Kids Dance & Performing Arts Academy JS

// Remove decorative background watermarks on load
document.addEventListener("DOMContentLoaded", () => {
  // Watermark removal
  document.querySelectorAll('svg, div').forEach(el => {
    const isWatermark = 
      el.classList.contains('pointer-events-none') && 
      el.classList.contains('select-none') && 
      (
        el.classList.contains('opacity-[0.03]') || 
        el.classList.contains('opacity-[0.06]') || 
        el.classList.contains('opacity-5') || 
        el.classList.contains('opacity-[0.05]') ||
        el.classList.contains('text-gray-200/20') ||
        el.classList.contains('dark:text-magenta/10')
      );
    if (isWatermark) {
      el.remove();
    }
  });

  // Inject custom dance/music SVG logo dynamically into the text 'T' elements
  const logoElements = document.querySelectorAll('.bg-magenta.text-white, span.bg-magenta.text-white');
  logoElements.forEach(el => {
    if (el.textContent.trim() === 'T' && (el.classList.contains('w-10') || el.classList.contains('w-8') || el.classList.contains('w-9') || el.classList.contains('w-12'))) {
      el.innerHTML = `
        <svg class="w-1/2 h-1/2 text-white" viewBox="0 0 24 24" fill="currentColor" style="display: block;">
          <!-- Main Twinkle Sparkle Star -->
          <path d="M12 2c0 5.5 4.5 10 10 10-5.5 0-10 4.5-10 10 0-5.5-4.5-10-10-10 5.5 0 10-4.5 10-10z" />
          <!-- Companion Twinkle Sparkle Star -->
          <path d="M19 5c0 1.65 1.35 3 3 3-1.65 0-3 1.35-3 3 0-1.65-1.35-3-3-3 1.65 0 3-1.35 3-3z" class="opacity-80" />
        </svg>
      `;
    }
  });

  // Inject Favicon dynamically
  let favicon = document.querySelector("link[rel~='icon']");
  if (!favicon) {
    favicon = document.createElement('link');
    favicon.rel = 'icon';
    favicon.type = 'image/svg+xml';
    favicon.href = 'assets/images/favicon.svg';
    document.head.appendChild(favicon);
  }

  // Simplify Home dropdown links text programmatically
  const homeLinks = document.querySelectorAll('a[href="index.html"], a[href="home-niche.html"]');
  homeLinks.forEach(link => {
    if (link.textContent.includes('Home 1')) {
      link.textContent = 'Home 1';
      const container = link.closest('.absolute');
      if (container) {
        container.className = container.className.replace(/\bw-56\b/g, 'w-36');
      }
    } else if (link.textContent.includes('Home 2')) {
      link.textContent = 'Home 2';
    }
  });

  // Set real social media URLs globally on load
  const socialContainers = document.querySelectorAll('.flex.space-x-3.rtl\\:space-x-reverse, .flex.gap-3.pt-2, .flex.space-x-4');
  socialContainers.forEach(container => {
    const links = container.querySelectorAll('a');
    if (links.length >= 4) {
      links[0].href = 'https://www.instagram.com/';
      links[0].target = '_blank';
      
      links[1].href = 'https://www.facebook.com/';
      links[1].target = '_blank';
      
      links[2].href = 'https://x.com/';
      links[2].target = '_blank';
      
      links[3].href = 'https://www.linkedin.com/';
      links[3].target = '_blank';
    }
  });

  // Fix and align header utility toggles globally (Theme left, RTL right, with symbols)
  const utilityWrappers = document.querySelectorAll('.xl\\:flex.items-center, .flex.items-center.gap-6, .flex.items-center.space-x-3\\.5, .flex.items-center.space-x-2\\.5, .flex.items-center.gap-4');
  utilityWrappers.forEach(wrapper => {
    const themeBtn = wrapper.querySelector('.theme-toggle');
    const rtlBtn = wrapper.querySelector('.rtl-toggle');
    if (themeBtn && rtlBtn) {
      // 1. Read and preserve any visibility helper classes
      let rtlHiddenClass = '';
      if (rtlBtn.classList.contains('hidden')) rtlHiddenClass += ' hidden';
      if (rtlBtn.classList.contains('md:flex')) rtlHiddenClass += ' md:flex';
      if (rtlBtn.classList.contains('md:hidden')) rtlHiddenClass += ' md:hidden';

      let themeHiddenClass = '';
      if (themeBtn.classList.contains('hidden')) themeHiddenClass += ' hidden';
      if (themeBtn.classList.contains('md:flex')) themeHiddenClass += ' md:flex';
      if (themeBtn.classList.contains('md:hidden')) themeHiddenClass += ' md:hidden';

      // 2. Ensure RTL button uses the exact opposing arrows SVG symbol
      rtlBtn.innerHTML = `
        <svg class="w-4.5 h-4.5 text-gray-555 dark:text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
          <!-- Top Arrow: Right to Left -->
          <path d="M20 8H4M8 4L4 8l4 4" />
          <!-- Bottom Arrow: Left to Right -->
          <path d="M4 16h16m-4-4l4 4-4 4" />
        </svg>
      `;
      rtlBtn.className = 'rtl-toggle p-2 rounded-xl border border-gray-200 dark:border-gray-800 bg-gray-50 dark:bg-darknavy-light hover:bg-gray-100 dark:hover:bg-darknavy text-gray-555 dark:text-gray-400 transition-colors duration-200 flex items-center justify-center shrink-0 w-9 h-9 sm:w-10 sm:h-10' + rtlHiddenClass;
      
      // Ensure Theme button uses the exact moon and sun SVG symbols
      const isDark = document.documentElement.classList.contains('dark');
      themeBtn.innerHTML = `
        <!-- Moon Icon -->
        <svg class="theme-toggle-moon w-4.5 h-4.5 text-gray-555 dark:text-gray-400 fill-current ${isDark ? 'hidden' : ''}" viewBox="0 0 24 24">
          <path d="M12.3 22h-.1c-5.5 0-10-4.5-10-10 0-4.8 3.5-8.9 8.2-9.8.5-.1 1 .2 1.2.7.2.5 0 1.1-.4 1.4-1.2.9-1.9 2.2-1.9 3.7 0 3.9 3.2 7.1 7.1 7.1 1.5 0 2.8-.7 3.7-1.9.3-.4.9-.6 1.4-.4.5.2.8.7.7 1.2-.9 4.7-5 8.2-9.8 8.2z"/>
        </svg>
        <!-- Sun Icon -->
        <svg class="theme-toggle-sun w-4.5 h-4.5 text-gray-555 dark:text-gray-400 ${isDark ? '' : 'hidden'}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="12" cy="12" r="5"/>
          <line x1="12" y1="1" x2="12" y2="3"/>
          <line x1="12" y1="21" x2="12" y2="23"/>
          <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/>
          <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/>
          <line x1="1" y1="12" x2="3" y2="12"/>
          <line x1="21" y1="12" x2="23" y2="12"/>
          <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/>
          <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>
        </svg>
      `;
      themeBtn.className = 'theme-toggle p-2 rounded-xl border border-gray-200 dark:border-gray-800 bg-gray-50 dark:bg-darknavy-light hover:bg-gray-100 dark:hover:bg-darknavy text-gray-555 dark:text-gray-400 transition-colors duration-200 flex items-center justify-center shrink-0 w-9 h-9 sm:w-10 sm:h-10' + themeHiddenClass;
      
      // 3. Re-order them: Theme Toggle first, RTL Toggle second
      const parent = themeBtn.parentElement;
      parent.insertBefore(themeBtn, rtlBtn);
    }
  });
});

// Global custom toast alert override
(function() {
  const styles = document.createElement('style');
  styles.id = 'toast-styles';
  styles.textContent = `
    @keyframes toast-in {
      from { transform: translate(12px, 0); opacity: 0; }
      to { transform: translate(0, 0); opacity: 1; }
    }
    .animate-toast-in {
      animation: toast-in 0.3s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }
  `;
  document.head.appendChild(styles);

  window.showToast = function(msg) {
    let container = document.getElementById("toast-container");
    if (!container) {
      container = document.createElement("div");
      container.id = "toast-container";
      container.className = "fixed top-6 right-6 z-[9999] flex flex-col gap-3 pointer-events-none";
      document.body.appendChild(container);
    }

    const toast = document.createElement("div");
    toast.className = "min-w-[280px] max-w-[360px] bg-white dark:bg-darknavy border-l-4 border-magenta shadow-2xl p-4 rounded-xl flex items-center justify-between gap-3 text-xs text-gray-700 dark:text-gray-200 animate-toast-in pointer-events-auto transition duration-300";
    toast.style.boxShadow = "0 20px 25px -5px rgba(0,0,0,0.1), 0 10px 10px -5px rgba(0,0,0,0.04)";

    toast.innerHTML = `
      <div class="flex items-center gap-2.5">
        <span class="text-magenta text-base">
          <svg class="w-4 h-4 fill-current" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
          </svg>
        </span>
        <span class="font-extrabold leading-normal">${msg}</span>
      </div>
      <button class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-150 transition shrink-0" onclick="this.parentElement.remove()">
        <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    `;

    container.appendChild(toast);

    // Auto-dismiss after 4 seconds
    setTimeout(() => {
      toast.style.transform = "translateX(24px)";
      toast.style.opacity = "0";
      setTimeout(() => {
        toast.remove();
      }, 300);
    }, 4000);
  };

  // Override default browser alert
  window.alert = function(msg) {
    window.showToast(msg);
  };
})();

document.addEventListener('DOMContentLoaded', () => {
  initTheme();
  initRtl();
  initMobileMenu();
  initDropdowns();
  initContactMap();
  initBlogFilter();
  initDashboard();
  highlightActiveNav();
});

// ==========================================
// 1. Theme Configuration (Dark / Light Mode)
// ==========================================
function initTheme() {
  const themeToggleBtns = document.querySelectorAll('.theme-toggle');
  
  // Set initial state
  if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    document.documentElement.classList.add('dark');
    updateThemeToggleIcons(true);
  } else {
    document.documentElement.classList.remove('dark');
    updateThemeToggleIcons(false);
  }

  themeToggleBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      if (document.documentElement.classList.contains('dark')) {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('color-theme', 'light');
        updateThemeToggleIcons(false);
      } else {
        document.documentElement.classList.add('dark');
        localStorage.setItem('color-theme', 'dark');
        updateThemeToggleIcons(true);
      }
    });
  });
}

function updateThemeToggleIcons(isDark) {
  const sunIcons = document.querySelectorAll('.theme-toggle-sun');
  const moonIcons = document.querySelectorAll('.theme-toggle-moon');
  
  sunIcons.forEach(icon => {
    if (isDark) icon.classList.remove('hidden');
    else icon.classList.add('hidden');
  });
  
  moonIcons.forEach(icon => {
    if (isDark) icon.classList.add('hidden');
    else icon.classList.remove('hidden');
  });
}

// ==========================================
// 2. Direction Configuration (RTL / LTR)
// ==========================================
function initRtl() {
  const rtlToggleBtns = document.querySelectorAll('.rtl-toggle');
  
  // Set initial direction
  const savedDir = localStorage.getItem('site-dir') || 'ltr';
  document.documentElement.setAttribute('dir', savedDir);

  updateRtlButtonText(savedDir);

  rtlToggleBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const currentDir = document.documentElement.getAttribute('dir');
      const newDir = currentDir === 'rtl' ? 'ltr' : 'rtl';
      document.documentElement.setAttribute('dir', newDir);
      localStorage.setItem('site-dir', newDir);
      updateRtlButtonText(newDir);
    });
  });
}

function updateRtlButtonText(dir) {
  const rtlTexts = document.querySelectorAll('.rtl-text');
  rtlTexts.forEach(txt => {
    txt.textContent = dir === 'rtl' ? 'LTR' : 'RTL';
  });
}

// ==========================================
// 3. Navigation Controls
// ==========================================
function initMobileMenu() {
  const menuBtn = document.getElementById('mobile-menu-btn');
  const closeBtn = document.getElementById('mobile-menu-close');
  const mobileMenu = document.getElementById('mobile-menu');
  
  if (menuBtn && mobileMenu) {
    menuBtn.addEventListener('click', () => {
      mobileMenu.classList.remove('hidden');
    });
  }
  if (closeBtn && mobileMenu) {
    closeBtn.addEventListener('click', () => {
      mobileMenu.classList.add('hidden');
    });
  }
}

function initDropdowns() {
  const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
  
  dropdownToggles.forEach(toggle => {
    const menu = toggle.nextElementSibling;
    
    // Toggle on click (for mobile/tablet)
    toggle.addEventListener('click', (e) => {
      e.stopPropagation();
      menu.classList.toggle('hidden');
    });

    // Close when clicking elsewhere
    document.addEventListener('click', () => {
      menu.classList.add('hidden');
    });
  });
}

// ==========================================
// 4. Contact Page Leaflet Map Container
// ==========================================
function initContactMap() {
  const mapElement = document.getElementById('contact-map');
  if (mapElement && typeof L !== 'undefined') {
    // Leaflet map setup for Dance Valley, CA 90210 (Beverly Hills region)
    const map = L.map('contact-map').setView([34.0736, -118.4004], 14);
    
    L.tileLayer('https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png', {
      attribution: '&copy; OpenStreetMap contributors'
    }).addTo(map);

    L.marker([34.0736, -118.4004]).addTo(map)
      .bindPopup('TwinkleArts Academy HQ<br>108 Rhythm Avenue, CA 90210')
      .openPopup();
  }
}

// ==========================================
// 5. Blog Filtering and Search
// ==========================================
function initBlogFilter() {
  const searchInput = document.getElementById('blog-search');
  const catButtons = document.querySelectorAll('.blog-cat-btn');
  const postCards = document.querySelectorAll('.blog-post-card');

  if (postCards.length === 0) return;

  let activeCategory = 'all';
  let searchQuery = '';

  const filterPosts = () => {
    postCards.forEach(card => {
      const title = card.querySelector('.blog-title').textContent.toLowerCase();
      const category = card.dataset.category;
      
      const matchesSearch = title.includes(searchQuery);
      const matchesCategory = activeCategory === 'all' || category === activeCategory;

      if (matchesSearch && matchesCategory) {
        card.classList.remove('hidden');
      } else {
        card.classList.add('hidden');
      }
    });
  };

  if (searchInput) {
    searchInput.addEventListener('input', (e) => {
      searchQuery = e.target.value.toLowerCase();
      filterPosts();
    });
  }

  catButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      catButtons.forEach(b => b.classList.remove('bg-magenta', 'text-white'));
      catButtons.forEach(b => b.classList.add('bg-white', 'text-black', 'dark:bg-darknavy', 'dark:text-white'));
      
      btn.classList.add('bg-magenta', 'text-white');
      btn.classList.remove('bg-white', 'text-black', 'dark:bg-darknavy', 'dark:text-white');
      
      activeCategory = btn.dataset.category;
      filterPosts();
    });
  });
}

// ==========================================
// 6. Interactive Dashboard Simulation
// ==========================================
function initDashboard() {
  // Configured locally in dashboard.html to prevent conflicts
}

// Helper to simulate receipt downloads
function downloadReceipt(receiptId, amount) {
  const button = document.getElementById(`btn-${receiptId}`);
  if (button) {
    button.innerHTML = `<svg class="animate-spin -ml-1 mr-2 h-4 w-4 inline text-white" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg> Generating...`;
    setTimeout(() => {
      button.innerHTML = `<svg class="w-4 h-4 inline-block -mt-1 ${document.documentElement.dir === 'rtl' ? 'ml-1' : 'mr-1'}" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg> Downloaded`;
      button.classList.add('bg-green-600');
      
      // Simulate file download trigger
      const receiptHTML = `
        <html>
        <head>
          <title>Receipt ${receiptId}</title>
          <style>
            body { font-family: sans-serif; padding: 40px; color: #333; }
            .header { border-bottom: 2px solid #91117a; padding-bottom: 25px; margin-bottom: 30px; }
            .magenta { color: #91117a; }
            .table { width: 100%; border-collapse: collapse; margin-top: 30px; }
            .table th, .table td { padding: 12px; border: 1px solid #ddd; text-align: left; }
            .table th { background: #111111; color: white; }
          </style>
        </head>
        <body>
          <div class="header">
            <h1 class="magenta">KIDS DANCE ACADEMY</h1>
            <p>Official Invoice & Payment Receipt</p>
          </div>
          <p><strong>Receipt ID:</strong> ${receiptId}</p>
          <p><strong>Date:</strong> August 20, 2026</p>
          <p><strong>Status:</strong> Paid</p>
          <table class="table">
            <thead>
              <tr>
                <th>Description</th>
                <th>Quantity</th>
                <th>Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Quarterly Tuition Fee (Term 3, 2026)</td>
                <td>1 Enrolled Child</td>
                <td>${amount}</td>
              </tr>
            </tbody>
          </table>
          <h2 style="text-align: right; margin-top: 30px;">Total Paid: ${amount}</h2>
          <p style="margin-top: 50px; font-size: 12px; color: #888; text-align: center;">Thank you for dancing with us!</p>
        </body>
        </html>
      `;
      const blob = new Blob([receiptHTML], { type: 'text/html' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.download = `Receipt_${receiptId}.html`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }, 1200);
  }
}

// ==========================================
// 7. Navigation Highlighting (Active Tab Colour)
// ==========================================
function highlightActiveNav() {
  let path = window.location.pathname;
  let page = path.split("/").pop();
  if (page === "" || page === "/") {
    page = "index.html";
  }

  // Highlight helper
  const highlight = (el) => {
    if (!el) return;
    el.classList.remove('text-gray-700', 'dark:text-gray-300', 'hover:text-magenta');
    el.classList.add('text-magenta', 'dark:text-magenta-light', 'font-bold');
  };

  // Determine main nav item to highlight
  let mainTargetHref = "";
  let subTargetHref = "";

  if (page === "index.html" || page === "home-niche.html") {
    mainTargetHref = "home"; // Special handling for dropdown toggle
  } else if (page === "about.html") {
    mainTargetHref = "about.html";
  } else if (page === "services.html" || page.startsWith("program-") || page === "service-details.html") {
    mainTargetHref = "services.html";
  } else if (page === "instructors.html") {
    mainTargetHref = "instructors.html";
  } else if (page === "contact.html") {
    mainTargetHref = "contact.html";
  } else if (page === "schedule.html" || page === "gallery.html" || page === "pricing.html" || page === "blog.html" || page.startsWith("blog-details")) {
    mainTargetHref = "explore"; // Highlights Explore dropdown
    subTargetHref = (page.startsWith("blog-details") || page === "blog.html") ? "blog.html" : page; // Highlights specific sub-link
  }

  // Highlight Desktop Navigation
  const desktopLinks = document.querySelectorAll('nav a');
  desktopLinks.forEach(link => {
    const href = link.getAttribute('href');
    if (href === mainTargetHref || href === subTargetHref) {
      highlight(link);
    }
  });

  // Handle Desktop Dropdown toggles
  if (mainTargetHref === "home" || mainTargetHref === "explore") {
    const dropdownToggles = document.querySelectorAll('nav .dropdown-toggle');
    dropdownToggles.forEach(toggle => {
      const toggleText = toggle.textContent.trim().toLowerCase();
      if (mainTargetHref === "home" && toggleText.includes("home")) {
        highlight(toggle);
      } else if (mainTargetHref === "explore" && toggleText.includes("explore")) {
        highlight(toggle);
      }
    });
  }

  // Highlight Mobile Navigation (Flat list)
  const mobileLinks = document.querySelectorAll('#mobile-menu a');
  mobileLinks.forEach(link => {
    const href = link.getAttribute('href');
    // For mobile flat list, we can directly match page, or parent page patterns
    let isMatch = (href === page);
    if (!isMatch) {
      if (href === "services.html" && (page.startsWith("program-") || page === "service-details.html")) {
        isMatch = true;
      } else if (href === "blog.html" && page.startsWith("blog-details")) {
        isMatch = true;
      }
    }
    if (isMatch) {
      highlight(link);
    }
  });
}

