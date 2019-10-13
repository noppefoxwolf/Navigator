//
//  NavigateModifier.swift
//
//  Created by Tomoya Hirano on 2019/10/13.
//  Copyright © 2019 Tomoya Hirano. All rights reserved.
//

import SwiftUI

extension View {
    func navigator(_ item: AnyView?) -> some View {
        modifier(NavigateModifier(item: item))
    }
}

fileprivate struct NavigateModifier: ViewModifier {
    @ObservedObject private var object: NavigateModifierObject = .init()
    
    fileprivate init(item: AnyView?) {
        self.object.presentaiton = item
    }

    fileprivate func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            NavigationLink(destination: object.presentaiton,
                           tag: object.tag,
                           selection: $object.selection) {
                            EmptyView()
            }
        }
    }
    
    private class NavigateModifierObject: ObservableObject {
        let tag: Int = 76757852
        @Published var selection: Int? = nil
        var presentaiton: AnyView? = nil {
            didSet {
                if presentaiton == nil {
                    selection = nil
                } else {
                    selection = tag
                }
            }
        }
    }
}

