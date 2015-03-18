//
//  AgendaObject.swift
//  BioInfo Conf App
//
//  Created by John on 3/10/15.
//  Copyright (c) 2015 John. All rights reserved.
//

import UIKit

class AgendaObject: NSObject {
    var name: String
    var date: String
    var time: String
    var eventDescription: String
    
    init(name: String, date:String, time: String, eventDescription: String) {
        self.name = name
        self.time = time
        self.date = date
        self.eventDescription = eventDescription
        super.init()
    }
    
   
}


// set up catch:
// if url == nil, use default:
    // format: Name, time, description, (Create group for morningSession afternoonSession etc.),
    // abstract.  use NSString for each, possibly Int for NSDate for time.

let sessionListFirstDay = [
    AgendaObject(name: "Welcome Session", date: "April 17", time: "1:00pm-1:20pm", eventDescription: "Greetings and Opening Remarks"),
    AgendaObject(name: "First Invited Speaker", date: "April 17", time: "1:20pm-2:00pm", eventDescription: ""),
    AgendaObject(name: "Session One", date: "April 17", time: "2:00pm-3:15pm", eventDescription: "Three Session Speakers, 20 minutes each"),
    AgendaObject(name: "Break", date: "April 17", time: "3:15pm-3:30", eventDescription: ""),
    AgendaObject(name: "Session Two", date: "April 17", time: "3:30pm-4:45pm", eventDescription: "Three Session Speakers, 20 minutes each"),
    AgendaObject(name: "Session Three", date: "April 17", time: "4:45pm-6:00pm", eventDescription: "Three Session Speakers, 20 minutes each"),
    AgendaObject(name: "Second Invited Speaker", date: "April 17", time: "6:00pm-6:40pm", eventDescription: ""),
    ]
let sessionListSecondDay = [
    AgendaObject(name: "Third Invited Speaker", date: "April 18", time: "8:00am-8:40am", eventDescription: ""),
    AgendaObject(name: "Session Four", date: "April 18", time: "8:40am-9:55am", eventDescription: "Three Session Speakers, 20 minutes each"),
    AgendaObject(name: "Break", date: "April 18", time: "9:55am-10:10am", eventDescription: ""),
    AgendaObject(name: "Session Five", date: "April 18", time: "10:10am-11:25am", eventDescription: "Three Session Speakers, 20 minutes each"),
    AgendaObject(name: "Posters and Lunch", date: "April 18", time: "11:25am-1:00pm", eventDescription: "Poster sessions during lunch"),
    AgendaObject(name: "Fourth Invited Speaker", date: "April 18", time: "1:00pm-1:40pm", eventDescription: ""),
    AgendaObject(name: "Session Six", date: "April 18", time: "1:40pm-2:55pm", eventDescription: "Three Session Speakers, 20 minutes each"),
    AgendaObject(name: "Break", date: "April 18", time: "3:10pm-4:25pm", eventDescription: ""),
    AgendaObject(name: "Session Seven", date: "April 18", time: "1:40pm-2:55pm", eventDescription: "Three Session Speakers, 20 minutes each"),
        ]
var conferenceSessionsDayOne: [AgendaObject] = sessionListFirstDay
var conferenceSessionsDayTwo: [AgendaObject] = sessionListSecondDay


let conferenceSpeaker = [
    AgendaObject(name: "Dr. Anton Nekrutenko", date: "", time: "", eventDescription: "Comparative Genome Analysis")
]

var conferenceSpeakers: [AgendaObject] = conferenceSpeaker


