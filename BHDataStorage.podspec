#
# Be sure to run `pod lib lint BHDataStorage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BHDataStorage'
  s.version          = '0.1.2'
  s.summary          = 'A short description of BHDataStorage.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/XB-Paul/BHDataStorage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XB-Paul' => 'xuebao.zhan@wwwarehouse.com' }
  s.source           = { :git => 'git@github.com:WWWarehouseMobile/BHDataStorage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'BHDataStorage/Classes/BHDataStorage.h'
  s.source_files = 'BHDataStorage/Classes/BHDataStorage.h'
  
  s.subspec 'AppGroup' do |ss|
      ss.source_files = 'BHDataStorage/Classes/BHAppGroup.{h,m}'
      ss.public_header_files = 'BHDataStorage/Classes/BHAppGroup.h'
      ss.frameworks = 'Foundation'
  end
  
  s.subspec 'Keychain' do |ss|
      ss.source_files = 'BHDataStorage/Classes/BHKeychain*.{h,m}'
      ss.public_header_files = 'BHDataStorage/Classes/BHKeychain*.h'
      ss.frameworks = 'Foundation'
  end
  
  s.subspec 'Archive' do |ss|
      ss.source_files = 'BHDataStorage/Classes/BHArchive*.{h,m}'
      ss.public_header_files = 'BHDataStorage/Classes/BHArchive*.h'
      ss.dependency 'PINCache'
      ss.frameworks = 'Foundation', 'Security'
  end
  
  s.subspec 'Database' do |ss|
      ss.source_files = 'BHDataStorage/Classes/BHDatabase*.{h,m}'
      ss.public_header_files = 'BHDataStorage/Classes/BHDatabase.h'
      ss.dependency 'FMDB'
      ss.frameworks = 'Foundation'
  end
  # s.resource_bundles = {
  #   'BHDataStorage' => ['BHDataStorage/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
