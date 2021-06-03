//
//  ContentView.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State public var userName: String = ""
    @State public var userPassword: String = ""
    @State private var errorMsg: String = ""
    
    @State private var showPassword: Bool = false
    @State private var authenticationPassed:Bool = false
    
    @State var userModelData = UserModelData()

    var userInformation : UserModel? {
            userModelData.userInformation.first { $0.username == userName }
        }
    
    @State var errorMsgColor = Color(red:220.0/255.0, green:0.0, blue:0.0)
        
        //Color(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, opacity: 1.0)
  
    var body: some View {
 
    NavigationView{
        VStack{
            Group{ //titles
                Text("Welcome Back!")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                
                UserImage()
                
                Spacer()
                    .frame(height: 25)
            }
            
            Group{ //inputs
                TextField("Username", text: $userName )
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 30.0)
                                        .stroke(Color.black, lineWidth: 3))
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                Spacer()
                    .frame(height: 20)
                
                if showPassword{

                    TextField("Password", text: $userPassword)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 30.0)
                                    .stroke(Color.black, lineWidth: 3))
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }else{
                   
                    SecureField("Password", text: $userPassword)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 30.0)
                                .stroke(Color.black, lineWidth: 3))
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
        
                }
                
                ShowPasswordButton(showPassword: $showPassword)
            }
            
            Group{ //error msg + button
                Button(action:{
                    
                    if self.userName == userInformation?.username && self.userPassword == userInformation?.password {
                        self.authenticationPassed = true
                    }else{
                        self.authenticationPassed = false
                    }
                    
                    if !authenticationPassed {
                        errorMsg = "Incorrect username or password, please try again"
                        errorMsgColor = Color(red:220.0/255.0, green:0.0, blue:0.0)
                    }else{
                        errorMsg = "Success"
                        errorMsgColor = Color(red:0.0, green:200.0/255.0, blue:0.0)
                    }
                
                }){
                    CustomButtonStyle(buttonText: "Login")
                }
                
                Spacer()
                    .frame(height: 25)
                
                Text(errorMsg)
                    .foregroundColor(errorMsgColor)
                
                NavigationLink(destination: LoginView(userName: $userName, userModelData: $userModelData, userInformation: userInformation), isActive: $authenticationPassed){
                    EmptyView()
               }
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
        .padding()
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
