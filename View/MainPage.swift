
import SwiftUI

struct MainPage: View {
    
    // Current Tab
    @State var currentTab: Tab = .Home
    
    // Hiding Tab Bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            // Tab View
            TabView(selection: $currentTab){
                
                Home()
                    .tag(Tab.Home)
                
                Text("Liked")
                    .tag(Tab.Liked)
                
//                Text("Profile")
//                    .tag(Tab.Profile)
                
                Text("Cart")
                    .tag(Tab.Cart)
            }
            
            //Custom Tab Bar
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    
                    Button {
                        // Updating Tab
                        currentTab = tab
                        
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode:.fit)
                            .frame(width: 22, height: 22)
                        // Applying little shadow at bg..
                            .background(
                                Color(.gray)
                                    .opacity(0.1)
                                    .cornerRadius(15)
                                // blurring
                                    .blur(radius: 5)
                                // Making little big
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color.blue : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom,10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Making CaseIterable
// Tab Cases
enum Tab: String, CaseIterable{
    
    // Raw Value must be image Name in asset.
    case Home = "Home"
    case Liked = "Liked"
//    case Profile = "Profile"
    case Cart = "Cart"
    
}
