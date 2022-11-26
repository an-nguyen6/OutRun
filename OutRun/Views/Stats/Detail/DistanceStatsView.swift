//
//  DistanceStatsView.swift
//
//  OutRun
//  Copyright (C) 2020 Tim Fraedrich <timfraedrich@icloud.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import UIKit
import Charts

class DistanceStatsView: StatsView {
    
    init(stats: WorkoutStats) {
        
        var statViews = [StatView]()
        
        let distanceView = LabelledDataView(title: LS["Workout.Distance"])
        statViews.append(distanceView)
        
        if stats.hasSteps {
            let stepsView = LabelledDataView(title: stats.workoutType == .cycling ? LS["Workout.Strokes"] : LS["Workout.Steps"])
            statViews.append(stepsView)
        }
        
        if stats.hasRouteSamples {
            let ascendingView = LabelledDataView(title: LS["WorkoutStats.AscendingAltitude"])
            let descendingView = LabelledDataView(title: LS["WorkoutStats.DescendingAltitude"])
            let altitudeChart = LabelledDiagramView(title: LS["WorkoutStats.AltitudeOverTime"])
            statViews.append(contentsOf: [ascendingView, descendingView, altitudeChart])
        }
        
        super.init(title: LS["Workout.Distance"], statViews: statViews)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
