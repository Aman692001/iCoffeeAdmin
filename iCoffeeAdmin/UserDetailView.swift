//
//  UserDetailView.swift
//  iCoffeeAdmin
//
//  Created by Aman on 20/05/23.
//

import SwiftUI

struct UserDetailView: View {
    
    var order: Order
    @State var user: FUser?
    
    
    
    var body: some View {
        
        List {
            
            Section {
                Text(user?.fullName ?? "")
                Text(user?.email ?? "")
                Text(user?.phoneNumber ?? "")
                Text(user?.fullAddress ?? "")
                 
            }//End of section
        }// end of list
        .listStyle(GroupedListStyle())
        .navigationBarTitle("User Profile")
        .onAppear {
            self.getUser()
        }
    }
    
    private func getUser() {
        
        downloadUser(userId: self.order.customerId) { (FUser) in
            
            self.user = FUser
            
        }
    }
    
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(order: Order())
    }
}
