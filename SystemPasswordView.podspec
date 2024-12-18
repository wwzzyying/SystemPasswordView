Pod::Spec.new do |s|
  s.name             = 'SystemPasswordView'
  s.version          = '0.1.4'
  s.summary          = 'A system-style password input view for iOS'
  
  s.description      = <<-DESC
  SystemPasswordView is a SwiftUI component that provides a system-style password input interface.
  It features:
  * Haptic feedback
  * Error animation
  * Native SwiftUI implementation
                       DESC

  s.homepage         = 'https://github.com/wwzzyying/SystemPasswordView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jyuuroku Wu' => 'jyuurokuu@gmail.com' }
  s.source           = { :git => 'https://github.com/wwzzyying/SystemPasswordView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '17.0'
  s.swift_version = '6.0'

  s.source_files = 'Sources/SystemPasswordView/**/*'
  
  s.frameworks = 'SwiftUI'
end 