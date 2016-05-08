#
#  Be sure to run `pod spec lint test.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "GMTools"
  s.version      = "0.0.1"
  s.summary      = "A Library For Access to GMTools."

  s.description  = <<-DESC
                   A short description of GMTools.
                   DESC

  s.homepage     = "https://github.com/Joostar/GMTools"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"



  s.license  = { :type => 'GNU',
                 :text => 'Copyright (C) 1989, 1991 Free Software Foundation, Inc.' }

  s.author             = "Joostar"

  s.platform     = :ios

  s.source       = { :git => "https://github.com/Joostar/GMTools.git"}



s.subspec 'Tools' do |ss|
    ss.source_files = 'GMTools/GMTools.{h,m}','GMTools/GMTools{_private,+Check,+DateFormat,+Check,+Encode,+Parameters,+randomColor,CommonDefines}.{h,m}'
    ss.public_header_files = 'GMTools/GMTools.h','GMTools/GMTools{_private,+Check,+DateFormat,+Check,+Encode,+Parameters,+randomColor,CommonDefines}.h'

  end

  s.subspec 'Deivce' do |ss|
    ss.source_files = 'GMTools/UIDevice+Ext.{h,m}'
    ss.public_header_files = 'GMTools/UIDevice+Ext.h'
   
  end

  s.subspec 'Image' do |ss|
    
    ss.source_files = 'GMTools/UIImage{+Blend,+Clip,+Color,+Corner,+Resize,+Rotate}.{h,m}'
    ss.public_header_files = 'GMTools/UIImage{+Blend,+Clip,+Color,+Corner,+Resize,+Rotate}.h'

   
  end

  s.subspec 'Views' do |ss|
    
    ss.source_files = 'GMTools/UIView{+Corner,+Shadow}.{h,m}'
    ss.public_header_files = 'GMTools/UIView{+Corner,+Shadow}.h'
  end

 s.subspec 'Timer' do |ss|
    
    ss.source_files = 'GMTools/NSTimer{+BlockSuppor}.{h,m}'
    ss.public_header_files = 'GMTools/NSTimer{+BlockSuppor}.h'
  end


  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # s.framework  = "SomeFramework"
  s.frameworks = "Foundation"
  
s.dependency     'SimpleKeychain'


  s.requires_arc = false

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end