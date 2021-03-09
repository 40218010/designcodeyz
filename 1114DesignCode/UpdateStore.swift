//
//  UpdateStore.swift
//  1114DesignCode
//
//  Created by Yahsuan on 29/12/2020.
//  Copyright © 2020 Yahsuan. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    @Published var updates : [Update] {
        didSet{
            didChange.send()
            
        }
    }
    init(updates: [Update] = []) {
        self.updates = updates
    }
    
}
    
