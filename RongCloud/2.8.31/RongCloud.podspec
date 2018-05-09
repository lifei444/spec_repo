#
#  Be sure to run `pod spec lint MVoIP.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|


  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #


  s.name         = "RongCloud"
  s.version      = "2.8.31"
  s.summary      = "RongCloud IM SDK.(如果看不到最新版本，请使用 pod repo update 命令更新一下本地pod仓库)"


  s.description  = <<-DESC
                   RongCloud IM SDK for iOS.


                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC


  s.homepage     = "http://rongcloud.cn/"
  s.license      = { :type => "Copyright", :text => "Copyright 2014 Rong Cloud" }
  s.author             = { "litao" => "litao@rongcloud.cn" }
  s.social_media_url   = "http://www.rongcloud.cn"
  s.platform     = :ios, "7.0"
  s.source       = { :http => "http://downloads.rongcloud.cn/RCE_App_SourceCode_v2_8_28.zip" }
  #s.default_subspec = 'IMLib', 'IMKit'
  s.requires_arc = true


  s.subspec 'IMLib' do |lib|
    lib.vendored_frameworks = "RongCloud/RongIMLib.framework"
    lib.libraries = "stdc++", "sqlite3", "z"
    lib.resources = "RongCloud/RCConfig.plist"
    lib.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    lib.vendored_libraries = "RongCloud/libopencore-amrnb.a"
  end

  s.subspec 'IMKit' do |kit|
      kit.resources = "RongCloud/RongCloud.bundle", "RongCloud/en.lproj", "RongCloud/zh-Hans.lproj", "RongCloud/Emoji.plist"
      kit.vendored_frameworks = "RongCloud/RongIMKit.framework"
      kit.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "SafariServices"
      kit.dependency 'RongCloud/IMLib'
  end

  s.subspec 'RedPacket' do |rp|
      rp.vendored_frameworks = "RongCloud/JrmfIMLib/JrmfPacketKit.framework", "RongCloud/JrmfIMLib/JYangToolKit.framework", "RongCloud/AlipaySDK/AlipaySDK.framework", "RongCloud/JrmfIMLib/JrmfWalletKit.framework"
      rp.resources = "RongCloud/JrmfIMLib/JResource.bundle", "RongCloud/JrmfIMLib/en.lproj", "RongCloud/JrmfIMLib/zh-Hans.lproj", "RongCloud/JrmfIMLib/jrmf.cer", "RongCloud/AlipaySDK/AlipaySDK.bundle"
      rp.libraries = "z", "xml2", "stdc++", "sqlite3", "c++", "c++abi"
      rp.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "CoreMotion", "CoreText"
      rp.dependency 'RongCloud/IMKit'
  end

 #  s.subspec 'Sticker' do |st|
#       st.vendored_frameworks = "RongCloud/BQMMRongCloudExt.framework"
#       st.resources = "RongCloud/BQMM.bundle"
#       st.libraries = "z"
#       st.dependency 'RongCloud/IMKit'
#   end

end
