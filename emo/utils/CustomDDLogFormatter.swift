//
//  CustomDDLogFormatter.swift
//  emo
//
//  Created by Jason Steele on 1/29/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import CocoaLumberjack
import Foundation

public class CustomDDLogFormatter: NSObject, DDLogFormatter {
    let dateFormatter = DateFormatter()
    var compact: Bool = false

    public override init() {
        super.init()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    }

    public convenience init(compact: Bool?) {
        self.init()
        self.compact = compact ?? false
    }

    public func format(message logMessage: DDLogMessage) -> String? {
        let logLevel: String

        switch logMessage.flag {
        case DDLogFlag.error:
            logLevel = "ERROR"
        case DDLogFlag.warning:
            logLevel = "WARNING"
        case DDLogFlag.info:
            logLevel = "INFO"
        case DDLogFlag.debug:
            logLevel = "DEBUG"
        default:
            logLevel = "VERBOSE"
        }

        let dt = dateFormatter.string(from: logMessage.timestamp)
        let logMsg = logMessage.message
        let lineNumber = logMessage.line
        let file = logMessage.fileName
        let functionName = logMessage.function
        let threadId = logMessage.threadID

        if compact {
            return "[\(logLevel)] [\(file):\(lineNumber)] [\(functionName ?? "")]"
                + " - \(logMsg)"
        } else {
            return "\(dt) [\(threadId)] [\(logLevel)] [\(file):\(lineNumber)] [\(functionName ?? "")]"
                + " - \(logMsg)"
        }
    }
}
