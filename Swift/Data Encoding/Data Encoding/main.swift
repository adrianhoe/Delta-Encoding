//
//  main.swift
//  Delta Encoding
//
//  Created by Adrian Hoe on 8/8/15.
//  Copyright (c) 2015 AdaLogica Software. All rights reserved.
//

import Foundation

protocol __{};extension String:__{};extension Int:__{};extension Int64:__{};extension Double:__{}
class InputScanner {  //based on https://github.com/shoumikhin/StreamScanner
   let source = NSFileHandle.fileHandleWithStandardInput()
   let delimiters = NSCharacterSet.whitespaceAndNewlineCharacterSet()
   var buffer: NSScanner?
   func read<T: __>() -> T? {
      if buffer == nil || buffer!.atEnd {
         if let nextInput = NSString(data: source.availableData, encoding: NSUTF8StringEncoding) {
            buffer = NSScanner(string: nextInput as String)}}
      if buffer == nil { return nil }
      var token: NSString?
      if !buffer!.scanUpToCharactersFromSet(delimiters, intoString: &token) || token == nil { return nil }
      buffer!.scanCharactersFromSet(delimiters, intoString: nil)
      var ret: T? = nil
      if ret is String? { return token as? T }
      let scanner = NSScanner(string: token as! String)
      switch ret {
      case is Int? : var value: Int = 0; if scanner.scanInteger(&value) { ret = value as? T }
      case is Int64? : var value: Int64 = 0; if scanner.scanLongLong(&value) { ret = value as? T }
      case is Double? : var value: Double = 0; if scanner.scanDouble(&value) { ret = value as? T }
      default : ret = nil}
      return ret}}



func DeltaEncode (Data: [Int], N: Int) -> ([Int]) {
   var Last: Int = 0;
   var Results: [Int] = []
   
   for i in 0 ... (N-1) {
      Results.append (Data[i] - Last)
      Last = Data[i]
   }

   return Results
}

let io = InputScanner()


var N: Int = 0

println("How many datum (N>0) to encode?")


while (!(N>0)) {
   
   print("> ")
   let i: Int! = io.read()
   
   N = i!
   
}

var count: Int = N

var data: [Int] = []

while Bool(count--)
{
   print("\(N-count) > ")
   if let datum: Int = io.read()
   {
      data.append(datum)
   }
}

var results: [Int] = DeltaEncode (data, N)

println()
println(data)
println(results)