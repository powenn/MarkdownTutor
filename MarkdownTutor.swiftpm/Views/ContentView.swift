import SwiftUI

struct ContentView: View {
    @State var startClick:Bool = false
    @AppStorage("selectedMode") var selectedMode:TutorMode = TutorMode.beginner
    var body: some View {
//        if (!startClick) {
//            HomeView(startClick: $startClick)
//                .accentColor(Color.cyan.opacity(0.8))
//        } else {
//            MainView()
//                .accentColor(Color.cyan.opacity(0.8))
//        }
        HomeView(startClick: $startClick, selectedMode: $selectedMode)
            .accentColor(Color.cyan.opacity(0.8))
            .fullScreenCover(isPresented: $startClick, content: {
                switch selectedMode {
                case .beginner:
                    BeginnerMainView()
                        .accentColor(Color.cyan.opacity(0.8))
                case .standard:
                    MainView()
                        .accentColor(Color.cyan.opacity(0.8))
                }
            })
        
    }
}
