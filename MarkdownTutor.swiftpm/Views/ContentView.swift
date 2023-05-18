import SwiftUI

struct ContentView: View {
    @State var startClick:Bool = false
    
    var body: some View {
        if (!startClick) {
            WelcomeView(startClick: $startClick)
                .accentColor(Color.cyan.opacity(0.8))
        } else {
            MainView()
                .accentColor(Color.cyan.opacity(0.8))
        }
    }
}
