Pod::Spec.new do |s|

  s.name         = "NSMutableArray-Delegate"
  s.version      = "0.0.3"
  s.summary      = "NSMutableArray-Delegate is a category that adds patern Delegate for mutable array."

#  s.description  = <<-DESC
#                   A longer description of NSMutableArray-Delegate in Markdown format.
#
#                   * Think: Why did you write this? What is the focus? What does it do?
#                   * CocoaPods will be using this to generate tags, and improve search results.
#                   * Try to keep it short, snappy and to the point.
#                   * Finally, don't worry about the indent, CocoaPods strips it!
#                   DESC

  s.homepage     = "https://github.com/nsleader/NSMutableArray-Delegate"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Ivan Chirkov" => "rumandevelop@gmail.com" }
  s.social_media_url   = "https://www.facebook.com/rumanwork"

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/nsleader/NSMutableArray-Delegate.git", :tag => s.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Classes", "Classes/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  s.public_header_files = "Classes/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.framework  = "Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
