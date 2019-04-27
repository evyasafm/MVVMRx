# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

target 'MVVMRx' do

  pod 'Moya'
  pod 'Moya/RxSwift'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SnapKit'
  pod 'RxSwiftExt'
  pod 'R.swift', '~> 5.0.0.alpha.2'
  pod 'Kingfisher'
  pod 'MXParallaxHeader'
  pod 'Hero'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Hero'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
