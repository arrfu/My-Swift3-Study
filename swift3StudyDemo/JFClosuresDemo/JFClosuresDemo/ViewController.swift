//
//  ViewController.swift
//  JFClosuresDemo
//
//  Created by hao123 on 2016/11/16.
//  Copyright © 2016年 arrfu. All rights reserved.
//  闭包有点类似oc的block代码块

/*
 闭包的语法表达式：
 
 { (parameters/接收的参数) -> (return type/闭包返回值类型) in
 statements/保存在闭包中需要执行的代码
 }
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.typealias关键字的使用，跟oc中的typedef类似
        testClosure1()
        
        // 2.简化形式
        testClosure2()
        
        // 闭包形式3 （当闭包没有接收参数时，可省略in关键字）
        testClosure3()
        
        // 闭包形式4.简化（省略参数名，用$0,$1,$2,$3,...代替）
        testClosure4()
        
        // 闭包的使用：值捕获
        testClosure5()
        
        // 闭包的使用：尾随闭包
        testClosure6()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// 闭包形式1
func testClosure1(){
    // 1.typealias关键字的使用，跟oc中的typedef类似
    typealias ClosureAdd = (_ num1:Int,_ num2:Int) -> Int // 给闭包起别名为：ClosureAdd
    let closureAdd:ClosureAdd = {
        (_ num1:Int,_ num2:Int) in
        return num1+num2
    }
    
    let reslut = closureAdd(2, 3)
    print("reslut = \(reslut)")
}


// 闭包形式2
func testClosure2(){
    // 2.简化
    let closureAdd:(_ num1:Int,_ num2:Int) -> Int
        
    closureAdd = {
        (_ num1:Int,_ num2:Int) in
        return num1+num2
    }
    
    let reslut = closureAdd(2, 3)
    print("reslut = \(reslut)")
}

// 闭包形式3
func testClosure3(){
    // 3.简化（当闭包没有接收参数时，可省略in关键字）
    let closureAdd:() -> Int
    
    closureAdd = {
//        () in  // 可省略
        return 100
    }
    
    let reslut = closureAdd()
    print("reslut = \(reslut)")
}

// 闭包形式4
func testClosure4(){
    // 4.简化（省略参数名，用$0,$1,$2,$3,...代替）
    let closureAdd:(Int,Int) -> Int
    
    closureAdd = {
        return $0+$1
    }
    
    let reslut = closureAdd(2,3)
    print("reslut = \(reslut)")
}

// 闭包的使用：值捕获
func testClosure5(){
    // 值捕获
    func makeIncrease(forIncrese num:Int) ->() -> Int{
        var total = 0
        
        // 嵌套函数，捕获上下文变量
        func increastor() -> Int{
            total += num
            return total
        }
        return increastor // 返回函数类型为() -> Int
    }
    
    let increaseFunc1 = makeIncrease(forIncrese: 3)
    print(increaseFunc1())// 3
    print(increaseFunc1())// 6
    print(increaseFunc1())// 9
    
    let increaseFunc1_1 = increaseFunc1 // 引用同一个闭包
    print(increaseFunc1_1())// 12
    
    let increaseFunc2 = makeIncrease(forIncrese: 5) // 新建一个新的闭包
    print(increaseFunc2())// 5
    print(increaseFunc2())// 10
    print(increaseFunc2())// 15
    
}

// 闭包的使用：尾随闭包
func testClosure6(){
    // 参数：一个Int型参数，一个函数型参数,返回值：String型
    func outputNameAndNumber(_ num:Int,name:(String) -> String) -> String{
        let infoString:String
        infoString = name("Peater")+"My num is \(num)"
        return infoString
    }
    
    // 不使用尾随闭包写法：
//    let result = outputNameAndNumber(24, name: {
//        (String) in
//        let infoString = "My name is \($0)"
//        return "My name is \($0)"})
//    
//    print(result)
    
    
}
