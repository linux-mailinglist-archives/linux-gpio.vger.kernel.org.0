Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532D92D6D3A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 02:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404827AbgLKBU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 20:20:57 -0500
Received: from foss.arm.com ([217.140.110.172]:49320 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404739AbgLKBUn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Dec 2020 20:20:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571F41396;
        Thu, 10 Dec 2020 17:19:58 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39CC73F66B;
        Thu, 10 Dec 2020 17:19:56 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 02/21] dt-bindings: pinctrl: Add Allwinner H616 compatible strings
Date:   Fri, 11 Dec 2020 01:19:15 +0000
Message-Id: <20201211011934.6171-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20201211011934.6171-1-andre.przywara@arm.com>
References: <20201211011934.6171-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A new SoC, a new compatible string.
Also we were too miserly with just allowing seven interrupt banks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml   | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 5240487dfe50..292b05d9ed08 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -53,6 +53,8 @@ properties:
       - allwinner,sun50i-h5-pinctrl
       - allwinner,sun50i-h6-pinctrl
       - allwinner,sun50i-h6-r-pinctrl
+      - allwinner,sun50i-h616-pinctrl
+      - allwinner,sun50i-h616-r-pinctrl
       - allwinner,suniv-f1c100s-pinctrl
       - nextthing,gr8-pinctrl
 
@@ -61,7 +63,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 7
+    maxItems: 8
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -91,7 +93,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 1
-    maxItems: 5
+    maxItems: 8
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -145,6 +147,18 @@ allOf:
   # boards are defining it at the moment so it would generate a lot of
   # warnings.
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+          maxItems: 8
+
   - if:
       properties:
         compatible:
-- 
2.17.5

