//
//  DeleteCard.swift
//  HoldToDelete
//
//  Created by Mohammed Rokon Uddin on 7/18/24.
//

import SwiftUI

struct DeleteCard: View {
  let icon: String
  let title: String
  let details: String
  let startTitle: String
  let endTitle: String
  let constants = Constants.self
  @Binding var show: Bool
  @State var trimEnd: CGFloat = 0.0

  var body: some View {
    VStack {
      VStack {
        Image(systemName: icon)
          .font(.system(size: 70))
          .foregroundStyle(.white)

        VStack(spacing: 16) {
          Text(title)
            .font(.title2.bold())
          Text(details)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .foregroundColor(.secondary)
        }
        HoldButton(
          startTitle: startTitle, endTitle: endTitle, trimEnd: $trimEnd)
      }
      .padding(.horizontal)
      .frame(width: 350, height: 316)
      .background(.BG, in: .rect(cornerRadius: 30))
      .overlay {
        ReclineLine(trimEnd: $trimEnd)
      }
      Button(
        action: {
          show = false
        },
        label: {
          Text(constants.Cancel)
            .font(.title2)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(.BG, in: .rect(cornerRadius: 16))
            .padding(.horizontal, 22)
        }
      )
      .tint(.white)
    }
  }
}
