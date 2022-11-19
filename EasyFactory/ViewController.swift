//
//  ViewController.swift
//  EasyFactory
//
//  Created by 王亚威 on 2022/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let oper = OperationFactory.createOperate(operate: "+")
        oper?.a = 1
        oper?.b = 2
        let result = oper?.getResult()
        print("result----", result!)
        
    }


}

// 使用封装
class Operation1 {
    static func getResult(a: Int, b: Int, operate: String) -> Int {
        var result = 0
        switch operate {
        case "+":
            result = a + b
        case "-":
            result = a - b
        case "*":
            result = a * b
        case "/":
            if b != 0 {
                result = a / b
            }
        default:
            result = 0
        }
        return result
    }
}

// 继承和多态
protocol Operationable {
    var a: Int {get set}
    var b: Int {get set}
    func getResult() -> Int
}

class Operation: Operationable {
    var a: Int = 0
    var b: Int = 0
    
    func getResult() -> Int {
        var result = 0
        return result
    }
}


class OperationAdd: Operation {
    
    override func getResult() -> Int {
        var result = 0
        result = a + b
        return result
    }
    
}

class OperationSub: Operation {
    
    override func getResult() -> Int {
        var result = 0
        result = a - b
        return result
    }
    
}

class OperationMul: Operation {
    
    override func getResult() -> Int {
        var result = 0
        result = a * b
        return result
    }
    
}


class OperationDiv: Operation {
    
    override func getResult() -> Int {
        var result = 0
        if b != 0 {
            result = a / b
        }
        return result
    }
    
}

/// 简单工厂
class OperationFactory {
    static func createOperate(operate: String) -> Operation? {
        var oper: Operation?
        switch operate {
        case "+":
            oper = OperationAdd()
        case "-":
            oper = OperationSub()
        case "*":
            oper = OperationMul()
        case "/":
            oper = OperationDiv()
        default:
            print("undefined operate")
        }
        return oper
    }
}
