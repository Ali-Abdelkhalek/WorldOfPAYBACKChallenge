//
//  TransactionsListView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 07/02/2023.
//

import SwiftUI

struct PBTransactionsListView: View {
    @ObservedObject var model: HomeViewModel
    @State private var error: Error?

    var body: some View {
        NavigationView{
            VStack{
                if model.isFilterApplied() {
                    Text("Current transactions sum = \(model.getTransactionsSum())")
                }
                List{
                    ForEach(model.getTransactions(), id: \.id) {transaction in
                        NavigationLink(destination: PBTransactionDetailsView(transaction: transaction)) {
                            PBTransactionCellView(transaction: transaction)
                        }
                    }
                }
                .navigationTitle("Transactions")
                .toolbar {
                    Button("Filter by Category") {
                        model.isFilterActive.toggle()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .overlay(alignment: .center) {
                    if error != nil {
                        ErrorView(error: $error)
                    }
                    
                }
                .overlay(alignment: .topTrailing){
                    if model.isFilterActive {
                        CategoryFilterView(categories: model.getCategories(), selectedCategories: $model.selectedCategories, isFilterActive: $model.isFilterActive)
                            .frame(width: 200, height: 300)
                    }
                }
                .refreshable {
                    await model.fetchTransactions{ error in
                        self.error = error
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct PBTransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        PBTransactionsListView(model: HomeViewModel())
    }
}
