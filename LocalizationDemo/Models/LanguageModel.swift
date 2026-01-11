import SwiftUI

enum LanguageModel: String, CaseIterable, Identifiable {
    case en, es, ru, ar, ja
    
    var id: String {
        return rawValue
    }
    
    var title: String {
        switch self {
        case .en: return "English"
        case .es: return "Español"
        case .ru: return "Русский"
        case .ar: return "العربية"
        case .ja: return "日本語"
        }
    }
    
    var identifier: String {
        return rawValue
    }
    
    var direction: LayoutDirection {
        switch self {
        case .en, .es, .ja, .ru: return .leftToRight
        case .ar: return .rightToLeft
        }
    }
    
    var countryCode: String {
           switch self {
           case .en: return "US"
           case .es: return "ES"
           case .ru: return "RU"
           case .ar: return "SA"
           case .ja: return "JP"
           }
       }
    
    var flag: String {
        return countryCode.flagEmoji
    }
}
