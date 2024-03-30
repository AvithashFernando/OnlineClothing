import SwiftUI
struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["MS1_01","MS1_02","MS1_03","MS2_01","MS2_02"]

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    .ScaledToFit()
                    .cornerRadius(15)
            }
            HStack {
                ForEach(0..<slides.count) {index in
                    Circle()
                        .fill(self.currentIndex == index ? Color(.blue) : Color(.blue))
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}