Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111CA347366
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbhCXIUW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236023AbhCXITp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:45 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F2EC061763;
        Wed, 24 Mar 2021 01:19:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k8so23462238wrc.3;
        Wed, 24 Mar 2021 01:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JmSHiD9M81xEDd6VjmJAtdYKosJxOC7lOQTLZmyj4iU=;
        b=LTnwldcka4s3v5J64n63VWKMPcDLBKcv3N4TFcEyMz2Q0RojsU9B+ilZ2rEgVE1BVo
         9H+rVlb28XZF2Oi6/yWraKyuPV+kbmEflnuI5CnSqSWfMsmKsj0ox1XORc2B9FguYmmy
         GJ14pQC5suQ9g5WZH6aZE6lsb8HpNjM2aCCp+a+zEIdke1HblgRq/iCzUOh+sBez8RuF
         Jk9bhZbgBSxdiR8fz5eVzFIOZcpxUSMRNwQaC65bBQXkT0LpVeVebABT3EzeZf+PV/UR
         oOLo0qT/b3JGI51ezX9AJndrHNfhfDJeCmXkB40Mxc3z1uSDZ3muFqtNOSZs2Te4OA6E
         L3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmSHiD9M81xEDd6VjmJAtdYKosJxOC7lOQTLZmyj4iU=;
        b=E469/efjWkJAIC8X8ZBskiTk/3gbM5WeqrY60xAAR9ECyLFqvf9o7wv08qu5HS+RXu
         tRnuSDiV9mqTixu5rRWC8mvfjZy8EZPAd6q0rnTBltppQ9rT7anh+hEgic7qidkTEkhx
         ANdhOUw9NExb7+NJie2VTGR1iFe+D0xlPkBIdz4WmUxi8CSkCsFbg9lVGCDZ55lvkqKo
         ODWLeQ0jKYBfo1Jy1iuuk7B8sUmEiUkD84+WmnqOunWwbHDWiL92RDCVOaBOjU/Tb3fS
         WMK/NivVCX9hS7D4wjASuwq7R12/6tm1qJae7WpUwpOKPdhOwSAy8iKp2rWJoVPrFV9S
         /7QA==
X-Gm-Message-State: AOAM531tVx81M1hjdgYVzWhWMDD2BuAV6eKxQEf+PBYBpp4Yc2drIM7M
        /6xiuO2ZEg/E8uzp9dBGXFw=
X-Google-Smtp-Source: ABdhPJzj6R6MNfWSC7554lODfzHhmD2L3SSxfG5kCDwA02FmgfZY+nQusmc6Fv7CF3Y4H7Gg2GZWTQ==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr2108270wrt.255.1616573983027;
        Wed, 24 Mar 2021 01:19:43 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:42 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 17/22] dt-bindings: add BCM63268 pincontroller binding documentation
Date:   Wed, 24 Mar 2021 09:19:18 +0100
Message-Id: <20210324081923.20379-18-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in the BCM63268
family SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v9: drop function and pins references and fix Co-developed-by
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
new file mode 100644
index 000000000000..58ffed44b3c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
@@ -0,0 +1,164 @@
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
+description:
+  Bindings for Broadcom's BCM63268 memory-mapped pin controller.
+
+properties:
+  compatible:
+    const: brcm,bcm63268-pinctrl
+
+  reg:
+    maxItems: 3
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ serial_led_clk, serial_led_data, hsspi_cs4, hsspi_cs5,
+                hsspi_cs6, hsspi_cs7, adsl_spi_miso, adsl_spi_mosi,
+                vreq_clk, pcie_clkreq_b, robosw_led_clk, robosw_led_data,
+                nand, gpio35_alt, dectpd, vdsl_phy_override_0,
+                vdsl_phy_override_1, vdsl_phy_override_2,
+                vdsl_phy_override_3, dsl_gpio8, dsl_gpio9 ]
+
+      pins:
+        enum: [ gpio0, gpio1, gpio16, gpio17, gpio8, gpio9, gpio18, gpio19,
+                gpio22, gpio23, gpio30, gpio31, nand_grp, gpio35
+                dectpd_grp, vdsl_phy_override_0_grp,
+                vdsl_phy_override_1_grp, vdsl_phy_override_2_grp,
+                vdsl_phy_override_3_grp, dsl_gpio8, dsl_gpio9 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@10 {
+      compatible = "brcm,bcm63268-pinctrl";
+      reg = <0x10 0x4>, <0x18 0x8>, <0x38 0x4>;
+
+      pinctrl_serial_led: serial_led-pins {
+        pinctrl_serial_led_clk: serial_led_clk-pins {
+          function = "serial_led_clk";
+          pins = "gpio0";
+        };
+
+        pinctrl_serial_led_data: serial_led_data-pins {
+          function = "serial_led_data";
+          pins = "gpio1";
+        };
+      };
+
+      pinctrl_hsspi_cs4: hsspi_cs4-pins {
+        function = "hsspi_cs4";
+        pins = "gpio16";
+      };
+
+      pinctrl_hsspi_cs5: hsspi_cs5-pins {
+        function = "hsspi_cs5";
+        pins = "gpio17";
+      };
+
+      pinctrl_hsspi_cs6: hsspi_cs6-pins {
+        function = "hsspi_cs6";
+        pins = "gpio8";
+      };
+
+      pinctrl_hsspi_cs7: hsspi_cs7-pins {
+        function = "hsspi_cs7";
+        pins = "gpio9";
+      };
+
+      pinctrl_adsl_spi: adsl_spi-pins {
+        pinctrl_adsl_spi_miso: adsl_spi_miso-pins {
+          function = "adsl_spi_miso";
+          pins = "gpio18";
+        };
+
+        pinctrl_adsl_spi_mosi: adsl_spi_mosi-pins {
+          function = "adsl_spi_mosi";
+          pins = "gpio19";
+        };
+      };
+
+      pinctrl_vreq_clk: vreq_clk-pins {
+        function = "vreq_clk";
+        pins = "gpio22";
+      };
+
+      pinctrl_pcie_clkreq_b: pcie_clkreq_b-pins {
+        function = "pcie_clkreq_b";
+        pins = "gpio23";
+      };
+
+      pinctrl_robosw_led_clk: robosw_led_clk-pins {
+        function = "robosw_led_clk";
+        pins = "gpio30";
+      };
+
+      pinctrl_robosw_led_data: robosw_led_data-pins {
+        function = "robosw_led_data";
+        pins = "gpio31";
+      };
+
+      pinctrl_nand: nand-pins {
+        function = "nand";
+        group = "nand_grp";
+      };
+
+      pinctrl_gpio35_alt: gpio35_alt-pins {
+        function = "gpio35_alt";
+        pin = "gpio35";
+      };
+
+      pinctrl_dectpd: dectpd-pins {
+        function = "dectpd";
+        group = "dectpd_grp";
+      };
+
+      pinctrl_vdsl_phy_override_0: vdsl_phy_override_0-pins {
+        function = "vdsl_phy_override_0";
+        group = "vdsl_phy_override_0_grp";
+      };
+
+      pinctrl_vdsl_phy_override_1: vdsl_phy_override_1-pins {
+        function = "vdsl_phy_override_1";
+        group = "vdsl_phy_override_1_grp";
+      };
+
+      pinctrl_vdsl_phy_override_2: vdsl_phy_override_2-pins {
+        function = "vdsl_phy_override_2";
+        group = "vdsl_phy_override_2_grp";
+      };
+
+      pinctrl_vdsl_phy_override_3: vdsl_phy_override_3-pins {
+        function = "vdsl_phy_override_3";
+        group = "vdsl_phy_override_3_grp";
+      };
+
+      pinctrl_dsl_gpio8: dsl_gpio8-pins {
+        function = "dsl_gpio8";
+        group = "dsl_gpio8";
+      };
+
+      pinctrl_dsl_gpio9: dsl_gpio9-pins {
+        function = "dsl_gpio9";
+        group = "dsl_gpio9";
+      };
+    };
-- 
2.20.1

