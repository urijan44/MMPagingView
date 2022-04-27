//
//  Example.swift
//  
//
//  Created by hoseung Lee on 2022/04/28.
//

import SwiftUI

struct ExampleView: View {
  var body: some View {
    MMPagingView(titles: ["A","B","C"], views: [
      AnyView(SomeView(title: "A")),
      AnyView(SomeView(title: "B")),
      AnyView(SomeView(title: "C"))
    ])
  }
}

struct Example_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}

struct SomeView: View {
  let title: String
  var body: some View {
    VStack(spacing: 18) {
      Text(title)
        .font(.system(size: 1000))
      Text(title)
      Text(title)
      Text(title)
      Text(title)
      Text(title)
      Text(title)
      Text(title)
      Text(title)
      Text(title)
        .background(Color.red)
        .frame(width: UIScreen.main.bounds.width)
    }

  }
}
