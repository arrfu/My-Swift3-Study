//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

var a = 1


let closerFunc:()->Int = {
    ()->Int in
    print("haha")
    return 9
}

let b = closerFunc()

let addFunc:(_ a:Int,_ b:Int,_ name:String) -> Int = {
    (a,b,name)in
    
    return a+b
}

let sum = addFunc(3,5,"peater")
let infoFunc = addFunc

typealias ScoreCloser = (_ a:Int,_ b:Int,_ name:String)->Int
func studentInfoFunc(score:(_ a:Int,_ b:Int,_ name:String)->Int){
    let sum = score(2,4,"tom")
    print(sum)
}

//studentInfoFunc(score:infoFunc)

//studentInfoFunc(score:{(a,b,name) in
//    return a*b
//})

//studentInfoFunc(){(a,b,name) in
//    return a*b
//}

studentInfoFunc{(a,b,name) in
    return a*b
}


var callBack : (String) -> String

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// 打印出 "5"

//let customerProvider = { customersInLine.remove(at: 0) }
let customerProvider = { () -> String in  customersInLine += ["heh","haha"];customersInLine.remove(at: 0);return "xixi"}
print(customersInLine.count)
// 打印出 "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// 打印出 "4"


public enum Result<T, E: Error> {
    case Success(T)
    case Error(E)
}

public struct Future<T, E: Error> {
    public typealias ResultType = Result<T, E>
    public typealias Completion = (ResultType) -> Void
    public typealias AsyncOperation = (Completion) -> Void
    
    private let operation: AsyncOperation
    
    public init(result: ResultType) {
        self.init(operation: { completion in
            completion(result)
        })
    }
    
    public init(value: T) {
        self.init(result: .Success(value))
    }
    
    public init(error: E) {
        self.init(result: .Error(error))
    }
    public init(operation:  @escaping (Completion) -> Void) {
        self.operation = operation
    }
    
    public func start(completion: Completion) {
        self.operation() { result in
            completion(result)
        }
    }
}

//: ### Error handeling

enum UserInfoErrorDomain: Error {
    case UserDoesNotExist
    case UserRequestFailure
    case NetworkRequestFailure
}

func downloadFile(URL: NSURL) -> Future<NSData, UserInfoErrorDomain> {
    
    return Future(operation: { completion in
        DispatchQueue.main.async( execute: {
            print("Async2")
            let result: Result<NSData, UserInfoErrorDomain>
            
            if let data = NSData(contentsOf: URL as URL) {
                result = Result.Success(data)
            }
            else {
                result = Result.Error(.NetworkRequestFailure)
            }
            
            completion(result) // ERROR here Closure use of non-escaping parameter 'completion' may allow it to escape
        })
    })
}