//
//  ContentView.swift
//  HoldToDelete
//
//  Created by Mohammed Rokon Uddin on 7/17/24.
//

import SwiftUI

struct ContentView: View {

  @State var show = false
    let constants = Constants.self
  var body: some View {
    ZStack {
      Button(
        action: {
          withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
            show.toggle()
          }
        },
        label: {
            Text(constants.showCard)
        })

      DeleteCard(
        icon: constants.icon,
        title: constants.title,
        details:
            constants.detail,
        startTitle: constants.startTitle,
        endTitle: constants.endTitle,
        show: $show
      )
      .frame(maxHeight: .infinity, alignment: .bottom)
      .offset(y: show ? -20 : 500)
    }
  }
}

#Preview {
  ContentView()
}
