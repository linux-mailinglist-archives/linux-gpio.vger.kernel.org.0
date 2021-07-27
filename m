Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00DA3D73FA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 13:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236440AbhG0LCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 07:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236471AbhG0LCv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 07:02:51 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A679C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 04:02:50 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b1-20020a17090a8001b029017700de3903so2693207pjn.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W08W4t/feuOVV58lX7wBn7wECn5PHr1QH5vAtcP1oqw=;
        b=PlCNFwLhgN7ax3PcfP3PNaX4GZJW65jjHCYZq6FQIzkcr9C720YTs5WjVuhkPG6vFg
         zBEHHIlocxgT6zOH/bvy9jP1ypNjFSyE81LfFsnz9fSH4OjeaDyjrk+PTDpWdLk0ZY2+
         UFwRH/wgc2XKR/MFOEgJyXgtqjo8QLQRNFJTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W08W4t/feuOVV58lX7wBn7wECn5PHr1QH5vAtcP1oqw=;
        b=tSUbblxka48/ttuAn9tDqdvfdgt44aw979bFEbrYBburoO4SLz92CUlBiv0fyoFTFG
         SL5Ocl3ugBZu2f27PDDU9saHh6xnq+uIddsJ5KWbFcQ6mPDitEULDk9v0UYUf1oUYbHS
         r+/h95K4qoyTl+EFXeqVUfy2yzeCd3o9M/DJWiRpcYsiKABWMNV9hd0KTu0qNuB3Xgva
         S5Q0pl+ey3tWgCjq8ca9rPtyy4p4IlBNGBUaj1vXHpRDlBD13VUkBJlZHjo/3bkI79wM
         pzBnKg/BLhU6b5qlAhXJ8/4hPd7MdfxOmVH3YVPu2+0OAUSseVqsj52j5XmKfONuPsqg
         pbaw==
X-Gm-Message-State: AOAM5303vnVf2GWgleh0P5/ki2ugA/c2hAylC6ssMgKg68CuU0E2PFCD
        sbYHBs9D07iBMCiZnZcUAxfoQQ==
X-Google-Smtp-Source: ABdhPJyRplRAxB4zIXJwdlf/ri8oyvre9U39cUhR1xlRtLOAz/niOYc9NED+Ejd6vSdeMgelOeFAgA==
X-Received: by 2002:a17:903:32c5:b029:12b:9107:8684 with SMTP id i5-20020a17090332c5b029012b91078684mr18072318plr.73.1627383769442;
        Tue, 27 Jul 2021 04:02:49 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:5176:76cc:2193:9b8f])
        by smtp.gmail.com with ESMTPSA id 33sm3553683pgs.59.2021.07.27.04.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 04:02:49 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Date:   Tue, 27 Jul 2021 19:02:32 +0800
Message-Id: <20210727110232.2503763-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210727110232.2503763-1-hsinyi@chromium.org>
References: <20210727110232.2503763-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 202 +++++++
 .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 175 ++++++
 .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 537 ++++++++++++++++++
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 230 ++++++++
 .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 -----
 .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
 .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ----------------
 .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
 8 files changed, 1144 insertions(+), 861 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
new file mode 100644
index 0000000000000..01b42657fb9fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT65xx Pin Controller Device Tree Bindings
+
+maintainers:
+  - Andy Teng <andy.teng@mediatek.com>
+
+description: |+
+  The Mediatek's Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-pinctrl
+      - mediatek,mt2712-pinctrl
+      - mediatek,mt6397-pinctrl
+      - mediatek,mt7623-pinctrl
+      - mediatek,mt8127-pinctrl
+      - mediatek,mt8135-pinctrl
+      - mediatek,mt8167-pinctrl
+      - mediatek,mt8173-pinctrl
+      - mediatek,mt8365-pinctrl
+      - mediatek,mt8516-pinctrl
+
+  reg:
+    maxItems: 1
+
+  pins-are-numbered: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  mediatek,pctl-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Should be phandles of the syscfg node.
+
+  interrupt-controller: true
+
+  interrupts:
+    description: |
+      The interrupt outputs from the controller.
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - pins-are-numbered
+  - gpio-controller
+  - "#gpio-cells"
+
+patternProperties:
+  '-[0-9]*$':
+    type: object
+    patternProperties:
+      '-pins*$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in <soc>-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up:
+            description: |
+              Besides generic pinconfig options, it can be used as the pull up
+              settings for 2 pull resistors, R0 and R1. User can configure those
+              special pins. Some macros have been defined for this usage, such
+              as MTK_PUPD_SET_R1R0_00. See dt-bindings/pinctrl/mt65xx.h for
+              valid arguments.
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            description: |
+              Can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA,
+              etc. See dt-bindings/pinctrl/mt65xx.h for valid arguments.
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt8135-pinfunc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        syscfg_pctl_a: syscfg-pctl-a@10005000 {
+          compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
+          reg = <0 0x10005000 0 0x1000>;
+        };
+
+        syscfg_pctl_b: syscfg-pctl-b@1020c020 {
+          compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
+          reg = <0 0x1020C020 0 0x1000>;
+        };
+
+        pinctrl@1c20800 {
+          compatible = "mediatek,mt8135-pinctrl";
+          reg = <0 0x1000B000 0 0x1000>;
+          mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
+          pins-are-numbered;
+          gpio-controller;
+          #gpio-cells = <2>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+              <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+
+          i2c0_pins_a: i2c0-0 {
+            pins1 {
+              pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
+                <MT8135_PIN_101_SCL0__FUNC_SCL0>;
+              bias-disable;
+            };
+          };
+
+          i2c1_pins_a: i2c1-0 {
+            pins {
+              pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
+                <MT8135_PIN_196_SCL1__FUNC_SCL1>;
+              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+            };
+          };
+
+          i2c2_pins_a: i2c2-0 {
+            pins1 {
+              pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
+              bias-pull-down;
+            };
+
+            pins2 {
+              pinmux = <MT8135_PIN_49_WATCHDOG__FUNC_GPIO49>;
+              bias-pull-up;
+            };
+          };
+
+          i2c3_pins_a: i2c3-0 {
+            pins1 {
+              pinmux = <MT8135_PIN_40_DAC_CLK__FUNC_GPIO40>,
+                <MT8135_PIN_41_DAC_WS__FUNC_GPIO41>;
+              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+            };
+
+            pins2 {
+              pinmux = <MT8135_PIN_35_SCL3__FUNC_SCL3>,
+                <MT8135_PIN_36_SDA3__FUNC_SDA3>;
+              output-low;
+              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+            };
+
+            pins3 {
+              pinmux = <MT8135_PIN_57_JTCK__FUNC_GPIO57>,
+                <MT8135_PIN_60_JTDI__FUNC_JTDI>;
+              drive-strength = <32>;
+            };
+          };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
new file mode 100644
index 0000000000000..7e77e81903831
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6797-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6797 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Andy Teng <andy.teng@mediatek.com>
+
+description: |+
+  The MediaTek's MT6797 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6797-pinctrl
+
+  reg:
+    minItems: 5
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: "gpio"
+      - const: "iocfgl"
+      - const: "iocfgb"
+      - const: "iocfgr"
+      - const: "iocfgt"
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: |
+      The interrupt outputs from the controller.
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+
+patternProperties:
+  '-[0-9]*$':
+    type: object
+    patternProperties:
+      '-pins*$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in <soc>-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            enum: [2, 4, 8, 12, 16]
+
+          slew-rate:
+            enum: [0, 1]
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,tdsel:
+            description: |
+              An integer describing the steps for output level shifter duty
+              cycle when asserted (high pulse width adjustment). Valid arguments
+              are from 0 to 15.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          mediatek,rdsel:
+            description: |
+              An integer describing the steps for input level shifter duty cycle
+              when asserted (high pulse width adjustment). Valid arguments are
+              from 0 to 63.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt6797-pinfunc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@10005000 {
+            compatible = "mediatek,mt6797-pinctrl";
+            reg = <0 0x10005000 0 0x1000>,
+                  <0 0x10002000 0 0x400>,
+                  <0 0x10002400 0 0x400>,
+                  <0 0x10002800 0 0x400>,
+                  <0 0x10002C00 0 0x400>;
+            reg-names = "gpio", "iocfgl", "iocfgb", "iocfgr", "iocfgt";
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            uart_pins_a: uart-0 {
+                pins1 {
+                    pinmux = <MT6797_GPIO232__FUNC_URXD1>,
+                            <MT6797_GPIO233__FUNC_UTXD1>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
new file mode 100644
index 0000000000000..9ce4fad56432c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -0,0 +1,537 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT7622 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Andy Teng <andy.teng@mediatek.com>
+
+description: |+
+  The MediaTek's MT7622 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-pinctrl
+      - mediatek,mt7629-pinctrl
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: "eint"
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: |
+      The interrupt outputs to sysirq.
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+if:
+  required:
+    - interrupt-controller
+then:
+  required:
+    - reg-names
+    - interrupts
+    - "#interrupt-cells"
+
+patternProperties:
+  '-[0-9]*$':
+    type: object
+    patternProperties:
+      '-mux*$':
+        type: object
+        description: |
+          pinmux configuration nodes.
+        $ref: "/schemas/pinctrl/pinmux-node.yaml"
+        properties:
+          function:
+            description: |
+              A string containing the name of the function to mux to the group.
+            enum: ["emmc", "eth", "i2c", "i2s", "ir", "led", "flash", "pcie",
+                   "pmic", "pwm", "sd", "spi", "tdm", "uart", "watchdog",
+                   "wifi"]
+
+          groups:
+            description: |
+              An array of strings. Each string contains the name of a group.
+              Valid values for MT7622 are listed below:
+                groups                   function    pins (in pin#)
+                ---------------------------------------------------------------
+                "emmc"                   "emmc"      40, 41, 42, 43, 44, 45, 47,
+                                                     48, 49, 50
+                "emmc_rst"               "emmc"      37
+                "esw"                    "eth"       51, 52, 53, 54, 55, 56, 57,
+                                                     58, 59, 60, 61, 62, 63, 64,
+                                                     65, 66, 67, 68, 69, 70
+                "esw_p0_p1"              "eth"       51, 52, 53, 54, 55, 56, 57,
+                                                     58
+                "esw_p2_p3_p4"           "eth"       59, 60, 61, 62, 63, 64, 65,
+                                                     66, 67, 68, 69, 70
+                "rgmii_via_esw"          "eth"       59, 60, 61, 62, 63, 64, 65,
+                                                     66, 67, 68, 69, 70
+                "rgmii_via_gmac1"        "eth"       59, 60, 61, 62, 63, 64, 65,
+                                                     66, 67, 68, 69, 70
+                "rgmii_via_gmac2"        "eth"       25, 26, 27, 28, 29, 30, 31,
+                                                     32, 33, 34, 35, 36
+                "mdc_mdio"               "eth"       23, 24
+                "i2c0"                   "i2c"       14, 15
+                "i2c1_0"                 "i2c"       55, 56
+                "i2c1_1"                 "i2c"       73, 74
+                "i2c1_2"                 "i2c"       87, 88
+                "i2c2_0"                 "i2c"       57, 58
+                "i2c2_1"                 "i2c"       75, 76
+                "i2c2_2"                 "i2c"       89, 90
+                "i2s_in_mclk_bclk_ws"    "i2s"       3, 4, 5
+                "i2s1_in_data"           "i2s"       1
+                "i2s2_in_data"           "i2s"       16
+                "i2s3_in_data"           "i2s"       17
+                "i2s4_in_data"           "i2s"       18
+                "i2s_out_mclk_bclk_ws"   "i2s"       3, 4, 5
+                "i2s1_out_data"          "i2s"       2
+                "i2s2_out_data"          "i2s"       19
+                "i2s3_out_data"          "i2s"       20
+                "i2s4_out_data"          "i2s"       21
+                "ir_0_tx"                "ir"        16
+                "ir_1_tx"                "ir"        59
+                "ir_2_tx"                "ir"        99
+                "ir_0_rx"                "ir"        17
+                "ir_1_rx"                "ir"        60
+                "ir_2_rx"                "ir"        100
+                "ephy_leds"              "led"       86, 91, 92, 93, 94
+                "ephy0_led"              "led"       86
+                "ephy1_led"              "led"       91
+                "ephy2_led"              "led"       92
+                "ephy3_led"              "led"       93
+                "ephy4_led"              "led"       94
+                "wled"                   "led"       85
+                "par_nand"               "flash"     37, 38, 39, 40, 41, 42, 43,
+                                                     44, 45, 46, 47, 48, 49, 50
+                "snfi"                   "flash"     8, 9, 10, 11, 12, 13
+                "spi_nor"                "flash"     8, 9, 10, 11, 12, 13
+                "pcie0_0_waken"          "pcie"      14
+                "pcie0_1_waken"          "pcie"      79
+                "pcie1_0_waken"          "pcie"      14
+                "pcie0_0_clkreq"         "pcie"      15
+                "pcie0_1_clkreq"         "pcie"      80
+                "pcie1_0_clkreq"         "pcie"      15
+                "pcie0_pad_perst"        "pcie"      83
+                "pcie1_pad_perst"        "pcie"      84
+                "pmic_bus"               "pmic"      71, 72
+                "pwm_ch1_0"              "pwm"       51
+                "pwm_ch1_1"              "pwm"       73
+                "pwm_ch1_2"              "pwm"       95
+                "pwm_ch2_0"              "pwm"       52
+                "pwm_ch2_1"              "pwm"       74
+                "pwm_ch2_2"              "pwm"       96
+                "pwm_ch3_0"              "pwm"       53
+                "pwm_ch3_1"              "pwm"       75
+                "pwm_ch3_2"              "pwm"       97
+                "pwm_ch4_0"              "pwm"       54
+                "pwm_ch4_1"              "pwm"       67
+                "pwm_ch4_2"              "pwm"       76
+                "pwm_ch4_3"              "pwm"       98
+                "pwm_ch5_0"              "pwm"       68
+                "pwm_ch5_1"              "pwm"       77
+                "pwm_ch5_2"              "pwm"       99
+                "pwm_ch6_0"              "pwm"       69
+                "pwm_ch6_1"              "pwm"       78
+                "pwm_ch6_2"              "pwm"       81
+                "pwm_ch6_3"              "pwm"       100
+                "pwm_ch7_0"              "pwm"       70
+                "pwm_ch7_1"              "pwm"       82
+                "pwm_ch7_2"              "pwm"       101
+                "sd_0"                   "sd"        16, 17, 18, 19, 20, 21
+                "sd_1"                   "sd"        25, 26, 27, 28, 29, 30
+                "spic0_0"                "spi"       63, 64, 65, 66
+                "spic0_1"                "spi"       79, 80, 81, 82
+                "spic1_0"                "spi"       67, 68, 69, 70
+                "spic1_1"                "spi"       73, 74, 75, 76
+                "spic2_0_wp_hold"        "spi"       8, 9
+                "spic2_0"                "spi"       10, 11, 12, 13
+                "tdm_0_out_mclk_bclk_ws" "tdm"       8, 9, 10
+                "tdm_0_in_mclk_bclk_ws"  "tdm"       11, 12, 13
+                "tdm_0_out_data"         "tdm"       20
+                "tdm_0_in_data"          "tdm"       21
+                "tdm_1_out_mclk_bclk_ws" "tdm"       57, 58, 59
+                "tdm_1_in_mclk_bclk_ws"  "tdm"       60, 61, 62
+                "tdm_1_out_data"         "tdm"       55
+                "tdm_1_in_data"          "tdm"       56
+                "uart0_0_tx_rx"          "uart"      6, 7
+                "uart1_0_tx_rx"          "uart"      55, 56
+                "uart1_0_rts_cts"        "uart"      57, 58
+                "uart1_1_tx_rx"          "uart"      73, 74
+                "uart1_1_rts_cts"        "uart"      75, 76
+                "uart2_0_tx_rx"          "uart"      3, 4
+                "uart2_0_rts_cts"        "uart"      1, 2
+                "uart2_1_tx_rx"          "uart"      51, 52
+                "uart2_1_rts_cts"        "uart"      53, 54
+                "uart2_2_tx_rx"          "uart"      59, 60
+                "uart2_2_rts_cts"        "uart"      61, 62
+                "uart2_3_tx_rx"          "uart"      95, 96
+                "uart3_0_tx_rx"          "uart"      57, 58
+                "uart3_1_tx_rx"          "uart"      81, 82
+                "uart3_1_rts_cts"        "uart"      79, 80
+                "uart4_0_tx_rx"          "uart"      61, 62
+                "uart4_1_tx_rx"          "uart"      91, 92
+                "uart4_1_rts_cts"        "uart"      93, 94
+                "uart4_2_tx_rx"          "uart"      97, 98
+                "uart4_2_rts_cts"        "uart"      95, 96
+                "watchdog"               "watchdog"  78
+              Valid values for MT7629 are listed below:
+                groups                   function    pins (in pin#)
+                ---------------------------------------------------------------
+                "mdc_mdio"               "eth"       23, 24
+                "i2c_0"                  "i2c"       19, 20
+                "i2c_1"                  "i2c"       53, 54
+                "ephy_leds"              "led"       12, 13, 14, 15, 16, 17, 18
+                "ephy0_led"              "led"       12
+                "ephy1_led"              "led"       13
+                "ephy2_led"              "led"       14
+                "ephy3_led"              "led"       15
+                "ephy4_led"              "led"       16
+                "wf2g_led"               "led"       17
+                "wf5g_led"               "led"       18
+                "snfi"                   "flash"     62, 63, 64, 65, 66, 67
+                "spi_nor"                "flash"     62, 63, 64, 65, 66, 67
+                "pcie_pereset"           "pcie"      51
+                "pcie_wake"              "pcie"      55
+                "pcie_clkreq"            "pcie"      56
+                "pwm_0"                  "pwm"       52
+                "pwm_1"                  "pwm"       61
+                "spi_0"                  "spi"       21, 22, 23, 24
+                "spi_1"                  "spi"       62, 63, 64, 65
+                "spi_wp"                 "spi"       66
+                "spi_hold"               "spi"       67
+                "uart0_txd_rxd"          "uart"      68, 69
+                "uart1_0_txd_rxd"        "uart"      25, 26
+                "uart1_0_cts_rts"        "uart"      27, 28
+                "uart1_1_txd_rxd"        "uart"      53, 54
+                "uart1_1_cts_rts"        "uart"      55, 56
+                "uart2_0_txd_rxd"        "uart"      29, 30
+                "uart2_0_cts_rts"        "uart"      31, 32
+                "uart2_1_txd_rxd"        "uart"      57, 58
+                "uart2_1_cts_rts"        "uart"      59, 60
+                "watchdog"               "watchdog"  11
+                "wf0_2g"                 "wifi"      70, 71, 72, 73, 74, 75, 76,
+                                                     77, 78
+                "wf0_5g"                 "wifi"      0, 1, 2, 3, 4, 5, 6, 7, 8,
+                                                     9, 10
+
+        required:
+          - groups
+          - function
+
+      '-conf*$':
+        type: object
+        description: |
+          pinconf configuration nodes.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          groups:
+            description: |
+              An array of strings. Each string contains the name of a group.
+              Valid values are the same as the pinmux node.
+
+          pins:
+            description: |
+              An array of strings. Each string contains the name of a pin.
+              Valid values for MT7622 are listed below:
+                PIN 0: "GPIO_A"
+                PIN 1: "I2S1_IN"
+                PIN 2: "I2S1_OUT"
+                PIN 3: "I2S_BCLK"
+                PIN 4: "I2S_WS"
+                PIN 5: "I2S_MCLK"
+                PIN 6: "TXD0"
+                PIN 7: "RXD0"
+                PIN 8: "SPI_WP"
+                PIN 9: "SPI_HOLD"
+                PIN 10: "SPI_CLK"
+                PIN 11: "SPI_MOSI"
+                PIN 12: "SPI_MISO"
+                PIN 13: "SPI_CS"
+                PIN 14: "I2C_SDA"
+                PIN 15: "I2C_SCL"
+                PIN 16: "I2S2_IN"
+                PIN 17: "I2S3_IN"
+                PIN 18: "I2S4_IN"
+                PIN 19: "I2S2_OUT"
+                PIN 20: "I2S3_OUT"
+                PIN 21: "I2S4_OUT"
+                PIN 22: "GPIO_B"
+                PIN 23: "MDC"
+                PIN 24: "MDIO"
+                PIN 25: "G2_TXD0"
+                PIN 26: "G2_TXD1"
+                PIN 27: "G2_TXD2"
+                PIN 28: "G2_TXD3"
+                PIN 29: "G2_TXEN"
+                PIN 30: "G2_TXC"
+                PIN 31: "G2_RXD0"
+                PIN 32: "G2_RXD1"
+                PIN 33: "G2_RXD2"
+                PIN 34: "G2_RXD3"
+                PIN 35: "G2_RXDV"
+                PIN 36: "G2_RXC"
+                PIN 37: "NCEB"
+                PIN 38: "NWEB"
+                PIN 39: "NREB"
+                PIN 40: "NDL4"
+                PIN 41: "NDL5"
+                PIN 42: "NDL6"
+                PIN 43: "NDL7"
+                PIN 44: "NRB"
+                PIN 45: "NCLE"
+                PIN 46: "NALE"
+                PIN 47: "NDL0"
+                PIN 48: "NDL1"
+                PIN 49: "NDL2"
+                PIN 50: "NDL3"
+                PIN 51: "MDI_TP_P0"
+                PIN 52: "MDI_TN_P0"
+                PIN 53: "MDI_RP_P0"
+                PIN 54: "MDI_RN_P0"
+                PIN 55: "MDI_TP_P1"
+                PIN 56: "MDI_TN_P1"
+                PIN 57: "MDI_RP_P1"
+                PIN 58: "MDI_RN_P1"
+                PIN 59: "MDI_RP_P2"
+                PIN 60: "MDI_RN_P2"
+                PIN 61: "MDI_TP_P2"
+                PIN 62: "MDI_TN_P2"
+                PIN 63: "MDI_TP_P3"
+                PIN 64: "MDI_TN_P3"
+                PIN 65: "MDI_RP_P3"
+                PIN 66: "MDI_RN_P3"
+                PIN 67: "MDI_RP_P4"
+                PIN 68: "MDI_RN_P4"
+                PIN 69: "MDI_TP_P4"
+                PIN 70: "MDI_TN_P4"
+                PIN 71: "PMIC_SCL"
+                PIN 72: "PMIC_SDA"
+                PIN 73: "SPIC1_CLK"
+                PIN 74: "SPIC1_MOSI"
+                PIN 75: "SPIC1_MISO"
+                PIN 76: "SPIC1_CS"
+                PIN 77: "GPIO_D"
+                PIN 78: "WATCHDOG"
+                PIN 79: "RTS3_N"
+                PIN 80: "CTS3_N"
+                PIN 81: "TXD3"
+                PIN 82: "RXD3"
+                PIN 83: "PERST0_N"
+                PIN 84: "PERST1_N"
+                PIN 85: "WLED_N"
+                PIN 86: "EPHY_LED0_N"
+                PIN 87: "AUXIN0"
+                PIN 88: "AUXIN1"
+                PIN 89: "AUXIN2"
+                PIN 90: "AUXIN3"
+                PIN 91: "TXD4"
+                PIN 92: "RXD4"
+                PIN 93: "RTS4_N"
+                PIN 94: "CST4_N"
+                PIN 95: "PWM1"
+                PIN 96: "PWM2"
+                PIN 97: "PWM3"
+                PIN 98: "PWM4"
+                PIN 99: "PWM5"
+                PIN 100: "PWM6"
+                PIN 101: "PWM7"
+                PIN 102: "GPIO_E"
+              Valid values for MT7629 are listed below:
+                PIN 0: "TOP_5G_CLK"
+                PIN 1: "TOP_5G_DATA"
+                PIN 2: "WF0_5G_HB0"
+                PIN 3: "WF0_5G_HB1"
+                PIN 4: "WF0_5G_HB2"
+                PIN 5: "WF0_5G_HB3"
+                PIN 6: "WF0_5G_HB4"
+                PIN 7: "WF0_5G_HB5"
+                PIN 8: "WF0_5G_HB6"
+                PIN 9: "XO_REQ"
+                PIN 10: "TOP_RST_N"
+                PIN 11: "SYS_WATCHDOG"
+                PIN 12: "EPHY_LED0_N_JTDO"
+                PIN 13: "EPHY_LED1_N_JTDI"
+                PIN 14: "EPHY_LED2_N_JTMS"
+                PIN 15: "EPHY_LED3_N_JTCLK"
+                PIN 16: "EPHY_LED4_N_JTRST_N"
+                PIN 17: "WF2G_LED_N"
+                PIN 18: "WF5G_LED_N"
+                PIN 19: "I2C_SDA"
+                PIN 20: "I2C_SCL"
+                PIN 21: "GPIO_9"
+                PIN 22: "GPIO_10"
+                PIN 23: "GPIO_11"
+                PIN 24: "GPIO_12"
+                PIN 25: "UART1_TXD"
+                PIN 26: "UART1_RXD"
+                PIN 27: "UART1_CTS"
+                PIN 28: "UART1_RTS"
+                PIN 29: "UART2_TXD"
+                PIN 30: "UART2_RXD"
+                PIN 31: "UART2_CTS"
+                PIN 32: "UART2_RTS"
+                PIN 33: "MDI_TP_P1"
+                PIN 34: "MDI_TN_P1"
+                PIN 35: "MDI_RP_P1"
+                PIN 36: "MDI_RN_P1"
+                PIN 37: "MDI_RP_P2"
+                PIN 38: "MDI_RN_P2"
+                PIN 39: "MDI_TP_P2"
+                PIN 40: "MDI_TN_P2"
+                PIN 41: "MDI_TP_P3"
+                PIN 42: "MDI_TN_P3"
+                PIN 43: "MDI_RP_P3"
+                PIN 44: "MDI_RN_P3"
+                PIN 45: "MDI_RP_P4"
+                PIN 46: "MDI_RN_P4"
+                PIN 47: "MDI_TP_P4"
+                PIN 48: "MDI_TN_P4"
+                PIN 49: "SMI_MDC"
+                PIN 50: "SMI_MDIO"
+                PIN 51: "PCIE_PERESET_N"
+                PIN 52: "PWM_0"
+                PIN 53: "GPIO_0"
+                PIN 54: "GPIO_1"
+                PIN 55: "GPIO_2"
+                PIN 56: "GPIO_3"
+                PIN 57: "GPIO_4"
+                PIN 58: "GPIO_5"
+                PIN 59: "GPIO_6"
+                PIN 60: "GPIO_7"
+                PIN 61: "GPIO_8"
+                PIN 62: "SPI_CLK"
+                PIN 63: "SPI_CS"
+                PIN 64: "SPI_MOSI"
+                PIN 65: "SPI_MISO"
+                PIN 66: "SPI_WP"
+                PIN 67: "SPI_HOLD"
+                PIN 68: "UART0_TXD"
+                PIN 69: "UART0_RXD"
+                PIN 70: "TOP_2G_CLK"
+                PIN 71: "TOP_2G_DATA"
+                PIN 72: "WF0_2G_HB0"
+                PIN 73: "WF0_2G_HB1"
+                PIN 74: "WF0_2G_HB2"
+                PIN 75: "WF0_2G_HB3"
+                PIN 76: "WF0_2G_HB4"
+                PIN 77: "WF0_2G_HB5"
+                PIN 78: "WF0_2G_HB6"
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            enum: [4, 8, 12, 16]
+
+          slew-rate:
+            enum: [0, 1]
+
+          mediatek,tdsel:
+            description: |
+              An integer describing the steps for output level shifter duty
+              cycle when asserted (high pulse width adjustment). Valid arguments
+              are from 0 to 15.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          mediatek,rdsel:
+            description: |
+              An integer describing the steps for input level shifter duty cycle
+              when asserted (high pulse width adjustment). Valid arguments are
+              from 0 to 63.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        required:
+          - groups
+          - pins
+
+        additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@10211000 {
+          compatible = "mediatek,mt7622-pinctrl";
+          reg = <0 0x10211000 0 0x1000>;
+          gpio-controller;
+          #gpio-cells = <2>;
+
+          pinctrl_eth_default: eth-0 {
+            mux-mdio {
+              groups = "mdc_mdio";
+              function = "eth";
+              drive-strength = <12>;
+            };
+
+            mux-gmac2 {
+              groups = "gmac2";
+              function = "eth";
+              drive-strength = <12>;
+            };
+
+            mux-esw {
+              groups = "esw";
+              function = "eth";
+              drive-strength = <8>;
+            };
+
+            conf-mdio {
+              pins = "MDC";
+              bias-pull-up;
+            };
+          };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
new file mode 100644
index 0000000000000..9b2cbba8dfd7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -0,0 +1,230 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8183 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Andy Teng <andy.teng@mediatek.com>
+
+description: |+
+  The MediaTek's MT8183 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8183-pinctrl
+
+  reg:
+    minItems: 10
+    maxItems: 10
+
+  reg-names:
+    items:
+      - const: "iocfg0"
+      - const: "iocfg1"
+      - const: "iocfg2"
+      - const: "iocfg3"
+      - const: "iocfg4"
+      - const: "iocfg5"
+      - const: "iocfg6"
+      - const: "iocfg7"
+      - const: "iocfg8"
+      - const: "eint"
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 5
+    description: |
+      GPIO valid number range.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: |
+      The interrupt outputs to sysirq.
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+
+patternProperties:
+  '-[0-9]*$':
+    type: object
+    patternProperties:
+      '-pins*$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in <soc>-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          mediatek,drive-strength-adv:
+            description: |
+              Describe the specific driving setup property.
+              For I2C pins, the existing generic driving setup can only support
+              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
+              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
+              driving setup, the existing generic setup will be disabled.
+              The specific driving setup is controlled by E1E0EN.
+              When E1=0/E0=0, the strength is 0.125mA.
+              When E1=0/E0=1, the strength is 0.25mA.
+              When E1=1/E0=0, the strength is 0.5mA.
+              When E1=1/E0=1, the strength is 1mA.
+              EN is used to enable or disable the specific driving setup.
+              Valid arguments are described as below:
+              0: (E1, E0, EN) = (0, 0, 0)
+              1: (E1, E0, EN) = (0, 0, 1)
+              2: (E1, E0, EN) = (0, 1, 0)
+              3: (E1, E0, EN) = (0, 1, 1)
+              4: (E1, E0, EN) = (1, 0, 0)
+              5: (E1, E0, EN) = (1, 0, 1)
+              6: (E1, E0, EN) = (1, 1, 0)
+              7: (E1, E0, EN) = (1, 1, 1)
+              So the valid arguments are from 0 to 7.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,tdsel:
+            description: |
+              An integer describing the steps for output level shifter duty
+              cycle when asserted (high pulse width adjustment). Valid arguments
+              are from 0 to 15.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          mediatek,rdsel:
+            description: |
+              An integer describing the steps for input level shifter duty cycle
+              when asserted (high pulse width adjustment). Valid arguments are
+              from 0 to 63.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@10005000 {
+          compatible = "mediatek,mt8183-pinctrl";
+          reg = <0 0x10005000 0 0x1000>,
+                <0 0x11f20000 0 0x1000>,
+                <0 0x11e80000 0 0x1000>,
+                <0 0x11e70000 0 0x1000>,
+                <0 0x11e90000 0 0x1000>,
+                <0 0x11d30000 0 0x1000>,
+                <0 0x11d20000 0 0x1000>,
+                <0 0x11c50000 0 0x1000>,
+                <0 0x11f30000 0 0x1000>,
+                <0 0x1000b000 0 0x1000>;
+          reg-names = "iocfg0", "iocfg1", "iocfg2",
+                "iocfg3", "iocfg4", "iocfg5",
+                "iocfg6", "iocfg7", "iocfg8",
+                "eint";
+          gpio-controller;
+          #gpio-cells = <2>;
+          gpio-ranges = <&pio 0 0 192>;
+          interrupt-controller;
+          interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+          #interrupt-cells = <2>;
+
+          i2c0_pins_a: i2c-0 {
+            pins1 {
+              pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
+                <PINMUX_GPIO49__FUNC_SDA5>;
+              mediatek,pull-up-adv = <3>;
+              mediatek,drive-strength-adv = <7>;
+            };
+          };
+
+          i2c1_pins_a: i2c-1 {
+            pins {
+              pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
+                <PINMUX_GPIO51__FUNC_SDA3>;
+              mediatek,pull-down-adv = <2>;
+              mediatek,drive-strength-adv = <4>;
+            };
+          };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
deleted file mode 100644
index 5fe2c26c28bf1..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ /dev/null
@@ -1,156 +0,0 @@
-* Mediatek MT65XX Pin Controller
-
-The Mediatek's Pin controller is used to control SoC pins.
-
-Required properties:
-- compatible: value should be one of the following.
-	"mediatek,mt2701-pinctrl", compatible with mt2701 pinctrl.
-	"mediatek,mt2712-pinctrl", compatible with mt2712 pinctrl.
-	"mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
-	"mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.
-	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
-	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
-	"mediatek,mt8167-pinctrl", compatible with mt8167 pinctrl.
-	"mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
-	"mediatek,mt8365-pinctrl", compatible with mt8365 pinctrl.
-	"mediatek,mt8516-pinctrl", compatible with mt8516 pinctrl.
-- pins-are-numbered: Specify the subnodes are using numbered pinmux to
-  specify pins.
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
-  binding is used, the amount of cells must be specified as 2. See the below
-  mentioned gpio binding representation for description of particular cells.
-
-	Eg: <&pio 6 0>
-	<[phandle of the gpio controller node]
-	[line number within the gpio controller]
-	[flags]>
-
-	Values for gpio specifier:
-	- Line number: is a value between 0 to 202.
-	- Flags:  bit field of flags, as defined in <dt-bindings/gpio/gpio.h>.
-            Only the following flags are supported:
-            0 - GPIO_ACTIVE_HIGH
-            1 - GPIO_ACTIVE_LOW
-
-Optional properties:
-- mediatek,pctl-regmap: Should be a phandle of the syscfg node.
-- reg: physicall address base for EINT registers
-- interrupt-controller: Marks the device node as an interrupt controller
-- #interrupt-cells: Should be two.
-- interrupts : The interrupt outputs from the controller.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-
-Subnode format
-A pinctrl node should contain at least one subnodes representing the
-pinctrl groups available on the machine. Each subnode will list the
-pins it needs, and how they should be configured, with regard to muxer
-configuration, pullups, drive strength, input enable/disable and input schmitt.
-
-    node {
-	pinmux = <PIN_NUMBER_PINMUX>;
-	GENERIC_PINCONFIG;
-    };
-
-Required properties:
-- pinmux: integer array, represents gpio pin number and mux setting.
-    Supported pin number and mux varies for different SoCs, and are defined
-    as macros in boot/dts/<soc>-pinfunc.h directly.
-
-Optional properties:
-- GENERIC_PINCONFIG: is the generic pinconfig options to use, bias-disable,
-    bias-pull-down, bias-pull-up, input-enable, input-disable, output-low, output-high,
-    input-schmitt-enable, input-schmitt-disable and drive-strength are valid.
-
-    Some special pins have extra pull up strength, there are R0 and R1 pull-up
-    resistors available, but for user, it's only need to set R1R0 as 00, 01, 10 or 11.
-    So when config bias-pull-up, it support arguments for those special pins.
-    Some macros have been defined for this usage, such as MTK_PUPD_SET_R1R0_00.
-    See dt-bindings/pinctrl/mt65xx.h.
-
-    When config drive-strength, it can support some arguments, such as
-    MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
-
-Examples:
-
-#include "mt8135-pinfunc.h"
-
-...
-{
-	syscfg_pctl_a: syscfg-pctl-a@10005000 {
-		compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
-		reg = <0 0x10005000 0 0x1000>;
-	};
-
-	syscfg_pctl_b: syscfg-pctl-b@1020c020 {
-		compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
-		reg = <0 0x1020C020 0 0x1000>;
-	};
-
-	pinctrl@1c20800 {
-		compatible = "mediatek,mt8135-pinctrl";
-		reg = <0 0x1000B000 0 0x1000>;
-		mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
-		pins-are-numbered;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-
-		i2c0_pins_a: i2c0@0 {
-			pins1 {
-				pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
-					 <MT8135_PIN_101_SCL0__FUNC_SCL0>;
-				bias-disable;
-			};
-		};
-
-		i2c1_pins_a: i2c1@0 {
-			pins {
-				pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
-					 <MT8135_PIN_196_SCL1__FUNC_SCL1>;
-				bias-pull-up = <55>;
-			};
-		};
-
-		i2c2_pins_a: i2c2@0 {
-			pins1 {
-				pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
-				bias-pull-down;
-			};
-
-			pins2 {
-				pinmux = <MT8135_PIN_49_WATCHDOG__FUNC_GPIO49>;
-				bias-pull-up;
-			};
-		};
-
-		i2c3_pins_a: i2c3@0 {
-			pins1 {
-				pinmux = <MT8135_PIN_40_DAC_CLK__FUNC_GPIO40>,
-					 <MT8135_PIN_41_DAC_WS__FUNC_GPIO41>;
-				bias-pull-up = <55>;
-			};
-
-			pins2 {
-				pinmux = <MT8135_PIN_35_SCL3__FUNC_SCL3>,
-					 <MT8135_PIN_36_SDA3__FUNC_SDA3>;
-				output-low;
-				bias-pull-up = <55>;
-			};
-
-			pins3 {
-				pinmux = <MT8135_PIN_57_JTCK__FUNC_GPIO57>,
-					 <MT8135_PIN_60_JTDI__FUNC_JTDI>;
-				drive-strength = <32>;
-			};
-		};
-
-		...
-	}
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
deleted file mode 100644
index bd83401e6179a..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-* MediaTek MT6797 Pin Controller
-
-The MediaTek's MT6797 Pin controller is used to control SoC pins.
-
-Required properties:
-- compatible: Value should be one of the following.
-              "mediatek,mt6797-pinctrl", compatible with mt6797 pinctrl.
-- reg:        Should contain address and size for gpio, iocfgl, iocfgb,
-              iocfgr and iocfgt register bases.
-- reg-names:  An array of strings describing the "reg" entries. Must
-              contain "gpio", "iocfgl", "iocfgb", "iocfgr", "iocfgt".
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be two. The first cell is the gpio pin number
-               and the second cell is used for optional parameters.
-
-Optional properties:
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Should be two.
-- interrupts : The interrupt outputs from the controller.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-
-Subnode format
-A pinctrl node should contain at least one subnodes representing the
-pinctrl groups available on the machine. Each subnode will list the
-pins it needs, and how they should be configured, with regard to muxer
-configuration, pullups, drive strength, input enable/disable and input schmitt.
-
-    node {
-        pinmux = <PIN_NUMBER_PINMUX>;
-        GENERIC_PINCONFIG;
-    };
-
-Required properties:
-- pinmux: Integer array, represents gpio pin number and mux setting.
-    Supported pin number and mux varies for different SoCs, and are defined
-    as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
-
-Optional properties:
-- GENERIC_PINCONFIG: is the generic pinconfig options to use, bias-disable,
-    bias-pull, bias-pull-down, input-enable, input-schmitt-enable,
-    input-schmitt-disable, output-enable output-low, output-high,
-    drive-strength, and slew-rate are valid.
-
-    Valid arguments for 'slew-rate' are '0' for no slew rate controlled and
-    '1' for slower slew rate respectively. Valid arguments for 'drive-strength'
-    is limited, such as 2, 4, 8, 12, or 16 in mA.
-
-    Some optional vendor properties as defined are valid to specify in a
-    pinconf subnode:
-    - mediatek,tdsel: An integer describing the steps for output level shifter
-      duty cycle when asserted (high pulse width adjustment). Valid arguments
-      are from 0 to 15.
-    - mediatek,rdsel: An integer describing the steps for input level shifter
-      duty cycle when asserted (high pulse width adjustment). Valid arguments
-      are from 0 to 63.
-    - mediatek,pull-up-adv: An integer describing the code R1R0 as 0, 1, 2
-      or 3 for the advanced pull-up resistors.
-    - mediatek,pull-down-adv: An integer describing the code R1R0 as 0, 1, 2,
-      or 3 for the advanced pull-down resistors.
-
-Examples:
-
-        pio: pinctrl@10005000 {
-                compatible = "mediatek,mt6797-pinctrl";
-                reg = <0 0x10005000 0 0x1000>,
-                      <0 0x10002000 0 0x400>,
-                      <0 0x10002400 0 0x400>,
-                      <0 0x10002800 0 0x400>,
-                      <0 0x10002C00 0 0x400>;
-                reg-names = "gpio", "iocfgl", "iocfgb",
-                            "iocfgr", "iocfgt";
-                gpio-controller;
-                #gpio-cells = <2>;
-
-                uart1_pins_a: uart1 {
-                        pins1 {
-                                pinmux = <MT6797_GPIO232__FUNC_URXD1>,
-                                         <MT6797_GPIO233__FUNC_UTXD1>;
-                        };
-                };
-        };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
deleted file mode 100644
index 7a7aca1ed705b..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
+++ /dev/null
@@ -1,490 +0,0 @@
-== MediaTek MT7622 pinctrl controller ==
-
-Required properties for the root node:
- - compatible: Should be one of the following
-	       "mediatek,mt7622-pinctrl" for MT7622 SoC
-	       "mediatek,mt7629-pinctrl" for MT7629 SoC
- - reg: offset and length of the pinctrl space
-
- - gpio-controller: Marks the device node as a GPIO controller.
- - #gpio-cells: Should be two. The first cell is the pin number and the
-   second is the GPIO flags.
-
-Optional properties:
-- interrupt-controller  : Marks the device node as an interrupt controller
-
-If the property interrupt-controller is defined, following property is required
-- reg-names: A string describing the "reg" entries. Must contain "eint".
-- interrupts : The interrupt output from the controller.
-- #interrupt-cells: Should be two.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-MT7622 pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, slew rate, etc.
-
-We support 2 types of configuration nodes. Those nodes can be either pinmux
-nodes or pinconf nodes. Each configuration node can consist of multiple nodes
-describing the pinmux and pinconf options.
-
-The name of each subnode doesn't matter as long as it is unique; all subnodes
-should be enumerated and processed purely based on their content.
-
-== pinmux nodes content ==
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pinmux subnode:
-
-Required properties are:
- - groups: An array of strings. Each string contains the name of a group.
-  Valid values for these names are listed below.
- - function: A string containing the name of the function to mux to the
-  group. Valid values for function names are listed below.
-
-== pinconf nodes content ==
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pinconf subnode:
-
-Required properties are:
- - pins: An array of strings. Each string contains the name of a pin.
-  Valid values for these names are listed below.
- - groups: An array of strings. Each string contains the name of a group.
-  Valid values for these names are listed below.
-
-Optional properies are:
- bias-disable, bias-pull, bias-pull-down, input-enable,
- input-schmitt-enable, input-schmitt-disable, output-enable
- output-low, output-high, drive-strength, slew-rate
-
- Valid arguments for 'slew-rate' are '0' for no slew rate controlled and '1' for
- slower slew rate respectively.
- Valid arguments for 'drive-strength', 4, 8, 12, or 16 in mA.
-
-The following specific properties as defined are valid to specify in a pinconf
-subnode:
-
-Optional properties are:
- - mediatek,tdsel: An integer describing the steps for output level shifter duty
-   cycle when asserted (high pulse width adjustment). Valid arguments are from 0
-   to 15.
- - mediatek,rdsel: An integer describing the steps for input level shifter duty
-   cycle when asserted (high pulse width adjustment). Valid arguments are from 0
-   to 63.
-
-== Valid values for pins, function and groups on MT7622 ==
-
-Valid values for pins are:
-pins can be referenced via the pin names as the below table shown and the
-related physical number is also put ahead of those names which helps cross
-references to pins between groups to know whether pins assignment conflict
-happens among devices try to acquire those available pins.
-
-	Pin #:  Valid values for pins
-	-----------------------------
-	PIN 0: "GPIO_A"
-	PIN 1: "I2S1_IN"
-	PIN 2: "I2S1_OUT"
-	PIN 3: "I2S_BCLK"
-	PIN 4: "I2S_WS"
-	PIN 5: "I2S_MCLK"
-	PIN 6: "TXD0"
-	PIN 7: "RXD0"
-	PIN 8: "SPI_WP"
-	PIN 9: "SPI_HOLD"
-	PIN 10: "SPI_CLK"
-	PIN 11: "SPI_MOSI"
-	PIN 12: "SPI_MISO"
-	PIN 13: "SPI_CS"
-	PIN 14: "I2C_SDA"
-	PIN 15: "I2C_SCL"
-	PIN 16: "I2S2_IN"
-	PIN 17: "I2S3_IN"
-	PIN 18: "I2S4_IN"
-	PIN 19: "I2S2_OUT"
-	PIN 20: "I2S3_OUT"
-	PIN 21: "I2S4_OUT"
-	PIN 22: "GPIO_B"
-	PIN 23: "MDC"
-	PIN 24: "MDIO"
-	PIN 25: "G2_TXD0"
-	PIN 26: "G2_TXD1"
-	PIN 27: "G2_TXD2"
-	PIN 28: "G2_TXD3"
-	PIN 29: "G2_TXEN"
-	PIN 30: "G2_TXC"
-	PIN 31: "G2_RXD0"
-	PIN 32: "G2_RXD1"
-	PIN 33: "G2_RXD2"
-	PIN 34: "G2_RXD3"
-	PIN 35: "G2_RXDV"
-	PIN 36: "G2_RXC"
-	PIN 37: "NCEB"
-	PIN 38: "NWEB"
-	PIN 39: "NREB"
-	PIN 40: "NDL4"
-	PIN 41: "NDL5"
-	PIN 42: "NDL6"
-	PIN 43: "NDL7"
-	PIN 44: "NRB"
-	PIN 45: "NCLE"
-	PIN 46: "NALE"
-	PIN 47: "NDL0"
-	PIN 48: "NDL1"
-	PIN 49: "NDL2"
-	PIN 50: "NDL3"
-	PIN 51: "MDI_TP_P0"
-	PIN 52: "MDI_TN_P0"
-	PIN 53: "MDI_RP_P0"
-	PIN 54: "MDI_RN_P0"
-	PIN 55: "MDI_TP_P1"
-	PIN 56: "MDI_TN_P1"
-	PIN 57: "MDI_RP_P1"
-	PIN 58: "MDI_RN_P1"
-	PIN 59: "MDI_RP_P2"
-	PIN 60: "MDI_RN_P2"
-	PIN 61: "MDI_TP_P2"
-	PIN 62: "MDI_TN_P2"
-	PIN 63: "MDI_TP_P3"
-	PIN 64: "MDI_TN_P3"
-	PIN 65: "MDI_RP_P3"
-	PIN 66: "MDI_RN_P3"
-	PIN 67: "MDI_RP_P4"
-	PIN 68: "MDI_RN_P4"
-	PIN 69: "MDI_TP_P4"
-	PIN 70: "MDI_TN_P4"
-	PIN 71: "PMIC_SCL"
-	PIN 72: "PMIC_SDA"
-	PIN 73: "SPIC1_CLK"
-	PIN 74: "SPIC1_MOSI"
-	PIN 75: "SPIC1_MISO"
-	PIN 76: "SPIC1_CS"
-	PIN 77: "GPIO_D"
-	PIN 78: "WATCHDOG"
-	PIN 79: "RTS3_N"
-	PIN 80: "CTS3_N"
-	PIN 81: "TXD3"
-	PIN 82: "RXD3"
-	PIN 83: "PERST0_N"
-	PIN 84: "PERST1_N"
-	PIN 85: "WLED_N"
-	PIN 86: "EPHY_LED0_N"
-	PIN 87: "AUXIN0"
-	PIN 88: "AUXIN1"
-	PIN 89: "AUXIN2"
-	PIN 90: "AUXIN3"
-	PIN 91: "TXD4"
-	PIN 92: "RXD4"
-	PIN 93: "RTS4_N"
-	PIN 94: "CST4_N"
-	PIN 95: "PWM1"
-	PIN 96: "PWM2"
-	PIN 97: "PWM3"
-	PIN 98: "PWM4"
-	PIN 99: "PWM5"
-	PIN 100: "PWM6"
-	PIN 101: "PWM7"
-	PIN 102: "GPIO_E"
-
-Valid values for function are:
-	"emmc", "eth", "i2c", "i2s", "ir", "led", "flash", "pcie",
-	"pmic", "pwm", "sd", "spi", "tdm", "uart", "watchdog"
-
-Valid values for groups are:
-additional data is put followingly with valid value allowing us to know which
-applicable function and which relevant pins (in pin#) are able applied for that
-group.
-
-	Valid value			function	pins (in pin#)
-	-------------------------------------------------------------------------
-	"emmc"				"emmc"		40, 41, 42, 43, 44, 45,
-							47, 48, 49, 50
-	"emmc_rst"			"emmc"		37
-	"esw"				"eth"		51, 52, 53, 54, 55, 56,
-							57, 58, 59, 60, 61, 62,
-							63, 64, 65, 66, 67, 68,
-							69, 70
-	"esw_p0_p1"			"eth"		51, 52, 53, 54, 55, 56,
-							57, 58
-	"esw_p2_p3_p4"			"eth"		59, 60, 61, 62, 63, 64,
-							65, 66, 67, 68, 69, 70
-	"rgmii_via_esw"			"eth"		59, 60, 61, 62, 63, 64,
-							65, 66, 67, 68, 69, 70
-	"rgmii_via_gmac1"		"eth"		59, 60, 61, 62, 63, 64,
-							65, 66, 67, 68, 69, 70
-	"rgmii_via_gmac2"		"eth"		25, 26, 27, 28, 29, 30,
-							31, 32, 33, 34, 35, 36
-	"mdc_mdio"			"eth"		23, 24
-	"i2c0"				"i2c"		14, 15
-	"i2c1_0"			"i2c"		55, 56
-	"i2c1_1"			"i2c"		73, 74
-	"i2c1_2"			"i2c"		87, 88
-	"i2c2_0"			"i2c"		57, 58
-	"i2c2_1"			"i2c"		75, 76
-	"i2c2_2"			"i2c"		89, 90
-	"i2s_in_mclk_bclk_ws"		"i2s"		3, 4, 5
-	"i2s1_in_data"			"i2s"		1
-	"i2s2_in_data"			"i2s"		16
-	"i2s3_in_data"			"i2s"		17
-	"i2s4_in_data"			"i2s"		18
-	"i2s_out_mclk_bclk_ws"		"i2s"		3, 4, 5
-	"i2s1_out_data"			"i2s"		2
-	"i2s2_out_data"			"i2s"		19
-	"i2s3_out_data"			"i2s"		20
-	"i2s4_out_data"			"i2s"		21
-	"ir_0_tx"			"ir"		16
-	"ir_1_tx"			"ir"		59
-	"ir_2_tx"			"ir"		99
-	"ir_0_rx"			"ir"		17
-	"ir_1_rx"			"ir"		60
-	"ir_2_rx"			"ir"		100
-	"ephy_leds"			"led"		86, 91, 92, 93, 94
-	"ephy0_led"			"led"		86
-	"ephy1_led"			"led"		91
-	"ephy2_led"			"led"		92
-	"ephy3_led"			"led"		93
-	"ephy4_led"			"led"		94
-	"wled"				"led"		85
-	"par_nand"			"flash"		37, 38, 39, 40, 41, 42,
-							43, 44, 45, 46, 47, 48,
-							49, 50
-	"snfi"				"flash"		8, 9, 10, 11, 12, 13
-	"spi_nor"			"flash"		8, 9, 10, 11, 12, 13
-	"pcie0_0_waken"			"pcie"		14
-	"pcie0_1_waken"			"pcie"		79
-	"pcie1_0_waken"			"pcie"		14
-	"pcie0_0_clkreq"		"pcie"		15
-	"pcie0_1_clkreq"		"pcie"		80
-	"pcie1_0_clkreq"		"pcie"		15
-	"pcie0_pad_perst"		"pcie"		83
-	"pcie1_pad_perst"		"pcie"		84
-	"pmic_bus"			"pmic"		71, 72
-	"pwm_ch1_0"			"pwm"		51
-	"pwm_ch1_1"			"pwm"		73
-	"pwm_ch1_2"			"pwm"		95
-	"pwm_ch2_0"			"pwm"		52
-	"pwm_ch2_1"			"pwm"		74
-	"pwm_ch2_2"			"pwm"		96
-	"pwm_ch3_0"			"pwm"		53
-	"pwm_ch3_1"			"pwm"		75
-	"pwm_ch3_2"			"pwm"		97
-	"pwm_ch4_0"			"pwm"		54
-	"pwm_ch4_1"			"pwm"		67
-	"pwm_ch4_2"			"pwm"		76
-	"pwm_ch4_3"			"pwm"		98
-	"pwm_ch5_0"			"pwm"		68
-	"pwm_ch5_1"			"pwm"		77
-	"pwm_ch5_2"			"pwm"		99
-	"pwm_ch6_0"			"pwm"		69
-	"pwm_ch6_1"			"pwm"		78
-	"pwm_ch6_2"			"pwm"		81
-	"pwm_ch6_3"			"pwm"		100
-	"pwm_ch7_0"			"pwm"		70
-	"pwm_ch7_1"			"pwm"		82
-	"pwm_ch7_2"			"pwm"		101
-	"sd_0"				"sd"		16, 17, 18, 19, 20, 21
-	"sd_1"				"sd"		25, 26, 27, 28, 29, 30
-	"spic0_0"			"spi"		63, 64, 65, 66
-	"spic0_1"			"spi"		79, 80, 81, 82
-	"spic1_0"			"spi"		67, 68, 69, 70
-	"spic1_1"			"spi"		73, 74, 75, 76
-	"spic2_0_wp_hold"		"spi"		8, 9
-	"spic2_0"			"spi"		10, 11, 12, 13
-	"tdm_0_out_mclk_bclk_ws"	"tdm"		8, 9, 10
-	"tdm_0_in_mclk_bclk_ws"		"tdm"		11, 12, 13
-	"tdm_0_out_data"		"tdm"		20
-	"tdm_0_in_data"			"tdm"		21
-	"tdm_1_out_mclk_bclk_ws"	"tdm"		57, 58, 59
-	"tdm_1_in_mclk_bclk_ws"		"tdm"		60, 61, 62
-	"tdm_1_out_data"		"tdm"		55
-	"tdm_1_in_data"			"tdm"		56
-	"uart0_0_tx_rx"			"uart"		6, 7
-	"uart1_0_tx_rx"			"uart"		55, 56
-	"uart1_0_rts_cts"		"uart"		57, 58
-	"uart1_1_tx_rx"			"uart"		73, 74
-	"uart1_1_rts_cts"		"uart"		75, 76
-	"uart2_0_tx_rx"			"uart"		3, 4
-	"uart2_0_rts_cts"		"uart"		1, 2
-	"uart2_1_tx_rx"			"uart"		51, 52
-	"uart2_1_rts_cts"		"uart"		53, 54
-	"uart2_2_tx_rx"			"uart"		59, 60
-	"uart2_2_rts_cts"		"uart"		61, 62
-	"uart2_3_tx_rx"			"uart"		95, 96
-	"uart3_0_tx_rx"			"uart"		57, 58
-	"uart3_1_tx_rx"			"uart"		81, 82
-	"uart3_1_rts_cts"		"uart"		79, 80
-	"uart4_0_tx_rx"			"uart"		61, 62
-	"uart4_1_tx_rx"			"uart"		91, 92
-	"uart4_1_rts_cts"		"uart"		93, 94
-	"uart4_2_tx_rx"			"uart"		97, 98
-	"uart4_2_rts_cts"		"uart"		95, 96
-	"watchdog"			"watchdog"	78
-
-
-== Valid values for pins, function and groups on MT7629 ==
-
-	Pin #:  Valid values for pins
-	-----------------------------
-	PIN 0: "TOP_5G_CLK"
-	PIN 1: "TOP_5G_DATA"
-	PIN 2: "WF0_5G_HB0"
-	PIN 3: "WF0_5G_HB1"
-	PIN 4: "WF0_5G_HB2"
-	PIN 5: "WF0_5G_HB3"
-	PIN 6: "WF0_5G_HB4"
-	PIN 7: "WF0_5G_HB5"
-	PIN 8: "WF0_5G_HB6"
-	PIN 9: "XO_REQ"
-	PIN 10: "TOP_RST_N"
-	PIN 11: "SYS_WATCHDOG"
-	PIN 12: "EPHY_LED0_N_JTDO"
-	PIN 13: "EPHY_LED1_N_JTDI"
-	PIN 14: "EPHY_LED2_N_JTMS"
-	PIN 15: "EPHY_LED3_N_JTCLK"
-	PIN 16: "EPHY_LED4_N_JTRST_N"
-	PIN 17: "WF2G_LED_N"
-	PIN 18: "WF5G_LED_N"
-	PIN 19: "I2C_SDA"
-	PIN 20: "I2C_SCL"
-	PIN 21: "GPIO_9"
-	PIN 22: "GPIO_10"
-	PIN 23: "GPIO_11"
-	PIN 24: "GPIO_12"
-	PIN 25: "UART1_TXD"
-	PIN 26: "UART1_RXD"
-	PIN 27: "UART1_CTS"
-	PIN 28: "UART1_RTS"
-	PIN 29: "UART2_TXD"
-	PIN 30: "UART2_RXD"
-	PIN 31: "UART2_CTS"
-	PIN 32: "UART2_RTS"
-	PIN 33: "MDI_TP_P1"
-	PIN 34: "MDI_TN_P1"
-	PIN 35: "MDI_RP_P1"
-	PIN 36: "MDI_RN_P1"
-	PIN 37: "MDI_RP_P2"
-	PIN 38: "MDI_RN_P2"
-	PIN 39: "MDI_TP_P2"
-	PIN 40: "MDI_TN_P2"
-	PIN 41: "MDI_TP_P3"
-	PIN 42: "MDI_TN_P3"
-	PIN 43: "MDI_RP_P3"
-	PIN 44: "MDI_RN_P3"
-	PIN 45: "MDI_RP_P4"
-	PIN 46: "MDI_RN_P4"
-	PIN 47: "MDI_TP_P4"
-	PIN 48: "MDI_TN_P4"
-	PIN 49: "SMI_MDC"
-	PIN 50: "SMI_MDIO"
-	PIN 51: "PCIE_PERESET_N"
-	PIN 52: "PWM_0"
-	PIN 53: "GPIO_0"
-	PIN 54: "GPIO_1"
-	PIN 55: "GPIO_2"
-	PIN 56: "GPIO_3"
-	PIN 57: "GPIO_4"
-	PIN 58: "GPIO_5"
-	PIN 59: "GPIO_6"
-	PIN 60: "GPIO_7"
-	PIN 61: "GPIO_8"
-	PIN 62: "SPI_CLK"
-	PIN 63: "SPI_CS"
-	PIN 64: "SPI_MOSI"
-	PIN 65: "SPI_MISO"
-	PIN 66: "SPI_WP"
-	PIN 67: "SPI_HOLD"
-	PIN 68: "UART0_TXD"
-	PIN 69: "UART0_RXD"
-	PIN 70: "TOP_2G_CLK"
-	PIN 71: "TOP_2G_DATA"
-	PIN 72: "WF0_2G_HB0"
-	PIN 73: "WF0_2G_HB1"
-	PIN 74: "WF0_2G_HB2"
-	PIN 75: "WF0_2G_HB3"
-	PIN 76: "WF0_2G_HB4"
-	PIN 77: "WF0_2G_HB5"
-	PIN 78: "WF0_2G_HB6"
-
-Valid values for function are:
-	"eth", "i2c", "led", "flash", "pcie", "pwm", "spi", "uart",
-	"watchdog", "wifi"
-
-Valid values for groups are:
-	Valid value			function	pins (in pin#)
-	----------------------------------------------------------------
-	"mdc_mdio"			"eth"		23, 24
-	"i2c_0"				"i2c"		19, 20
-	"i2c_1"				"i2c"		53, 54
-	"ephy_leds"			"led"		12, 13, 14, 15, 16,
-							17, 18
-	"ephy0_led"			"led"		12
-	"ephy1_led"			"led"		13
-	"ephy2_led"			"led"		14
-	"ephy3_led"			"led"		15
-	"ephy4_led"			"led"		16
-	"wf2g_led"			"led"		17
-	"wf5g_led"			"led"		18
-	"snfi"				"flash"		62, 63, 64, 65, 66, 67
-	"spi_nor"			"flash"		62, 63, 64, 65, 66, 67
-	"pcie_pereset"			"pcie"		51
-	"pcie_wake"			"pcie"		55
-	"pcie_clkreq"			"pcie"		56
-	"pwm_0"				"pwm"		52
-	"pwm_1"				"pwm"		61
-	"spi_0"				"spi"		21, 22, 23, 24
-	"spi_1"				"spi"		62, 63, 64, 65
-	"spi_wp"			"spi"		66
-	"spi_hold"			"spi"		67
-	"uart0_txd_rxd"			"uart"		68, 69
-	"uart1_0_txd_rxd"		"uart"		25, 26
-	"uart1_0_cts_rts"		"uart"		27, 28
-	"uart1_1_txd_rxd"		"uart"		53, 54
-	"uart1_1_cts_rts"		"uart"		55, 56
-	"uart2_0_txd_rxd"		"uart"		29, 30
-	"uart2_0_cts_rts"		"uart"		31, 32
-	"uart2_1_txd_rxd"		"uart"		57, 58
-	"uart2_1_cts_rts"		"uart"		59, 60
-	"watchdog"			"watchdog"	11
-	"wf0_2g"			"wifi"		70, 71, 72, 73, 74,
-							75, 76, 77, 78
-	"wf0_5g"			"wifi"		0, 1, 2, 3, 4, 5, 6,
-							7, 8, 9, 10
-
-Example:
-
-	pio: pinctrl@10211000 {
-		compatible = "mediatek,mt7622-pinctrl";
-		reg = <0 0x10211000 0 0x1000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		pinctrl_eth_default: eth-default {
-			mux-mdio {
-				groups = "mdc_mdio";
-				function = "eth";
-				drive-strength = <12>;
-			};
-
-			mux-gmac2 {
-				groups = "gmac2";
-				function = "eth";
-				drive-strength = <12>;
-			};
-
-			mux-esw {
-				groups = "esw";
-				function = "eth";
-				drive-strength = <8>;
-			};
-
-			conf-mdio {
-				pins = "MDC";
-				bias-pull-up;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
deleted file mode 100644
index eccbe3f55d3f3..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
+++ /dev/null
@@ -1,132 +0,0 @@
-* Mediatek MT8183 Pin Controller
-
-The Mediatek's Pin controller is used to control SoC pins.
-
-Required properties:
-- compatible: value should be one of the following.
-	"mediatek,mt8183-pinctrl", compatible with mt8183 pinctrl.
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
-  binding is used, the amount of cells must be specified as 2. See the below
-  mentioned gpio binding representation for description of particular cells.
-- gpio-ranges : gpio valid number range.
-- reg: physical address base for gpio base registers. There are 10 GPIO
-  physical address base in mt8183.
-
-Optional properties:
-- reg-names: gpio base register names. There are 10 gpio base register
-  names in mt8183. They are "iocfg0", "iocfg1", "iocfg2", "iocfg3", "iocfg4",
-  "iocfg5", "iocfg6", "iocfg7", "iocfg8", "eint".
-- interrupt-controller: Marks the device node as an interrupt controller
-- #interrupt-cells: Should be two.
-- interrupts : The interrupt outputs to sysirq.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-
-Subnode format
-A pinctrl node should contain at least one subnodes representing the
-pinctrl groups available on the machine. Each subnode will list the
-pins it needs, and how they should be configured, with regard to muxer
-configuration, pullups, drive strength, input enable/disable and input schmitt.
-
-    node {
-	pinmux = <PIN_NUMBER_PINMUX>;
-	GENERIC_PINCONFIG;
-    };
-
-Required properties:
-- pinmux: integer array, represents gpio pin number and mux setting.
-    Supported pin number and mux varies for different SoCs, and are defined
-    as macros in boot/dts/<soc>-pinfunc.h directly.
-
-Optional properties:
-- GENERIC_PINCONFIG: is the generic pinconfig options to use, bias-disable,
-    bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
-    output-high, input-schmitt-enable, input-schmitt-disable
-    and drive-strength are valid.
-
-    Some special pins have extra pull up strength, there are R0 and R1 pull-up
-    resistors available, but for user, it's only need to set R1R0 as 00, 01,
-    10 or 11. So It needs config "mediatek,pull-up-adv" or
-    "mediatek,pull-down-adv" to support arguments for those special pins.
-    Valid arguments are from 0 to 3.
-
-    mediatek,tdsel: An integer describing the steps for output level shifter
-      duty cycle when asserted (high pulse width adjustment). Valid arguments
-      are from 0 to 15.
-    mediatek,rdsel: An integer describing the steps for input level shifter
-      duty cycle when asserted (high pulse width adjustment). Valid arguments
-      are from 0 to 63.
-
-    When config drive-strength, it can support some arguments, such as
-    MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
-    It can only support 2/4/6/8/10/12/14/16mA in mt8183.
-    For I2C pins, there are existing generic driving setup and the specific
-    driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
-    adjustment in generic driving setup. But in specific driving setup,
-    they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
-    driving setup for I2C pins, the existing generic driving setup will be
-    disabled. For some special features, we need the I2C pins specific
-    driving setup. The specific driving setup is controlled by E1E0EN.
-    So we need add extra vendor driving preperty instead of
-    the generic driving property.
-    We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
-    driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
-    It is used to enable or disable the specific driving setup.
-    E1E0 is used to describe the detail strength specification of the I2C pin.
-    When E1=0/E0=0, the strength is 0.125mA.
-    When E1=0/E0=1, the strength is 0.25mA.
-    When E1=1/E0=0, the strength is 0.5mA.
-    When E1=1/E0=1, the strength is 1mA.
-    So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
-
-Examples:
-
-#include "mt8183-pinfunc.h"
-
-...
-{
-	pio: pinctrl@10005000 {
-		compatible = "mediatek,mt8183-pinctrl";
-		reg = <0 0x10005000 0 0x1000>,
-		      <0 0x11f20000 0 0x1000>,
-		      <0 0x11e80000 0 0x1000>,
-		      <0 0x11e70000 0 0x1000>,
-		      <0 0x11e90000 0 0x1000>,
-		      <0 0x11d30000 0 0x1000>,
-		      <0 0x11d20000 0 0x1000>,
-		      <0 0x11c50000 0 0x1000>,
-		      <0 0x11f30000 0 0x1000>,
-		      <0 0x1000b000 0 0x1000>;
-		reg-names = "iocfg0", "iocfg1", "iocfg2",
-			    "iocfg3", "iocfg4", "iocfg5",
-			    "iocfg6", "iocfg7", "iocfg8",
-			    "eint";
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&pio 0 0 192>;
-		interrupt-controller;
-		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
-		#interrupt-cells = <2>;
-
-		i2c0_pins_a: i2c0 {
-			pins1 {
-				pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
-					 <PINMUX_GPIO49__FUNC_SDA5>;
-				mediatek,pull-up-adv = <3>;
-				mediatek,drive-strength-adv = <7>;
-			};
-		};
-
-		i2c1_pins_a: i2c1 {
-			pins {
-				pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
-					 <PINMUX_GPIO51__FUNC_SDA3>;
-				mediatek,pull-down-adv = <2>;
-				mediatek,drive-strength-adv = <4>;
-			};
-		};
-		...
-	};
-};
-- 
2.32.0.432.gabb21c7263-goog

