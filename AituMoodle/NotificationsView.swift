import SwiftUI

struct NotificationsView: View {
    let notifications = [
        Notifications(date: Date(), subName: "Intoducing to programming 1", assName: "Register Term", previousMark: "N/A", currentMark: "100"),
        Notifications(date: Date(), subName: "Intoducing to programming 1", assName: "Register Term", previousMark: "N/A", currentMark: "100"),
        Notifications(date: Date(), subName: "Intoducing to programming 1", assName: "Register Term", previousMark: "N/A", currentMark: "100"),
        Notifications(date: Date(), subName: "Intoducing to programming 1", assName: "Register Term", previousMark: "N/A", currentMark: "100")
    ]
    let colors = [
        Color(red: 0.88, green: 1, blue: 0.7),
        Color(red: 1, green: 0.93, blue: 0.7),
        Color(red: 0.98, green: 0.77, blue: 0.99)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Notifications")
                    .font(.customFont(size: 51))
                    .foregroundColor(Color("fontColor"))
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
            }
            ScrollView {
                VStack {
                    ForEach(0..<notifications.count, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 18) {
                            HStack {
                                Text(notifications[index].date, formatter: dateFormatter)
                                    .font(.customFont(size: 27))
                                    .foregroundColor(Color("FontWithouDark"))
                                Spacer()
                            }
                            VStack(spacing: 7) {
                                HStack {
                                    Text("Updated grades:")
                                        .font(.customFont(size: 27))
                                        .foregroundColor(Color("NameOfNotif"))
                                    Spacer()
                                }
                                HStack {
                                    Text("\(notifications[index].subName):")
                                        .font(.customFont(size: 27))
                                        .foregroundColor(Color("FontWithouDark"))
                                    Spacer()
                                }
                                HStack {
                                    Text("• \(notifications[index].assName): \(notifications[index].previousMark) → \(notifications[index].currentMark)")
                                        .font(.customFont(size: 27))
                                        .foregroundColor(Color("FontWithouDark"))
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                        .background(colors[index % colors.count])
                        .cornerRadius(24)
                        .padding(.horizontal, 15)
                    }
                }
            }
        }
    }
}



#Preview {
    NotificationsView()
}
