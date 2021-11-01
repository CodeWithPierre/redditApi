//
//  Dynamic.swift
//  RedditApi
//
//  Created by Pierre ILYAMUKURU on 10/24/21.
//

import Foundation

/// Dynamic
class Dynamic<T>: NSObject {
    typealias Listener = (T) -> ()
    var listener: Listener?

    /// Bind
    /// - Parameter listener: Listener
    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    /// Bind And Fire
    /// - Parameter listener: Listener
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    /// Value
    var value: T {
        didSet {
            listener?(value)
        }
    }

    /// Initialise
    /// - Parameter v: value
    init(_ v: T) {
        value = v
    }
}

