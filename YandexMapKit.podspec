Pod::Spec.new do |s|
  s.name     = 'YandexMapKit'
  s.version  = '1.0.7'
  s.license  = { :type => 'Yandex Map Kit Terms of Use', :file => 'LICENSE.txt' }
  s.summary  = 'Yandex Map Kit for iOS.'
  s.homepage = 'https://github.com/yandexmobile/yandexmapkit-ios'
  s.author   = 'Yandex'
  s.source = { :http => 'http://m.soft.yandex.ru/download/mapkit/ios-v4/yamapkit-file.zip' }
  s.description = 'Static library for embedding Yandex.Maps into iOS applications.'
  s.platform = :ios
  s.source_files = 'Headers/*.h'
  s.resources   = ['YandexMapKit.bundle', 'YandexMapKit_iOS7.bundle']
  s.frameworks = 'AudioToolbox', 'OpenAL', 'AVFoundation', 'CoreData', 'CoreLocation', 'CoreTelephony', 'QuartzCore', 'MessageUI', 'OpenGLES', 'Security', 'SystemConfiguration'
  s.libraries  = 'sqlite3', 'stdc++.6', 'xml2', 'z', 'YandexMapKit'
  s.preserve_paths = 'libYandexMapKit.a'
  s.xcconfig = { 
    'HEADER_SEARCH_PATHS'  => '"$(SDKROOT)/usr/include/libxml2"',
    'LIBRARY_SEARCH_PATHS' => ENV['YANDEX_DEV'] ? "\"#{ENV['BINBUILDS_FOLDER']}/yandex-mapkit-ios\"" : "\"$(PODS_ROOT)/YandexMapKit\""
  }
end
