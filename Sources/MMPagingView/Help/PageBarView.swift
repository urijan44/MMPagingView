//
//  PageBarView.swift
//  
//
//  Created by hoseung Lee on 2022/04/28.
//

import SwiftUI

struct PageBarView: View {
    var pageManager: PageBarManager
    @ObservedObject var manager: Manager
    @State var indicatorXOffset: CGFloat = 0
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        HStack(
                            alignment: .center,
                            spacing: manager.itemSpace) {
                                ForEach(manager.items, id: \.id) { item in
                                    Button {
                                        manager.changeView(item.id)
                                    } label: {
                                        Text(item.title)
                                            .font(.system(size: 15, weight: .regular))
                                            .lineLimit(1)
                                            .foregroundColor(
                                                manager.isSelectedIndex(item.id) ?
                                                manager.tintColor :
                                                manager.normalColor)
                                            .frame(
                                                width: manager.tapBarWdith(viewWidth: geometry.size.width)
                                            )
                                            .id(item.id)
                                    }
                                    .frame(height: manager.tabHeight)
                                }
                            }
                        Capsule()
                            .fill(manager.tintColor)
                            .frame(
                                width: manager.tapBarWdith(viewWidth: geometry.size.width),
                                height: manager.indicatorThinkness)
                            .position(
                                x: indicatorXOffset + manager.tapBarWdith(viewWidth: geometry.size.width) / 2,
                                y: -(manager.indicatorThinkness / 2))
                            .animation(.default, value: 1)
                    }
                }
                .onAppear {
                    manager.proxy = proxy
                    manager.viewWidth = geometry.size.width
                }
                .onChange(of: pageManager.currentIndex) { index in
                    withAnimation {
                        indicatorXOffset = CGFloat(index) * (manager.tapBarWdith(viewWidth: geometry.size.width) + manager.itemSpace)
                    }

                    guard let currentView = try? manager.currentView(index: index) else { return }
                    withAnimation {
                        manager.proxy?.scrollTo(currentView.id, anchor: .leading)
                    }
                }
            }
        }
    }

    init(titles: [TabBarItem], pageManager: PageBarManager) {
        self.manager = Manager(titles: titles, pageManager: pageManager)
        self.pageManager = pageManager
    }
}
