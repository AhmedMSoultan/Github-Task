//
//  Bundle+unitTest.swift
//  Github-TaskTests
//
//  Created by Ahmed Soultan on 15/04/2022.
//

import Foundation

extension Bundle {
    public class var unitTest:Bundle{
        return Bundle(for: GithubServiceTest.self)
    }
}
