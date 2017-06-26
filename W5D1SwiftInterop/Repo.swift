//
//  Repo.swift
//  W5D1SwiftInterop
//
//  Created by Daniel Mathews on 2017-06-26.
//  Copyright © 2017 Daniel Mathews. All rights reserved.
//

import Foundation

class Repo:NSObject{
    
    let name:String
    let url:URL
    let size:Int
    
    init(name:String, url:URL, size:Int) {
        self.name = name
        self.url = url
        self.size = size
    }
    
}
