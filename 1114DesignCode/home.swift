//
//  home.swift
//  1114DesignCode
//
//  Created by Yahsuan on 28/11/2020.
//  Copyright © 2020 Yahsuan. All rights reserved.
//

import SwiftUI

let statusBarHeight = UIApplication.shared.windows[0].windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds

struct home: View {
   
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20:0)
                .scaleEffect(showProfile ? 0.95:1)
                .animation(.default)
                

            
    
            ContentView()
                .frame(minWidth: 0, maxWidth: 912)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarHeight + 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -40, y: showProfile ? statusBarHeight : 80)
                .animation(.spring())

            
            Buttonright(show: $showProfile)
                .offset(x: -16 , y: showProfile ? statusBarHeight : 88)
                .animation(.spring())


            
            MenuView(show: $show)
            
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            home().previewDevice("iPhone SE")
            home().previewDevice("iPhone 7")
            home().previewDevice("iPad Pro (12.9-inch)")
        }
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.headline)
            Spacer()

        }
    }
}


struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icon : String
    
}

let menuData = [
    Menu(title: "My Account", icon: "person.circle"),
    Menu(title: "SETTINGS", icon: "gear"),
    Menu(title: "Billing", icon: "creditcard.fill"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down.circle")

]

struct MenuView: View {
    
    var menuItems = ["My Account","Billing","Team","Sign Out"]
    var menu = menuData
    @Binding var show : Bool
    @State var showUpdate = false
    
    var body: some View {
        
        
        HStack {
            VStack(alignment: .leading,spacing: 20) {
                
                ForEach(menu) {
                    item in
                    if item.title == "SETTINGS" {
                        
                            Button(action: {
                                           self.showUpdate.toggle()
                                       }) {
                                           MenuRow(image: item.icon, text: item.title)
                                       }.sheet(isPresented: self.$showUpdate) {
                                           Settings()
                                       }
                                   } else {
                                       MenuRow(image: item.icon, text: item.title)
                                   }
                }
                
                
                Spacer()
                
            }
            .padding(20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 460)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing,60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 :60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default)
            .offset(x: show ? 0: -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()

        }
        .padding(.top, statusBarHeight)

    }
}

struct CircleButton: View {
    var icon = "person.circle.fill"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(Color("button"))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        ZStack{
            Button(action: {self.show.toggle() }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing,19)
                .frame(width: 90, height: 60)
                .background(Color("button"))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                
                
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct Buttonright: View {
    @Binding var show : Bool
    @State var showUpdate = false

    var body: some View {
        ZStack{
            HStack {
                Button(action: {self.show.toggle() }) {
                    CircleButton(icon:"person.circle.fill")
                }
                Button(action: {
                                   self.showUpdate.toggle()
                               }) {
                                   CircleButton(icon: "bell")
                               }.sheet(isPresented: $showUpdate) {
                                   UpdateList()
                                
                               }
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}
