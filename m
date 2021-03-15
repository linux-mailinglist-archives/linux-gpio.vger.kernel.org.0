Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508A633B183
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhCOLm7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhCOLmg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C881C061574;
        Mon, 15 Mar 2021 04:42:36 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso20045272wmi.3;
        Mon, 15 Mar 2021 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6kySR0ORgKVk8MhO60ASA7Nkl6ciG0aSRuEvq9UB8TI=;
        b=jqvIxTToXGbosPmKbQXkAUcv3m28ONeYJbQ/+cZhx21k7jwcf7uCnlYYE/klaFNiLu
         q0xfgt7opHDZQi1xz2ZHLnVORaltqgkA2xKO5Hs9F/DX6ggJKdXwgx/PBnuBw7eH0ar5
         OboAwKyPdpPNu+n8yvy8gaGsDWoG+lDD9zN3LlDOnQbFF9vLmxo5JRQD6shIqnmThyk6
         u/cVbBPBiemWyxH6U+rH44g/Ma2NaQ6ElQPEeRyzImKQGeNLFtPnO1w2wwcJrfVpraUG
         nvW3y8taciHBPISAW0642XBwKK12PCGnxq+0NuRx81xRJVglHY7j35dRe+LqrS9XKmXW
         RlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6kySR0ORgKVk8MhO60ASA7Nkl6ciG0aSRuEvq9UB8TI=;
        b=Wq1YRKjmyGQ2d7qOJ62pmP+CVssOOKwPJ8zR4n10u7RKsVJjhFUiUEol7lZMZgkCrd
         qQSSBfwSuVNuV4ni2rZBwpyaOKJ4P3QowTr+eCv/FNcJpPyzm8uX1a3ws01Oh2NDy78W
         8+Fx7yjR2rDXhKYDHPY4D/kbfyxWXqWkqPRhskw3UfEWiw8KCSD7zxSVonoKQC9pMiSG
         4d2HEuk/YgWCI35tAz/RF8jJpZAuuWHofs985g3w6A6C3HczssxRGkUbr8NDi/BdZYyQ
         tHX9f7TP5jLHcc1q57+8K3jbQrOfps/UUBKncS5kZ1GfrsysM2PNJo2DuGsMYZgPG9Kd
         oA3g==
X-Gm-Message-State: AOAM533Kpu5pUX+V+cbxbknOrW57U6q3d7AWNPYAfludF37OH0g3tG+d
        UPqrE1EYaiU/VOZj23GYYMg=
X-Google-Smtp-Source: ABdhPJzZV6JyF6x5l3Pu8xN9/pJxAB9KAiUUji3fhmGhsZuiZZ9vpeC8qZFcEFVmWVcqEGPMptGHmA==
X-Received: by 2002:a1c:4145:: with SMTP id o66mr21010864wma.68.1615808554982;
        Mon, 15 Mar 2021 04:42:34 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:34 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 18/22] dt-bindings: add BCM63268 GPIO sysctl binding documentation
Date:   Mon, 15 Mar 2021 12:42:10 +0100
Message-Id: <20210315114214.3096-19-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM63268 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        | 196 ++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
new file mode 100644
index 000000000000..73cc8445e649
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm63268-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM63268 GPIO System Controller Device Tree Bindings
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description:
+  Broadcom BCM63268 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  "#address-cells": true
+
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: brcm,bcm63268-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  ranges:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
+    description:
+      GPIO controller for the SoC GPIOs. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
+
+  "^pinctrl@[0-9a-f]+$":
+    # Child node
+    type: object
+    $ref: "../pinctrl/brcm,bcm63268-pinctrl.yaml"
+    description:
+      Pin controller for the SoC pins. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml.
+
+required:
+  - "#address-cells"
+  - compatible
+  - ranges
+  - reg
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@100000c0 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "brcm,bcm63268-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x100000c0 0x80>;
+      ranges = <0 0x100000c0 0x80>;
+
+      gpio@0 {
+        compatible = "brcm,bcm63268-gpio";
+        reg = <0x0 0x10>;
+
+        data = <0xc>;
+        dirout = <0x4>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 52>;
+        #gpio-cells = <2>;
+      };
+
+      pinctrl: pinctrl@10 {
+        compatible = "brcm,bcm63268-pinctrl";
+        reg = <0x10 0x4>, <0x18 0x8>, <0x38 0x4>;
+
+        pinctrl_serial_led: serial_led-pins {
+          pinctrl_serial_led_clk: serial_led_clk-pins {
+            function = "serial_led_clk";
+            pins = "gpio0";
+          };
+
+          pinctrl_serial_led_data: serial_led_data-pins {
+            function = "serial_led_data";
+            pins = "gpio1";
+          };
+        };
+
+        pinctrl_hsspi_cs4: hsspi_cs4-pins {
+          function = "hsspi_cs4";
+          pins = "gpio16";
+        };
+
+        pinctrl_hsspi_cs5: hsspi_cs5-pins {
+          function = "hsspi_cs5";
+          pins = "gpio17";
+        };
+
+        pinctrl_hsspi_cs6: hsspi_cs6-pins {
+          function = "hsspi_cs6";
+          pins = "gpio8";
+        };
+
+        pinctrl_hsspi_cs7: hsspi_cs7-pins {
+          function = "hsspi_cs7";
+          pins = "gpio9";
+        };
+
+        pinctrl_adsl_spi: adsl_spi-pins {
+          pinctrl_adsl_spi_miso: adsl_spi_miso-pins {
+            function = "adsl_spi_miso";
+            pins = "gpio18";
+          };
+
+          pinctrl_adsl_spi_mosi: adsl_spi_mosi-pins {
+            function = "adsl_spi_mosi";
+            pins = "gpio19";
+          };
+        };
+
+        pinctrl_vreq_clk: vreq_clk-pins {
+          function = "vreq_clk";
+          pins = "gpio22";
+        };
+
+        pinctrl_pcie_clkreq_b: pcie_clkreq_b-pins {
+          function = "pcie_clkreq_b";
+          pins = "gpio23";
+        };
+
+        pinctrl_robosw_led_clk: robosw_led_clk-pins {
+          function = "robosw_led_clk";
+          pins = "gpio30";
+        };
+
+        pinctrl_robosw_led_data: robosw_led_data-pins {
+          function = "robosw_led_data";
+          pins = "gpio31";
+        };
+
+        pinctrl_nand: nand-pins {
+          function = "nand";
+          group = "nand_grp";
+        };
+
+        pinctrl_gpio35_alt: gpio35_alt-pins {
+          function = "gpio35_alt";
+          pin = "gpio35";
+        };
+
+        pinctrl_dectpd: dectpd-pins {
+          function = "dectpd";
+          group = "dectpd_grp";
+        };
+
+        pinctrl_vdsl_phy_override_0: vdsl_phy_override_0-pins {
+          function = "vdsl_phy_override_0";
+          group = "vdsl_phy_override_0_grp";
+        };
+
+        pinctrl_vdsl_phy_override_1: vdsl_phy_override_1-pins {
+          function = "vdsl_phy_override_1";
+          group = "vdsl_phy_override_1_grp";
+        };
+
+        pinctrl_vdsl_phy_override_2: vdsl_phy_override_2-pins {
+          function = "vdsl_phy_override_2";
+          group = "vdsl_phy_override_2_grp";
+        };
+
+        pinctrl_vdsl_phy_override_3: vdsl_phy_override_3-pins {
+          function = "vdsl_phy_override_3";
+          group = "vdsl_phy_override_3_grp";
+        };
+
+        pinctrl_dsl_gpio8: dsl_gpio8-pins {
+          function = "dsl_gpio8";
+          group = "dsl_gpio8";
+        };
+
+        pinctrl_dsl_gpio9: dsl_gpio9-pins {
+          function = "dsl_gpio9";
+          group = "dsl_gpio9";
+        };
+      };
+    };
-- 
2.20.1

