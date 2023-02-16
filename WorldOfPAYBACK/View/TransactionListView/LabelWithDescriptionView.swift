//
//  LabelWithDescription.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 07/02/2023.
//

import SwiftUI

struct LabelWithDescription: View {
    let label: String
    let detail: String
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(.gray)
            Text(detail)
        }
        .fixedSize()
        .frame(maxWidth: .infinity,
               alignment: .leading)
    }
}

struct LabelWithDescription_Previews: PreviewProvider {
    static var previews: some View {
        LabelWithDescription(label: "Label", detail: "Description")
    }
}
