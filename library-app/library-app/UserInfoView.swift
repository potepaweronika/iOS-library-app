//
//  UserInfoView.swift
//  library-app
//
//  Created by user on 08/06/2023.
//

import SwiftUI

struct UserInfoView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var appState: AppState
    
    var selectedBook: Book?
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    
    private func isValidInput() -> Bool {
        if firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        
        if lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        
        if !isValidEmail(email) {
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    var body: some View {
        VStack {
            if let book = selectedBook, let library = selectedBook?.library {
                VStack {
                    Text("Selected Book:")
                        .font(.headline)
                    Text("\(book.title!) by \(book.author!)")
                        .font(.subheadline)
                    Text("Library: \(library.name!)")
                        .font(.subheadline)
                    Text("Adress: \(library.address!)")
                        .font(.footnote)
                }
                .padding()
            }
            
            VStack {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.emailAddress)
                
                Button(action: {
                    if isValidInput() {
                        let userInfo = User(context: context)
                        userInfo.firstName = self.firstName
                        userInfo.lastName = self.lastName
                        userInfo.email = self.email
                        userInfo.book = self.selectedBook
                        try? self.context.save()
                        appState.rootViewId = UUID()
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("One or more fields contain error, make sure the is no empty fields and email is correct"), dismissButton: .default(Text("Ok!")))
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Info")
//        NavigationLink(destination: ContentView(), isActive: $isClicked, label: {EmptyView()})
    }
}
