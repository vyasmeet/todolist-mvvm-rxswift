//
//  TodoListRealmViewModel.swift
//  Todolist-MVVM
//
//  Created by Meet Vyas on 18/06/18.
//  Copyright © 2018 Foo Bar. All rights reserved.
//

import XCTest
@testable import Todolist_MVVM

class TodoListViewModelTests: XCTestCase {
    
    var vm: TodoListViewModel!
    var vmRealm: TodoListRealmViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        vm = TodoListViewModel()
        vmRealm = TodoListRealmViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        vm = nil
        vmRealm = nil
    }
    
    func testAddTwoTodos() {
        let oldCount = vm.getTodos().value.count
        
        vm.addTodo(withTodo: "test")
        vm.addTodo(withTodo: "test123")
        
        print("TODOS : ", vm.getTodos().value)
        XCTAssert(vm.getTodos().value.count == oldCount + 2)
    }
    
    func testRealmAddTwoTodos() {
        let oldCount = vmRealm.getTodos().value.count
        
        vmRealm.addTodo(withTodo: "newTest")
        vmRealm.addTodo(withTodo: "newTest789")
        
        print("TODOS ==> ", vmRealm.getTodos().value)
        XCTAssert(vmRealm.getTodos().value.count == oldCount + 2)
    }
    
    func testRemoveTodo() {
        let oldCount = vm.getTodos().value.count
        
        vm.removeTodo(withIndex: 0)
        
        XCTAssert(vm.getTodos().value.count == oldCount - 1)
    }
    
    func testRealmRemoveTodo() {
        let oldCount = vmRealm.getTodos().value.count
        
        vmRealm.removeTodo(withIndex: 0)
        
        XCTAssert(vmRealm.getTodos().value.count == oldCount - 1)
    }
    
    func testToggleTodo() {
        let isCompleted = vm.getTodos().value[0].isCompleted
        vm.toggleTodoIsCompleted(withIndex: 0)
        XCTAssert(vm.getTodos().value[0].isCompleted == !isCompleted)
    }
    
    func testRealmTogggleTodo() {
        let isCompleted = vmRealm.getTodos().value[0].isCompleted
        
        vmRealm.toggleTodoIsCompleted(withIndex: 0)
        
        XCTAssert(vmRealm.getTodos().value[0].isCompleted == !isCompleted)
    }
    
    func testPrintTodos() {
        print("TODOS : ", vm.getTodos().value)
    }
    
    func testRealmPrintTodos() {
        print("TODOS ==> ", vmRealm.getTodos().value)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
