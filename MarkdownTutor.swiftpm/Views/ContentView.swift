import SwiftUI
import ColorfulX

struct ContentView: View {
    @State var startClick:Bool = false
    @AppStorage("selectedMode") var selectedMode:TutorMode = TutorMode.beginner
    
    @State var colors: [Color] = ColorfulPreset.allCases.randomElement()!.colors
    let timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            ColorfulView(color: $colors)
                            .opacity(0.2)
                            .ignoresSafeArea()
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
        }.onReceive(timer, perform: { _ in
            colors = ColorfulPreset.allCases.randomElement()!.colors
        })
    }
}
