//
//  OrderDetailView.swift
//  iCoffeeAdmin
//
//  Created by Aman on 20/05/23.
//

import SwiftUI

struct OrderDetailView: View {
    
    var order: Order
    
    var body: some View {
        
        
        VStack {
            
            List {
             
                Section(header: Text("Customer")) {
                    
                    NavigationLink(destination: UserDetailView(order: order)) {
                        Text(order.customerName)
                            .font(.headline)
                    }
                    
                }//end of section
                
                Section(header: Text("order Items")) {
                    
                    ForEach(self.order.orderItems) { drink in
                        
                        HStack {
                            Text(drink.name)
                            Spacer()
                            Text("$ \(drink.price.clean)")
                        }// end of Hstack
                        
                    }// end of for each
                }//end of section
                
            }//end of List
            
        }//end of Vstack
        .navigationBarTitle("Order", displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.markAsCompleted()
            }, label: {
                Text("Complete order")
            })
        )
    } // end of body
    
    private func markAsCompleted() {
        
        if !order.isCompleted {
            order.isCompleted = true
            order.saveOrderToFirestore()
        }
    }
    
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order())
    }
}
