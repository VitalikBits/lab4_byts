import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var city = ""
    @State private var university = ""
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    headerView
                    informationView
                    interestsView
                }
                .frame(maxWidth: 600)
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
    }
    
    // Верхня частина профілю
    private var headerView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: [.blue, .indigo],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 12) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                
                Text(name.isEmpty ? "Ваше ім'я" : name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("Мій профіль • SwiftUI")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding(25)
        }
    }
    
    // Особиста інформація
    private var informationView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Особиста інформація")
                .font(.title3)
                .fontWeight(.bold)
            
            profileField(
                "Ім'я та прізвище",
                placeholder: "Введіть ім'я",
                value: $name
            )
            
            profileField(
                "Місто",
                placeholder: "Введіть місто",
                value: $city
            )
            
            profileField(
                "Навчальний заклад",
                placeholder: "Введіть назву закладу",
                value: $university
            )
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color(.secondarySystemGroupedBackground),
            in: RoundedRectangle(cornerRadius: 20)
        )
        .shadow(color: .black.opacity(0.06),
                radius: 8, x: 0, y: 4)
    }
    
    // Поле введення інформації
    private func profileField(
        _ title: String,
        placeholder: String,
        value: Binding<String>
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            TextField(placeholder, text: value)
                .padding(12)
                .background(
                    Color(.systemGroupedBackground),
                    in: RoundedRectangle(cornerRadius: 10)
                )
        }
    }
    
    // Інтереси
    private var interestsView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Мої інтереси")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Мені подобається програмування та створення мобільних застосунків.")
                .font(.body)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 12) {
                interestItem("Swift", icon: "chevron.left.forwardslash.chevron.right")
                interestItem("iOS", icon: "iphone")
                interestItem("Дизайн", icon: "paintbrush")
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color(.secondarySystemGroupedBackground),
            in: RoundedRectangle(cornerRadius: 20)
        )
    }
    // Окремий елемент інтересів
        private func interestItem(
            _ title: String,
            icon: String
        ) -> some View {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)

                Text(title)
                    .font(.caption)
            }
            .foregroundStyle(.indigo)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(
                Color.indigo.opacity(0.08),
                in: RoundedRectangle(cornerRadius: 12)
            )
        }
    }

    #Preview {
        ContentView()
    }
