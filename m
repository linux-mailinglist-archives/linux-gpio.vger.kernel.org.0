Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FD9416D63
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 10:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244578AbhIXII2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 04:08:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53726 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S244482AbhIXIIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 04:08:25 -0400
X-UUID: ff31e5ce6db548059cce3611c1452241-20210924
X-UUID: ff31e5ce6db548059cce3611c1452241-20210924
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 177459825; Fri, 24 Sep 2021 16:06:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 16:06:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 16:06:45 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down description
Date:   Fri, 24 Sep 2021 16:06:29 +0800
Message-ID: <20210924080632.28410-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For supporting SI units in "bias-pull-down" & "bias-pull-up",
change pull up/down description
and add "mediatek,rsel_resistance_in_si_unit" description.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86 ++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 2f12ec59eee5..5f642bef72af 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -49,6 +49,12 @@ properties:
     description: The interrupt outputs to sysirq.
     maxItems: 1
 
+  mediatek,rsel_resistance_in_si_unit:
+    type: boolean
+    description: |
+      Identifying i2c pins pull up/down type which is RSEL. It can support
+      RSEL define or si unit value(ohm) to set different resistance.
+
 #PIN CONFIGURATION NODES
 patternProperties:
   '-pins$':
@@ -85,9 +91,85 @@ patternProperties:
           2/4/6/8/10/12/14/16mA in mt8195.
         enum: [0, 1, 2, 3, 4, 5, 6, 7]
 
-      bias-pull-down: true
+      bias-pull-down:
+        description: |
+          For pull down type is normal, it don't need add RSEL & R1R0 define
+          and resistance value.
+          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
+          define in mt8195.
+          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
+          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
+          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
+          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
+          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
+          define in mt8195. It can also support resistance value(ohm) "75000" & "5000" in mt8195.
+          oneOf:
+            - enum: [100, 101, 102, 103]
+            - description: mt8195 pull down PUPD/R0/R1 type define value.
+            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+            - description: mt8195 pull down RSEL type define value.
+            - enum: [75000, 5000]
+            - description: mt8195 pull down RSEL type si unit value(ohm).
+
+          An example of using RSEL define:
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
+            };
+          };
+          An example of using si unit resistance value(ohm):
+          &pio {
+            mediatek,rsel_resistance_in_si_unit;
+          }
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-down = <75000>;
+            };
+          };
 
-      bias-pull-up: true
+      bias-pull-up:
+        description: |
+          For pull up type is normal, it don't need add RSEL & R1R0 define
+          and resistance value.
+          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
+          define in mt8195.
+          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
+          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
+          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
+          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
+          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
+          define in mt8195. It can also support resistance value(ohm)
+          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
+          oneOf:
+            - enum: [100, 101, 102, 103]
+            - description: mt8195 pull up PUPD/R0/R1 type define value.
+            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+            - description: mt8195 pull up RSEL type define value.
+            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
+            - description: mt8195 pull up RSEL type si unit value(ohm).
+          An example of using RSEL define:
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
+            };
+          };
+          An example of using si unit resistance value(ohm):
+          &pio {
+            mediatek,rsel_resistance_in_si_unit;
+          }
+          pincontroller {
+            i2c0_pin {
+              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+              bias-pull-up = <1000>;
+            };
+          };
 
       bias-disable: true
 
-- 
2.25.1

