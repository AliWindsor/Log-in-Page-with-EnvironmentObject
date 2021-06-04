//
//  LoginView.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State public var userName: String = ""
    
    @State private var userPassword: String = ""
    @State private var errorMsg: String = ""
    
    @State private var showPassword: Bool = false
    @State private var authenticationPassed:Bool = false
    
    @State var userModelData:UserModelData = UserModelData()

    var userInformation : UserModel? {
            userModelData.userInformation.first { $0.username == userName }
        }
    
    @State var errorMsgColor = Color(red:220.0/255.0, green:0.0, blue:0.0)
  
    var body: some View {
        
        switch viewRouter.currentPage {
        
            case .userDetailsPage:
                UserDetailsView(userName: $userName, userModelData: $userModelData, userInformation: userInformation)
                
            case .loginPage:
                EmptyView()
        }

        VStack{
            Group{ //titles
                Text("Welcome Back!")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                
                UserImage()
                
                Text(errorMsg)
                    .foregroundColor(errorMsgColor)
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
                        viewRouter.currentPage = .userDetailsPage
        
                    }
                
                }){
                    CustomButtonStyle(buttonText: "Login")
                }
                
                Spacer()
                    .frame(height: 25)
            }
            
        }
        .padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(ViewRouter())
    }
}
