//
//  ReclineLine.swift
//  HoldToDelete
//
//  Created by Mohammed Rokon Uddin on 7/18/24.
//

import SwiftUI

struct ReclineLine: View {
  @Binding var trimEnd: CGFloat

  var body: some View {
    RoundedRectangle(cornerRadius: 30)
      .trim(from: 0.5 - trimEnd / 2, to: 0.5 + trimEnd / 2)
      .stroke(lineWidth: /*@START_MENU_TOKEN@*/ 1.0 /*@END_MENU_TOKEN@*/)
      .frame(width: 313, height: 347)
      .foregroundColor(.red)
      .rotationEffect(.degrees(90))
  }
}
