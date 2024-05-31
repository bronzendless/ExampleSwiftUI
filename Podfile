# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

source 'https://cdn.cocoapods.org/'

def pods_libs
  pod 'Alamofire', '5.9.1'
  pod 'Kingfisher', '7.11.0'
  pod 'SwiftUIIntrospect', '1.1.4'
end

target 'ExampleSwiftUI' do
  inhibit_all_warnings!
  use_frameworks!
  pods_libs
end


post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
    end
end

