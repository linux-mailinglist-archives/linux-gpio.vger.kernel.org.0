Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40553DF41E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 19:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238410AbhHCRvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 13:51:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:40647 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238316AbhHCRvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 13:51:38 -0400
X-IronPort-AV: E=Sophos;i="5.84,292,1620658800"; 
   d="scan'208";a="89707988"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Aug 2021 02:51:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 27E0240BF58E;
        Wed,  4 Aug 2021 02:51:23 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/4] dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt Controller
Date:   Tue,  3 Aug 2021 18:51:06 +0100
Message-Id: <20210803175109.1729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add DT bindings for the Renesas RZ/G2L Interrupt Controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../renesas,rzg2l-irqc.yaml                   | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
new file mode 100644
index 000000000000..66d6a0ebe128
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -0,0 +1,129 @@
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
+    - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts,
+    - GPIO pins used as external interrupt input pins, mapped to 32 GIC SPI interrupts,
+    - NMI edge select.
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
+  interrupts:
+    description: Specifies the GIC interrupts.
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
+                        clocks = <&cpg CPG_MOD R9A07G044_IA55_CLK>,
+                                 <&cpg CPG_MOD R9A07G044_IA55_PCLK>;
+                        clock-names = "clk", "pclk";
+                        power-domains = <&cpg>;
+                        resets = <&cpg R9A07G044_IA55_RESETN>;
+    };
-- 
2.17.1

