//
//  HandlerThread.swift
//
//  Created by thcomp on 2016/02/17.
//  Copyright © 2016年 thcomp. All rights reserved.
//

import Foundation

public class Handler {
    private var mOperationQueue: NSOperationQueue;
    private var mOperationList: [InnerOperation] = [InnerOperation]();
    
    public init(){
        mOperationQueue = NSOperationQueue.currentQueue()!;
    }
    
    public init(operationQueue: NSOperationQueue){
        mOperationQueue = operationQueue;
    }
    
    public func post(runnable: Runnable){
        mOperationQueue.addOperationWithBlock({ () -> Void  in
            runnable.run();
        });
    }
    
    public func sendMessage(msg: Message){
        let operation: InnerOperation = InnerOperation(handler: self, message: msg);
        mOperationList.append(operation);
        mOperationQueue.addOperation(operation);
    }
    
    public func handleMessage(msg: Message) -> Void {
        // if you want to receive message, please override this method.
    }
    
    public func removeMessage(what: Int){
        for (index, operation) in mOperationList.enumerate() {
            if operation.mMessage.what == what {
                operation.cancel();
                mOperationList.removeAtIndex(index);
                break;
            }
        }
    }
    
    public func removeMessages(what: Int){
        for (index, operation) in mOperationList.enumerate() {
            if operation.mMessage.what == what {
                operation.cancel();
                mOperationList.removeAtIndex(index);
            }
        }
    }
    
    public func removeAllMessages(){
        for operation in mOperationList {
            operation.cancel();
        }
        mOperationList.removeAll();
    }
    
    internal class InnerOperation : NSOperation{
        private let mHandler: Handler;
        private let mMessage: Message;

        internal init(handler: Handler, message: Message){
            mHandler = handler;
            mMessage = message;
        }
        
        internal override func main() {
            let what: Int = mMessage.what;
            mHandler.handleMessage(mMessage);
            mHandler.removeMessage(what);
        }
        
    }
}