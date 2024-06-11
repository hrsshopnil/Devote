//
//  NewTaskItemView.swift
//  Devote-Final
//
//  Created by shopnil hasan on 9/6/24.
//

import SwiftUI
import SwiftData

struct NewTaskItemView: View {
    @Environment(\.modelContext) private var context
    @State private var task = ""
    @Binding var isShowing: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundStyle(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                Button {
                    let newTask = Tasks(task: task)
                    context.insert(newTask)
                    isShowing = false
                } label: {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                }
                .disabled(task.isEmpty)
                .padding()
                .font(.headline)
                .foregroundStyle(.white)
                .background(task.isEmpty ? Color.gray : Color.pink)
                .cornerRadius(10)

            }//: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color("sheetColor"))
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.65), radius: 24)
            .frame(maxWidth: 640)
        }//: VSTACK
        .padding()
    }
}

#Preview {
    NewTaskItemView(isShowing: .constant(true))
}
