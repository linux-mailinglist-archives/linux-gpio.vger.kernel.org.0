Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB5033B185
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhCOLm6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhCOLmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:35 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52043C061574;
        Mon, 15 Mar 2021 04:42:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so19266779wmi.3;
        Mon, 15 Mar 2021 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2TCx7RrG3IG3AoexbQC2rRtKLkwhVusuxmN6RWmjY6w=;
        b=BG0fci+a0tBToTu39ITWT35xyz23dqy/wk/YmMcS9P8yMCECJg9kTlNRPLoxSTt2V+
         Y4CfVFLwgUUfG+wwI2axsi/VnoElzKay2T89cUXBXb4Hweh78CjN7W/5FCJ1ivMtdool
         pEzjy9RGMJBEFg6dW6eyaK8qpcSxHuPm24cSGqnXizct0Xd7q1jEY7GPSXBLe5ZNTMwL
         jo430gqaOhFMCrpeiKsGYaDqBsDahPQN1UcGSDxYrH769HGiVtAhHcTdNsnjPo3FtNW4
         jO5nTQsO4FAqSulrgy8Dw5qrkhI+FNA4v0zvS3Zx2FfxJeeX9HKQ4tIOH1vrDFWZWj8T
         x56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2TCx7RrG3IG3AoexbQC2rRtKLkwhVusuxmN6RWmjY6w=;
        b=nPr3IYIiukXic0aYZLUusyYV9LiuZtGTA6DXoG7Es2V6jzNqyZKcjVSfiLbg/owFmD
         zByuWg1FVKv5AA/2mPkZRsqPfKiB/5kG7nQ7WfrELr6qHD/TV94G2W8qhb8dJuVsP42i
         3c71drRwoOOQ9uLIzBqnD0w5a+ayMm3Fz0nB5RkOu2RnJG3vfSea42IupN6B6WMc2EU4
         ZsyoK9jzwS/w0PHWVWDS0il00QnPTyVaAblKTuqjVuYE/ZosCISibN2VQ5SUYQte5gjt
         iiaCCyIZpOCuTMGW2B3x3hRAJ/PlCg61ZGVsyz25reoeUAlQBBDxfhu+hIv2S6sB69Wv
         mYng==
X-Gm-Message-State: AOAM53321x925C2vlBQNGA+PIfCR7HLRJedYPV08jzNp1Jd4ujfbP5Fr
        /ix86gVIHMuu4xaa7nzM8dM=
X-Google-Smtp-Source: ABdhPJweLXbJUlrNp1Tu//dYLYqccYRHJsUcAv3Qe8shFNfnAU9IIPg8YU5N9Kt9Jh6AEfv22fD3kg==
X-Received: by 2002:a1c:e18b:: with SMTP id y133mr25749127wmg.22.1615808554026;
        Mon, 15 Mar 2021 04:42:34 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:33 -0700 (PDT)
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
Subject: [PATCH v7 17/22] dt-bindings: add BCM63268 pincontroller binding documentation
Date:   Mon, 15 Mar 2021 12:42:09 +0100
Message-Id: <20210315114214.3096-18-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the pincontrol core found in the BCM63268
family SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com></jonas.gorski>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
new file mode 100644
index 000000000000..4efaa01142fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
@@ -0,0 +1,169 @@
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
+  reg:
+    maxItems: 3
+
+patternProperties:
+  '^.*-pins$':
+    if:
+      type: object
+    then:
+      properties:
+        function:
+          $ref: "pinmux-node.yaml#/properties/function"
+          enum: [ serial_led_clk, serial_led_data, hsspi_cs4, hsspi_cs5,
+                  hsspi_cs6, hsspi_cs7, adsl_spi_miso, adsl_spi_mosi,
+                  vreq_clk, pcie_clkreq_b, robosw_led_clk, robosw_led_data,
+                  nand, gpio35_alt, dectpd, vdsl_phy_override_0,
+                  vdsl_phy_override_1, vdsl_phy_override_2,
+                  vdsl_phy_override_3, dsl_gpio8, dsl_gpio9 ]
+
+        pins:
+          $ref: "pinmux-node.yaml#/properties/pins"
+          enum: [ gpio0, gpio1, gpio16, gpio17, gpio8, gpio9, gpio18, gpio19,
+                  gpio22, gpio23, gpio30, gpio31, nand_grp, gpio35
+                  dectpd_grp, vdsl_phy_override_0_grp,
+                  vdsl_phy_override_1_grp, vdsl_phy_override_2_grp,
+                  vdsl_phy_override_3_grp, dsl_gpio8, dsl_gpio9 ]
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

