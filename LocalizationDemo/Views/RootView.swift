import SwiftUI

struct RootView: View {
    @Environment(SettingsViewModel.self) private var settingsVM

    var body: some View {
        NavigationStack {
            HomeView()
        }
        .environment(\.locale, Locale(identifier: settingsVM.selectedLanguage.identifier))
        .environment(\.layoutDirection, settingsVM.selectedLanguage.direction)
    }
}

#Preview {
    RootView()
}
