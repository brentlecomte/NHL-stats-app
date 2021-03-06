//
//  Endpoints.swift
//  NHL APP
//
//  Created by Brent Le Comte on 18/12/2020.
//  Copyright © 2020 Brent Le Comte. All rights reserved.
//

import Foundation

enum endPoints: String {
    case baseURL = "https://statsapi.web.nhl.com/api"
    
    case shedule = "/schedule"
    case teams = "/teams"
    
    case v1 = "/v1"
}
