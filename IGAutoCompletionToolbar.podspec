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
    ss.source_files  = 'IGAutoCompletionToolbar/Library/ios5/*.{m,h}'
    ss.dependency 'PSTCollectionView'
    ss.dependency 'IGAutoCompletionToolbar/Core'

    def ss.post_install(target)
      prefix_header = config.project_pods_root + target.prefix_header_filename
      prefix_header.open('a') do |file|
        file.puts(%{#ifdef __OBJC__\n#import "IGAutoCompletionToolbar+iOS5.h"\n#endif})
      end
    end
  end
end
