//
//  ErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Software Team on 10/02/2023.
//

import SwiftUI

struct ErrorView: View {
    @Binding var error: Error?

    var body: some View {
        if let error = error {
            VStack {
                Text(error.localizedDescription)
                    .bold()
                HStack {
                    Button("Dismiss") {
                        self.error = nil
                    }
                }
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct ErrorView_Previews: PreviewProvider {
    
    struct ErrorViewPreviewView: View {
        @State private var error: Error? = PBTransactionsLoadingError.timeoutError

            var body: some View {
                ErrorView(error: $error)
            }
    }
    
    static var previews: some View {
        ErrorViewPreviewView()
    }
}
