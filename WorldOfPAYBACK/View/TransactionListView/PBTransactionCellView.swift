//
//  PBTransactionCellView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 11/02/2023.
//

import SwiftUI

struct PBTransactionCellView: View {
    let transaction:PBTransaction
    var body: some View {
        HStack{
            VStack(spacing: 5){
                LabelWithDescription(label: AppStrings.PBTransaction.ParterLabelName, detail: transaction.partnerDisplayName)
                LabelWithDescription(label: AppStrings.PBTransaction.DateLabelName, detail: Date.forUserTimeZone(from: transaction.transactionDetail.bookingDate))
                LabelWithDescription(label: AppStrings.PBTransaction.CategoryLabelName, detail: "\(transaction.category)")
                LabelWithDescription(label: AppStrings.PBTransaction.DescriptionLabelName, detail: transaction.transactionDetail.description ?? "--")
            }
            
            VStack{
                Text("\(transaction.transactionDetail.value.amount)")
                Text(transaction.transactionDetail.value.currency)
            }
            .padding()
            .border(.indigo, width: 3)
            .cornerRadius(5)
            
        }
    }
}

struct PBTransactionCellView_Previews: PreviewProvider {
    static var previews: some View {
        PBTransactionCellView(transaction: PBTransaction(partnerDisplayName: "Demo", alias: PBTransactionAlias(reference: "1213213431343252231"), category: 2, transactionDetail: PBTransactionDetail(description: "Description", bookingDate: "2022-07-24T10:59:05+0200", value: PBTransactionValue(amount: 5000, currency: "USD"))))
            .padding()
    }
}
