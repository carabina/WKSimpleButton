Pod::Spec.new do |s|

  s.name         = "WKSimpleButton"
  s.version      = "0.0.1"
  s.summary      = "A short description of WKSimpleButton."

  s.homepage     = "https://github.com/OComme/WKSimpleButton"

  s.license      = "MIT"
  s.platform     = :ios

  s.author             = { "OComme" => "a1653913692@icloud.com" }

  s.source       = { :git => "https://github.com/OComme/WKSimpleButton.git", :tag => "#{s.version}" }
  s.source_files  = "WKSimpleButtonDemo/**/*.{h,m}"

  s.requires_arc = true
  s.ios.deployment_target = "8.0"

  s.dependency "Masonry"
  s.dependency "ReactiveObjC"

end
