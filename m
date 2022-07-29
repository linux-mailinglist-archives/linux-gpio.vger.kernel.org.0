Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7453658500F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 14:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbiG2MZB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 08:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiG2MZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 08:25:00 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C184C61D84;
        Fri, 29 Jul 2022 05:24:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,201,1654527600"; 
   d="scan'208";a="129599622"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Jul 2022 21:24:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.113])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 33BB6432835B;
        Fri, 29 Jul 2022 21:24:54 +0900 (JST)
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
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG binding
Date:   Fri, 29 Jul 2022 13:24:47 +0100
Message-Id: <20220729122448.498690-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
References: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for the RZ/G2L Port Output Enable for GPT (POEG).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated the description.
REF->v1:
 * Modelled as pincontrol as most of its configuration is intended to be
   static.
 * Updated reg size in example.
---
 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
new file mode 100644
index 000000000000..decd87aa7b56
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
@@ -0,0 +1,68 @@
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
+  The output pins(GTIOCxA and GTIOCxB) of the general PWM timer (GPT) can be
+  disabled by using the port output enabling function for the GPT (POEG).
+  Specifically, either of the following ways can be used.
+  * Input level detection of the GTETRGA to GTETRGD pins.
+  * Output-disable request from the GPT.
+  * SSF bit setting(ie, by setting POEGGn.SSF to 1)
+
+  The state of the GTIOCxA and the GTIOCxB pins when the output is disabled,
+  are controlled by the GPT module.
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

