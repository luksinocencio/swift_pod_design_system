Pod::Spec.new do |spec|

  spec.name                  = "CoreFramework"
  spec.version               = "1.0.0"
  spec.summary               = "CoreFramework foi desenvolvido para o app Reminder como core de design e de componentes a serem utilizados pela equipe ReminderTeam."

  spec.description           = <<-DESC
                   Este projeto tem o intuito de...
  DESC

  spec.homepage              = "https://github.com/luksinocencio/swift_pod_design_system.git"
  spec.license               = { :type => "MIT", :file => "LICENSE" }
  spec.author                = { "luksinocencio" => "luksinocencio@gmail.com" }
  spec.platform              = :ios, "12.0"
  spec.ios.deployment_target = "12.0"
  spec.source                = { :git => "https://github.com/luksinocencio/swift_pod_design_system.git", :tag => "#{spec.version}" }
  spec.source_files          = "CoreFramework/Sources/**/*.{swift,h}"
  spec.frameworks          = "UIKit"
  spec.exclude_files         = "Classes/Exclude"
  
end