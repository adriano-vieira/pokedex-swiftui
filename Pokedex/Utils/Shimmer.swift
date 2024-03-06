//
//  Shimmer.swift
//  Pokedex
//
//  Created by Adriano Vieira on 03/03/24.
//

import SwiftUI

public struct Shimmer: ViewModifier {
    private let animation: Animation
    private let gradient: Gradient
    private let min, max: CGFloat
    @State private var isInitialState = true
    @Environment(\.layoutDirection) private var layoutDirection

    public init(
        animation: Animation = Self.defaultAnimation,
        gradient: Gradient = Self.defaultGradient,
        bandSize: CGFloat = 0.8
    ) {
        self.animation = animation
        self.gradient = gradient
        self.min = 0 - bandSize
        self.max = 1 + bandSize
    }

    public static let defaultAnimation = Animation.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false)

    public static let defaultGradient = Gradient(colors: [
        .white.opacity(0.3),
        .white.opacity(0.8),
        .white.opacity(0.3)
    ])

    var startPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            return isInitialState ? UnitPoint(x: max, y: min) : UnitPoint(x: 0, y: 1)
        } else {
            return isInitialState ? UnitPoint(x: min, y: min) : UnitPoint(x: 1, y: 1)
        }
    }

    var endPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            return isInitialState ? UnitPoint(x: 1, y: 0) : UnitPoint(x: min, y: max)
        } else {
            return isInitialState ? UnitPoint(x: 0, y: 0) : UnitPoint(x: max, y: max)
        }
    }

    public func body(content: Content) -> some View {
        content
            .mask(LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint))
            .animation(animation, value: isInitialState)
            .onAppear {
                isInitialState = false
            }
    }
}

extension View {
    @ViewBuilder
    func shimmering(
        active: Bool = true,
        duration: Double = 1.5,
        bounce: Bool = true
    ) -> some View {
        if active {
            modifier(Shimmer())
        } else {
            self
        }
    }
}
