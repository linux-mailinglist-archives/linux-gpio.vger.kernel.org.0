Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A869222DF4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgGPVaG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgGPVaF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 17:30:05 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845C2C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:30:04 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k15so4750808lfc.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m97woWgyvZCjuCpnu/GEoCGoRJXZfOl1hveBqC5I7xc=;
        b=VEGb0b5w2JIwKewUBzZ4y5nul6+pCFtgBRFmBzmmpi0ZMFr5A81CuXS0Yxf3u+xVoD
         QkNTHEK+Ax+G7Vfg3DGFohOTqjnBy5vsGY8QT99rvmw2iR2C/3QHM26PWeIw1+G+76WY
         gT0dDvAq0+hmpF1zN6hdYxqaRPaq3foOL90M/31IgDfYrXSnRopmuhRjgay9oIJIuSIB
         eBb8IKktcH/5aPBxhfkZKnSc9Cvjg8d5xR56OWe/xo9e6T3E5vYVPL/tFM/VU/dsTDoW
         3GMKGVxxf8i/qkH+4sqIfO+acutWbnv1YaN/vV6WtARML+L0CFP3zQ1xO52PcGds6+IG
         J8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m97woWgyvZCjuCpnu/GEoCGoRJXZfOl1hveBqC5I7xc=;
        b=OjrfwBSa2ZoO3a8jHMv8I+TI+w2cwQfVP1qSD2ouRnV1zjUllFIYu+mcPHaZ8U3EBs
         FHDqZsPOdBG8LUJeWaa9dFlD5zZuSSQZP2ZXKuqwh7rxOYcNQMSBvuAvLaMiX3x2e904
         j62iqIlreErN8F+5Yb3RPxwSM6UXnXoenvs+IZYahM1YLC+dsPZZs47a7+7yIh9kDOTQ
         HGnVWFAl8bvkE/F/2YlqSlcgnxOE+hu6E30cEoBL3Lct8r7KFfOyE42mIHoCDb1M0/iA
         Xtgt4Tn8uawcQSzj2nufiOcspf4M3i2rsYxGTcozzU4H1cR9YY6U+cNWYVwe/9FG50bC
         vMkQ==
X-Gm-Message-State: AOAM5339cls4VSuWRNPios8P0H3wwPo/5kX9tG9nOlyYg9D5qFCSrChx
        640A1WLeV//u7dQ9Ha2++Mk/SkWWg1IuKA==
X-Google-Smtp-Source: ABdhPJzzanQLJNKReGHkVwKDHf2cPzf5eJKIX1Jk7KiReEQC2PBaX3JrvsVz7ZuOdI75+Xbttej3Aw==
X-Received: by 2002:a19:6a14:: with SMTP id u20mr2896420lfu.172.1594935002942;
        Thu, 16 Jul 2020 14:30:02 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id m11sm1274763ljj.122.2020.07.16.14.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:30:02 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 0a7ea6a0;
        Thu, 16 Jul 2020 21:30:01 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
Date:   Thu, 16 Jul 2020 22:55:28 +0200
Message-Id: <20200716205530.22910-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
References: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm msm8226
pinctrl driver.

- Bindings documentation was based on qcom,ipq6018-pinctrl.yaml added by
  Sricharan R <sricharan@codeaurora.org> and then modified for msm8226
  content

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
new file mode 100644
index 0000000000..1f0f5757f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,msm8226-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. MSM8226 TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  MSM8226 platform.
+
+properties:
+  compatible:
+    const: qcom,msm8226-pinctrl
+
+  reg:
+    description: Specifies the base address and size of the TLMM register space
+    maxItems: 1
+
+  interrupts:
+    description: Specifies the TLMM summary IRQ
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: Specifies the PIN numbers and Flags, as defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins. Functions are only valid for gpio pins.
+        enum: [ gpio, cci_i2c0, blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim5,
+          blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c5, blsp_spi1,
+          blsp_spi2, blsp_spi3, blsp_spi5, blsp_uart1, blsp_uart2,
+          blsp_uart3, blsp_uart5, cam_mclk0, cam_mclk1, wlan ]
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        msmgpio: pinctrl@fd510000 {
+                compatible = "qcom,msm8226-pinctrl";
+                reg = <0xfd510000 0x4000>;
+
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&msmgpio 0 0 117>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+                serial-pins {
+                        pins = "gpio8", "gpio9";
+                        function = "blsp_uart3";
+                        drive-strength = <8>;
+                        bias-disable;
+                };
+        };
-- 
2.25.1

