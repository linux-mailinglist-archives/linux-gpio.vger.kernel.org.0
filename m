Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA7640A9E7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 10:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhINIy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 04:54:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51608 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231424AbhINIyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 04:54:12 -0400
X-UUID: 90fac02ad2f1464395a44bff841428b5-20210914
X-UUID: 90fac02ad2f1464395a44bff841428b5-20210914
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1008755453; Tue, 14 Sep 2021 16:52:51 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 16:52:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 14 Sep
 2021 16:52:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 16:52:50 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        "Sam Shih" <sam.shih@mediatek.com>
Subject: [RESEND,v2,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Date:   Tue, 14 Sep 2021 16:51:35 +0800
Message-ID: <20210914085137.31761-8-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914085137.31761-1-sam.shih@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

MT7986 is Mediatek's new 4-core SoC, which is mainly for wifi-router
application. The difference between mt7986a and mt7986b is that some
pins do not exist on mt7986b.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>

---
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

