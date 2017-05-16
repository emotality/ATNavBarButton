Pod::Spec.new do |s|
  s.name        = "ATNavBarButton"
  s.version     = "1.1"
  s.summary     = "A sub-class of UIBarButtonItem to insert custom buttons or indicatorView into your navigationBar with one line of code."
  s.screenshots = "https://www.emotality.com/development/GitHub/ATNavBarButton-1.png", "https://www.emotality.com/development/GitHub/ATNavBarButton-2.png", "https://www.emotality.com/development/GitHub/ATNavBarButton-3.png"
  s.license  = { :type => 'MIT', :file => 'LICENSE.md' }

  s.author              = { "Jean-Pierre Fourie" => "jp@emotality.com" }
  s.homepage		= 'https://github.com/emotality/ATNavBarButton'
  s.social_media_url    = 'https://twitter.com/emotality'

  s.platform                = :ios
  s.ios.deployment_target   = '8.0'
  s.requires_arc            = true

  s.source              = { :git => "https://github.com/emotality/ATNavBarButton.git", :tag => s.version.to_s }
  s.source_files        = 'ATNavBarButton/*.{m,h}'
  s.public_header_files = 'ATNavBarButton/*.h'
  s.frameworks          = 'UIKit'
end
