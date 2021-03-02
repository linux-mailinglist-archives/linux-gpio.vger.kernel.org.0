Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60FB32AD3A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384029AbhCBV3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835650AbhCBTS3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:18:29 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E557C061222;
        Tue,  2 Mar 2021 11:16:40 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o16so3872836wmh.0;
        Tue, 02 Mar 2021 11:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7gJa4gBAfCOTwqi46bF2W12+HC1MVtZps6aUgXfjRVQ=;
        b=EeLMjp5E3x5o7EerIr676AmROtAtkJEs3SJAMrXCGflsKfRXf7R+JEhdXBuVgUh5l9
         mr4DfxBVVzHrEGFDWYLgFgaTwmEpWg5QtBmFDuF4szC8u1t7krsHQWI9wdNDip/8S+nS
         5a0+zuTBa3a2eFBXRtAnBDUWNiyTswop41LbsDE8nwyRc47HwMkFNrje5JMffMEo82O0
         FKFdUvljxEE8VKleiKRvtgk+dvV1xdzzLQHDTZe+FO08PcsyA9gyGy60Bi+0l3F5zw24
         WGYove2f/rxn+whVLIg1N+hlNQmxIqW0k8TLlQDhhFTbtQHY5w7iAyJEg/M4llF6mv/I
         ywMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gJa4gBAfCOTwqi46bF2W12+HC1MVtZps6aUgXfjRVQ=;
        b=kml4ufr1MFkiQoi8otb6KM9nb/dsMlXZJdaHk7T5XzjNaOFwIMGLuoaMD2Pwr3W5v4
         3/w9CaSgTNZsYIK9+nZJ/uajdI/5SSSG3knIa3IswDscEBnPA/UmL/IVJ/zcPVnk8oHh
         cn7DGQBYv4g/s8vbZPs+g8Q9nuSA2PSpPt6hDrHXWpIZb9kUbdP+7oMOhZgCWy9ZaWi8
         r7q7XmlLdEVfv07MpAN+eEYBDht8lJyqGYDtvzTszOh2GcfpWSXagrf0LRNX9VytlJ7X
         korFum+ZKbkMSeitNroAerYLUdMJpAwwq9jIaEHJkeg/aIs1mUW5JHB4YZ62AWgHwhxz
         BPPg==
X-Gm-Message-State: AOAM531k/pY/bu4JOe97KW8PFlw84Jt59FRnFNR26kMNHyQCtx1McTBV
        NtZVmCcipNBXVMO3oniWRd57TOd1YlK36w==
X-Google-Smtp-Source: ABdhPJxXqEnSWY+s814NOq64x7ZHRuEXS2Hi/QIKH9isfuqaSMYtgsKXZLHgNWdui18s65hMP86ATw==
X-Received: by 2002:a05:600c:358d:: with SMTP id p13mr5592709wmq.152.1614712598694;
        Tue, 02 Mar 2021 11:16:38 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:37 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>, f.fainelli@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/12] Documentation: add BCM63268 pincontroller binding documentation
Date:   Tue,  2 Mar 2021 20:16:10 +0100
Message-Id: <20210302191613.29476-10-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
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
 v2: remove interrupts

 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
new file mode 100644
index 000000000000..151aa36f539b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
@@ -0,0 +1,182 @@
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
+  Refer to the the bindings described in
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

