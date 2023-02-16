//
//  SwiftUIView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 07/02/2023.
//

import SwiftUI

struct PBTransactionDetailsView: View {
    var transaction: PBTransaction
    var body: some View {
        VStack(spacing: 5){
            LabelWithDescription(label: AppStrings.PBTransaction.ParterLabelName, detail: transaction.partnerDisplayName)
            LabelWithDescription(label: AppStrings.PBTransaction.DescriptionLabelName, detail: transaction.transactionDetail.description ?? "--")
            Spacer()
        }
        .padding()
    }
}

struct PBTransactionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PBTransactionDetailsView(transaction: PBTransaction(partnerDisplayName: "REWE Group", alias: PBTransactionAlias(reference: "795357452000810"), category: 1, transactionDetail: PBTransactionDetail(description: "Punkte sammeln", bookingDate: "2022-07-24T10:59:05+0200", value: PBTransactionValue(amount: 100, currency: "PBP"))))
    }
}
