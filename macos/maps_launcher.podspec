#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint maps_launcher.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'maps_launcher'
  s.version          = '0.0.1'
  s.summary          = 'Simple Flutter plugin to open the maps application (or browser) on all platforms.'
  s.description      = <<-DESC
Simple Flutter plugin to open the maps application (or browser) on all platforms.
                       DESC
  s.homepage         = 'https://github.com/pikaju/flutter-maps-launcher'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'maps_launcher/Sources/maps_launcher/**/*.swift'
  s.resource_bundles = {'maps_launcher_privacy' => ['maps_launcher/Sources/maps_launcher/PrivacyInfo.xcprivacy']}
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '12.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
