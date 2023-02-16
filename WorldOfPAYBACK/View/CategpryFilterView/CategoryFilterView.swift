//
//  CategoryFilterView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 11/02/2023.
//

import SwiftUI

struct CategoryFilterView: View {
    var categories: [Int]
    @Binding var selectedCategories: [Bool]
    @Binding var isFilterActive: Bool
    var body: some View {
        if isFilterActive{
            VStack(spacing: 0){
                List{
                    ForEach(Array(categories.enumerated()), id: \.offset) {index, value in
                        CheckBoxMenuCellView(checked: $selectedCategories[value - 1], title: "\(categories[index])")
                    }
                }
                Divider()
                Button {
                    isFilterActive.toggle()
                } label: {
                    Text("Apply filter")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(.white)
                }
                Divider()
                Button {
                    selectedCategories = [Bool](repeating: false, count: categories.max() ?? 0)
                    isFilterActive.toggle()
                } label: {
                    Text("Clear filters")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(.white)
                }
                
            }
            .refreshable {
                // prevent reloading transaction list bug
            }
            .border(.gray, width: 3)
            .cornerRadius(10)
        }
    }
}

struct CategoryFilterView_Previews: PreviewProvider {
    
    
    struct CategoryFilterViewPreivew: View {
        @State var categories: [Int] = [1, 2, 5]
        @State var selectedCategories: [Bool] = [Bool](repeating: false, count: 5)
        @State  var isFilterActive: Bool = true
        var body: some View {
            CategoryFilterView(categories: categories, selectedCategories: $selectedCategories, isFilterActive: $isFilterActive)
        }
    }
    static var previews: some View {
        CategoryFilterViewPreivew()
    }
}
