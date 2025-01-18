//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Grace Filippi on 12/19/23.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    @State private var confirmationTitle = "Thank you"
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 233)
                    }
                    .accessibilityHidden(true)
                    
                    Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                        .font(.title)
                    Button("Place Order") {
                        Task {
                            await placeOrder()
                        }
                    }
                        .padding()
                }
            }
            .navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert(confirmationTitle, isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
        }
    }
    
    func placeOrder() async {
        
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            confirmationTitle = "Order Failed"
            confirmationMessage = "Your connection seems to have failed. Please connect to the internet and try again."
            showingConfirmation = true
        }
        
    }
}

#Preview {
    CheckoutView(order: Order())
}
