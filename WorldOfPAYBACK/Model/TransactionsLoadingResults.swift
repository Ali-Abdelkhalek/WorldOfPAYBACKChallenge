//
//  TransactionsLoadingResults.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 11/02/2023.
//

import Foundation

enum TransactionsLoadingResults {
    case failure(PBTransactionsLoadingError)
    case success([PBTransaction])
    case partialCorruptData([PBTransaction], PBTransactionsLoadingError)
}
