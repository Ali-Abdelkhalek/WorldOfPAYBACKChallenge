//
//  PAYBACKClient.swift
//  WorldOfPAYBACK
//
//  Created by Ali Abdelkhalek on 07/02/2023.
//

import Foundation

class PAYBACKClient: ObservableObject {
    
    func fetchTransactionsRandomly(from source: PBTransactionsSource, _ completetionHandler: (TransactionsLoadingResults) -> Void) async {
        sleep(2)
        await Bool.random() ? completetionHandler(.failure(.timeoutError)) : fetchTransactions(from: .mock, completetionHandler)
    }
    
    func fetchTransactions(from source: PBTransactionsSource, _ completetionHandler: (TransactionsLoadingResults) -> Void) async {
        switch source {
        case .mock:
            fetchTransactionsFromMock(completetionHandler)
        case .server:
            fetchTransactionsFromServer(completetionHandler)
        }
    }
    
    func fetchTransactionsFromServer(_ completetionHandler: (TransactionsLoadingResults) -> Void){
        
    }
    
    func fetchTransactionsFromMock(_ completetionHandler: (TransactionsLoadingResults) -> Void) {
        guard let startWordsURL = Bundle.main.url(forResource: "PBTransactions", withExtension: "json") else { completetionHandler(.failure(.corruptMockData)); return}
        guard let contents = try? String(contentsOf: startWordsURL, encoding: .utf8), let contentData = contents.data(using: .utf8)  else { completetionHandler(.failure(.corruptMockData)); return}
        guard let transactions = try? JSONSerialization.jsonObject(with: contentData, options: []) as? [String:Any] else { completetionHandler(.failure(.corruptMockData)); return}
        completetionHandler(readTransactions(from : transactions))
    }
    
    func readTransactions(from transactionsDict: [String: Any]) -> TransactionsLoadingResults {
        var PBTransactions: [PBTransaction] = []
        var doesResponseContainCorruptData = false
        if let items = transactionsDict["items"] as? [[String:Any]] {
            items.forEach{ item in
                if let transaction = readSingleTransaction(from: item) {
                    PBTransactions.append(transaction)
                }
                else {
                    doesResponseContainCorruptData = true
                }
            }
            return doesResponseContainCorruptData ? .partialCorruptData(PBTransactions, .partialDataCorruption) : .success(PBTransactions)
        }
        return .failure(.corruptMockData)
    }
    
    func readSingleTransaction(from transactionDict: [String: Any]) -> PBTransaction? {
        guard let partnerDisplayName = transactionDict["partnerDisplayName"] as? String,
              let category = transactionDict["category"] as? Int,
              let alias = readTransactionAlias(from: transactionDict["alias"] as? [String: Any]),
              let transactionDetail = readTransactionDetail(from: transactionDict["transactionDetail"] as? [String: Any]) else {return nil}
        
        return PBTransaction(partnerDisplayName: partnerDisplayName, alias: alias, category: category, transactionDetail: transactionDetail)
    }
    
    func readTransactionAlias(from aliasDict: [String: Any]?) -> PBTransactionAlias? {
        guard let reference = aliasDict?["reference"] as? String else { return nil }
        return PBTransactionAlias(reference: reference)
    }
    
    func readTransactionDetail(from detailDict: [String: Any]?) -> PBTransactionDetail? {
        guard let bookingDate = detailDict?["bookingDate"] as? String,
              let transactionValue = readTransactionValue(from: detailDict?["value"] as? [String: Any]) else { return nil }
        let description = detailDict?["description"] as? String
        return PBTransactionDetail(description: description, bookingDate: bookingDate, value: transactionValue)
    }
    
    func readTransactionValue(from valueDict: [String: Any]?) -> PBTransactionValue? {
        guard let amount = valueDict?["amount"] as? Int,
              let currency = valueDict?["currency"] as? String else { return nil }
        return PBTransactionValue(amount: amount, currency: currency)
    }
    
}
