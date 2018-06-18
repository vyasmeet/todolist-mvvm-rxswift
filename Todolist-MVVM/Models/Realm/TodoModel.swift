//
//  TodoListRealmViewModel.swift
//  Todolist-MVVM
//
//  Created by Meet Vyas on 18/06/18.
//  Copyright © 2018 Foo Bar. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    
    @objc dynamic var todoID = UUID().uuidString
    @objc dynamic var isCompleted: Bool = false
    @objc dynamic var todo: String = ""
    
    override static func primaryKey() -> String? {
        return "todoID"
    }
    
}
