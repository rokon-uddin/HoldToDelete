//
//  HoldButton.swift
//  HoldToDelete
//
//  Created by Mohammed Rokon Uddin on 7/18/24.
//

import SwiftUI

struct HoldButton: View {
  let startTitle: String
  let endTitle: String
  let constants = Constants.self
  @State var isComplete = false
  @State var isSuccess = false
  @Binding var trimEnd: CGFloat

  var body: some View {
    VStack {
      ZStack {
        ZStack(alignment: .leading) {
          Rectangle()
            .foregroundColor(.red.opacity(0.5))
          Rectangle()
            .frame(maxWidth: isComplete ? .infinity : 0)
            .foregroundStyle(isSuccess ? .BG : .red)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .clipShape(.rect(cornerRadius: 16))
        .padding(.horizontal, 8)
          Text(isSuccess ? constants.accountDelete : constants.holdToDelete)
          .bold()
          .foregroundStyle(.white)
      }
      .onLongPressGesture(minimumDuration: 2, maximumDistance: 50) {
        isPressing in
        if isPressing {
          withAnimation(.linear(duration: 2)) {
            isComplete = true
            trimEnd = 1
          }
        } else {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if !isSuccess {
              withAnimation {
                isComplete = false
                trimEnd = 0
              }
            }
          }
        }
      } perform: {
        withAnimation {
          isSuccess = true
          trimEnd = 1
        }
      }
    }
  }
}
