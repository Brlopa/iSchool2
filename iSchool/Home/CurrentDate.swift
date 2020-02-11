import SwiftUI

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    return formatter
}()



struct CurrentDate: View {
    var now = Date()
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(now, formatter: dateFormatter)")
                    .font(.headline)
                Spacer()
            }
            .padding(.leading)
        }
    }
}
