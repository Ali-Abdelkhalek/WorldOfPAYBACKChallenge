//
//  HomeViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 11/02/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    let PBClient = PAYBACKClient()
    var allTransactions: [PBTransaction] = []
    @Published var selectedCategories: [Bool] = []
    @Published var isFilterActive = false
    
    init(){
        PBClient.fetchTransactionsFromMock{ result in
            processTransactionFetchingResults(from: result, {_ in})
        }
    }

    func updateTransactionList(by newList: [PBTransaction]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return}
            self.allTransactions = newList.sorted{ $0.transactionDetail.bookingDate < $1.transactionDetail.bookingDate}
            self.selectedCategories = [Bool](repeating: false, count: self.getCategories().max() ?? 0)
        }
    }
    
    func fetchTransactions(_ completetionHandler: (PBTransactionsLoadingError?) -> Void) async{
        await PBClient.fetchTransactionsRandomly(from: .mock){ result in
            processTransactionFetchingResults(from: result, completetionHandler)
        }
    }
    
    func processTransactionFetchingResults(from result: TransactionsLoadingResults, _ completetionHandler: (PBTransactionsLoadingError?) -> Void) {
        switch result {
        case .success(let transactions):
            updateTransactionList(by: transactions)
        case .failure(let error):
            completetionHandler(error)
        case .partialCorruptData(let transactions, let error):
            updateTransactionList(by: transactions)
            completetionHandler(error)
            
        }
    }
    
    func getCategories() -> [Int] {
        return Set(allTransactions.map{ $0.category }).sorted()
    }
    
    func getTransactions() -> [PBTransaction] {
        if selectedCategories.contains(true) {
            return allTransactions.filter{ selectedCategories[$0.category - 1]}
        } else{
            return allTransactions
        }
    }
    
    func isFilterApplied() -> Bool {
        return selectedCategories.contains(true)
    }
    
    func getTransactionsSum() -> Int {
        return allTransactions.filter{ selectedCategories[$0.category - 1]}.map{ $0.transactionDetail.value.amount}.reduce(0, +)
    }
    
}
