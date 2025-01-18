//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Grace Filippi on 12/17/23.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name: ", text: $order.address.name)
                    TextField("Street Address: ", text: $order.address.streetAddress)
                    TextField("City: ", text: $order.address.city)
                    TextField("Zip: ", text: $order.address.zip)
                }
                Section {
                    NavigationLink("Check Out") {
                        CheckoutView(order: order)
                    }
                }
                .disabled(order.address.hasValidAddress == false)
            }
            .navigationTitle("Checkout Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
