target 'FBLeak' do

    platform :ios, '8.0'
    project 'FBLeak.xcodeproj'
    #use_frameworks!


    # Sign-in
    pod 'Facebook-iOS-SDK', '3.24.4'
end

post_install do |installer|
  installer.pods_project.build_settings('Debug')['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
  
  installer.pods_project.build_configurations.each do |config|
  	config.build_settings['ENABLE_BITCODE'] = 'NO'
  end

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end
