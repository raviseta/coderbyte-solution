import UIKit

var greeting = "Hello, playground"

    struct Stack {
        private var myArray: [Int] = []
        
        mutating func push(_ element: Int) {
            myArray.append(element)
        }
        
        mutating func pop() -> Int? {
            return myArray.popLast()
        }
        
        func peek() -> Int {
            guard let topElement = myArray.last else {return 0}
            return topElement
        }
        func isEmpty() -> Bool{
            return myArray.count == 0 ? true : false
        }
    }



func getLargestRect(arr_:[Int]) -> Int
{
    var stack = Stack()
    var maxArea = 0
    let arrayData = arr_
    
    
    for i in 0..<arrayData.count{
        if arrayData[i] >= arrayData[stack.peek()]{
            stack.push(i)
        }else{
            while (!stack.isEmpty() && arrayData[stack.peek()] > arrayData[i]){
                let curr = arrayData[stack.pop()!]
                
                if stack.isEmpty(){
                    maxArea = max(maxArea, curr * i)
                }else{
                    maxArea = max(maxArea, curr*(i-stack.peek()-1))
                }
                
            }
            stack.push(i)
        }
    }
    
    
    if(!stack.isEmpty())
    {
        let i = arrayData.count
        while(!stack.isEmpty())
        {
            let curr = arrayData[stack.pop()!]
            if(stack.isEmpty()){
                maxArea = max(maxArea, curr*i)
            }
            else{
                maxArea = max(maxArea, curr*(i-stack.peek()-1))
            }
        }
    }
    return maxArea
    
    
}

print(getLargestRect(arr_: [5, 6, 7, 4, 1]))
