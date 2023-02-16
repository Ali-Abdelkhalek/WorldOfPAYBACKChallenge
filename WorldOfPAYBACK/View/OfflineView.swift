//
//  OfflineView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 07/02/2023.
//

import SwiftUI

struct OfflineView: View {
    var body: some View {
        VStack{
            Label("You're offline", systemImage: "icloud.slash")
            Text("Check your connection and try again.")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct OfflineView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineView()
    }
}
