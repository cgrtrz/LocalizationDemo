import SwiftUI

struct SettingsView: View {
    @Environment(SettingsViewModel.self) private var vm

    var body: some View {
        List {
            Section(header: Text("language_section_title")) {
                ForEach(LanguageModel.allCases) { language in
                    HStack(spacing: 10) {
                        Text(language.flag)
                            .font(.title3)

                        Text(language.title)

                        Spacer()

                        if vm.selectedLanguage == language {
                            Image(systemName: "checkmark")
                                .font(.body.weight(.semibold))
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        vm.changeLanguage(to: language)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("\(language.title)")
                }
            }
        }
        .id(vm.selectedLanguage.identifier)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(LocalizedStringKey("settings_title"))
                    .font(.title)
                    .bold()
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
    .environment(SettingsViewModel())
}
