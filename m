Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A7A573813
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236354AbiGMNzn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 09:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbiGMNzn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 09:55:43 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A845F2C677;
        Wed, 13 Jul 2022 06:55:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,267,1650898800"; 
   d="scan'208";a="126043824"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jul 2022 22:55:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 325AA43AFF6F;
        Wed, 13 Jul 2022 22:55:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG binding
Date:   Wed, 13 Jul 2022 14:55:27 +0100
Message-Id: <20220713135528.1386594-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
References: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for the RZ/G2L Port Output Enable for GPT (POEG).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
REF->v1:
 * Modelled as pincontrol as most of its configuration is intended to be
   static.
 * Updated reg size in example.
---
 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
new file mode 100644
index 000000000000..7607dd87fa68
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-poeg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Port Output Enable for GPT (POEG)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  The output pins of the general PWM timer (GPT) can be disabled by using
+  the port output enabling function for the GPT (POEG). Specifically,
+  either of the following ways can be used.
+  * Input level detection of the GTETRGA to GTETRGD pins.
+  * Output-disable request from the GPT.
+  * Register settings.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-poeg  # RZ/G2{L,LC}
+          - renesas,r9a07g054-poeg  # RZ/V2L
+      - const: renesas,rzg2l-poeg
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    poeggd: poeg@10049400 {
+        compatible = "renesas,r9a07g044-poeg", "renesas,rzg2l-poeg";
+        reg = <0x10049400 0x400>;
+        interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD R9A07G044_POEG_D_CLKP>;
+        power-domains = <&cpg>;
+        resets = <&cpg R9A07G044_POEG_D_RST>;
+    };
-- 
2.25.1

