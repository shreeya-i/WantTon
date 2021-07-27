//
//  SignInView.swift
//  SignInView
//
//  Created by Brindha V on 24/7/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail:email,
                    password:password){result,error in
        guard result != nil, error == nil else{
            return
        }
        // success
    }
}

func signUp(email: String, password: String){
    auth.createUser(withEmail:email, password: password){result,error in
    guard result != nil,error == nil else{
        return
    }
    // success
}
}

struct ContentView: View{
    @State var email = ""
    var body: some View{
        NavigationView{
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
               
                VStack {
                    TextField ("Email Address",text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("Email Address",text: $email).padding().background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                    },label: {
                        Text("Sign In")
                            .foregroundColor(.green)
                            .frame(width:200,height:50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
            }
            .navigationTitle("Sign In")
        }
    }
}
    

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
}
}
