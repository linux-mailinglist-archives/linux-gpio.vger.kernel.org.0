Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7122BE85
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 09:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgGXHBT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 03:01:19 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:59914 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726503AbgGXHBT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Jul 2020 03:01:19 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.8966789|0.1167637;BR=01201311R511ec;CH=green;DM=|AD|false|;DS=SPAM|spam_other|0.913775-0.00286365-0.0833614;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03298;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.I6q5Ffb_1595574068;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I6q5Ffb_1595574068)
          by smtp.aliyun-inc.com(10.147.41.178);
          Fri, 24 Jul 2020 15:01:13 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Yangtao Li <frank@allwinnertech.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 03/16] dt-bindings: pinctrl: sunxi: Get rid of continual nesting
Date:   Fri, 24 Jul 2020 15:00:31 +0800
Message-Id: <229e4870dab1b34797304c384e68c7d04196423b.1595572867.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1595572867.git.frank@allwinnertech.com>
References: <cover.1595572867.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

Rather than a continual nesting of 'else' clauses, just make
each 'if' a new entry under 'allOf' and get rid of the else.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 124 ++++++++++--------
 1 file changed, 68 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 7556be6e2754..35a26abb02e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -155,62 +155,74 @@ allOf:
           minItems: 5
           maxItems: 5
 
-    else:
-      if:
-        properties:
-          compatible:
-            enum:
-              - allwinner,sun6i-a31-pinctrl
-              - allwinner,sun6i-a31s-pinctrl
-              - allwinner,sun50i-h6-pinctrl
-
-      then:
-        properties:
-          interrupts:
-            minItems: 4
-            maxItems: 4
-
-      else:
-        if:
-          properties:
-            compatible:
-              enum:
-                - allwinner,sun8i-a23-pinctrl
-                - allwinner,sun8i-a83t-pinctrl
-                - allwinner,sun50i-a64-pinctrl
-                - allwinner,sun50i-h5-pinctrl
-                - allwinner,suniv-f1c100s-pinctrl
-
-        then:
-          properties:
-            interrupts:
-              minItems: 3
-              maxItems: 3
-
-        else:
-          if:
-            properties:
-              compatible:
-                enum:
-                  - allwinner,sun6i-a31-r-pinctrl
-                  - allwinner,sun8i-a33-pinctrl
-                  - allwinner,sun8i-h3-pinctrl
-                  - allwinner,sun8i-v3-pinctrl
-                  - allwinner,sun8i-v3s-pinctrl
-                  - allwinner,sun9i-a80-r-pinctrl
-                  - allwinner,sun50i-h6-r-pinctrl
-
-          then:
-            properties:
-              interrupts:
-                minItems: 2
-                maxItems: 2
-
-          else:
-            properties:
-              interrupts:
-                minItems: 1
-                maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun6i-a31-pinctrl
+            - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun50i-h6-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+          maxItems: 4
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun8i-a23-pinctrl
+            - allwinner,sun8i-a83t-pinctrl
+            - allwinner,sun50i-a64-pinctrl
+            - allwinner,sun50i-h5-pinctrl
+            - allwinner,suniv-f1c100s-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun6i-a31-r-pinctrl
+            - allwinner,sun8i-a33-pinctrl
+            - allwinner,sun8i-h3-pinctrl
+            - allwinner,sun8i-v3-pinctrl
+            - allwinner,sun8i-v3s-pinctrl
+            - allwinner,sun9i-a80-r-pinctrl
+            - allwinner,sun50i-h6-r-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun4i-a10-pinctrl
+            - allwinner,sun5i-a10s-pinctrl
+            - allwinner,sun5i-a13-pinctrl
+            - allwinner,sun7i-a20-pinctrl
+            - allwinner,sun8i-a23-r-pinctrl
+            - allwinner,sun8i-a83t-r-pinctrl
+            - allwinner,sun8i-h3-r-pinctrl
+            - allwinner,sun8i-r40-pinctrl
+            - allwinner,sun50i-a64-r-pinctrl
+            - nextthing,gr8-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
 
 additionalProperties: false
 
-- 
2.24.0

