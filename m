Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B872AEC18
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgKKIeF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:34:05 -0500
Received: from mo-csw-fb1516.securemx.jp ([210.130.202.172]:41870 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgKKIeE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:34:04 -0500
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 0AB8RKkE029488; Wed, 11 Nov 2020 17:27:20 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0AB8R4d4028947; Wed, 11 Nov 2020 17:27:04 +0900
X-Iguazu-Qid: 34tru22Sm28wWYIhgO
X-Iguazu-QSIG: v=2; s=0; t=1605083224; q=34tru22Sm28wWYIhgO; m=aeEbFW/VjOoxOWHY2UeFS7I+hvaA/8Ym7LB/V4U4feM=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 0AB8R3iU020951;
        Wed, 11 Nov 2020 17:27:03 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0AB8R3Mr006953;
        Wed, 11 Nov 2020 17:27:03 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0AB8R2wE032436;
        Wed, 11 Nov 2020 17:27:02 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 1/4] dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
Date:   Thu, 12 Nov 2020 02:25:50 +0900
X-TSB-HOP: ON
Message-Id: <20201111172553.1369282-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the Toshiba Visconti GPIO Controller.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml

diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
new file mode 100644
index 000000000000..49356b9b6284
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/toshiba,gpio-visconti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti ARM SoCs GPIO controller
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,gpio-tmpv7708
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: truei
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    description:
+      interrupt mapping one per GPIO.
+    minItems: 32
+    maxItems: 32
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-ranges
+  - gpio-controller
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/interrupt-controller/irq.h>
+      #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+      soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gpio: gpio@28020000 {
+          compatible = "toshiba,gpio-tmpv7708";
+          reg = <0 0x28020000 0 0x1000>;
+          #gpio-cells = <0x2>;
+          gpio-ranges = <&pmux 0 0 32>;
+          gpio-controller;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+...
-- 
2.29.2

