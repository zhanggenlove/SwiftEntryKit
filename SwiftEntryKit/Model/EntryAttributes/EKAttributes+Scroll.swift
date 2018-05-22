//
//  EKAttributes+Scroll.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 4/30/18.
//

import Foundation

extension EKAttributes {
    
    /** Describes the event of scroll user interaction */
    public struct Scroll {
    
        /** The degree of the scroll direction */
        public enum Degree {
            
            /** The lowest scroll degree - the scroll is totally disabled */
            case disabled
            
            /** Scroll stretches the entry (Rubber Band) */
            case stretch
            
            /** Scrolling is free, but not swipable*/
            case free
            
            /** The highest scroll degree, totally free and swipable */
            case swipable
            
            /** Returns true if the value is not *.disabled* */
            public var isEnabled: Bool {
                return self != .disabled
            }
            
            public var isStretch: Bool {
                return self == .stretch
            }
        }
        
        /** Describes the event when the user leaves the entry after scrolling it - how it goes back into its place */
        public struct PullbackAnimation {
            public var duration: TimeInterval
            public var damping: CGFloat
            public var initialSpringVelocity: CGFloat
            
            public init(duration: TimeInterval, damping: CGFloat, initialSpringVelocity: CGFloat) {
                self.duration = duration
                self.damping = damping
                self.initialSpringVelocity = initialSpringVelocity
            }
            
            /** The entry is jolted when it's pulled back into the original position */
            public static var jolt: PullbackAnimation {
                return PullbackAnimation(duration: 0.5, damping: 0.3, initialSpringVelocity: 10)
            }
            
            /** The view eases out when it's pulled back into the original position */
            public static var easeOut: PullbackAnimation {
                return PullbackAnimation(duration: 0.3, damping: 1, initialSpringVelocity: 10)
            }
        }
        
        /** Scroll up degree */
        public var up: Degree
        
        /** Scroll down degree */
        public var down: Degree
        
        /** Pullback animation descriptor */
        public var pullbackAnimation: PullbackAnimation
        
        /** Returns true if any of the scroll directions is enabled */
        public var isEnabled: Bool {
            return up.isEnabled && down.isEnabled
        }
        
        /** Returns disabled scroll property */
        public static var disabled: Scroll {
            return Scroll(up: .disabled, down: .disabled)
        }
        
        /** Initializer */
        public init(up: Degree, down: Degree, pullbackAnimation: PullbackAnimation = .easeOut) {
            self.up = up
            self.down = down
            self.pullbackAnimation = pullbackAnimation
        }
    }
}
