Pod::Spec.new do |s|
  s.name         = "PreventSleep"
  s.version      = "2.0"
  s.summary      = "PreventSleep is a simple library to prevent a Mac from allowing a display to sleep, or from prevent idle sleep."
  s.homepage     = "https://github.com/jesse-c/PreventSleep"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author       = { "Jesse Claven" => "jesse.claven@gmail.com" }
  s.platform     = :osx, "10.10"
  s.source       = { :git => "https://github.com/jesse-c/PreventSleep.git", :tag => s.version }
  s.source_files = 'Sources/*.swift'
  s.requires_arc = true
end

