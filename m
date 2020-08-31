Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F13257505
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 10:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgHaILW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 04:11:22 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:52466 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgHaILU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:11:20 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07V8AlEW006400; Mon, 31 Aug 2020 17:10:47 +0900
X-Iguazu-Qid: 34tKGq3o2vjA0gEPlD
X-Iguazu-QSIG: v=2; s=0; t=1598861447; q=34tKGq3o2vjA0gEPlD; m=wz3Ji6+3jnDYpbjJmm9marffPxNcuoZNtHujLIhghMo=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1513) id 07V8AjRY038434;
        Mon, 31 Aug 2020 17:10:45 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 07V8AivR028260;
        Mon, 31 Aug 2020 17:10:44 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 07V8AiaU004504;
        Mon, 31 Aug 2020 17:10:44 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 1/8] dt-bindings: pinctrl: Add bindings for Toshiba Visconti TMPV7700 SoC
Date:   Mon, 31 Aug 2020 17:10:18 +0900
X-TSB-HOP: ON
Message-Id: <20200831081025.2721320-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl bindings for Toshiba Visconti TMPV7700 SoC series.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../pinctrl/toshiba,visconti-pinctrl.yaml     | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
new file mode 100644
index 000000000000..d0d1a01140ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti TMPV770x pin mux/config controller
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description:
+  Toshiba's Visconti ARM SoC a pin mux/config controller.
+
+properties:
+  compatible:
+    enum:
+      - toshiba,tmpv7708-pinctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  '-pins$':
+    type: object
+    description: |
+      A pinctrl node should contain at least one subnodes representing the
+      pinctrl groups available on the machine. Each subnode will list the
+      pins it needs, and how they should be configured, with regard to muxer
+      configuration, pullups, drive strength.
+    $ref: "pinmux-node.yaml"
+
+    properties:
+      function:
+        description:
+          Function to mux.
+        $ref: "/schemas/types.yaml#/definitions/string"
+        enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
+          spi0, spi1, spi2, spi3, spi4, spi5, spi6,
+          uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
+
+      groups:
+        description:
+          Name of the pin group to use for the functions.
+        $ref: "/schemas/types.yaml#/definitions/string"
+        enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
+          i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
+          spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
+          spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
+          uart0_grp, uart1_grp, uart2_grp, uart3_grp,
+          pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
+          pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
+          pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
+          pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
+          pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
+          pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 16, 24, 32]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      bias-pull-up: true
+
+      bias-pull-down: true
+
+      bias-disable: true
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pmux: pmux@24190000 {
+            compatible = "toshiba,tmpv7708-pinctrl";
+            reg = <0 0x24190000 0 0x10000>;
+
+            spi0_pins: spi0-pins {
+                function = "spi0";
+                groups = "spi0_grp";
+            };
+        };
+    };
-- 
2.27.0

