#
#  Be sure to run `pod spec lint AttributedText.podspec' to ensure this is a
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

  s.name         = "Toolbelt"
  s.version      = "0.12.1"
  s.summary      = "A collection of class extensions for iOS and OS X development written in Swift"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                    A collection of class extensions for iOS and OS X development written in Swift
                   DESC

  s.homepage     = "https://github.com/alexanderedge/Toolbelt.git"

  s.license      = "MIT"

  s.author             = { "Alexander Edge" => "alex@alexedge.co.uk" }

  s.platform     = :ios, "8.0"

  s.source       = {
    :git => "https://github.com/alexanderedge/Toolbelt.git",
    :tag => "#{s.version}"
  }

  s.source_files  = "Toolbelt/Toolbelt/**/*.swift"

end
