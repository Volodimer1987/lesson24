//
//  ContentView.swift
//  lesson24
//
//  Created by vladimir gennadievich on 06.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("nikeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }
                HStack(spacing:15){
                    Rectangle()
                        .fill(Color.red)
                        .frame(height:1)
                    
                    Text("OR")
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height:1)
                }.padding(.horizontal,30)
                .padding(.top,50)
                
                HStack(spacing:25) {
                    Button(action: {
                        print("Going to facebook")
                    }, label: {
                        Image("facebook-512")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            
                    })
                    
                    Button(action: {
                        print("Going to facebook")
                    }, label: {
                        Image("apple5")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 52, height: 52)
                            .clipShape(Circle())
 
                    })
                    
                    Button(action: {
                        print("twitter")
                    }, label: {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
 
                    })

                }
                .padding(.top,30)
            }
            .padding(.vertical)
            
        }
        .background(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CShape:Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}
struct CShape1:Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Login:View {
    
    @State var email = ""
    @State var password = ""
    @Binding var index:Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing:10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white:.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue:Color.clear)
                            .frame(width:100,height: 5)
                    }
                    
                    Spacer()
                }.padding(.top,30)
                
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "envelop.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                        TextField("Email Address", text:$email)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
                        SecureField("Password", text:$password)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        print(" pss")
                    }, label: {
                        Text("Forget Password >")
                            .foregroundColor(Color.white.opacity(0.6))
                    })
                }
                .padding(.horizontal)
                .padding(.top,30)
            }
            .padding()
            .padding(.bottom,65)
            .background(Color.init(#colorLiteral(red: 1, green: 0.4427514626, blue: 0.7708736239, alpha: 1)))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            Button(action: {
                print("tyc tyc")
            }, label: {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,50)
                    .background(Color.init(.systemBlue))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            })
            .offset(y:35)
            .opacity(self.index == 0 ? 1:0)
        }
    }
}

struct SignUp:View {
    
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @Binding var index:Int
    
    var body: some View {
        ZStack(alignment:.bottom) {
            
            VStack {
                
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing:10) {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white:.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue:Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top,30)
                
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.purple)
                        TextField("Emaul Adress",text:self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                .padding(.top,40)
                
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.red)
                        SecureField("Password",text:self.$password)
                        
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                VStack {
                    HStack(spacing:15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.red)
                        SecureField("Password",text:self.$repassword)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                .padding(.top,30)
            }
            .padding()
            .padding(.bottom,65)
            .background(Color.purple)
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            
            Button(action: {
                print("ps")
            }, label: {
                Text("SignUp")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,40)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            })
            .offset(y: 36)
            .opacity(self.index == 1 ? 1:0)
        }
    }
}
