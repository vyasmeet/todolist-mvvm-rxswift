//
//  TodoListRealmViewModel.swift
//  Todolist-MVVM
//
//  Created by Meet Vyas on 18/06/18.
//  Copyright © 2018 Foo Bar. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class TodoRealmAccessProvider {
    
    private var todosFromRealm = Variable<[TodoModel]>([])
    
    init() {
        todosFromRealm.value = fetchData()
    }
    
    // MARK: - fetching Todos from Core Data and update observable todos
    private func fetchData() -> [TodoModel] {
        do {
            let realm = try Realm()
            return realm.objects(TodoModel.self).map{$0}
        } catch {
            return []
        }
    }
    
    // MARK: - return observable todo
    public func fetchObservableData() -> Observable<[TodoModel]> {
        todosFromRealm.value = fetchData()
        return todosFromRealm.asObservable()
    }
    
    // MARK: - add new todo from Core Data
    public func addTodo(withTodo todo: String) {
        let newTodo = TodoModel()
        newTodo.todo = todo
        newTodo.isCompleted = false

        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newTodo, update: true)
            }
            todosFromRealm.value = fetchData()
        } catch {
            fatalError("error saving data")
        }
    }
    
    // MARK: - toggle selected todo's isCompleted value
    public func toggleTodoIsCompleted(withIndex index: Int) {
        
        do {
            let realm = try Realm()
            try realm.write {
                todosFromRealm.value[index].isCompleted = !todosFromRealm.value[index].isCompleted
            }
            todosFromRealm.value = fetchData()
        } catch {
            fatalError("error change data")
        }
        
    }
    
    // MARK: - remove specified todo from Core Data
    public func removeTodo(withIndex index: Int) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(todosFromRealm.value[index])
            }
            todosFromRealm.value = fetchData()
        } catch {
            fatalError("error delete data")
        }
    }
    
}
