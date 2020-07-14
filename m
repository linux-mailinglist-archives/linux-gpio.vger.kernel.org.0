Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD6821E985
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 09:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGNHGm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 03:06:42 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:48606 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725778AbgGNHGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 03:06:42 -0400
X-Alimail-AntiSpam: AC=SUSPECT;BC=0.6363785|-1;BR=01201311R131b1;CH=blue;DM=|SUSPECT|false|;DS=CONTINUE|ham_system_inform|0.0262548-0.000494732-0.973251;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03294;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.I1TY-3s_1594710393;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I1TY-3s_1594710393)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 14 Jul 2020 15:06:37 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Yangtao Li <frank@allwinnertech.com>
Subject: [PATCH v4 04/16] dt-bindings: pinctrl: sunxi: Add A100 pinctrl bindings
Date:   Tue, 14 Jul 2020 15:06:23 +0800
Message-Id: <7be3efafd34cbb5938ea73dfe08f3db3e7747123.1594708864.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1594708863.git.frank@allwinnertech.com>
References: <cover.1594708863.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

Add device tree binding Documentation details for A100 pinctrl driver,
which has a r pin controller and a pin controller with more irq lines.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 35a26abb02e7..34a17d5c6135 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -48,6 +48,8 @@ properties:
       - allwinner,sun9i-a80-r-pinctrl
       - allwinner,sun50i-a64-pinctrl
       - allwinner,sun50i-a64-r-pinctrl
+      - allwinner,sun50i-a100-pinctrl
+      - allwinner,sun50i-a100-r-pinctrl
       - allwinner,sun50i-h5-pinctrl
       - allwinner,sun50i-h6-pinctrl
       - allwinner,sun50i-h6-r-pinctrl
@@ -143,6 +145,18 @@ allOf:
   # boards are defining it at the moment so it would generate a lot of
   # warnings.
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-a100-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 7
+          maxItems: 7
+
   - if:
       properties:
         compatible:
@@ -216,6 +230,7 @@ allOf:
             - allwinner,sun8i-h3-r-pinctrl
             - allwinner,sun8i-r40-pinctrl
             - allwinner,sun50i-a64-r-pinctrl
+            - allwinner,sun50i-a100-r-pinctrl
             - nextthing,gr8-pinctrl
 
     then:
-- 
2.24.0

