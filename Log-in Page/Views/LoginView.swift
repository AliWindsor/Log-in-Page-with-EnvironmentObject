//
//  LoginView.swift
//  Log-in Page
//
//  Created by Alicia Windsor on 03/06/2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @Binding public var userName: String
    
    @State private var userPassword: String = ""
    @State private var errorMsg: String = ""
    
    @State private var showPassword: Bool = false
    @State private var authenticationPassed:Bool = false
    
    @Binding var userModelData:UserModelData
    var userInformation : UserModel?
    
    @State private var errorMsgColor = Color(red:220.0/255.0, green:0.0, blue:0.0)
    @State private var keyboardHeight:CGFloat = 0
  
    var body: some View {
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
            
            Group{ //authetication check
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
                            
                            withAnimation {
                                viewRouter.currentPage = .userDetailsPage
                            }
                        }
                }){
                    CustomButtonStyle(buttonText: "Login")
                }
                
                Spacer()
                    .frame(height: 45)
            }
            
        }

        .padding()
        .padding(.bottom, keyboardHeight)
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0-200 }
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(200) } //reset view after keyboard is gone
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}


