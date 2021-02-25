Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87AC3253C8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhBYQo1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbhBYQn6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:58 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DF0C061794;
        Thu, 25 Feb 2021 08:42:27 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id k66so5437397wmf.1;
        Thu, 25 Feb 2021 08:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7fjB1e++hLR8ADNwUG9q+2gJ3lhPcwoGxct0PrcHySc=;
        b=ebwloGE/6e1DXLMiQg4+dsaXBVxWm2WTm0j/SKoFm8m9jDAiGrGC08F8XRU6hwRXbX
         vf+QL0ue/DowmHVeOD3kXUzLzWZjimJ4CJkNsQz9wXhF9ZWVd1T2hHGdxFx2zLA7VbcI
         XNoDOD2nCZYxvHR99GEh6XIbvOmIg7kXqN4KWCQRlehlDETcFB2HL+FvGJCqN/Wld625
         MF/uNUKLzYthoLC7alXJZfJ7rL1/JksQBsrx6nmFnuotD7SZpgAagM5ZYfPpNfEtwj9W
         csl/rp1j40ukZ9PVUCGoU7z/aayEW4ljga8rjrfGqmxaY0mkD31GDjIP2ViIZYqkWYoB
         Tr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fjB1e++hLR8ADNwUG9q+2gJ3lhPcwoGxct0PrcHySc=;
        b=PMBjxslON8ZiNnPk9u2AcyvsK8xvJo7wkAPEUCu1Pze4nYsIEuCCiOJCmiLvtB/qHk
         nwuaqAeu9ecdj5jR7rVaqp/xvbLzzrBY8KN9cQujd4KInpE4jvGliVEbak2xR337ortN
         VK01C/537xtMhdQw7h1dAeLDn22qNMkzC6BFXVCTUI1A1bbWsm3IfMBnfDuQhfqmoo0B
         qbuxPxmbwq5OIBKwZvLryj7e26J7XLqgBHGjLa8u/xnwAwVB3ylTODwK9PtZD5r6Q/Q9
         ocCfTf9+mLAYxPqh7FlkeYu36Pb8OovGQRl/0Yf3ou9bfH2RCBA8NbIAK1tMVQxHiTVL
         k7/Q==
X-Gm-Message-State: AOAM5326/x44K7fml+e/gr55ac4e1WvCWI25o5fL2V6Iq859wL7Gzjps
        CzLuUO3aM4LZDaY6I/+zbFw=
X-Google-Smtp-Source: ABdhPJxY3WPedcs0R1kilFOnbyH4pzdu6nx2ZKqZ0K84bgCv8yBEh00LshHAnm1uXVFEie750xO9Ag==
X-Received: by 2002:a05:600c:4c17:: with SMTP id d23mr4052587wmp.116.1614271346539;
        Thu, 25 Feb 2021 08:42:26 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:26 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] Documentation: add BCM63268 pincontroller binding documentation
Date:   Thu, 25 Feb 2021 17:42:13 +0100
Message-Id: <20210225164216.21124-10-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225164216.21124-1-noltari@gmail.com>
References: <20210225164216.21124-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in the BCM63268
family SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 198 ++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
new file mode 100644
index 000000000000..00a681772319
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm63268-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM63268 pin controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  The pin controller node should be the child of a syscon node.
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: brcm,bcm63268-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Specifies the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  interrupts-extended:
+    description:
+      One interrupt per each of the 4 GPIO ports supported by the controller,
+      sorted by port number ascending order.
+    minItems: 4
+    maxItems: 4
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ serial_led_clk, serial_led_data, hsspi_cs4, hsspi_cs5,
+                  hsspi_cs6, hsspi_cs7, adsl_spi_miso, adsl_spi_mosi,
+                  vreq_clk, pcie_clkreq_b, robosw_led_clk, robosw_led_data,
+                  nand, gpio35_alt, dectpd, vdsl_phy_override_0,
+                  vdsl_phy_override_1, vdsl_phy_override_2,
+                  vdsl_phy_override_3, dsl_gpio8, dsl_gpio9 ]
+
+        pins:
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [ gpio0, gpio1, gpio16, gpio17, gpio8, gpio9, gpio18, gpio19,
+                  gpio22, gpio23, gpio30, gpio31, nand_grp, gpio35
+                  dectpd_grp, vdsl_phy_override_0_grp,
+                  vdsl_phy_override_1_grp, vdsl_phy_override_2_grp,
+                  vdsl_phy_override_3_grp, dsl_gpio8, dsl_gpio9 ]
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@100000c0 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0x100000c0 0x80>;
+
+      pinctrl: pinctrl {
+        compatible = "brcm,bcm63268-pinctrl";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupts-extended = <&ext_intc 0 0>,
+                              <&ext_intc 1 0>,
+                              <&ext_intc 2 0>,
+                              <&ext_intc 3 0>;
+        interrupt-names = "gpio32",
+                          "gpio33",
+                          "gpio34",
+                          "gpio35";
+
+        pinctrl_serial_led: serial_led {
+          pinctrl_serial_led_clk: serial_led_clk {
+            function = "serial_led_clk";
+            pins = "gpio0";
+          };
+
+          pinctrl_serial_led_data: serial_led_data {
+            function = "serial_led_data";
+            pins = "gpio1";
+          };
+        };
+
+        pinctrl_hsspi_cs4: hsspi_cs4 {
+          function = "hsspi_cs4";
+          pins = "gpio16";
+        };
+
+        pinctrl_hsspi_cs5: hsspi_cs5 {
+          function = "hsspi_cs5";
+          pins = "gpio17";
+        };
+
+        pinctrl_hsspi_cs6: hsspi_cs6 {
+          function = "hsspi_cs6";
+          pins = "gpio8";
+        };
+
+        pinctrl_hsspi_cs7: hsspi_cs7 {
+          function = "hsspi_cs7";
+          pins = "gpio9";
+        };
+
+        pinctrl_adsl_spi: adsl_spi {
+          pinctrl_adsl_spi_miso: adsl_spi_miso {
+            function = "adsl_spi_miso";
+            pins = "gpio18";
+          };
+
+          pinctrl_adsl_spi_mosi: adsl_spi_mosi {
+            function = "adsl_spi_mosi";
+            pins = "gpio19";
+          };
+        };
+
+        pinctrl_vreq_clk: vreq_clk {
+          function = "vreq_clk";
+          pins = "gpio22";
+        };
+
+        pinctrl_pcie_clkreq_b: pcie_clkreq_b {
+          function = "pcie_clkreq_b";
+          pins = "gpio23";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk {
+          function = "robosw_led_clk";
+          pins = "gpio30";
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data {
+          function = "robosw_led_data";
+          pins = "gpio31";
+        };
+
+        pinctrl_nand: nand {
+          function = "nand";
+          group = "nand_grp";
+        };
+
+        pinctrl_gpio35_alt: gpio35_alt {
+          function = "gpio35_alt";
+          pin = "gpio35";
+        };
+
+        pinctrl_dectpd: dectpd {
+          function = "dectpd";
+          group = "dectpd_grp";
+        };
+
+        pinctrl_vdsl_phy_override_0: vdsl_phy_override_0 {
+          function = "vdsl_phy_override_0";
+          group = "vdsl_phy_override_0_grp";
+        };
+
+        pinctrl_vdsl_phy_override_1: vdsl_phy_override_1 {
+          function = "vdsl_phy_override_1";
+          group = "vdsl_phy_override_1_grp";
+        };
+
+        pinctrl_vdsl_phy_override_2: vdsl_phy_override_2 {
+          function = "vdsl_phy_override_2";
+          group = "vdsl_phy_override_2_grp";
+        };
+
+        pinctrl_vdsl_phy_override_3: vdsl_phy_override_3 {
+          function = "vdsl_phy_override_3";
+          group = "vdsl_phy_override_3_grp";
+        };
+
+        pinctrl_dsl_gpio8: dsl_gpio8 {
+          function = "dsl_gpio8";
+          group = "dsl_gpio8";
+        };
+
+        pinctrl_dsl_gpio9: dsl_gpio9 {
+          function = "dsl_gpio9";
+          group = "dsl_gpio9";
+        };
+      };
+    };
-- 
2.20.1

