//
//  XXLogger.swift
//  XXLogger
//
//  Created by Rdxer on 2016/12/25.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit


/// 默认 log 级别 = LogTagLevel.d
public var xx_DefaultLogLevel = LogTagLevel.d

/// 日志级别
///
/// - D: 一般的调试信息
/// - W: 警告级别的
/// - E: 错误级别的
public enum LogTagLevel:Int{
    case d = 1
    case w = 10
    case e = 100
}

extension LogTagLevel:CustomStringConvertible{
    public var description : String {
        switch self{
        case .d: return "😀"
        case .w: return "⚠️"
        case .e: return "❌"
        }
    }
}


/// 打印一般打印信息
public func printD<T>(_ message: T,
            level: LogTagLevel = .d,
            file: String = #file,
            method: String = #function,
            line: Int = #line)
{
    //    #if DEBUG
    LXFLog(message, level:level,
           file: file,
           method: method,
           line: line)
    //    #endif
    
}

/// 打印警告信息
public func printW<T>(_ message: T,
            level: LogTagLevel = .w,
            file: String = #file,
            method: String = #function,
            line: Int = #line)
{
    //    #if DEBUG
    LXFLog(message, level:level,
           file: file,
           method: method,
           line: line)
    //    #endif
}
/// 打印错误信息
public func printE<T>(_ message: T,
            level: LogTagLevel = .e,
            file: String = #file,
            method: String = #function,
            line: Int = #line)
{
    LXFLog(message, level:level,
           file: file,
           method: method,
           line: line)
}

/// 输出日志-TAG
///
/// - parameter message: 日志消息
/// - parameter level:   日志级别,默认是 D(debug)
/// - parameter file:    文件路径
/// - parameter method:  方法名
/// - parameter line:    代码行数
private func LXFLog<T>(_ message: T,
                    level: LogTagLevel = .d,
                    file: String ,
                    method: String ,
                    line: Int)
{
    if level.rawValue < xx_DefaultLogLevel.rawValue{
        return
    }
    let fileName = NSURL(fileURLWithPath: file).deletingPathExtension!.lastPathComponent
    // MARK: -  format 格式字符串,
    print(String(format: "%@ %@(%d) %@ 💬: %@", "\(level.description)", fileName, line, method ,"\(message)"))
}
