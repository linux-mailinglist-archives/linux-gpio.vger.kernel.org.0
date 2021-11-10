Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F7344CD3A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbhKJXBK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 18:01:10 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15510 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233848AbhKJXBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 18:01:10 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143741"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:58:21 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 650834006CC7;
        Thu, 11 Nov 2021 07:58:18 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v3 1/7] dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt Controller
Date:   Wed, 10 Nov 2021 22:58:02 +0000
Message-Id: <20211110225808.16388-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add DT bindings for the Renesas RZ/G2L Interrupt Controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../renesas,rzg2l-irqc.yaml                   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
new file mode 100644
index 000000000000..ebe318fe336b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Interrupt Controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  The RZ/G2L Interrupt Controller is a front-end for the GIC found on Renesas RZ/G2L SoC's
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
+          - renesas,r9a07g044-irqc # RZ/G2L
+      - const: renesas,rzg2l-irqc
+
+  '#interrupt-cells':
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
+  interrupt-map:
+    maxItems: 41
+    description: Specifies the mapping from external interrupts to GIC interrupts.
+
+  interrupt-map-mask:
+    items:
+      - const: 40
+      - const: 0
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
+  - interrupt-map
+  - interrupt-map-mask
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    irqc: interrupt-controller@110a0000 {
+            compatible = "renesas,r9a07g044-irqc", "renesas,rzg2l-irqc";
+            #interrupt-cells = <2>;
+            #address-cells = <0>;
+            interrupt-controller;
+            reg = <0x110a0000 0x10000>;
+            interrupt-map = <0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                            <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                            <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+                            <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+                            <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+                            <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+                            <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                            <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+                            <8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                            <9 0 &gic GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+                            <10 0 &gic GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+                            <11 0 &gic GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+                            <12 0 &gic GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+                            <13 0 &gic GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                            <14 0 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+                            <15 0 &gic GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+                            <16 0 &gic GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+                            <17 0 &gic GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+                            <18 0 &gic GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+                            <19 0 &gic GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+                            <20 0 &gic GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+                            <21 0 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+                            <22 0 &gic GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+                            <23 0 &gic GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+                            <24 0 &gic GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+                            <25 0 &gic GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+                            <26 0 &gic GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+                            <27 0 &gic GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+                            <28 0 &gic GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+                            <29 0 &gic GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                            <30 0 &gic GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                            <31 0 &gic GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                            <32 0 &gic GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                            <33 0 &gic GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                            <34 0 &gic GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+                            <35 0 &gic GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
+                            <36 0 &gic GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
+                            <37 0 &gic GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
+                            <38 0 &gic GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+                            <39 0 &gic GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
+                            <40 0 &gic GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+                        interrupt-map-mask = <40 0>;
+                        clocks = <&cpg CPG_MOD R9A07G044_IA55_CLK>,
+                                 <&cpg CPG_MOD R9A07G044_IA55_PCLK>;
+                        clock-names = "clk", "pclk";
+                        power-domains = <&cpg>;
+                        resets = <&cpg R9A07G044_IA55_RESETN>;
+    };
-- 
2.17.1

