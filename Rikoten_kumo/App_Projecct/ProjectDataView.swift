//
//  ProjectDataView.swift
//  Rikoten_kumo
//
//  Created by 雲下晃 on 2021/08/26.
//

import SwiftUI

struct ProjectDataView: View {
    var projectphoto: ProjectData
    let w: CGFloat = UIScreen.main.bounds.width - 20
    
    var body: some View {
        VStack {
            Image(projectphoto.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350.0, height: 200.0)
                .cornerRadius(20)
            HStack {
                Rectangle()
                    .frame(width: 5, height: 70)
                VStack{
                    HStack{
                        Text(projectphoto.projectTitle)
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    HStack{
                        Text(projectphoto.projectSubTitle)
                            .font(.system(size: 15))
                            .bold()
                            .padding(.top, 5)
                            .padding(.bottom, 15)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                Spacer()
            }
            HStack{
                Spacer()
                Text(projectphoto.groupName)
                    .font(.system(size: 15))
                    .padding(.trailing, 10)
            }
        }
        .frame(width: w,height: 200)
    }
}

struct ProjectDataView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDataView(projectphoto: projectArray[0])
    }
}
