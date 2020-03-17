//
//  FilteringOperatorsViewModel.swift
//  RxSwiftExamples
//
//  Created by AdrenResi on 3/17/20.
//  Copyright © 2020 AdrenResi. All rights reserved.
//

import UIKit
import RxSwift

/*
// Filter:
 Filter
 IgnoreElements
 ElementAt
 DistinctUntilChanged
 Debounce
 Take
 TakeWhile
 TakeWhileWithIndex
 TakeUntil
 Skip
 SkipUntil

*/

class FilteringOperatorsViewModel {
    
    // Don't forget to have a disposeBag as a class member!
    let disposeBag = DisposeBag()
    
    func filter() {
        Observable.of(1,2,3,4,5,6)
            // You can choose to use
            // anonymous closure arguments
            // which is stuff like "$0".
            // e.g. .filter { $0 < 3 }
            
            // ...or you can use explicit arguments
            // which are the typical arguments you see
            // in a closure. Just don't have both.
            .filter { $0 % 2 == 0 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func ignoreElements() {
        // ignoreElements ignores .next event elements
        // It does, however, allow the stop events (.completed and .error)
        let enemyBoss = PublishSubject<String>()
        
        enemyBoss
            .ignoreElements()
            .subscribe { (_) in
                print("You died!")
            }
            .disposed(by: disposeBag)
        
        // All of these .onNext events get ignored.
        // Only the onCompleted is what gets the print statement
        // to show up
        enemyBoss.onNext("You tried hitting the enemy boss")
        enemyBoss.onNext("You tried hitting the enemy boss")
        enemyBoss.onNext("You tried hitting the enemy boss")
        enemyBoss.onCompleted()
    }
    
    func elementAt() {
        // You can pick an index number of an element to single out.
        // All other elements will be ignored when you
        // subscribe to the .next events.
        let strikes = PublishSubject<String>()
        
        strikes
        .elementAt(2)
            .subscribe(onNext: { (_) in
                print("You're out!")
            }, onError: { (error) in
                
            }, onCompleted: {
                
            }) {
                
            }.disposed(by: disposeBag)
        
        strikes.onNext("X")
        strikes.onNext("X")
        
        // This .onNext event is on element #2, so
        // calling this event will trigger "You're out!"
        strikes.onNext("X")
    }
    
    func distinctUntilChanged() {
        
    }
    
    func debounce() {
        
    }
    
    func take() {
        
    }
    
    func takeWhile() {
        
    }
    
    func takeWhileWithIndex() {
        
    }
    
    func takeUntil() {
        
    }
    
    func skip() {
        
    }
    
    func skipUntil() {
        let subject = PublishSubject<String>()
        let trigger = PublishSubject<String>()
        
        subject
            .skipUntil(trigger)
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        // These get skipped/ignored because the subject is waiting
        // for the trigger to emit an event.
        subject.onNext("A")
        subject.onNext("B")
        
        // The trigger emits an event.
        // No matter what the event is, it triggers the subject.
        trigger.onNext("X")
        
        // This gets emitted.
        subject.onNext("C")
    }
    
    func skipWhile() {
        Observable.of(2,2,3,4,4)
            .skipWhile { (integer) -> Bool in
                integer % 2 == 0
            }
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        
    }
}
