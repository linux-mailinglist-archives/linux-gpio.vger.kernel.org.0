Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 224A01621DE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 08:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgBRH5f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 02:57:35 -0500
Received: from inva020.nxp.com ([92.121.34.13]:52936 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgBRH5e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 02:57:34 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E1CFE1A0D40;
        Tue, 18 Feb 2020 08:57:32 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 95E001A055D;
        Tue, 18 Feb 2020 08:57:25 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 04B8040245;
        Tue, 18 Feb 2020 15:57:16 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 1/4] dt-bindings: pinctrl: Convert i.MX8MQ to json-schema
Date:   Tue, 18 Feb 2020 15:51:37 +0800
Message-Id: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the i.MX8MQ pinctrl binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V3:
	- use uint32-matrix instead of uint32-array for fsl,pins.
---
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 36 ----------
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml       | 82 ++++++++++++++++++++++
 2 files changed, 82 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
deleted file mode 100644
index 66de750..0000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Freescale IMX8MQ IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-for common binding part and usage.
-
-Required properties:
-- compatible: "fsl,imx8mq-iomuxc"
-- reg: should contain the base physical address and size of the iomuxc
-  registers.
-
-Required properties in sub-nodes:
-- fsl,pins: each entry consists of 6 integers and represents the mux and config
-  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
-  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
-  imx8mq-pinfunc.h under device tree source folder.  The last integer CONFIG is
-  the pad setting value like pull-up on this pin.  Please refer to i.MX8M Quad
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
-        compatible = "fsl,imx8mq-iomuxc";
-        reg = <0x0 0x30330000 0x0 0x10000>;
-
-        pinctrl_uart1: uart1grp {
-                fsl,pins = <
-                        MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX             0x49
-                        MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX             0x49
-                >;
-        };
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
new file mode 100644
index 0000000..b30c704
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mq-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMX8MQ IOMUX Controller
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
+    const: fsl,imx8mq-iomuxc
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
+          be found in <arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MX8M Quad Reference Manual for detailed CONFIG settings.
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
+        compatible = "fsl,imx8mq-iomuxc";
+        reg = <0x30330000 0x10000>;
+
+        pinctrl_uart1: uart1grp {
+            fsl,pins =
+                <0x234 0x49C 0x4F4 0x0 0x0	0x49>,
+                <0x238 0x4A0 0x4F4 0x0 0x0	0x49>;
+        };
+    };
+
+...
-- 
2.7.4

