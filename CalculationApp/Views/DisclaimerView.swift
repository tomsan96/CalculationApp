//
//  DisclaimerView.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/24.
//

import SwiftUI
import WebKit

struct DisclaimerHTMLView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}

struct DisclaimerView: View {
    var body: some View {
        VStack {
            DisclaimerHTMLView(htmlString:
        """
        <html lang="ja">
          <head>
            <style>
              h1 {
                font-weight: bold;
                font-size: 60px;
              }

              p {
                font-size: 40px;
              }
            </style>
          </head>
          <body>
            <h1>免責事項</h1>
            <p>・当アプリは、利用者に資産運用に関するシミュレーションを提供することを目的として作成されたものであり、投資判断の根拠として使用することを保証するものではありません。</p>
            <p>・シミュレーション結果は概算値であり、手数料、税金等は考慮しておりません。そのため実際の運用結果と異なる可能性があります。<p>
            <p>・特定の金融商品の取引を推奨し、勧誘するものではありません。<p>
            <p>・シミュレーション内容については、今後予告なく変更される場合があります。<p>
            <p>・当アプリを利用することで得られた結果に関して、当方は一切の責任を負いません。また、当アプリにおいて提供される情報について、その正確性、有用性、適時性、信頼性についても一切保証いたしません。</p>
            <p>・投資に関する決定は、利用者の判断によって行われるものであり、投資により生じる損害やトラブルに関しては、利用者が全ての責任を負うものとします。</p>
          </body>
        </html>
        """)
        }
        .padding()
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
