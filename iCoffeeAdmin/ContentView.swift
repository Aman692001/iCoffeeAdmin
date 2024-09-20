//
//  ContentView.swift
//  iCoffeeAdmin
//
//  Created by Aman on 20/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListener = OrderListener()
    
    var body: some View {
        
        NavigationView {
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            List {
                
                Section(header:  Text("Active Orders")) {
                    
                    ForEach(self.orderListener.activeOrders ?? []) { order in
                        
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            
                            HStack {
                                Text(order.customerName)
                                Spacer()
                                Text("$\(order.amount.clean)")
                            }//end of HStack
                        }//end of nivgationlink
                        
                    }//end of for each
                }//end of section
                
                Section(header: Text("Completed Orders")) {
                    
                    ForEach(self.orderListener.completedOrders ?? []) { order in
                        
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            HStack {
                                Text(order.customerName)
                                Spacer()
                                Text("$\(order.amount.clean)")
                            }//end of HStack

                        }//end of navigation link

                        
                    }//end of for each
                    
                }// end of Section
                
            }// end of list
            .navigationBarTitle("Orders")
            
        }// end of navigation view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
