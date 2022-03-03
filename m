Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895024CC0C8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 16:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbiCCPH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 10:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234417AbiCCPHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 10:07:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AA1190B57;
        Thu,  3 Mar 2022 07:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646320025; x=1677856025;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8mezKlIkUGiAo2UAZ5QH3YPWGPZyCzM5md4mxTO2kBI=;
  b=dp98RD9gl5QEb9h9BrQ1iaHmBCn+2FjW6Rbwvt8UnJn3e+xz4jvMO/Mi
   T8ftMqbFA7mvoowU2cLCKlOcSdQ/AxtnCU07cMj+f5bLXBxw0IlWvdgzA
   AZxAx6/d1JYQjAL43b13uqezWYokXICX8PAgp4HFL4/yAfpcMfshtWpHz
   94JZsbXmbBogcF6NftrTnwjgVQXEY0e9fhvj/2FQBisMzxzoTuy5ZVW4/
   VR4gdn0vU9A2reIoYnMIeqgPYwBBKlXkq+FapN5WZUuhEagT+BTpmPZdk
   yFSpjl5S8xgmiJH7GEeuSdRSnQv2yevdLhkeK+NepdyzBG7RkY+K2zo9a
   w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643670000"; 
   d="scan'208";a="22439561"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Mar 2022 16:07:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 03 Mar 2022 16:07:03 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 03 Mar 2022 16:07:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646320023; x=1677856023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8mezKlIkUGiAo2UAZ5QH3YPWGPZyCzM5md4mxTO2kBI=;
  b=CyyN5eiKDyqJlroUPNr89uxA1RP2wwfiHCBnqDqBPyVb9NHjl+uXbEMK
   2kbm9g7RCkgAD3l3kNSZ1b+LV06WmcFLMrvmezmMkdBDAU/paD3TGIIp3
   JfNh4dXPDReQtRxwzqXEabe9RTvnMvX181ja3r4X3bCB+ak00PV9LEpcQ
   0JNIxzGaCMi8vP1G6FQj9DqjPC7cR/rcRnocDOLv8zHBg/GxI1MwBigzK
   rfjmgOAtPhSK5A0b/rFwH4swm4ls1bs9d3jmuPj0owwNuzL7XU51t61P1
   PPa8SHFHfgOMuru8tEUctyiqavrnq0pZGQzRW9UlsrgJLmhWXdiiyHmCG
   w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643670000"; 
   d="scan'208";a="22439560"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Mar 2022 16:07:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F0241280074;
        Thu,  3 Mar 2022 16:07:02 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: Convert i.MX7D to json-schema
Date:   Thu,  3 Mar 2022 16:06:52 +0100
Message-Id: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the i.MX7D pinctrl binding to DT schema format using json-schema

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt    |  87 --------------
 .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   | 113 ++++++++++++++++++
 2 files changed, 113 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
deleted file mode 100644
index bfab5ca49fd1..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-* Freescale i.MX7 Dual IOMUX Controller
-
-iMX7D supports two iomuxc controllers, fsl,imx7d-iomuxc controller is similar
-as previous iMX SoC generation and fsl,imx7d-iomuxc-lpsr which provides low
-power state retention capabilities on gpios that are part of iomuxc-lpsr
-(GPIO1_IO7..GPIO1_IO0). While iomuxc-lpsr provides its own set of registers for
-mux and pad control settings, it shares the input select register from main
-iomuxc controller for daisy chain settings, the fsl,input-sel property extends
-fsl,imx-pinctrl driver to support iomuxc-lpsr controller.
-
-iomuxc_lpsr: iomuxc-lpsr@302c0000 {
-	compatible = "fsl,imx7d-iomuxc-lpsr";
-	reg = <0x302c0000 0x10000>;
-	fsl,input-sel = <&iomuxc>;
-};
-
-iomuxc: iomuxc@30330000 {
-	compatible = "fsl,imx7d-iomuxc";
-	reg = <0x30330000 0x10000>;
-};
-
-Peripherals using pads from iomuxc-lpsr support low state retention power
-state, under LPSR mode GPIO's state of pads are retain.
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx7d-iomuxc" for main IOMUXC controller, or
-  "fsl,imx7d-iomuxc-lpsr" for Low Power State Retention IOMUXC controller.
-- fsl,pins: each entry consists of 6 integers and represents the mux and config
-  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
-  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
-  imx7d-pinfunc.h under device tree source folder.  The last integer CONFIG is
-  the pad setting value like pull-up on this pin.  Please refer to i.MX7 Dual
-  Reference Manual for detailed CONFIG settings.
-- fsl,input-sel: required property for iomuxc-lpsr controller, this property is
-  a phandle for main iomuxc controller which shares the input select register for
-  daisy chain settings.
-
-CONFIG bits definition:
-PAD_CTL_PUS_100K_DOWN           (0 << 5)
-PAD_CTL_PUS_5K_UP               (1 << 5)
-PAD_CTL_PUS_47K_UP              (2 << 5)
-PAD_CTL_PUS_100K_UP             (3 << 5)
-PAD_CTL_PUE                     (1 << 4)
-PAD_CTL_HYS                     (1 << 3)
-PAD_CTL_SRE_SLOW                (1 << 2)
-PAD_CTL_SRE_FAST                (0 << 2)
-PAD_CTL_DSE_X1                  (0 << 0)
-PAD_CTL_DSE_X4                  (1 << 0)
-PAD_CTL_DSE_X2                  (2 << 0)
-PAD_CTL_DSE_X6                  (3 << 0)
-
-Examples:
-While iomuxc-lpsr is intended to be used by dedicated peripherals to take
-advantages of LPSR power mode, is also possible that an IP to use pads from
-any of the iomux controllers. For example the I2C1 IP can use SCL pad from
-iomuxc-lpsr controller and SDA pad from iomuxc controller as:
-
-i2c1: i2c@30a20000 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c1_1>, <&pinctrl_i2c1_2>;
-};
-
-iomuxc-lpsr@302c0000 {
-	compatible = "fsl,imx7d-iomuxc-lpsr";
-	reg = <0x302c0000 0x10000>;
-	fsl,input-sel = <&iomuxc>;
-
-	pinctrl_i2c1_1: i2c1grp-1 {
-		fsl,pins = <
-			MX7D_PAD_GPIO1_IO04__I2C1_SCL 0x4000007f
-		>;
-	};
-};
-
-iomuxc@30330000 {
-	compatible = "fsl,imx7d-iomuxc";
-	reg = <0x30330000 0x10000>;
-
-	pinctrl_i2c1_2: i2c1grp-2 {
-		fsl,pins = <
-			MX7D_PAD_I2C1_SDA__I2C1_SDA 0x4000007f
-		>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
new file mode 100644
index 000000000000..621038662188
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx7d-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMX7D IOMUX Controller
+
+maintainers:
+  - Dong Aisheng <aisheng.dong@nxp.com>
+
+description:
+  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+  for common binding part and usage.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx7d-iomuxc
+          - fsl,imx7d-iomuxc-lpsr
+
+  reg:
+    maxItems: 1
+
+  fsl,input-sel:
+    description:
+      phandle for main iomuxc controller which shares the input select
+      register for daisy chain settings.
+    $ref: /schemas/types.yaml#/definitions/phandle
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
+          be found in <arch/arm/boot/dts/imx7d-pinfunc.h>. The last integer
+          CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MX7D Reference Manual for detailed CONFIG settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_reg" indicates the offset of mux register.
+            - description: |
+                "conf_reg" indicates the offset of pad configuration register.
+            - description: |
+                "input_reg" indicates the offset of select input register.
+            - description: |
+                "mux_val" indicates the mux value to be applied.
+            - description: |
+                "input_val" indicates the select input value to be applied.
+            - description: |
+                "pad_setting" indicates the pad configuration value to be applied.
+
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+  - reg
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx7d-iomuxc-lpsr
+
+then:
+  required:
+    - fsl,input-sel
+
+additionalProperties: false
+
+examples:
+  - |
+    iomuxc: pinctrl@30330000 {
+      compatible = "fsl,imx7d-iomuxc";
+      reg = <0x30330000 0x10000>;
+
+      pinctrl_uart5: uart5grp {
+        fsl,pins =
+          <0x0160 0x03D0 0x0714 0x1 0x0	0x7e>,
+          <0x0164 0x03D4 0x0000 0x1 0x0	0x76>;
+      };
+    };
+  - |
+    iomuxc_lpsr: pinctrl@302c0000 {
+      compatible = "fsl,imx7d-iomuxc-lpsr";
+      reg = <0x302c0000 0x10000>;
+      fsl,input-sel = <&iomuxc>;
+
+      pinctrl_gpio_lpsr: gpio1-grp {
+          fsl,pins =
+            <0x0008 0x0038 0x0000 0x0 0x0	0x59>,
+            <0x000C 0x003C 0x0000 0x0 0x0	0x59>;
+        };
+    };
-- 
2.25.1

