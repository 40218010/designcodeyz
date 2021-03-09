//
//  TabBar.swift
//  1114DesignCode
//
//  Created by Yahsuan on 30/12/2020.
//  Copyright © 2020 Yahsuan. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
            TabView {
                home().tabItem {
                    

                    Image("IconHome")
                    Text("Home")
                    
                }.tag(1)
                ContentView().tabItem {
                    
                    Image("IconCards")
                    Text("Certificates")
                    
                }.tag(2)
                Settings().tabItem {
                    
                    Image("IconSettings")
                    Text("Settings")
                    
                }.tag(3)
                
                
                
            }
        
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraExtraLarge)
        }
    }
}
