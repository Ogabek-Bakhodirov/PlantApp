//
//  Constants.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 06/07/22.
//

import UIKit

struct K{
    
    struct OnboardingImages{
        static var identifyPageImage = UIImage(named: "ic_onboarding_identify")
        static var learnPageImage = UIImage(named: "ic_onboarding_learn")
        static var readPageImage = UIImage(named: "ic_onboarding_read")
    }
    
    struct Colors{
        static let mainBgColor = UIColor(named: "main_bg")
        static let mainTitleColor = UIColor(named: "main_title_color")
        static let onboardingBtnColor = UIColor(named: "onboarding_btn_color")
        static let mainSubtitleColor = UIColor(named: "main_subtitle_color")
    }
    
    struct TitleLabels{
        static var identifyPageTitleLabel = "Identify Plants"
        static var learnPageTitleLabel = "Learn Many Plants Species"
        static var readPageTitleLabel = "Read Many Articles About Plant"
        static var loginPageTitleLabel = "Hello"
    }
    struct SubtitleLabels {
        static var loginPageSubtitleLabel = "Username"
    }
    
    struct DescriptionLabels{
        static var identifyPageDescription = "You can identify the plants you don't know through your camera"
        static var learnPageDescription = "Let's learn about the many plant species that exist in this world"
        static var readPageDescription = "Let's learn more about beautiful plants and read many articles about plants and gardening"
        static var loginPageDescription = "Let’s Learn More About Plants"
    }
    
    struct DotImages{
        static var identifyPageDot = UIImage(named: "ic_dots_1")
        static var learnPageDot = UIImage(named: "ic_dots_2")
        static var readPageDot = UIImage(named: "ic_dots_3")
    }
}
