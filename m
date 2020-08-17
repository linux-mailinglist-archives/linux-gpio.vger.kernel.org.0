Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D247245AB2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 04:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgHQCWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 22:22:55 -0400
Received: from mo-csw-fb1516.securemx.jp ([210.130.202.172]:40578 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgHQCWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 22:22:55 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 07H1l6ug018747; Mon, 17 Aug 2020 10:47:07 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07H1kjrg013957; Mon, 17 Aug 2020 10:46:45 +0900
X-Iguazu-Qid: 34tKBCMUDASUpnerkR
X-Iguazu-QSIG: v=2; s=0; t=1597628805; q=34tKBCMUDASUpnerkR; m=K9eOxlCO3hWCFf7zFOXkqLY1mW6IQbtKGI+m3CO+IOk=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1512) id 07H1kixZ022550;
        Mon, 17 Aug 2020 10:46:44 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx12.toshiba.co.jp  with ESMTP id 07H1khk0001566;
        Mon, 17 Aug 2020 10:46:43 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc03.toshiba.co.jp  with ESMTP id 07H1kh40023635;
        Mon, 17 Aug 2020 10:46:43 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 1/8] dt-bindings: pinctrl: Add bindings for Toshiba Visconti TMPV7700 SoC
Date:   Mon, 17 Aug 2020 10:46:25 +0900
X-TSB-HOP: ON
Message-Id: <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl bindings for Toshiba Visconti TMPV7700 SoC series.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../pinctrl/toshiba,visconti-pinctrl.yaml     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
new file mode 100644
index 000000000000..4009902cd396
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -0,0 +1,82 @@
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
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          description:
+            Function to mux.
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
+            spi0, spi1, spi2, spi3, spi4, spi5, spi6,
+            uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
+
+        groups:
+          description:
+            Name of the pin group to use for the functions.
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
+            i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
+            spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
+            spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
+            uart0_grp, uart1_grp, uart2_grp, uart3_grp,
+            pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
+            pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
+            pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
+            pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
+            pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
+            pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+
+        drive-strength:
+          enum: [2, 4, 6, 8, 16, 24, 32]
+          default: 2
+          description:
+            Selects the drive strength for the specified pins, in mA.
+
+        bias-pull-up: true
+
+        bias-pull-down: true
+
+        bias-disable: true
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    pmux: pmux@24190000 {
+        compatible = "toshiba,tmpv7708-pinctrl";
+        reg = <0 0x24190000 0 0x10000>;
+
+        spi_0: spi_0 {
+                function = "spi0";
+                groups = "spi0_grp";
+        };
+    };
-- 
2.27.0

