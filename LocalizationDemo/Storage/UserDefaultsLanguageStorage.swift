import Foundation

protocol LanguageStorage {
    func loadLanguage() -> LanguageModel
    func saveLanguage(_ language: LanguageModel)
}

final class UserDefaultsLanguageStorage: LanguageStorage {

    private let key = "selected_language_identifier"
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func loadLanguage() -> LanguageModel {
        guard
            let identifier = defaults.string(forKey: key),
            let language = LanguageModel(rawValue: identifier)
        else {
            return .en // veya .en / .ar
        }

        return language
    }

    func saveLanguage(_ language: LanguageModel) {
        defaults.set(language.identifier, forKey: key)
    }
}
