//
//  PBTransaction.swift
//  WorldOfPAYBACK
//
//  Created by Ali Abdelkhalek on 07/02/2023.
//

import Foundation
import SwiftUI

struct PBTransaction: Identifiable {
    var id: String { alias.reference }
    let partnerDisplayName: String
    let alias: PBTransactionAlias
    let category: Int
    let transactionDetail: PBTransactionDetail
}

struct PBTransactionAlias {
    let reference: String
}

struct PBTransactionDetail{
    let description: String?
    let bookingDate: String
    let value: PBTransactionValue
}

struct PBTransactionValue {
    let amount: Int
    let currency: String
}
