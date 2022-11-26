//
//  NetworkMonitorOni.swift
//  SignalConnectionSwift
//
//  Created by etho on 11/25/22.
//

import Foundation
import Network
//singleton class to wrap calls into network framework
final class NetWorkMonitor {
    static let shared = NetWorkMonitor()
    private let queue = DispatchQueue.global()
    private let monitor : NWPathMonitor
    public private(set) var isConnected : Bool = false
    
    private init(){
        monitor = NWPathMonitor()
    }
    
    public func StartMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {[weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
    
    public func StopMonitoring(){
        monitor.cancel()
    }
}
