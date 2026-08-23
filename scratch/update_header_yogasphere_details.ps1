# PowerShell script to update mobile drawer with YogaSphere sub-menu guides and backdrop close actions

$newHeader = @'
  <!-- ================= HEADER SECTION ================= -->
  <header class="sticky top-0 z-40 bg-white/95 dark:bg-darknavy/95 backdrop-blur border-b border-gray-100 dark:border-gray-800 transition-colors duration-300">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between h-20">
        
        <!-- Logo -->
        <a href="index.html" class="flex items-center space-x-2 rtl:space-x-reverse shrink-0">
          <span class="w-10 h-10 rounded-full bg-magenta flex items-center justify-center text-white font-extrabold text-xl shadow-lg shadow-magenta/30 animate-pulse-slow">T</span>
          <span class="text-xl font-bold tracking-tight text-darknavy dark:text-white font-sans">Twinkle<span class="text-magenta">Arts</span></span>
        </a>

        <!-- Desktop Navigation -->
        <nav class="hidden xl:flex space-x-6 rtl:space-x-reverse items-center mx-6">
          
          <!-- Home Dropdown -->
          <div class="relative group">
            <button class="dropdown-toggle flex items-center space-x-1 rtl:space-x-reverse text-gray-700 dark:text-gray-300 hover:text-magenta py-2 font-semibold transition-colors duration-200">
              <span>Home</span>
              <svg class="w-4 h-4 text-gray-400 group-hover:text-magenta transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
            </button>
            <div class="absolute left-0 rtl:right-0 mt-2 w-56 rounded-xl bg-white dark:bg-darknavy border border-gray-100 dark:border-gray-800 shadow-xl hidden group-hover:block z-50">
              <div class="p-2 space-y-1">
                <a href="index.html" class="block px-4 py-3 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Home 1 - Academy Landing</a>
                <a href="home-niche.html" class="block px-4 py-3 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Home 2 - Niche Urban Beat</a>
              </div>
            </div>
          </div>

          <a href="about.html" class="text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition-colors duration-200">About Us</a>
          <a href="services.html" class="text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition-colors duration-200">Programs</a>
          <a href="instructors.html" class="text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition-colors duration-200">Instructors</a>
          
          <!-- Explore Dropdown -->
          <div class="relative group">
            <button class="dropdown-toggle flex items-center space-x-1 rtl:space-x-reverse text-gray-700 dark:text-gray-300 hover:text-magenta py-2 font-semibold transition-colors duration-200">
              <span>Explore Pages</span>
              <svg class="w-4 h-4 text-gray-400 group-hover:text-magenta transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
            </button>
            <div class="absolute left-0 rtl:right-0 mt-2 w-52 rounded-xl bg-white dark:bg-darknavy border border-gray-100 dark:border-gray-800 shadow-xl hidden group-hover:block z-50">
              <div class="p-2 space-y-1">
                <a href="schedule.html" class="block px-4 py-2.5 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Class Schedule</a>
                <a href="gallery.html" class="block px-4 py-2.5 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Event Gallery</a>
                <a href="pricing.html" class="block px-4 py-2.5 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Membership Plans</a>
                <a href="blog.html" class="block px-4 py-2.5 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Academy Blog</a>
              </div>
            </div>
          </div>
          
          <a href="contact.html" class="text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition-colors duration-200">Contact</a>
        </nav>

        <!-- Utility Toggles & Button -->
        <div class="hidden xl:flex items-center space-x-3 rtl:space-x-reverse shrink-0">
          <button class="rtl-toggle px-3 py-1.5 rounded-lg border border-gray-200 dark:border-gray-700 text-xs font-extrabold hover:bg-gray-100 dark:hover:bg-darknavy-light transition text-gray-700 dark:text-gray-300">
            <span class="rtl-text">RTL</span>
          </button>
          
          <button class="theme-toggle p-2 rounded-lg border border-gray-200 dark:border-gray-700 hover:bg-gray-100 dark:hover:bg-darknavy-light text-gray-500 dark:text-gray-400">
            <svg class="theme-toggle-sun w-5 h-5 hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364-6.364l-.707.707M6.343 17.657l-.707.707m12.728 0l-.707-.707M6.343 6.343l-.707-.707M12 8a4 4 0 100 8 4 4 0 000-8z"></path></svg>
            <svg class="theme-toggle-moon w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path></svg>
          </button>

          <a href="login-register.html" class="bg-magenta hover:bg-magenta-hover text-white px-5 py-2.5 rounded-full font-bold shadow-lg shadow-magenta/20 transition duration-150 text-sm">Register Now</a>
        </div>

        <!-- Mobile Menu Toggle Button (Clean like YogaSphere) -->
        <div class="xl:hidden flex items-center shrink-0">
          <button id="mobile-menu-btn" class="p-2 text-gray-700 dark:text-gray-300 focus:outline-none">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
          </button>
        </div>

      </div>
    </div>

    <!-- Mobile Navigation Drawer (YogaSphere Style) -->
    <div id="mobile-menu" class="hidden fixed inset-0 z-50 bg-black/60 xl:hidden">
      <!-- Backdrop Close Area -->
      <div class="absolute inset-0" onclick="document.getElementById('mobile-menu').classList.add('hidden')"></div>
      
      <div class="absolute top-0 right-0 rtl:left-0 rtl:right-auto w-80 h-full bg-white dark:bg-neutral-900 p-6 shadow-2xl flex flex-col justify-between transition-transform duration-300 z-10">
        
        <div class="space-y-6">
          <!-- Drawer Header -->
          <div class="flex justify-between items-center pb-4 border-b border-gray-150 dark:border-gray-800">
            <h4 class="text-xl font-bold text-darknavy dark:text-white">Menu</h4>
            <button id="mobile-menu-close" class="text-gray-500 hover:text-magenta focus:outline-none">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>
          </div>

          <!-- Drawer Navigation Links -->
          <nav class="space-y-3">
            <!-- Home Accordion -->
            <div class="space-y-1">
              <button class="w-full flex justify-between items-center py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition text-left" onclick="this.nextElementSibling.classList.toggle('hidden')">
                <span>Home</span>
                <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
              </button>
              <div class="pl-4 ml-1 space-y-2.5 hidden border-l-2 border-gray-150 dark:border-gray-800 py-1">
                <a href="index.html" class="block pl-3 text-sm text-gray-500 hover:text-magenta font-medium">Home 1</a>
                <a href="home-niche.html" class="block pl-3 text-sm text-gray-500 hover:text-magenta font-medium">Home 2</a>
              </div>
            </div>

            <a href="about.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition">About Us</a>
            <a href="services.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition">Programs</a>
            <a href="instructors.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition">Instructors</a>
            
            <!-- Explore Pages Accordion -->
            <div class="space-y-1">
              <button class="w-full flex justify-between items-center py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition text-left" onclick="this.nextElementSibling.classList.toggle('hidden')">
                <span>Explore Pages</span>
                <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
              </button>
              <div class="pl-4 ml-1 space-y-2.5 hidden border-l-2 border-gray-150 dark:border-gray-800 py-1">
                <a href="schedule.html" class="block pl-3 text-sm text-gray-500 hover:text-magenta font-medium">Class Schedule</a>
                <a href="gallery.html" class="block pl-3 text-sm text-gray-500 hover:text-magenta font-medium">Event Gallery</a>
                <a href="pricing.html" class="block pl-3 text-sm text-gray-500 hover:text-magenta font-medium">Membership Plans</a>
                <a href="blog.html" class="block pl-3 text-sm text-gray-500 hover:text-magenta font-medium">Academy Blog</a>
              </div>
            </div>

            <a href="contact.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition">Contact</a>
          </nav>
        </div>

        <div class="space-y-4">
          <!-- Register Now CTA button (full-width) -->
          <div class="pt-4 border-t border-gray-150 dark:border-gray-800">
            <a href="login-register.html" class="block w-full text-center bg-magenta hover:bg-magenta-hover text-white py-3.5 rounded-xl font-bold shadow transition text-sm">Register Now</a>
          </div>

          <!-- Bottom Toggles Bar -->
          <div class="flex justify-between items-center pt-4 border-t border-gray-150 dark:border-gray-800">
            <!-- Theme Toggle Icon Button -->
            <button class="theme-toggle p-2 hover:bg-gray-100 dark:hover:bg-neutral-800 rounded-xl transition text-gray-500 dark:text-gray-400">
              <svg class="theme-toggle-sun w-6 h-6 hidden" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364-6.364l-.707.707M6.343 17.657l-.707.707m12.728 0l-.707-.707M6.343 6.343l-.707-.707M12 8a4 4 0 100 8 4 4 0 000-8z"></path></svg>
              <svg class="theme-toggle-moon w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z"></path></svg>
            </button>
            
            <!-- RTL/LTR Swap Icon Button -->
            <button class="rtl-toggle p-2 hover:bg-gray-100 dark:hover:bg-neutral-800 rounded-xl transition text-gray-500 dark:text-gray-400">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4"/></svg>
            </button>
          </div>
        </div>

      </div>
    </div>
  </header>
'@

Get-ChildItem -Filter *.html | ForEach-Object {
    $filePath = $_.FullName
    $name = $_.Name
    
    if ($name -eq "dashboard.html" -or $name -eq "login-register.html") {
        return
    }
    
    $content = [System.IO.File]::ReadAllText($filePath)
    $headerPattern = '(?s)<header[^>]*>.*?</header>'
    
    if ($content -match $headerPattern) {
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, $headerPattern, $newHeader)
        [System.IO.File]::WriteAllText($filePath, $content)
        Write-Host "Polished YogaSphere mobile drawer in: $name"
    }
}
