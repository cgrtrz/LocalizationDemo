import SwiftUI

@main
struct AppEntry: App {
    @State private var settingsVM: SettingsViewModel = .init()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(settingsVM)
        }
    }
}
