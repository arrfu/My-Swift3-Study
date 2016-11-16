//
//  ViewController.swift
//  JFClosuresDemo
//
//  Created by hao123 on 2016/11/16.
//  Copyright © 2016年 arrfu. All rights reserved.
//

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
