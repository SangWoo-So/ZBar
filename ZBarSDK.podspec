Pod::Spec.new do |s|
  s.name     = 'ZBarSDK'
  s.version  = '2.0.0'
  s.platform = :ios
  s.license  = 'GNU LGPL 2.1'
  s.summary  = 'QR and barcode scan library'
  s.homepage = 'http://zbar.sourceforge.net/'
  s.author   = { 'Jeff Brown' => 'spadix@users.sourceforge.net' }
  s.source   = { :git => 'https://github.com/SangWoo-So/ZBar', :revision => 'iPhoneSDK-2.0.0' }

  s.description  = 'ZBar is an open source software suite for reading bar codes from various sources, such as video streams, ' \
                   'image files and raw intensity sensors. It supports many popular symbologies (types of bar codes) including ' \
                   'EAN-13/UPC-A, UPC-E, EAN-8, Code 128, Code 39, Interleaved 2 of 5 and QR Code.'

  s.resources    = 'iphone/res/{zbar-*.png,zbar-help.html}'

  s.public_header_files = 'iphone/**/**/*.h', 'include/*.h'
  s.source_files = 'include/zbar.h', 'zbar/**/*.h',
                    'iphone/*.h',
                    'iphone/include/**/*.h',
                    'zbar/{config,decoder,error,image,img_scanner,refcnt,scanner,symbol}.c',
                    'zbar/decoder/{codabar,code39,code93,code128,databar,ean,i25,qr_finder}.c',
                    'zbar/qrcode/*.c',
                    'iphone/*.m'

  s.frameworks   = 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'QuartzCore'

  s.library      = 'iconv'

#   s.clean_paths  = FileList['*'].exclude(/(include|zbar|iphone|README|LICENSE)$/)

  s.xcconfig = { "EXCLUDED_SOURCE_FILE_NAMES[sdk=iphoneos*][arch=*]"        => 'ZBarReaderViewImpl_Simulator.m',
                 "EXCLUDED_SOURCE_FILE_NAMES[sdk=iphonesimulator*][arch=*]" => 'ZBarReaderViewImpl_Capture.m ZBarCaptureReader.m',
                 "GCC_PREPROCESSOR_DEFINITIONS"                             => '$(inherited) NDEBUG=1' }
                 
  s.prefix_header_file = 'iphone/include/prefix.pch'
  s.compiler_flags = '-w'
  s.requires_arc = false

#   # Maintain the dir structure for headers
#   def s.copy_header_mapping(from)
#     from
#   end
# 
#   # Append the prefix header to the Pods prefix header
#   def s.post_install(target)
#     prefix_header = config.project_pods_root + target.prefix_header_filename
#     prefix_header.open('a') do |file|
#       file.puts((pod_destroot + 'iphone/include/prefix.pch').read)
#     end
#   end
end