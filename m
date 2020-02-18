Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA021621E2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 08:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgBRH5h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 02:57:37 -0500
Received: from inva021.nxp.com ([92.121.34.21]:51908 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbgBRH5h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 02:57:37 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 311BB200A9B;
        Tue, 18 Feb 2020 08:57:35 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E0120201D4F;
        Tue, 18 Feb 2020 08:57:27 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4E74C402DD;
        Tue, 18 Feb 2020 15:57:19 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 3/4] dt-bindings: pinctrl: Convert i.MX8MN to json-schema
Date:   Tue, 18 Feb 2020 15:51:39 +0800
Message-Id: <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the i.MX8MN pinctrl binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V3:
	- use uint32-matrix instead of uint32-array for fsl,pins.
---
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.txt        | 39 ----------
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml       | 82 ++++++++++++++++++++++
 2 files changed, 82 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
deleted file mode 100644
index 330716c..0000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-* Freescale IMX8MN IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-for common binding part and usage.
-
-Required properties:
-- compatible: "fsl,imx8mn-iomuxc"
-- reg: should contain the base physical address and size of the iomuxc
-  registers.
-
-Required properties in sub-nodes:
-- fsl,pins: each entry consists of 6 integers and represents the mux and config
-  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
-  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
-  <arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h>. The last integer CONFIG is
-  the pad setting value like pull-up on this pin. Please refer to i.MX8M Nano
-  Reference Manual for detailed CONFIG settings.
-
-Examples:
-
-&uart1 {
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_uart1>;
-};
-
-iomuxc: pinctrl@30330000 {
-        compatible = "fsl,imx8mn-iomuxc";
-        reg = <0x0 0x30330000 0x0 0x10000>;
-
-        pinctrl_uart1: uart1grp {
-                fsl,pins = <
-			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-			MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
-			MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
-			MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
-			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0x19
-                >;
-        };
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
new file mode 100644
index 0000000..b9aa180
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mn-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMX8MN IOMUX Controller
+
+maintainers:
+  - Anson Huang <Anson.Huang@nxp.com>
+
+description:
+  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+  for common binding part and usage.
+
+properties:
+  compatible:
+    const: fsl,imx8mn-iomuxc
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          each entry consists of 6 integers and represents the mux and config
+          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
+          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
+          be found in <arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MX8M Nano Reference Manual for detailed CONFIG settings.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          - items:
+              items:
+                - description: |
+                    "mux_reg" indicates the offset of mux register.
+                - description: |
+                    "conf_reg" indicates the offset of pad configuration register.
+                - description: |
+                    "input_reg" indicates the offset of select input register.
+                - description: |
+                    "mux_val" indicates the mux value to be applied.
+                - description: |
+                    "input_val" indicates the select input value to be applied.
+                - description: |
+                    "pad_setting" indicates the pad configuration value to be applied.
+
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    iomuxc: pinctrl@30330000 {
+        compatible = "fsl,imx8mn-iomuxc";
+        reg = <0x30330000 0x10000>;
+
+        pinctrl_uart2: uart2grp {
+            fsl,pins =
+                <0x23C 0x4A4 0x4FC 0x0 0x0	0x140>,
+                <0x240 0x4A8 0x000 0x0 0x0	0x140>;
+        };
+    };
+
+...
-- 
2.7.4

