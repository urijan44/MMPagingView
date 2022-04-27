//
//  PageBarManager.swift
//  
//
//  Created by hoseung Lee on 2022/04/28.
//

import SwiftUI
final public class PageBarManager: ObservableObject {

    @Published public var currentIndex: Int = 0

    public init () { }
}
