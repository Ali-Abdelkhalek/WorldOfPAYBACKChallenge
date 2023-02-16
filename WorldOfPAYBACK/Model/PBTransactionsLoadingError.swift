//
//  PBTransactionsLoadingError.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 10/02/2023.
//

import Foundation

enum PBTransactionsLoadingError: Error {
    case timeoutError
    case partialDataCorruption
    case corruptMockData
    
}

extension PBTransactionsLoadingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .timeoutError:
            return NSLocalizedString("Request timed out, please check your network and try again.", comment: "Time Out")
        case .partialDataCorruption:
            return NSLocalizedString("The response contains partially corrupt data, please get in touch with support.", comment: "Partial Corrupt Data Response")
        case .corruptMockData:
            return NSLocalizedString("Failed to load the transaction from the mock data, please check your mock data and try again.", comment: "Corrupt Data Response")
        }
    }
}
