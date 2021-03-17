Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC7933F2EF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhCQOiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbhCQOiX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:23 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7559C06174A;
        Wed, 17 Mar 2021 07:38:22 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p19so1618019wmq.1;
        Wed, 17 Mar 2021 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Nd69911mgnCMN0CIV0lsbM2sURwMWHMvUCpCHVEUddM=;
        b=vFz3RvaEhTm5J9FtNyjpa6LNTXQpcqiZJruo+0+aJpdtpzn2QbV7qgz3dKyAoCLHYN
         B+hsdRTbI5H8/mgededVhAOymndVUS4kc1esT3rfTELGwoLJZxMTwYdLYez3wpsbbY1N
         BtXCE6NO0JwM92XPqavcr+EoCsYMu9PCTSzSqM5qSte8AJL3PwymbSMpdc7mpsRiMPRQ
         0odL9mSBXD2r3DCpSGnncB0AEqgpnHBhNIrlzzZ6LZFQCMs2ccnbU2awfIYp+4cxYWQO
         hKnQu+QRwOH41RgeHg9coYGBn8DFZcNcOhna97h6X1FelxsO5B59HX5CGgsgTyLA+n0D
         f2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nd69911mgnCMN0CIV0lsbM2sURwMWHMvUCpCHVEUddM=;
        b=CduD0+DeZLDZwXpDmYBNTbk+fbVNcUQEZa9p9l1WhMmdW5Mur655ku2tR7M1fc7VZv
         3WA8zAwnajsKlhjI+idKxXU4rA3WhopRHzuFVLjbkeNBbNJICNCY837zXB/m8e31zXuw
         KlQXCCS/Yv4eMn70lZ6jrKcYFuYtPskl6zwfzR+JbXgSsYCXVLfcu/Sp6T9w4cTvLCOq
         HJP0hyJB4dGCxGBs8GXthCwW6WYRh6RnVy52dvQD1xrQ1q+ootxYOyXabrBrvcVJ8QmE
         3fHWBX57c3OPH8i3fQFnft25zkS8GGJvpBV9fg9Sk9Rr50FjvMOX+xp8aA/whBjIet1V
         L+yA==
X-Gm-Message-State: AOAM530CgrlzG0E9vph7cZsxE2YKFsYFyfaJMJkiOAOwAUjy2Oa4HzvZ
        I2IWtbIfc3+s0JC3/xAd2G8=
X-Google-Smtp-Source: ABdhPJyqwj+y7fzpRbKkkh/eUSRumaNRe15EsoC/ZUmf0SClcmA+qhe5iNAJqSxXd9+0x2Atz2ea1Q==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr3956062wml.135.1615991901550;
        Wed, 17 Mar 2021 07:38:21 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:21 -0700 (PDT)
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
Subject: [PATCH v8 17/22] dt-bindings: add BCM63268 pincontroller binding documentation
Date:   Wed, 17 Mar 2021 15:37:58 +0100
Message-Id: <20210317143803.26127-18-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
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
 v8: add changes suggested by Rob Herring
 v7: add changes suggested by Rob Herring
 v6: add changes suggested by Rob Herring
 v5: change Documentation to dt-bindings in commit title
 v4: no changes
 v3: add new gpio node
 v2: remove interrupts

 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
new file mode 100644
index 000000000000..1acd6ef38c5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
@@ -0,0 +1,166 @@
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
+        $ref: "pinmux-node.yaml#/properties/function"
+        enum: [ serial_led_clk, serial_led_data, hsspi_cs4, hsspi_cs5,
+                hsspi_cs6, hsspi_cs7, adsl_spi_miso, adsl_spi_mosi,
+                vreq_clk, pcie_clkreq_b, robosw_led_clk, robosw_led_data,
+                nand, gpio35_alt, dectpd, vdsl_phy_override_0,
+                vdsl_phy_override_1, vdsl_phy_override_2,
+                vdsl_phy_override_3, dsl_gpio8, dsl_gpio9 ]
+
+      pins:
+        $ref: "pinmux-node.yaml#/properties/pins"
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

