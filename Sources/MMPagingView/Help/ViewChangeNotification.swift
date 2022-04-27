//
//  ViewChangeNotification.swift
//  
//
//  Created by hoseung Lee on 2022/04/28.
//

import Foundation
public struct ViewChangeNotification {
    public static let name = Notification.Name("ViewChange")

    public enum Keys: String {
        case index
    }
}
