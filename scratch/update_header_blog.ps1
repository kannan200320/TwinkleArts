# PowerShell script to update header layout to move Blog to main menu

$newHeader = @'
  <!-- ================= HEADER SECTION ================= -->
  <header class="sticky top-0 z-40 bg-white/95 dark:bg-darknavy/95 backdrop-blur border-b border-gray-100 dark:border-gray-800 transition-colors duration-300">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between h-20">
        
        <!-- Logo -->
        <a href="index.html" class="flex items-center space-x-2 rtl:space-x-reverse shrink-0">
          <span class="w-10 h-10 rounded-full bg-magenta flex items-center justify-center text-white font-extrabold text-xl shadow-lg shadow-magenta/30 animate-pulse-slow">K</span>
          <span class="text-xl font-bold tracking-tight text-darknavy dark:text-white font-sans">Kids<span class="text-magenta">Dance</span></span>
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
                <a href="instructors.html" class="block px-4 py-2.5 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Our Instructors</a>
                <a href="pricing.html" class="block px-4 py-2.5 text-sm rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-darknavy-light hover:text-magenta font-semibold transition-colors">Membership Plans</a>
              </div>
            </div>
          </div>
          
          <a href="blog.html" class="text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition-colors duration-200">Blog</a>
          <a href="contact.html" class="text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold transition-colors duration-200">Contact</a>
        </nav>

        <!-- Utility Toggles & Button -->
        <div class="hidden xl:flex items-center space-x-3 rtl:space-x-reverse shrink-0">
          <button class="rtl-toggle px-3 py-1.5 rounded-lg border border-gray-200 dark:border-gray-700 text-xs font-extrabold hover:bg-gray-100 dark:hover:bg-darknavy-light transition text-gray-700 dark:text-gray-300">
            <span class="rtl-text">RTL (Arabic)</span>
          </button>
          
          <button class="theme-toggle p-2 rounded-lg border border-gray-200 dark:border-gray-700 hover:bg-gray-100 dark:hover:bg-darknavy-light text-gray-500 dark:text-gray-400">
            <svg class="theme-toggle-sun w-5 h-5 hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364-6.364l-.707.707M6.343 17.657l-.707.707m12.728 0l-.707-.707M6.343 6.343l-.707-.707M12 8a4 4 0 100 8 4 4 0 000-8z"></path></svg>
            <svg class="theme-toggle-moon w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path></svg>
          </button>

          <a href="login-register.html" class="bg-magenta hover:bg-magenta-hover text-white px-5 py-2.5 rounded-full font-bold shadow-lg shadow-magenta/20 transition duration-150 text-sm">Register Now</a>
        </div>

        <!-- Mobile Menu Toggle Button -->
        <div class="flex items-center space-x-2 rtl:space-x-reverse xl:hidden shrink-0">
          <button class="theme-toggle p-2 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400">
            <svg class="theme-toggle-sun w-5 h-5 hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364-6.364l-.707.707M6.343 17.657l-.707.707m12.728 0l-.707-.707M6.343 6.343l-.707-.707M12 8a4 4 0 100 8 4 4 0 000-8z"></path></svg>
            <svg class="theme-toggle-moon w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path></svg>
          </button>
          <button class="rtl-toggle p-2 rounded-lg border border-gray-200 dark:border-gray-700 text-xs font-bold text-gray-700 dark:text-gray-300">RTL</button>
          <button id="mobile-menu-btn" class="p-2 text-gray-700 dark:text-gray-300 focus:outline-none">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
          </button>
        </div>

      </div>
    </div>

    <!-- Mobile Navigation Drawer -->
    <div id="mobile-menu" class="hidden border-b border-gray-200 dark:border-gray-800 bg-white dark:bg-darknavy transition-all xl:hidden">
      <div class="px-4 py-4 space-y-2">
        <a href="index.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Home 1 - Academy Landing</a>
        <a href="home-niche.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Home 2 - Niche Urban Beat</a>
        <a href="about.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">About Us</a>
        <a href="services.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Programs</a>
        <a href="schedule.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Schedule</a>
        <a href="gallery.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Gallery</a>
        <a href="instructors.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Instructors</a>
        <a href="pricing.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Pricing</a>
        <a href="blog.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Blog</a>
        <a href="contact.html" class="block py-2 text-gray-700 dark:text-gray-300 hover:text-magenta font-semibold">Contact</a>
        <div class="pt-4 border-t border-gray-100 dark:border-gray-800">
          <a href="login-register.html" class="block w-full text-center bg-magenta text-white py-3 rounded-lg font-bold">Register Now</a>
        </div>
      </div>
    </div>
  </header>
'@

Get-ChildItem -Filter *.html | ForEach-Object {
    $filePath = $_.FullName
    $name = $_.Name
    
    if ($name -eq "dashboard.html") {
        return
    }
    
    $content = [System.IO.File]::ReadAllText($filePath)
    $headerPattern = '(?s)<header[^>]*>.*?</header>'
    
    if ($content -match $headerPattern) {
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, $headerPattern, $newHeader)
        [System.IO.File]::WriteAllText($filePath, $content)
        Write-Host "Updated header in: $name"
    }
}
