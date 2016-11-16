//
//  ViewController.swift
//  HelloWorld
//
//  Created by hao123 on 2016/10/12.
//  Copyright © 2016年 arrfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 测试函数用法
        testConstValue1();
        
        // 测试含有参数和返回值的函数用法
        print(testFunc2(name: "Peater"));
        
        // 计算 x*5的值
        print(testFunc3(dataValue: 3));
        
        // 测试多重返回值,返回方式以结构体的形式返回，用.语法获取对应的值
        print(testFunc4(array: [3,6,9,31,99]));
        let bounds = testFunc4(array: [3,6,9,31,99]);
        let datas = testFunc4(array: [3,6,9,31,99]);
        print("min = \(bounds.min),max = \(bounds.max)");
        print("min = \(datas.min),max = \(datas.max)");
        
        
        // 测试断言
        _ = testFunc5();
        
        // 异常处理
        testFunc6Catch();
        
        // 空合运算符使用
        testFunc7();
        
        // 区间运算
        testFunc8AreaCount();
        
        // 字符串的使用
        testFunc9String();
        testFunc9String1();
        
        // 字符串索引的使用
        testFunc10StringIndex();
        
        // 字符串的插入删除
        testFunc11StringInsert();
        
        // 字符串的比较
        testFun12StringCompare();
        
        // 数组的使用
        testFunc13Array();
        
        // 集合类型 Set的使用
        testFunc14SetArray();
        
        // 字典的使用 Dictionary
        testFunc15Dictionary();
        
        // 控制函数的使用
        test16Control();
        
        // 提前退出 guard
        testFunc17Guard(Person: ["name":"peter"]);
        
        // 默认参数的用法
        testFunc18Optional();
        
        // 闭包函数练习
        test19Sort();
        
        // 枚举练习
//        test20Enu();
//        
//        test21Class();
//        
//        // 属性的使用
//        test22Properties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    

}

func testConstValue1(){
    var myString = "hello";
    
    var secString = myString;
    
    myString = "hi";
    
    let threeString = "boy";
    
    
    print("myString = \(myString)  , secString = \(secString)");
    
    print("threeString = \(threeString)");
}

// 测试含有参数和返回值的函数用法
func testFunc2(name:String) ->String{
    return "my name is \(name)";
}

// 测试含有参数和返回值的函数用法：返回int 型
func testFunc3(dataValue:Int) ->Int{
    return dataValue*5;
}

// 多重返回值
func testFunc4(array:[Int]) ->(min:Int,max:Int){
    var minValue = array[0];
    var maxValue = array[0];
    
    // 获取数组中的最小和最大值
    for value in array[1..<array.count] {
        if value < minValue {
            minValue  = value;
        }
        else if value > maxValue{
            maxValue = value;
        }
    }
    
    return (minValue,maxValue);
    
}

// 使用断言进行调试
func testFunc5() ->Bool{
    
    let numa = 3;
    
    // 使用断言,当判断为false时，程序将终止，并且提示错误位置
    assert(numa>0, "变量为非法值");
    
    return true;
}


// 通过添加一个throws关键词来声明可能 抛出异常
func canThrowAnError() throws{
    print("抛出一个异常");
}

// 错误处理
func testFunc6Catch(){
    do{
        try canThrowAnError();
        print("正常");
    }catch{
        print("异常捕获");
        
    }
}

// 空合运算符使用
func testFunc7(){
    let colorA = "red";
    var colorB:String?; // 声明为可选类型
    
//    colorB = "blue";
    
    var userColor = colorB ?? colorA; // 当colorB为空时，则返回colorA的值
    
    print("选择了颜色为：\(userColor)");
}

// 区间运算
func testFunc8AreaCount(){
    
    // 闭区间 3个点 ...
    for index in 1...5 {
        print("\(index) *5 = \(index*5)");
    }
    
    // 半开区间 两个点..<
    for index in 1..<5 {
        print("\(index) * 6 = \(index*6)");
    }
}

// 字符串的使用
func testFunc9String(){
    var name1 = String();
    
    // 可以通过检查其Bool类型的isEmpty属性来判断该字符串是否为空：
    if name1.isEmpty {
        print("name1 字符变量为空");
    }
    
    // 字符串拼接方式
    name1 += "mary";
    name1 = name1 + " " + "is a girl";
    
    print("name1 = \(name1)");
    
    // 遍历字符串
    for chara in "I am arrfu".characters {
        print(chara);
    }
    
    print("\n");
    for chara in name1.characters {
        print(chara);
    }
    
    // 字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：
    let array:[Character] = ["h","e","l","l","o"];
    let name2 = String(array);
    print(name2);
    
    
    
}

func testFunc9String1(){
    // 变量的使用，可以在定义变量时，生命类型
    var data0 = 1;
    let data1:Int = 2;
    var data11:Float = 22;
    // 字符串插值 (String Interpolation) 的用法
    let data111 = "\(data1) square is \(Double(data1)*Double(data1))";//
    
    print(data11, separator: "", terminator: "\n");
    print("data0 = \(data0),data1 = \(data1),data11 = \(data11)");
    
    // 字符串的使用
    let name1: NSString = "1";
    var name11:NSString = "11";
    
    // 创建空字符串，建议用"?"判断解析，当此变量没有值时，打印时不会crash
    // 用"!"强制解析，当变量没有值时，打印会crash
    var name111:NSString?;
    //         var name111:NSString!;
    //        var name111:NSString;
    name111 = "111";
    
    print("name1 = \(name1),name11 = \(name11),name111 = \(name111)");
    print(name111);

}

// 字符串索引的使用
func testFunc10StringIndex(){
    let name1 = "abc def!";
    
    print("startIndex = \(name1.startIndex) , endIndex = \(name1.endIndex)");
    
    // 获取第一个字符
    let firstCharater = name1[name1.startIndex];
    print("firstCharater = \(firstCharater)");// a
    
    // 获取最后一个字符
    let endCharater = name1[name1.index(before: name1.endIndex)];
    print("endCharater = \(endCharater)");// !
    
    // 获取第二个字符
    let secCharater = name1[name1.index(after: name1.startIndex)];
    print("secCharater = \(secCharater)");// b
    
    // 利用对应偏移量来获取索引
    let index = name1.index(name1.startIndex, offsetBy: 1); // 偏移一个量
    print("name1[index] = \(name1[index])"); // b
    
    // 使用 characters 属性的 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符
    for index in name1.characters.indices {
        print("\(name1[index])",  terminator: " ");//不换行输出
    }
    print("\n");
}

// 字符串的插入删除
func testFunc11StringInsert(){
    var name1 = "hello";
    
    // 插入字符
    name1.insert("!", at: name1.endIndex);
    print("name1 = \(name1)");
    
    // 插入字符串
    name1.insert(contentsOf: "I am arrfu".characters, at: name1.endIndex);
    print("name1 = \(name1)");
    
    // 从字符串起偏移5个量的位置插入
    name1.insert(contentsOf: " man ".characters, at: name1.index(name1.startIndex, offsetBy: 5));
    print("name1 = \(name1)");
    
    // 删除指定位置字符 !
    name1.remove(at: name1.index(name1.endIndex, offsetBy: -11));
    print("name1 = \(name1)");
    
    // 删除指定区域字符串 arrfu
    let range = name1.index(name1.endIndex, offsetBy: -5) ..< name1.endIndex;
    name1.removeSubrange(range);
    print("name1 = \(name1)");
    
    // 清空字符串
    name1.removeAll();
    print("name1 = \(name1)");
}

// 字符串的比较: 比较规则，从左往右逐个比较，直到找到左边第一个不相等的字符为止
func testFun12StringCompare(){
    let name1 = "peater";
    let name2 = "peater";
    let name3 = "peatea";
    let name4 = "aeater";
    let name5 = "zeater";
    
    if name1 == name2 {
        print("name1 == name2");
    }
    
    if name1 > name3 {
        print("name1 > name3");
    }
    
    if name1 > name4 {
        print("name1 > name4");
    }
    
    if name1 < name5 {
        print("name1 < name5");
    }
}

// 数组的使用
func testFunc13Array(){
    var buf = [Int](); // 初始化一个空的Int型数组
    
    var array = [Int](repeating: 3, count: 5); // 初始化一个值为3的数组，长度为5
    
    array[4] = 9;
    
    // 添加数组元素的方式 追加：append() 和 += , 插入：insert()
    buf.append(12); // 添加数组元素
    
    buf += [8];
    
    buf += [55,56,57];
    
    print("buf count = \(buf.count)");
    for num in buf {
        print(num, separator: "", terminator: " ");
    }
    
    print("\n array count = \(array.count)");
    for num in array {
        print(num, separator: "", terminator: " ");
    }
    
    var buf1 = buf+array; // 数组相加
    
    // 插入元素
    buf1.insert(4, at: 2); // 数组插入元素，索引位置为2
    print("\n buf1 = \(buf1)");
    
    // 移除元素
    buf1.remove(at: 0);
    print("\n buf1 = \(buf1)");
    
    // 移除最后一个元素,该函数返回一个被删除的元素
    let value1 = buf1.removeLast();
    print("buf1 = \(buf1),last value = \(value1)");
    
    for (index,value) in buf1.enumerated() {
        print("buf1[\(index)] = \(value)")
    }
    
    var buf2:[String] = ["tom","marry","peter","lily","lucy"]; // 初始化string类型的数组
    print("\n buf2 = \(buf2)"); // ["tom", "marry", "peter", "lily", "lucy"]
    
    // 修改数组中某段区间的值
    buf2[2...4] = ["dog","pig"]; // 将2，3，4索引所在的元素替换为 dog,pig元素，元素个数-1
    print("\n buf2 = \(buf2)"); // ["tom", "marry", "dog", "pig"]
    
    // 以元素的形式遍历数组,enumerated()方法遍历
    for (index,value) in buf2.enumerated() {
        print("item = \(index+1) : \(value)");
    }
    
    var aabuf = [String]()
    aabuf.append("haha")
    aabuf += ["heh","xixi","didi"]
    print(aabuf);
    
    var bbbuf:[String] = ["aa","bb","cc","dd"]
    print(bbbuf)
    
    let ccbuf = aabuf+bbbuf
    print(ccbuf)
    
    
}

// 集合类型 Set的使用
func testFunc14SetArray(){
    
    // 集合具有无序性，一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明
    var bufData:Set<String> = ["aa","bb","cc"];
    print("bufData = \(bufData)"); // ["bb", "aa", "cc"]
    
    // 集合插入操作
    bufData.insert("dd");
    print("bufData = \(bufData)"); //  ["aa", "dd", "bb", "cc"]
    
    // 集合移除某个元素操作,成功，则返回被删除的元素，失败：返回nil
    if let value = bufData.remove("aa") {
        print("remove succeed:\(value) , \(bufData)");
    }
    else{
        print("bufData 集合中不存在这个元素 ");
    }
    
    // 集合按顺序输出 sorted()，但是并没有改变集合里面的顺序
    for genre in bufData.sorted() {
        print(genre, separator: "", terminator: " ");// bb cc dd
    }
    print("\n bufData = \(bufData)"); // ["dd", "bb", "cc"]
    
    // 集合的基本操作
    let aBuf:Set = [0,1,2,3];
    let bBuf:Set = [2,3,4,5];
    
    // 取交集 intersection()
    var value1 = aBuf.intersection(bBuf);
    print(value1); // [3, 2]
    
    // 取合集 union() : 方法根据两个集合的值创建一个新的集合
    value1 = aBuf.union(bBuf);
    print(value1); // [0, 3, 1, 5, 2, 4]
    
    // subtracting() : 方法根据不在该集合中的值创建一个新的集合
    value1 = aBuf.subtracting(bBuf);
    print(value1); // [0, 1]
    
    // symmetricDifference() : 方法根据在一个集合中但不在两个集合中的值创建一个新的集合
    value1 = aBuf.symmetricDifference(bBuf);
    print(value1); // [0, 1, 5, 4]
    
}

// 字典的使用 Dictionary <Key, Value>
func testFunc15Dictionary(){
    
    // 创建一个空字典
    var buf = [Int:String]();
    print(buf); // [:]
    
    buf[5] = "haha";
    print(buf); // [5: "haha"]
    
    // 初始化一个字典
    var dict1 = ["aa":"tom","bb":"lucy","cc":"peter"];
    print(dict1); // ["bb": "lucy", "aa": "tom", "cc": "peter"]
    
    dict1["bb"] = "mary";
    print(dict1); // ["bb": "mary", "aa": "tom", "cc": "peter"]
    
    dict1["dd"] = "dog";
    print(dict1); // ["aa": "tom", "dd": "dog", "bb": "mary", "cc": "peter"]
    
    // 返回一个可选值 string?
    print(dict1["dd"]); // Optional("dog")
    
    // 不存在该键值时， 返回nil
    print(dict1["kk"]); //  nil
    
    // 更新字典某个键值的方式
    if let updateValue =  dict1.updateValue("tony", forKey: "aa") {
        print("更新键值成功,旧值 = \(updateValue)",dict1);
        // 更新键值成功,旧值 = tom ["aa": "tony", "dd": "dog", "bb": "mary", "cc": "peter"]
    }
    else{
        print("字典中没有这个键值");
    }
    
    if let updateValue = dict1["aa"] {
        print("存在这个键值 \(updateValue)");
    }
    else{
        print("字典中没有这个键值");
    }
    
    // 移除键值对的方式：1.removeValueForKey() 2.给键值赋值nil
    if let removedValue = dict1.removeValue(forKey: "bb") {
        print("删除键值成功,旧值 = \(removedValue)",dict1);
        // 删除键值成功,旧值 = mary ["aa": "tony", "dd": "dog", "cc": "peter"]
    }
    else{
        print("字典中没有这个键值");
    }
    
    // 直接赋值空，即可删除该键值对
    dict1["aa"] = nil;
    print(dict1); // ["dd": "dog", "cc": "peter"]
    
    // 字典的遍历:使用for-in循环来遍历某个字典中的键值对。每一个字典中的数据项都以(key, value)元组形式返回
    for (key,value) in dict1 {
        print("key = \(key),value = \(value)"); // key = dd,value = dog
    }
    
    // 直接使用字典的key 或者value 来构建数组
    let arrayKey = [String](dict1.keys);
    print(arrayKey); // ["dd", "cc"]
    
    let arrayValue = [String](dict1.values);
    print(arrayValue); // ["dog", "peter"]
    
}

// switch 的使用：复合匹配，用逗号分开 ， 可以匹配多种数据类型
func testSwitchWithValue(value:String) ->Int{
    
    var data = 0;
    
    switch value {
    case "dog":
        data = 1;
        
    case "pig":
        data = 2;
        
    case "duck","aa":
        data = 3;
        
    default:
        data = 100;
    }
    
    return data;
}
// 控制函数的使用
func test16Control(){
    // switch的使用
    
    var ret = 0;
    
    ret = testSwitchWithValue(value: "dd");//ret = 100
    print("ret = \(ret)");
    
    ret = testSwitchWithValue(value: "pig");// ret = 2
    print("ret = \(ret)");
    
    ret = testSwitchWithValue(value: "duck"); // ret = 3
    print("ret = \(ret)");
    
    ret = testSwitchWithValue(value: "aa"); // ret = 3
    print("ret = \(ret)");
    
    
    // switch的区间匹配
    let num = 53;
    
    switch num {
    case 0..<30:
        print("该值所在区间 0~30");
    case 30..<60:
        print("该值所在区间 30~60");
    case 60..<90:
        print("该值所在区间 60~90");
    default:
        print("非法区间");
    }
    
    // switch的元组用法：我们可以使用元组在同一个switch语句中测试多个值。
    //元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值
    var point = (10,15);
    
//    point = (0,0);
    
    switch point {
    case (0,0):
        print("在原点位置");
    case (_,0):
        print("该点在x轴上");
    case (0,_):
        print("该点在y轴上");
        
    case (-20..<20,-10..<30):
        print("该点所在区间内：-20<=x<20 , -10<=y<30");
    default:
        print("该点在其他位置");
    }
    
    // switch的值绑定用法：case 分支允许将匹配的值绑定到一个临时的常量或变量，并且在case分支体内使用，这种行为被称为值绑定
    let otherPoint = (30,9);
    
    switch otherPoint {
    case (let x,0):
        print("x轴上的值：x = \(x)");
    case (0,let y):
        print("y轴上的值：y = \(y)");
        
    case (let x,let y):
        print("该点的坐标：x = \(x), y = \(y)");
        
    default:
        print("该点在其他位置");
    }
    
    // where的使用：case 分支的模式可以使用where语句来判断额外的条件
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
    }
    // 输出 "(1, -1) is on the line x == -y"
    
    // switch 的贯穿fallthrough：继续向下一case匹配
    let value1 = 3;
    switch value1 {
    case 0..<5:
        print("该变量在区间 0~5 内");
        fallthrough;
        
    case 3:
        print("该变量值为3");
    default:
        print("其他");
    }
    
    // 带标签语句的使用:形式：label name: while condition { statements }
    var count = 1;
    
    gameLoop:while count != 10{
        switch count {
        case 9:
            print("count = \(count)");
            break gameLoop; // 跳出while循环
        case 0..<10:
            count += 1;
            continue gameLoop; // 重新循环
        default:
            print("其他");
        }
    }
    
    if #available(iOS 9, *) {
        print("is ios >= 9");
    }

    
}

// 提前退出 guard 关键字的使用：guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执
// 行guard语句后的代码.如果条件不为真则执行else从句中的代码
func testFunc17Guard(Person:[String:String]){
    guard let name = Person["name"] else {
        print("Error ! the person's name is nil");
        return ;
    }

    print("hello \(name)")
    guard name[name.startIndex] == "a" else {
        print("first chatater is not 'a'");
        return ;
    }
    
    print("first chatater is 'a'")

}

// 带默认参数
func testMax(min:Int,max:Int = 55){
    print("min = \(min),max = \(max)");
}

// 可变参数的用法：可以接受零个或多个参数值，定义方式：...
// 参数中的 "_"标签标示可忽略标签标识 ,注意： 一个函数最多只能拥有一个可变参数。
func testTotal(_ numbers:Double ...) ->Double{
    var totals:Double = 0;
    
    for num in numbers {
        totals += num;
    }
    
    return totals;
}

// 输入输出参数的使用：inout关键字
func testSwapTwoNums(_ a: inout Int, _ b: inout Int) {
    let temp = a;
    a = b;
    b = temp;
}

func testAddFun(_ a:Int,_ b:Int) ->Int{
    return a+b;
}
// 函数类型作为参数使用
func testAddResult(_ fun1:(Int,Int) ->Int,_ x:Int,_ y:Int){
    print("result = \(fun1(x,y))");
}

// 函数类型作为返回值类型:
// 例如：返回的函数类型为：->(Int,Int) ->Int 即两个Int型参数，该函数的返回值类型是Int型
func testReturnFunc(_ a:Int) ->(Int,Int) ->Int{
    return testAddFun; // 返回相加的函数
}

// 嵌套函数的使用:把函数定义在别的函数体中，称作 嵌套函数.
// 默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数调用,一个外围函数也可
// 以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用
func testNestedFunc(_ a:Int) ->(Int,Int) ->Int{
    func testPlusFun(_ a:Int,_ b:Int) ->Int{
        return a * b;
    }
    
    return testPlusFun;
}

func testFunc18Optional(){
    
    // 默认参数的用法
    testMax(min: 12); // min = 12,max = 55
    testMax(min: 12, max: 22); // min = 12,max = 22
    
    
    // 可变参数的用法：可以接受零个或多个参数值，定义方式：...
    var total = testTotal(1,2,3,4);
    print("total = \(total)"); // total = 10.0
    
    // 输入输出参数的使用：inout关键字
    var numA = 33;
    var numB = 44;
    testSwapTwoNums(&numA, &numB);
    print("numA = \(numA),numB = \(numB)");// numA = 44,numB = 33
    
    // 使用函数类型 的使用：将函数当做变量使用
    let newFunc1 = testSwapTwoNums;
    newFunc1(&numA, &numB);
    print("numA = \(numA),numB = \(numB)");// numA = 33,numB = 44
    
    let newFunc2 = testTotal;
    total = newFunc2(1,9,2,3);
    print("total = \(total)"); // total = 15.0
    
    // 函数类型作为参数使用
    testAddResult(testAddFun, 3, 10); // result = 13
    
    // 函数类型作为返回值类型
    let newFunc3 = testReturnFunc(1);
    print("newFunc3(3,4) = \(newFunc3(3,4))"); // newFunc3(3,4) = 7
    
    // 嵌套函数的使用:
    let newFunc4 = testNestedFunc(1);
    print("newFunc4(3,4) = \(newFunc4(3,4))"); // newFunc4(3,4) = 12
    
    
}

func backward(_ s1:String,_ s2:String) ->Bool{
    return s1>s2;
}

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

// 闭包函数练习
/*
闭包表达式语法：
 
{ (parameters) -> returnType in
    statements
}
 
 */
func test19Sort(){
    
    let names = ["apple","caple","banana","dog","girl"];
    
    // 默认从小到大排序，且不改变原有数组顺序。
    print(names.sorted()); // ["apple", "banana", "caple", "dog", "girl"]
    
    let reversNames = names.sorted(by: backward); // 按自定义函数排序，且不改变原有数组顺序。
    
    print(reversNames); // ["girl", "dog", "caple", "banana", "apple"]
    
    print(names); // ["apple", "caple", "banana", "dog", "girl"]
    
    // 内联闭包表达式语法：{(parameters) ->returnType in statements}
    let name1 = names.sorted(by: {(s1:String,s2:String) ->Bool in return s1>s2});
    print(name1);// ["girl", "dog", "caple", "banana", "apple"]
    
    // 根据上下文推断闭包类型：
    let name2 = names.sorted(by: {s1,s2 in return s1>s2});
    print(name2); // ["girl", "dog", "caple", "banana", "apple"]
    
    // 单表达式闭包隐式返回：可以通过省略 return 关键字来隐式返回单行表达式的结果
    let name3 = names.sorted(by: {s1,s2 in s1>s2});
    print(name3); // ["girl", "dog", "caple", "banana", "apple"]
    
    // 参数名称缩写：Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
    let name4 = names.sorted(by: {$0 > $1});
    print(name4); // ["girl", "dog", "caple", "banana", "apple"]
    
    // 运算符方法：
    let name5 = names.sorted(by: >);
    print(name5); // ["girl", "dog", "caple", "banana", "apple"]
    
    // 尾随闭包：一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ];
    
    let numbers = [16, 58, 510]
    
    let strings = numbers.map {
        (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        return output
    }
    print(strings);
    
    // 值捕获
    //    func makeIncrease(forIncrese num:Int) ->() -> Int{
    //        var total = 0
    //
    //        // 嵌套函数，捕获上下文变量
    //        func increastor() -> Int{
    //            total += (num+1)
    //            return total
    //        }
    //
    //        return increastor // 返回函数类型为() -> Int
    //        
    //    }
    
    // 值捕获 (testIncrease 和 test2Increase 有各自独立的引用，互不影响)
    var testIncrease = makeIncrease(forIncrese: 3)
    print("testIncrese = \(testIncrease())")
    print("testIncrese = \(testIncrease())")
    print("testIncrese = \(testIncrease())")
    
    var test2Increase = makeIncrease(forIncrese: 10)
    print("test2Increase = \(test2Increase())")
    print("test2Increase = \(test2Increase())")
    print("test2Increase = \(test2Increase())")
    print("test2Increase = \(test2Increase())")
    print("testIncrese = \(testIncrease())")
    
    // 逃逸闭包(关键字@escaping):一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中
    var completeHandles:[() -> Int] = []
    func someFuncExcapeCloser(handleclose : @escaping () ->Int){
        completeHandles.append(handleclose)
    }
    
    func addTest() -> Int{
        var sum = 0
        return sum+1
        
    }
    
    someFuncExcapeCloser(handleclose: addTest)
    print(completeHandles[0]())
    
    
    
    typealias nothing1 = () -> Void
    
    

}



// 枚举
enum DirectPoint {
    case north
    case south
    case east
    case west
}

// 关联值
enum Barcode{
    case upc(Int,Int,Int)
    case qrcode(String)
}

// 默认值
enum WeekDays:Int{
    case sun = 5,monday,tuesday
}
// 枚举练习
func test20Enu(){

    let directHead = DirectPoint.east;
    
    switch directHead {
    case .north:
        print("north")
    case .south:
        print("south")
    case .east:
        print("east")

    default:
        print("other !!!")
    }
    
    var barcode = Barcode.upc(11, 22, 33)
    switch barcode {
    case .upc(let num1, let num2, var num3):
        print("upc = ",num1,num2,num3)
        num3 = 77;
        print("After:upc = ",num1,num2,num3)
    case .qrcode(let name):
        print("qrcode = ",name)
//    default: break
        
    }

    barcode = Barcode.qrcode("tom..")
    print("barcode = ",barcode);
    
    let day = WeekDays.monday;
    print("day = \(day.rawValue)");
    
    let possiblePlanet = WeekDays(rawValue: 7)// 获取原始值为7的变量，返回的是可选值类型
    print("possiblePlanet = \(possiblePlanet)");
//    print("possiblePlanet = \(possiblePlanet?.rawValue)");
    
    
    
}

// 类的使用
class VideoMode{
    var width = 0
    var height = 0
    var name :String? // 声明为可选值类型，其初始值为nil
}

//  类的使用
func test21Class(){
    
    let videoMode1 = VideoMode()
    videoMode1.width = 33
    print("width = \(videoMode1.width),name = \(videoMode1.name)")
    
    let model2 = videoMode1; // 类为引用类型，结构体和枚举是值拷贝类型
    model2.width = 44
    model2.name = "tom haha"
    print("model2 width = \(model2.width),model2 name = \(model2.name)")
    print("video width = \(videoMode1.width),video name = \(videoMode1.name)")
    
   
    if videoMode1 === model2 {
        print("videoMode1 和 model2 共同引用同一个类")
    }
    
    
}

struct StudyMode {
    var score :Int
    let length :Int
    
    
}
// 属性的使用
func test22Properties(){
    let mode1 = StudyMode(score:1,length:3)
    print("mode1 = \(mode1)")
    
    
    
}


