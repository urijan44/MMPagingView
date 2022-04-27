//
//  TabBarItem.swift
//  
//
//  Created by hoseung Lee on 2022/04/28.
//

import Foundation
struct TabBarItem: Identifiable {
    let title: String
    let id: String = UUID().uuidString
    var index: Int
}
