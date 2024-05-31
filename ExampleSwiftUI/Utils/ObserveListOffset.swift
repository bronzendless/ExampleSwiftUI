//
//  ObserveListOffset.swift
//  ExampleSwiftUI
//
//  Created by Nantarat Prommanon on 31/5/2567 BE.
//

import SwiftUI

struct ObserveListOffset: ViewModifier {
    @StateObject private var pageOffsetObservable = PageOffsetObservable()
    var onChange: (CGPoint) -> ()
    
    func body(content: Content) -> some View {
        content
            .introspect(.list, on: .iOS(.v13, .v14, .v15)) {
                self.pageOffsetObservable.scrollView = $0
            }
            .introspect(.list, on: .iOS(.v16, .v17)) {
                self.pageOffsetObservable.scrollView = $0
            }
            .onReceive(self.pageOffsetObservable.$offset, perform: { newOffset in
                self.onChange(newOffset)
            })
    }
}

class PageOffsetObservable: NSObject, ObservableObject {
    @Published var offset: CGPoint = .zero
    private(set) var isObserve: Bool = false
    private var startOffset: CGFloat? = 0.0
    
    var scrollView: UIScrollView? {
        didSet {
            self.observe()
        }
    }
    
    private func observe() {
        if !self.isObserve {
            self.startOffset = scrollView?.contentOffset.y
            scrollView?.addObserver(self, forKeyPath: "contentOffset", context: nil)
            self.isObserve = true
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset", let scrollOfset = (object as? UIScrollView)?.contentOffset {
            self.offset = CGPoint(x: scrollOfset.x, y: scrollOfset.y - (self.startOffset ?? 0.0))
        }
    }
    
    deinit {
        self.scrollView?.removeObserver(self, forKeyPath: "contentOffset")
    }
}
