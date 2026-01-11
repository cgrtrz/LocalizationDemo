import Foundation

@Observable
final class SettingsViewModel {
    var selectedLanguage: LanguageModel
    
    private let storage: LanguageStorage
    
    init(storage: LanguageStorage = UserDefaultsLanguageStorage()) {
        self.storage = storage
        self.selectedLanguage = storage.loadLanguage()
    }
    
    func changeLanguage(to newLanguage: LanguageModel) {
        guard selectedLanguage != newLanguage else { return }
        
        DispatchQueue.main.async {
            self.selectedLanguage = newLanguage
            self.storage.saveLanguage(newLanguage)
        }
    }
}
