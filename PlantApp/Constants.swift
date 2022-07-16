//
//  Constants.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 06/07/22.
//

import UIKit

enum Images {
    case identifyPageImage
    case learnPageImage
    case readPageImage
    case identifyPageDot
    case learnPageDot
    case readPageDot
    case mainPageUserPhoto
    case mainPageflowerImage1
    case mainPageflowerImage2
    case mainPageflowerImage3
    case mainPagePlantImage
    case mainPageBackgroundImage
    case speciesPage_bg_img
    case kebab_menu_img
    case search
    case listPlantsBackground
    case redCactus
    case fatCactus
    case circleCactus
    case ic_check_green

    var image: UIImage? {
        switch self {
        case .identifyPageImage: return  UIImage(named: "ic_onboarding_identify")
        case .learnPageImage: return  UIImage(named: "ic_onboarding_learn")
        case .readPageImage: return UIImage(named: "ic_onboarding_read")
        case .identifyPageDot: return UIImage(named: "ic_dots_1")
        case .learnPageDot: return UIImage(named: "ic_dots_2")
        case .readPageDot: return UIImage(named: "ic_dots_3")
        case .mainPageUserPhoto: return UIImage(named: "ic_userPhoto")
        case .mainPageflowerImage1: return UIImage(named: "ic_flower_1")
        case .mainPageflowerImage2: return UIImage(named: "ic_flower_2")
        case .mainPageflowerImage3: return UIImage(named: "ic_flower_3")
        case .mainPagePlantImage: return UIImage(named: "ic_plant_1")
        case .mainPageBackgroundImage: return UIImage(named: "ic_main_bg")
        case .speciesPage_bg_img: return UIImage(named: "speciesPage_bg_img")
        case .kebab_menu_img: return UIImage(named: "kebab_menu_img")
        case .search: return UIImage(named: "ic_search")
        case .listPlantsBackground: return UIImage(named: "listPlantsPage_bg_img")
        case .redCactus: return UIImage(named: "red_cactus_img")
        case .fatCactus: return UIImage(named: "fat_cactus_img")
        case .circleCactus: return UIImage(named: "circle_cactus_img")
        case .ic_check_green: return UIImage(named: "ic_check_green")
        }
    }
}

enum Colors {
    case mainBgColor
    case mainTitleColor
    case onboardingBtnColor
    case mainSubtitleColor
    case spaciesPagetextColor

    var color: UIColor? {
        switch self {
            case .mainBgColor: return UIColor(named: "main_bg")
            case .mainTitleColor: return UIColor(named: "main_title_color")
            case .onboardingBtnColor: return UIColor(named: "onboarding_btn_color")
            case .mainSubtitleColor: return UIColor(named: "main_subtitle_color")
            case .spaciesPagetextColor: return  UIColor(named: "speciesPage_textColor")
        }
    }
}

enum Strings {
    case identifyPageTitleLabel
    case learnPageTitleLabel
    case readPageTitleLabel
    case loginPageTitleLabel
    case identifyPageDescription
    case learnPageDescription
    case readPageDescription
    case loginPageDescription
    case loginPageSubtitleLabel

    var value: String {
        switch self {
            case .identifyPageTitleLabel: return "Identify Plants"
            case .learnPageTitleLabel: return "Learn Many Plants Species"
            case .readPageTitleLabel: return "Read Many Articles About Plant"
            case .loginPageTitleLabel: return  "Hello"
            case .identifyPageDescription: return "You can identify the plants you don't know through your camera"
            case .learnPageDescription: return "Let's learn about the many plant species that exist in this world"
            case .readPageDescription: return "Let's learn more about beautiful plants and read many articles about plants and gardening"
            case .loginPageDescription: return "Let’s Learn More About Plants"
            case .loginPageSubtitleLabel: return "Username"
        }
    }
}
