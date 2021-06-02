//
//  ComplicationView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Palloma Ramos on 02/06/21.
//

import SwiftUI
import ClockKit

struct ComplicationView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct ComplicationViewCircular: View {
  // 2
  @State var appointment: Appointment

  var body: some View {
    // 3
    ZStack {
      ProgressView(
        "\(appointment.rationalizedTimeUntil())",
        value: (1.0 - appointment.rationalizedFractionCompleted()),
        total: 1.0)
        .progressViewStyle(
          CircularProgressViewStyle(tint: appointment.tag.color.color))
    }
  }
}

struct ComplicationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          // 2
          CLKComplicationTemplateGraphicCircularView(
            ComplicationViewCircular(
              appointment: Appointment.oneDummy(offset: Appointment.oneHour * 0.5)
            )
          // 3
          ).previewContext()
        }
    }
}
