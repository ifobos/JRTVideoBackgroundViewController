Pod::Spec.new do |s|
  s.name         = "JRTVideoBackgroundViewController"
  s.version      = "0.0.1"
  s.summary      = "JRTVideoBackgroundViewController contains a ViewController fast and easy configuration having background video player."
  s.homepage     = "https://github.com/ifobos/JRTVideoBackgroundViewController"
  s.license      = "MIT"
  s.author       = { "ifobos" => "juancarlos.garcia.alfaro@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ifobos/JRTVideoBackgroundViewController.git", :tag => "0.0.1" }
  s.source_files = "JRTVideoBackgroundViewController/JRTVideoBackgroundViewController/PodFiles/*.{h,m}"
  s.requires_arc = true
end
