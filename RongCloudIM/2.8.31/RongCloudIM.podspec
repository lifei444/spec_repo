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


  s.name         = "RongCloudIM"
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
  s.source       = { :http => "http://downloads.rongcloud.cn/Rong_Cloud_iOS_IM_SDK_v2_8_31_Stable.zip" }
  #s.default_subspec = 'IMLib', 'IMKit'
  s.requires_arc = true


  s.subspec 'IMLib' do |lib|
    lib.vendored_frameworks = "RongCloudIM/RongIMLib.framework"
    lib.libraries = "stdc++", "sqlite3", "z"
    lib.resources = "RongCloudIM/RCConfig.plist"
    lib.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    lib.vendored_libraries = "RongCloudIM/libopencore-amrnb.a"
  end

  s.subspec 'IMKit' do |kit|
      kit.resources = "RongCloudIM/RongCloud.bundle", "RongCloudIM/en.lproj", "RongCloudIM/zh-Hans.lproj", "RongCloudIM/Emoji.plist"
      kit.vendored_frameworks = "RongCloudIM/RongIMKit.framework"
      kit.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "SafariServices"
      kit.dependency 'RongCloudIM/IMLib'
  end

  s.subspec 'CallLib' do |cl|
      cl.vendored_frameworks = "RongCloudIM/RongCallLib.framework", "RongCloudIM/AgoraRtcEngineKit.framework"
      cl.libraries = "z", "xml2", "stdc++", "sqlite3", "c++", "c++abi", "resolv"
      cl.frameworks = "SystemConfiguration", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "CoreMotion", "VideoToolbox"
      cl.dependency 'RongCloudIM/IMLib'
  end

  s.subspec 'CallKit' do |ck|
      ck.vendored_frameworks = "RongCloudIM/RongCallKit.framework"
      ck.libraries = "z", "xml2", "stdc++", "sqlite3", "c++", "c++abi"
      ck.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics"
      ck.dependency 'RongCloudIM/CallLib'
      ck.dependency 'RongCloudIM/IMKit'
  end

  s.subspec 'RedPacket' do |rp|
      rp.vendored_frameworks = "RongCloudIM/JrmfIMLib/JrmfPacketKit.framework", "RongCloudIM/JrmfIMLib/JYangToolKit.framework", "RongCloudIM/AlipaySDK/AlipaySDK.framework", "RongCloudIM/JrmfIMLib/JrmfWalletKit.framework"
      rp.resources = "RongCloudIM/JrmfIMLib/JResource.bundle", "RongCloudIM/JrmfIMLib/en.lproj", "RongCloudIM/JrmfIMLib/zh-Hans.lproj", "RongCloudIM/JrmfIMLib/jrmf.cer", "RongCloudIM/AlipaySDK/AlipaySDK.bundle"
      rp.libraries = "z", "xml2", "stdc++", "sqlite3", "c++", "c++abi"
      rp.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo", "CoreTelephony", "CoreMedia", "CoreAudio", "CFNetwork", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics", "CoreMotion", "CoreText"
      rp.dependency 'RongCloudIM/IMKit'
  end

  s.subspec 'Sticker' do |st|
      st.vendored_frameworks = "RongCloudIM/BQMMRongCloudExt.framework"
      st.resources = "RongCloudIM/BQMM.bundle"
      st.libraries = "z"
      st.dependency 'RongCloudIM/IMKit'
  end

end
