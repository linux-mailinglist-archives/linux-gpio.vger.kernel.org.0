Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4B5417106
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 13:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343544AbhIXLme (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 07:42:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43376 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S244321AbhIXLmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 07:42:32 -0400
X-UUID: 7962f5f4ad3e4869b5981a4d187a8b80-20210924
X-UUID: 7962f5f4ad3e4869b5981a4d187a8b80-20210924
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 720220876; Fri, 24 Sep 2021 19:40:55 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 19:40:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 19:40:54 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     <matthias.bgg@gmail.com>
CC:     <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
        <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
        <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
        <hsinyi@chromium.org>, <john@phrozen.org>,
        <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux@roeck-us.net>, <mpm@selenic.com>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <sam.shih@mediatek.com>, <sboyd@kernel.org>,
        <sean.wang@kernel.org>, <seiya.wang@mediatek.com>,
        <wim@linux-watchdog.org>
Subject: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Date:   Fri, 24 Sep 2021 19:40:46 +0800
Message-ID: <20210924114046.26070-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

MT7986 series is Mediatek's new 4-core SoC, which is mainly for
wifi-router application. The difference between mt7986a and mt7986b
is that some pins do not exist on mt7986b.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>

---
v3: changed 'MT7986' to 'MT7986 series' in the commit message
v2: added an Acked-by tag
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 80a05f6fee85..a9a778269684 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -76,6 +76,14 @@ properties:
           - enum:
               - mediatek,mt7629-rfb
           - const: mediatek,mt7629
+      - items:
+          - enum:
+              - mediatek,mt7986a-rfb
+          - const: mediatek,mt7986a
+      - items:
+          - enum:
+              - mediatek,mt7986b-rfb
+          - const: mediatek,mt7986b
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.29.2

