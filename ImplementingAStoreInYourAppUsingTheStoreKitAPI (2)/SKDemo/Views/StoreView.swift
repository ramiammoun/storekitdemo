/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The view for the store.
*/

import SwiftUI
import StoreKit

@main
struct SKDemoApp: App {
    var body: some Scene {
        WindowGroup {
            StoreView()
        }
    }
}

struct StoreView: View {
    @StateObject var store: Store = Store()
    

    var body: some View {
        List {


            SubscriptionsView()

//            Section("Navigation: Non-Renewing Subscription") {
//                ForEach(store.nonRenewables) { product in
//                    ListCellView(product: product, purchasingEnabled: store.purchasedSubscriptions.isEmpty)
//                }
//            }
//            .listStyle(GroupedListStyle())

            Button("Restore Purchases", action: {
                Task {
                    //This call displays a system prompt that asks users to authenticate with their App Store credentials.
                    //Call this function only in response to an explicit user action, such as tapping a button.
                    try? await AppStore.sync()
                }
            })

        }
        .navigationTitle("Subscribe")
        .environmentObject(store)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}


extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
