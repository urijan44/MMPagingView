import SwiftUI

public struct MMPagingView: View {
    @ObservedObject var pageManager = PageBarManager()

    let titles: [TabBarItem]
    let views: [AnyView]
    public var body: some View {
      VStack(spacing: 10) {
            PageBarView(titles: titles, pageManager: pageManager)
                .frame(height: 48)
            TabView(selection: $pageManager.currentIndex) {
                ForEach(titles, id: \.id) { title in
                    TaggingView(index: title.index)

                        .tag(title.index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .onChange(of: pageManager.currentIndex) { newValue in
            NotificationCenter.default.post(name: ViewChangeNotification.name, object: nil, userInfo: [ViewChangeNotification.Keys.index: newValue])
        }
    }

    public init(
        titles: [String],
        views: [AnyView]) {
            assert(Set<String>(titles).count == titles.count)

            var index = -1
            let items: [TabBarItem] = titles.map {
                index += 1
                return TabBarItem(title: $0, index: index)
            }
            self.views = views
            self.titles = items

            NotificationCenter.default.addObserver(forName: ViewChangeNotification.name, object: nil, queue: nil) { _ in }
        }

    @ViewBuilder
    func TaggingView(index: Int) -> some View {
        views[index]
    }
}
