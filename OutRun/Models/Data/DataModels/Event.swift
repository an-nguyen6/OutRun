//
//  Event.swift
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

import Foundation

typealias Event = OutRunV4.Event

extension Event: CustomStringConvertible {
    
    var description: String {
        
        var desc = "WorkoutEvent("
        
        if let uuid = uuid {
            desc += "uuid: \(uuid), "
        }
        
        return desc + "title: \(title))"
    }
    
}

// MARK: OREventInterface

extension Event: OREventInterface {
    
    var uuid: UUID? { threadSafeSyncReturn { self._uuid.value } }
    var title: String { threadSafeSyncReturn { self._title.value } }
    var comment: String? { threadSafeSyncReturn { self._comment.value } }
    var startDate: Date? { threadSafeSyncReturn { self._startDate.value } }
    var endDate: Date? { threadSafeSyncReturn { self._endDate.value } }
    var workouts: [ORWorkoutInterface] { self._workouts.value }
    
}

// MARK: TempValueConvertible

extension Event: TempValueConvertible {
    
    var asTemp: TempEvent {
        TempEvent(
            uuid: uuid,
            title: title,
            comment: comment,
            startDate: startDate,
            endDate: endDate,
            workouts: workouts.compactMap { $0.uuid }
        )
    }
    
}
