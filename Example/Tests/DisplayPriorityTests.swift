//
//  AttributesCreationDisplayPriorityTests.swift
//  SwiftEntryKitTests
//
//  Created by Daniel Huri on 5/20/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftEntryKit

class DisplayPriorityTests: QuickSpec {

    override func spec() {
        testDisplayPriority()
    }
    
    private func testDisplayPriority() {
        describe("attributes display priority") {
            var attributes: EKAttributes!
            
            beforeEach {
                attributes = EKAttributes()
            }
            
            it("is initialized with max display priority") {
                attributes.displayPriority = .max
                expect(attributes.displayPriority).to(equal(.max))
                expect(attributes.displayPriority.rawValue).to(equal(EKAttributes.DisplayPriority.maxRawValue))
            }
            
            it("is initialized with high display priority") {
                attributes.displayPriority = .high
                expect(attributes.displayPriority).to(equal(.high))
                expect(attributes.displayPriority.rawValue).to(equal(EKAttributes.DisplayPriority.highRawValue))
            }
            
            it("is initialized with high display priority") {
                attributes.displayPriority = .normal
                expect(attributes.displayPriority).to(equal(.normal))
                expect(attributes.displayPriority.rawValue).to(equal(EKAttributes.DisplayPriority.normalRawValue))
            }
            
            it("is initialized with low display priority") {
                attributes.displayPriority = .low
                expect(attributes.displayPriority).to(equal(.low))
                expect(attributes.displayPriority.rawValue).to(equal(EKAttributes.DisplayPriority.lowRawValue))
            }
            
            it("is initialized with min display priority") {
                attributes.displayPriority = .min
                expect(attributes.displayPriority).to(equal(.min))
                expect(attributes.displayPriority.rawValue).to(equal(EKAttributes.DisplayPriority.minRawValue))
            }
            
            it("is initialized with custom display priority") {
                let custom1 = EKAttributes.DisplayPriority(rawValue: 999)
                attributes.displayPriority = custom1
                expect(attributes.displayPriority).to(equal(custom1))
                expect(attributes.displayPriority.rawValue).to(equal(999))
                
                let custom2 = EKAttributes.DisplayPriority(1)
                attributes.displayPriority = custom2
                expect(attributes.displayPriority).to(equal(custom2))
                expect(attributes.displayPriority.rawValue).to(equal(1))
                
                expect(custom2).to(beLessThan(custom1))
            }
        }
    }
}
