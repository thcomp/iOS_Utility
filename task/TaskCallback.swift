//
//  TaskCallback.swift
//
//  Created by thcomp on 8/29/15.
//  Copyright (c) 2015 thcomp. All rights reserved.
//

import Foundation

protocol TaskCallback{
    func onPreExecute(asyncTask: AsyncTask);
    func onPostExecute(asyncTask: AsyncTask, result: AnyObject);
}
