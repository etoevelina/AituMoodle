import SwiftUI

struct GradesView: View {
    
    let gradesItem: [GradeItem]?
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            
            if let firstGrade = gradesItem?.first(where: { $0.itemname == "Register Term" && $0.percentageformatted != "0.00 %" && $0.percentageformatted != "-"}) {
                    HStack {
                        RingChartGrade(
                            percentage: makeDouble(s: firstGrade.percentageformatted),
                            gradient: LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.2, green: 0.96, blue: 0.96), location: 0),
                                    Gradient.Stop(color: Color(red: 0, green: 0.41, blue: 0.78), location: 1),
                                ],
                                startPoint: UnitPoint(x: 0.14, y: 0),
                                endPoint: UnitPoint(x: 0.94, y: 1.13)
                            )
                        ).padding()
                        
                        
                        Text("Register term")
                            .font(.customFont(size: 35))
                            .foregroundColor(Color("fontColor"))
                            .frame(maxWidth: 140)
                            .padding(.leading, 25)
                    }
                    .padding(.horizontal, 10)
                } else {
                    Image("citata")
                        .resizable()
                        .frame(width: 340, height: 185)
                }
            
            VStack{
                ScrollView {
                    ForEach(0..<(gradesItem?.count ?? 0), id: \.self) { index in
                        VStack {
                            HStack {
                                Text(gradesItem?[index].itemname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true || gradesItem?[index].itemname == "-" ?
                                     "Missing name of the grade🤔" :
                                        gradesItem?[index].itemname ?? "Missing name of the grade🤔")
                                
                                .font(.customFont(size: 19))
                                .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                Text(gradesItem?[index].percentageformatted.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true || gradesItem?[index].percentageformatted == "-" ?
                                     "N/A" :
                                        gradesItem?[index].percentageformatted ?? "N/A")
                                .font(.customFont(size: 35))
                                .foregroundColor(Color.white)
                                
                            }
                            .padding()
                            .shadow(radius: 5)
                            .frame(maxWidth: .infinity, maxHeight: 85)
                            .padding()
                            .background(Color(red: 0.06, green: 0.13, blue: 0.23))
                            .cornerRadius(24)
                            .padding(.horizontal, 15)
                        }
                        .padding(.top)
                    }
                }
            }
            .background(Color(red: 0.96, green: 0.95, blue: 0.95)).opacity(0.84)
            .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.46), radius: 11.5, x: 0, y: 16)
            .clipShape(RoundedCornerShape(radius: 48, corners: [.topLeft, .topRight]))
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 1, green: 1, blue: 1), location: 0),
            Gradient.Stop(color: Color(red: 0.16, green: 0.31, blue: 1), location: 1),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
            )
            )
    }
    
    func makeDouble(s: String) -> Double {
        if let dotIndex = s.firstIndex(of: ".") {
            let substring = s[..<dotIndex]
            if let number = Double(substring) {
                return number
            }
        }
        return 0
    }
}

#Preview {
    MainView()
}
