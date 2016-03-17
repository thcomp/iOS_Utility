//
//  HttpResponseCallback.swift
//
//  Created by thcomp on 2016/02/25.
//  Copyright © 2016年 thcomp. All rights reserved.
//

import Foundation

public protocol HttpConnectionCallback {
    func onSendData(request: NSMutableURLRequest, param: HttpRequestParams) -> Void;
    func onReceiveData(connectResult: Bool, response: NSHTTPURLResponse?, param: HttpRequestParams) -> Void;
}