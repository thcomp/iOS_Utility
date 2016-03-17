//
//  HttpStatusCode.swift
//
//  Created by thcomp on 2016/03/13.
//  Copyright © 2016年 thcomp. All rights reserved.
//

import Foundation

public class HttpStatusCode{
    public static let Continue = 100;
    public static let SwitchingProtocols = 101;
    public static let Processing = 102;
    
    public static let OK = 200;
    public static let Created = 201;
    public static let Accepted = 202;
    public static let NonAuthoritativeInformation = 203;
    public static let NoContent = 204;
    public static let ResetContent = 205;
    public static let PartialContent = 206;
    public static let MultiStatus = 207;
    public static let AlreadyReported = 208;
    public static let IMUsed = 226;
    
    public static let MultipleChoices = 300;
    public static let MovedPermanently = 301;
    public static let Found = 302;
    public static let SeeOther = 303;
    public static let NotModified = 304;
    public static let UseProxy = 305;
    public static let TemporaryRedirect = 307;
    public static let PermanentRedirect = 308;
    
    public static let BadRequest = 400;
    public static let Unauthorized = 401;
    public static let PaymentRequired = 402;
    public static let Forbidden = 403;
    public static let NotFound = 404;
    public static let MethodNotAllowed = 405;
    public static let NotAcceptable = 406;
    public static let ProxyAuthenticationRequired = 407;
    public static let RequestTimeout = 408;
    public static let Conflict = 409;
    public static let Gone = 410;
    public static let LengthRequired = 411;
    public static let PreconditionFailed = 412;
    public static let PayloadTooLarge = 413;
    public static let URITooLong = 414;
    public static let UnsupportedMediaType = 415;
    public static let RangeNotSatisfiable = 416;
    public static let ExpectationFailed = 417;
    public static let ImATeapot = 418;
    public static let UnprocessableEntity = 422;
    public static let Locked = 423;
    public static let FailedDependency = 424;
    public static let UpgradeRequired = 426;
    public static let UnavailableForLegalReasons = 451;
    
    public static let InternalServerError = 500;
    public static let NotImplemented = 501;
    public static let BadGateway = 502;
    public static let ServiceUnavailable = 503;
    public static let GatewayTimeout = 504;
    public static let HTTPVersionNotSupported = 505;
    public static let VariantAlsoNegotiates = 506;
    public static let InsufficientStorage = 507;
    public static let BandwidthLimitExceeded = 509;
    public static let NotExtended = 510;
}
