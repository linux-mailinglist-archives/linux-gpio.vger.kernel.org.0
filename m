Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449DC52C37F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 21:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241949AbiERTaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 15:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241821AbiERT35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 15:29:57 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BEB80BDA13;
        Wed, 18 May 2022 12:29:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,235,1647270000"; 
   d="scan'208";a="120092069"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2022 04:29:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 991B44004CF5;
        Thu, 19 May 2022 04:29:45 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/7] dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt Controller
Date:   Wed, 18 May 2022 20:29:18 +0100
Message-Id: <20220518192924.20948-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220518192924.20948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220518192924.20948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add DT bindings for the Renesas RZ/G2L Interrupt Controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../renesas,rzg2l-irqc.yaml                   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
new file mode 100644
index 000000000000..ffbb4ab4d9a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L (and alike SoC's) Interrupt Controller (IA55)
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  IA55 performs various interrupt controls including synchronization for the external
+  interrupts of NMI, IRQ, and GPIOINT and the interrupts of the built-in peripheral
+  interrupts output by each IP. And it notifies the interrupt to the GIC
+    - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
+    - GPIO pins used as external interrupt input pins, mapped to 32 GIC SPI interrupts
+    - NMI edge select (NMI is not treated as NMI exception and supports fall edge and
+      stand-up edge detection interrupts)
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-irqc    # RZ/G2L
+      - const: renesas,rzg2l-irqc
+
+  '#interrupt-cells':
+    description: The first cell should contain external interrupt number (IRQ0-7) and the
+                 second cell is used to specify the flag.
+    const: 2
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 41
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: clk
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - '#address-cells'
+  - interrupt-controller
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    irqc: interrupt-controller@110a0000 {
+            compatible = "renesas,r9a07g044-irqc", "renesas,rzg2l-irqc";
+            reg = <0x110a0000 0x10000>;
+            #interrupt-cells = <2>;
+            #address-cells = <0>;
+            interrupt-controller;
+            interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD R9A07G044_IA55_CLK>,
+                     <&cpg CPG_MOD R9A07G044_IA55_PCLK>;
+            clock-names = "clk", "pclk";
+            power-domains = <&cpg>;
+            resets = <&cpg R9A07G044_IA55_RESETN>;
+    };
-- 
2.25.1

