//
//  PageBarViewManager.swift
//  
//
//  Created by hoseung Lee on 2022/04/28.
//

import SwiftUI
extension PageBarView {
    final class Manager: ObservableObject {
        var pageManager: PageBarManager
        @Published var items: [TabBarItem]
        @Published var proxy: ScrollViewProxy?
        @Published var viewWidth: CGFloat?
        @Published var tintColor: Color = .purple
        @Published var normalColor: Color = .black
        @Published var tabHeight: CGFloat = 48
        private var viewMap: [String: Int] = [:]
        let itemSpace: CGFloat = 6
        let indicatorThinkness: CGFloat = 3

        init(titles: [TabBarItem], pageManager: PageBarManager) {
            self.items = titles
            self.pageManager = pageManager

            for (index, pageableView) in items.enumerated() {
                viewMap.updateValue(index, forKey: pageableView.id)
            }
        }

        func changeView(_ viewId: String) {
            guard let index = getViewIndex(viewId) else { return }
            pageManager.currentIndex = index
        }

        func getViewTag(_ viewId: String) -> Int {
            return getViewIndex(viewId) ?? 0
        }

        private func getViewIndex(_ viewId: String) -> Int? {
            viewMap[viewId]
        }

        func tapBarWdith(viewWidth: CGFloat) -> CGFloat {
            let itemCount: CGFloat = items.count > 6 ? 6.0 : CGFloat(items.count)
            let totalSpace: CGFloat = 6 * itemCount - 1
            let availableWidth = viewWidth - totalSpace
            return availableWidth / itemCount
        }

        func currentView(index: Int) throws -> TabBarItem {
            guard index >= 0, index < items.count else { throw NSError(domain: "인덱스가 범위를 벗어났습니다", code: 0) }
            return items[index]
        }

        func isSelectedIndex(_ viewId: String) -> Bool {
            guard let index = getViewIndex(viewId) else { return false }
            return pageManager.currentIndex == index
        }
    }
}
