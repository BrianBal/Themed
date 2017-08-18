Pod::Spec.new do |s|
  s.name             = 'Themed'
  s.version          = '0.1.0'
  s.summary          = 'A light weight, simple and flexible theme engine for iOS written in Swift.'
  s.description      = <<-DESC
Themed is a theme engine for iOS.
+ Write styles in Swift
+ Keep styles DRY
+ Supports runtime style changes
                       DESC

  s.homepage         = 'https://github.com/BrianBal/Themed'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Bal' => 'briantbal@gmail.com' }
  s.source           = { :git => 'https://github.com/BrianBal/Themed.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'Themed/Classes/**/*'
end
