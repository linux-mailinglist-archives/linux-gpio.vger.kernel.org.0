Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B833133F2FE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhCQOjA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbhCQOiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A568EC06175F;
        Wed, 17 Mar 2021 07:38:23 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so1437953wmj.2;
        Wed, 17 Mar 2021 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iedgdCnjGfttEX1KOgm1110/nTRsaLsXXPaZMdz5aEE=;
        b=pOW2Jh48vpFuHFq2fjFvEcOK7kthLEbWfW8T+ZjghO37YPyt+eIuuJCgZjA5dLvP2K
         FyYoqy24tRMeAoWmukt0Yk0nzp2+NIjbWH+aAN8J1+3/A5PTRaObAAK6zqTOLGnqD0Z3
         K4BTuVtgzjZkfXfVO0QVMwSYKXjWESe/0xso56a7sQ6km0cUE6Q+kczcdF/0UrfwrAL6
         e0KnHHf3z1o+Lwn2ppHPvys/hDeNYNTULN81ewi+g2FUxWvgDLNVS+RtR/M553j8Bowx
         kG4tXNNJRwkJ5yZlPfLNzPwJa9LXxvbD70RT5uiSqDuOmuHj1Nc/ACHYfJE8h0PkVzvm
         E8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iedgdCnjGfttEX1KOgm1110/nTRsaLsXXPaZMdz5aEE=;
        b=q8he90aiAXZ8PEORnxS27xj1Vf7ZCTK+bNbyThYXHtpf8JFPZ4jfDQ5yedzNjm+9i5
         cKob3wWnUMJJN21haqlYH33qCupcbgm1sypO45Dvk/MMjWmS3D4wJZKPZjFt5RHA7VCI
         fdhRONq72qVjpcyy+Clu7D5TG6gTt6gOl98GS6o8ysph6yOLB2T3ibp/c7SEKkWCvY88
         UFJ9ZAKX/tuhgZEYf5lhGomBXLrfSldwpcKKrbBKuV0xan7qU1e51StxdHX+6460UVD8
         HB4LYNT7z9SDitBJeKyutGjs45AH6TIqyf6vPWgFEG8qHV3kpVp5/E9qJNvapRN8JZoT
         rSHg==
X-Gm-Message-State: AOAM530kuBlRm0hgLBqNmENd+Qx8jo7BErmkFLsx34QjOygu5SHaA3t+
        l17ZGCHf6TCYHbp6d2dXmrg=
X-Google-Smtp-Source: ABdhPJy/c7OG+Vrv6cK8K7oeV+pKUh5q/8U1ukj61nMn0pm8oakq7DNsT5kHXcIJMxX+wJ2P9Em2tA==
X-Received: by 2002:a05:600c:4150:: with SMTP id h16mr4023734wmm.120.1615991902405;
        Wed, 17 Mar 2021 07:38:22 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:22 -0700 (PDT)
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
Subject: [PATCH v8 18/22] dt-bindings: add BCM63268 GPIO sysctl binding documentation
Date:   Wed, 17 Mar 2021 15:37:59 +0100
Message-Id: <20210317143803.26127-19-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO sysctl found in BCM63268 SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring

 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
new file mode 100644
index 000000000000..c7771c86d7c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
@@ -0,0 +1,194 @@
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
+    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    description:
+      GPIO controller for the SoC GPIOs. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
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
+        reg-names = "dirout", "dat";
+        reg = <0x0 0x8>, <0x8 0x8>;
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

