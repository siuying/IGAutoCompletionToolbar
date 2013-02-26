Pod::Spec.new do |s|
  s.name     = 'IGAutoCompletionToolbar'
  s.version  = '0.1.1'
  s.summary  = 'IGAutoCompletionToolbar is a UICollectionView subclass created to display auto completion via a keyboard accessory view.'
  s.description = "IGAutoCompletionToolbar is a UICollectionView subclass created to display auto completion via a keyboard accessory view."

  s.homepage = 'https://github.com/siuying/IGAutoCompletionToolbar'
  s.author   = { 'Francis Chong' => 'francis@ignition.hk' }
  s.license  = 'MIT'
  s.source   = { :git => 'https://github.com/siuying/IGAutoCompletionToolbar.git', :tag => '0.1.2' }
  s.requires_arc = true
  s.platform = :ios, '5.0'

  s.preferred_dependency = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files = 'IGAutoCompletionToolbar/Library/*.{m,h}'
    ss.frameworks = 'QuartzCore'
  end

  s.subspec 'ios5' do |ss|
    ss.dependency 'PSTCollectionView'
    ss.dependency 'IGAutoCompletionToolbar/Core'
    s.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) IG_TOOLBAR_IOS5' }
  end
end
