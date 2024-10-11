//
//  ViewDidLoad+ViewModifier.swift
//  CommonSwiftUI
//
//  Created by James Thang on 18/06/2024.
//

import SwiftUI

extension View {
    /// Applies a custom transformation to a view and returns the resulting view.
    ///
    /// This function allows for applying transformations conditionally based on the iOS version. It's particularly useful for modifying views with version-specific features or styles.
    ///
    /// - Parameter transform: A closure that takes the original view as an argument and returns the modified view.
    ///
    /// ## Simplified Usage with iOS Version Check:
    /// ```swift
    /// Text("Conditional Styling")
    ///     .apply {
    ///         if #available(iOS 16.0, *) {
    ///             $0.padding()
    ///         } else {
    ///             $0.padding().background(Color.gray)
    ///         }
    ///     }
    /// ```
    /// In this usage example, padding is applied universally, but a gray background is only applied if the iOS version is below 16.0.
    public func apply<Content>(@ViewBuilder _ transform: (Self) -> Content) -> Content {
        transform(self)
    }
    
    /// Attaches a callback that performs an action when the view loads.
    ///
    /// This function allows for executing code at the moment the view is first rendered. It's useful for initiating data fetching, analytics, or other one-time setup tasks when a view appears.
    ///
    /// - Parameter action: An optional closure to perform when the view loads. If nil, no action is taken.
    ///
    /// ## Usage:
    /// ```swift
    /// Text("Welcome")
    ///     .onLoad {
    ///         print("View has loaded")
    ///     }
    /// ```
    /// This example prints a message to the console when the `Text` view loads.
    public func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
