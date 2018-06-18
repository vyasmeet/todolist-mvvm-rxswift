//
//  TodoListRealmViewModel.swift
//  Todolist-MVVM
//
//  Created by Meet Vyas on 18/06/18.
//  Copyright © 2018 Foo Bar. All rights reserved.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func todoFetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var todo: String?

}
