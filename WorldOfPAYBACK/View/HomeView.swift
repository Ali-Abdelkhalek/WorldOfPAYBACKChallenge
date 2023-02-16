//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Ali Abdelkhalek on 07/02/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model = HomeViewModel()
    @ObservedObject var networkMonitor = NetworkMonitor()
    var body: some View {
        if networkMonitor.isConnected {
            PBTransactionsListView(model: model)
        } else{
            OfflineView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
