//
//  CertificateRow.swift
//  1114DesignCode
//
//  Created by Yahsuan on 07/01/2021.
//  Copyright © 2021 Yahsuan. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {
    var certificates = certificateData
    
    var body: some View {
        VStack(alignment:.leading ) {
            Text("Certificates")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading,30)
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20.0){
                ForEach(certificates) { item in
                    
                    CertificateView(item: item)
                    }
                    
                }
            .padding(20)
                .padding(.leading,10)
            }
        }
        
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}


struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: CGFloat
    var height: CGFloat
}

let certificateData = [
    Certificate(title: "OC", image: "Certificate1", width: 230, height: 150),
    Certificate(title: "Swift", image: "Certificate2", width: 230, height: 150),
    Certificate(title: "Java", image: "Certificate3", width: 230, height: 150),
    Certificate(title: "GO", image: "Certificate4", width: 230, height: 150),
]
