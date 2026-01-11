import SwiftUI

struct HomeView: View {
    @Environment(SettingsViewModel.self) private var settingsVM
    @Environment(\.locale) private var locale
    @Environment(\.layoutDirection) private var layoutDirection

    @State private var messageCount: Int = 2

    var body: some View {
        VStack(spacing: 16) {

            Text("home_title")
                .font(Font.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
            
            headerCard
            
            formatCard
            
            pluralCard
            
            longTextCard

            Spacer(minLength: 6)

            NavigationLink {
                SettingsView()
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "globe")
                    Text("open_settings")
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: layoutDirection == .leftToRight ? "chevron.right" : "chevron.left")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
        }
        .padding()
    }

    // MARK: - Cards

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("current_language")
                .font(.headline)

            HStack(spacing: 10) {
                Text(settingsVM.selectedLanguage.flag)
                    .font(.title2)

                Text(settingsVM.selectedLanguage.title)
                    .font(.title3.weight(.semibold))

                Spacer()

                Text(layoutDirection == .rightToLeft ? "RTL" : "LTR")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.secondary)
            }

            Text("\(String(localized: "locale_label")) \(locale.identifier)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var formatCard: some View {
        let now = Date()
        let sampleNumber = 12345.67

        return VStack(alignment: .leading, spacing: 10) {
            Text("formatting_demo")
                .font(.headline)

            labeledRow("date_label", formattedDate(now))
            labeledRow("number_label", formattedNumber(sampleNumber))
            labeledRow("currency_label", formattedCurrency(sampleNumber, currencyCode: "USD"))
        }
        .padding(14)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var pluralCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("plural_demo")
                .font(.headline)

            Stepper(value: $messageCount, in: 0...99) {
                Text("messages_count \(messageCount)")
                    .font(.subheadline.weight(.semibold))
            }
        }
        .padding(14)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var longTextCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("layout_stress_test")
                .font(.headline)

            Text("long_text_example")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(3)
        }
        .padding(14)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    // MARK: - Helpers

    private func labeledRow(_ key: LocalizedStringKey, _ value: String) -> some View {
        HStack {
            Text(key)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
    }

    private func formattedDate(_ date: Date) -> String {
        let f = DateFormatter()
        f.locale = locale
        f.dateStyle = .medium
        f.timeStyle = .none
        return f.string(from: date)
    }

    private func formattedNumber(_ value: Double) -> String {
        let f = NumberFormatter()
        f.locale = locale
        f.numberStyle = .decimal
        f.maximumFractionDigits = 2
        return f.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    private func formattedCurrency(_ value: Double, currencyCode: String) -> String {
        let f = NumberFormatter()
        f.locale = locale
        f.numberStyle = .currency
        f.currencyCode = currencyCode
        return f.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
#Preview {
    HomeView()
}

