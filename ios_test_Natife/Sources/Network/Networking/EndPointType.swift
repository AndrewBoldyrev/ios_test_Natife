//
//  EndPointType.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 17.01.2023.
//

import Foundation

protocol EndPointType {
  var baseURL: String { get }
  var path: String { get }
  var url: URL? { get }
}


