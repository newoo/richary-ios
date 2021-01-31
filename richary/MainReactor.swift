//
//  MainReactor.swift
//  richary
//
//  Created by law on 2021/02/01.
//

import Foundation

import RxSwift
import ReactorKit

class MainReactor: Reactor {
    let initialState = State()
    
    enum Action {
        case refresh
    }
    
    enum Mutation {
        case setCurrentDate
    }
    
    struct State {
        var currentDateText = Date().toString(by: DateFormatter().dateFommat())
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            return .just(.setCurrentDate)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setCurrentDate:
            state.currentDateText = Date().toString(by: DateFormatter().dateFommat())
        }
        
        return state
    }
}
