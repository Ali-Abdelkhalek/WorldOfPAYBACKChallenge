//
//  CheckBoxMenuCellView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 10/02/2023.
//

import SwiftUI

struct CheckBoxMenuCellView: View {
    @Binding var checked: Bool
    let title: String
    var body: some View {
        Button{
            checked.toggle()
        } label: {
            HStack{
                CheckBoxView(checked: $checked)
                Text(title)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        
    }
}
struct CheckBoxMenuCellViewPreview: View {
    @State var checked: Bool = false
    @State var title: String = "item"
    var body: some View {
        CheckBoxMenuCellView(checked: $checked, title: title)
    }
}

struct CheckBoxMenuCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        CheckBoxMenuCellViewPreview()
    }
}
