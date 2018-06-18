//
//  TodoListRealmViewModel.swift
//  Todolist-MVVM
//
//  Created by Meet Vyas on 18/06/18.
//  Copyright © 2018 Foo Bar. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

struct TodoListRealmViewModel {
    
    private var todos = Variable<[TodoModel]>([])
    private var todoDataAccessProvider = TodoRealmAccessProvider()
    private var disposeBag = DisposeBag()
    
    init() {
        fetchTodosAndUpdateObservableTodos()
        print("Realm ==> \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
    }
    
    public func getTodos() -> Variable<[TodoModel]> {
        return todos
    }
    
    // MARK: - fetching Todos from Core Data and update observable todos
    private func fetchTodosAndUpdateObservableTodos() {
        todoDataAccessProvider.fetchObservableData()
            .map({ $0 })
            .subscribe(onNext : { (todos) in
                self.todos.value = todos
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - add new todo from Core Data
    public func addTodo(withTodo todo: String) {
        todoDataAccessProvider.addTodo(withTodo: todo)
    }
    
    // MARK: - toggle selected todo's isCompleted value
    public func toggleTodoIsCompleted(withIndex index: Int) {
        todoDataAccessProvider.toggleTodoIsCompleted(withIndex: index)
    }
    
    // MARK: - remove specified todo from Core Data
    public func removeTodo(withIndex index: Int) {
        todoDataAccessProvider.removeTodo(withIndex: index)
    }
    
}

