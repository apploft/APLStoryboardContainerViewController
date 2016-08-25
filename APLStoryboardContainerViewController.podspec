Pod::Spec.new do |s|

  s.name         = "APLStoryboardContainerViewController"
  s.version      = "0.0.3"
  s.summary      = "A container view controller which can automatically load view controller from different storyboards and embed them as child view controller."

  s.description  = <<-DESC
                   A container view controller which can automatically load view controller from different storyboards and embed them as child view controller.
                   This greatly helps keeping storyboards clean and manageable in size.

                   * In a storyboard just insert a view controller and set the name of a different storyboard. Without further specification of a particular view controller name the 
                     initial view controllr of this storyboard will be loaded and embedded as child view controller.
                   DESC

  s.homepage     = "https://github.com/apploft/APLStoryboardContainerViewController"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.authors          = { "Tino Rachui" => "tino.rachui@apploft.de", "Mathias Koehnke" => "mathias.koehnke@apploft.de" }

  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/apploft/APLStoryboardContainerViewController.git", :tag => s.version.to_s }

  s.source_files  = 'Classes', 'Classes/**/*.{h,m}', 'Classes/Private/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
end
