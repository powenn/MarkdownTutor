import SwiftUI

struct ContentView: View {
    @State var startClick:Bool = true
    
    var body: some View {
        if (!startClick) {
            WelcomeView(startClick: $startClick)
        } else {
            MainView()
        }
    }
}
