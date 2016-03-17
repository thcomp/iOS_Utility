//
//  RandomTextSupplier.swift
//
//  Created by thcomp on 2015/11/23.
//  Copyright © 2015年 thcomp. All rights reserved.
//

import Foundation

private protocol RandomCharProvider{
    func getRandomCharacter()->Character;
}

public class RandomTextSupplier{
    public static func getRandomText(length: Int, availableCharType: Int)->String{
        var ret: String = String();
        var providerArray: [RandomCharProvider] = [];
        
        if availableCharType & AvaliableCharSmallLetter == AvaliableCharSmallLetter{
            providerArray.append(SmallLetterProvider());
        }
        if availableCharType & AvaliableCharCapitalLetter == AvaliableCharCapitalLetter{
            providerArray.append(CapitalLetterProvider());
        }
        if availableCharType & AvaliableCharNumber == AvaliableCharNumber{
            providerArray.append(NumberProvider());
        }
        if availableCharType & AvaliableCharSymbol == AvaliableCharSymbol{
            providerArray.append(SymbolProvider());
        }
        
        let arrayCount = providerArray.count;
        for var i:Int=0; i<length; i++ {
            var randomValue: Int = 0;
            arc4random_buf(&randomValue, sizeof(Int));
            if randomValue < 0 {
                randomValue *= -1;
            }
            ret.append(providerArray[randomValue % arrayCount].getRandomCharacter());
        }
        
        return ret;
    }
    
    public static let AvaliableCharSmallLetter = 1;
    public static let AvaliableCharCapitalLetter = 2;
    public static let AvaliableCharNumber = 4;
    public static let AvaliableCharSymbol = 8;
    
    private struct SmallLetterProvider:RandomCharProvider{
        func getRandomCharacter()->Character{
            var tempRet: UInt8 = 0;
            arc4random_buf(&tempRet, sizeof(UInt8));
            return Character(UnicodeScalar(tempRet % 26 + 0x61));
        }
    }
    
    private struct CapitalLetterProvider:RandomCharProvider{
        func getRandomCharacter()->Character{
            var tempRet: UInt8 = 0;
            arc4random_buf(&tempRet, sizeof(UInt8));
            return Character(UnicodeScalar(tempRet % 26 + 0x41));
        }
    }
    
    private struct NumberProvider:RandomCharProvider{
        func getRandomCharacter()->Character{
            var tempRet: UInt8 = 0;
            arc4random_buf(&tempRet, sizeof(UInt8));
            return Character(UnicodeScalar(tempRet % 10 + 0x30));
        }
    }
    
    private struct SymbolProvider:RandomCharProvider{
        func getRandomCharacter()->Character{
            var tempRet: Int = 0;
            arc4random_buf(&tempRet, sizeof(Int));
            if tempRet < 0 {
                tempRet *= -1;
            }
            return SymbolCharacterArray[tempRet % SymbolCharacterArray.count];
        }
    }
    
    private static let SymbolCharacterArray: [Character] = [
        "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "¥", "]", "^", "_", "`", "{", "|", "}", "~"
    ];
}