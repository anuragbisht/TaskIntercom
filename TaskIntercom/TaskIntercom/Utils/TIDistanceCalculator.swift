//
//  DistanceCalculator.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/8/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

/*
 FORMULAE =>
 λ1 = longitude of location1 in radians
 ϕ1 = latitude  of location1 in radians
 λ2 = longitude of location2 in radius
 ϕ2 = latitude of location2 in radius
 
 Δλ = |λ1-λ2|   (absolute val)
 Δϕ = |ϕ1-ϕ2|  (absolute val)
 Δσ = the central angle between the locations, which is callccuulated by the spherical law of cosines if one of the poles is used as an auxiliary third point on the sphere (in radians)
            Δσ = arccos⁡ ( sinϕ1 sinϕ2 + cosϕ1 cosϕ2 cos(Δλ))
 The actual arc length d on a sphere of radius r can be trivially computed as
            d = rΔσ
 
 */

import Foundation
import CoreLocation


class TIDistanceCalculator {
  
  var λ1:Double = 0.0;
  var ϕ1:Double = 0.0;
  
  var λ2:Double = 0.0;
  var ϕ2:Double = 0.0;
  
  var Δλ:Double = 0.0;
  var Δσ:Double = 0.0;
  
  var d:Double = 0.0;
  var r:Double = 6371.0;
  
  var endPoint:Array<Double> = [53.339428, -6.257664];
  var startPoint:Array<Double> = []{
    didSet{
      //set λ1 and ϕ1 in radians
      λ1 = convertDegreeToRadian(degree: startPoint[0]);
      ϕ1 = convertDegreeToRadian(degree: startPoint[1]);
      Δλ = getAbsoluteDifference(val1: λ1, val2: λ2);
    }
  }
 
  init() {
    λ2 = convertDegreeToRadian(degree: 53.339428);
    ϕ2 = convertDegreeToRadian(degree: -6.257664);
    endPoint = [53.339428, -6.257664];
  }
  
 
  //convert degrees to radians
  func convertDegreeToRadian(degree: Double)-> Double{
    let radian  = degree * Double.pi / 180;
    return radian;
  }
  //get absolute difference
  func getAbsoluteDifference(val1:Double, val2:Double)-> Double{
    return abs(val1-val2);
  }
  //get distance between two locations
  func calculateDistance()->Double{
    λ2 = convertDegreeToRadian(degree: 53.339428);
    ϕ2 = convertDegreeToRadian(degree: -6.257664);
    Δσ = acos((sin(ϕ1) * sin(ϕ2))+(cos(ϕ1)*cos(ϕ2)*cos(Δλ)));
    d = r * Δσ;
    return d;
  }
}

