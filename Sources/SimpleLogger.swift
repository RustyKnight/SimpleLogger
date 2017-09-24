//
//  SimpleLogger.swift
//  SimpleLogger
//
//  Created by Shane Whitehead on 24/9/17.
//  Copyright © 2017 SimpleLogger. All rights reserved.
//

import Foundation

public struct SimpleLogger {
	
	public enum LogType: String {
		case info = "💡"
		case warn = "⚠️"
		case error = "🔥"
		case debug = "🐞"
	}
	
	public static var shared: SimpleLogger = SimpleLogger()
	
	var dateFormat: DateFormatter {
		let df = DateFormatter()
		df.dateStyle = .short
		df.timeStyle = .short
		return df
	}
	
	public func log(_ type: LogType, message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
		let fileName = (file as NSString).lastPathComponent
		print("|\(type.rawValue)|\(dateFormat.string(from: date))|[\(fileName):\(function)@\(line)] \(message)")
	}
	
	public func debug(message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
		log(.debug, message: message, function: function, line: line, file: file, date: date)
	}
	
	public func info(message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
		log(.info, message: message, function: function, line: line, file: file, date: date)
	}
	
	public func warn(message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
		log(.warn, message: message, function: function, line: line, file: file, date: date)
	}
	
	public func error(message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
		log(.error, message: message, function: function, line: line, file: file, date: date)
	}
}

public func log(info message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
	SimpleLogger.shared.info(message: message, function: function, line: line, file: file, date: date)
}

public func log(debug message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
	SimpleLogger.shared.debug(message: message, function: function, line: line, file: file, date: date)
}

public func log(warn message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
	SimpleLogger.shared.warn(message: message, function: function, line: line, file: file, date: date)
}

public func log(error message: String, function: String = #function, line: Int = #line, file: String = #file, date: Date = Date()) {
	SimpleLogger.shared.error(message: message, function: function, line: line, file: file, date: date)
}
