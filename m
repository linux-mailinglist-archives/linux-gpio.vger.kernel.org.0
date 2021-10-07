Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982D142559E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbhJGOmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbhJGOmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:42:23 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1327C061570;
        Thu,  7 Oct 2021 07:40:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r18so23996279edv.12;
        Thu, 07 Oct 2021 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvmoIo/jp1Rmwxylzdxe5b42lAV5Oim2xHCPh6KbP+k=;
        b=Zv8FsBODeDM/gFraHYf8c5JeTBVxvpmF39jXRyMIKr1u7Zau1b9IQWelcXz2VlXjpb
         EJZ8UJyJaVRkJ4SpbUgP3tyK7eZfwHNbjTbVcxAc3XCYnqUuWo4JZuVg1ib+7gKOUipk
         I1+VfJZ7u/+Na6vtfMCXk2rqR2emZy8R7ZOeNto+OfZZrza83z/4ZGtOksRwFPivD0iA
         +hJM5llwSQc12P5de0Yyw850OxBajINmeocv9IiIYQSrzKK3tjP5foKVS3hA8e3wLpHU
         jSpMHYRDR992EzOageBoZlN71TZ9jvFbcp5pAcXpjSyIrEbtTRjSGqd1AjkDCEkThnYE
         jY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvmoIo/jp1Rmwxylzdxe5b42lAV5Oim2xHCPh6KbP+k=;
        b=o3rJp/k6zSIqctFTTxiNJ45DmRfQxmFlrK2unub+Zpzc1CY9N5fzZMWafwGJPYOG1u
         eBKS6rQluzgNoDrx6Oa6SEMo2fto1CjepqZSVAQuHQ7H7SgapbnvfnMPUtmXkSCbQNzS
         cCQkh2uC6xKeMo0rE8tXz6Fu5dK9PBk1THpkn3a8/v1S77goeTnK6MweJrW45sUmjXZ2
         ynHYZzVj2PWv7Qg5VI4nhJk9ryTWoBiYUo8zbkNtapMYXJR1g1HPvIiACTJJAVCQu3R8
         Fgx7aINrVRajefNjca/yd/EQJpHe9FKANYzk22utuVETDOv+eolvdDV1/iHMoZI232lX
         Wdeg==
X-Gm-Message-State: AOAM531h/49gEV3APjhLwFkY16vsuyUMP5SubKAR037br51DWSw0oiiY
        N/6UAqfYMMxYq1U4dsOOVag=
X-Google-Smtp-Source: ABdhPJx85QKQdR101tmf1WbcPnP+jUdvPeQMvMBWd273yyiDBtTr1ITrrFbAwNt4+XJW7E71cUVzOw==
X-Received: by 2002:a50:e041:: with SMTP id g1mr7043269edl.4.1633617628308;
        Thu, 07 Oct 2021 07:40:28 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id 21sm10086523ejv.54.2021.10.07.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:40:27 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: convert rockchip,pinctrl.txt to YAML
Date:   Thu,  7 Oct 2021 16:40:17 +0200
Message-Id: <20211007144019.7461-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert rockchip,pinctrl.txt to YAML

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V3:
   Add uint32-matrix type reference.
   Add required.
   Restyle.

Changed V2:
   Add '|' to maintain the paragraphs.
   Change gpio patternProperties.
   Move description to items.
   Remove type array.
   Restyle.
---
 .../bindings/pinctrl/rockchip,pinctrl.txt     | 114 -----------
 .../bindings/pinctrl/rockchip,pinctrl.yaml    | 184 ++++++++++++++++++
 2 files changed, 184 insertions(+), 114 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
deleted file mode 100644
index 84c411129..000000000
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-* Rockchip Pinmux Controller
-
-The Rockchip Pinmux Controller, enables the IC
-to share one PAD to several functional blocks. The sharing is done by
-multiplexing the PAD input/output signals. For each PAD there are several
-muxing options with option 0 being the use as a GPIO.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-The Rockchip pin configuration node is a node of a group of pins which can be
-used for a specific device or function. This node represents both mux and
-config of the pins in that group. The 'pins' selects the function mode(also
-named pin mode) this pin can work on and the 'config' configures various pad
-settings such as pull-up, etc.
-
-The pins are grouped into up to 5 individual pin banks which need to be
-defined as gpio sub-nodes of the pinmux controller.
-
-Required properties for iomux controller:
-  - compatible: should be
-		"rockchip,px30-pinctrl":    for Rockchip PX30
-		"rockchip,rv1108-pinctrl":  for Rockchip RV1108
-		"rockchip,rk2928-pinctrl":  for Rockchip RK2928
-		"rockchip,rk3066a-pinctrl": for Rockchip RK3066a
-		"rockchip,rk3066b-pinctrl": for Rockchip RK3066b
-		"rockchip,rk3128-pinctrl":  for Rockchip RK3128
-		"rockchip,rk3188-pinctrl":  for Rockchip RK3188
-		"rockchip,rk3228-pinctrl":  for Rockchip RK3228
-		"rockchip,rk3288-pinctrl":  for Rockchip RK3288
-		"rockchip,rk3308-pinctrl":  for Rockchip RK3308
-		"rockchip,rk3328-pinctrl":  for Rockchip RK3328
-		"rockchip,rk3368-pinctrl":  for Rockchip RK3368
-		"rockchip,rk3399-pinctrl":  for Rockchip RK3399
-		"rockchip,rk3568-pinctrl":  for Rockchip RK3568
-
-  - rockchip,grf: phandle referencing a syscon providing the
-	 "general register files"
-
-Optional properties for iomux controller:
-  - rockchip,pmu: phandle referencing a syscon providing the pmu registers
-	 as some SoCs carry parts of the iomux controller registers there.
-	 Required for at least rk3188 and rk3288. On the rk3368 this should
-	 point to the PMUGRF syscon.
-
-Deprecated properties for iomux controller:
-  - reg: first element is the general register space of the iomux controller
-	 It should be large enough to contain also separate pull registers.
-	 second element is the separate pull register space of the rk3188.
-	 Use rockchip,grf and rockchip,pmu described above instead.
-
-Required properties for gpio sub nodes:
-See rockchip,gpio-bank.yaml
-
-Required properties for pin configuration node:
-  - rockchip,pins: 3 integers array, represents a group of pins mux and config
-    setting. The format is rockchip,pins = <PIN_BANK PIN_BANK_IDX MUX &phandle>.
-    The MUX 0 means gpio and MUX 1 to N mean the specific device function.
-    The phandle of a node containing the generic pinconfig options
-    to use, as described in pinctrl-bindings.txt in this directory.
-
-Examples:
-
-#include <dt-bindings/pinctrl/rockchip.h>
-
-...
-
-pinctrl@20008000 {
-	compatible = "rockchip,rk3066a-pinctrl";
-	rockchip,grf = <&grf>;
-
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	gpio0: gpio0@20034000 {
-		compatible = "rockchip,gpio-bank";
-		reg = <0x20034000 0x100>;
-		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clk_gates8 9>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	...
-
-	pcfg_pull_default: pcfg_pull_default {
-		bias-pull-pin-default
-	};
-
-	uart2 {
-		uart2_xfer: uart2-xfer {
-			rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>,
-					<1 RK_PB1 1 &pcfg_pull_default>;
-		};
-	};
-};
-
-uart2: serial@20064000 {
-	compatible = "snps,dw-apb-uart";
-	reg = <0x20064000 0x400>;
-	interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-	reg-shift = <2>;
-	reg-io-width = <1>;
-	clocks = <&mux_uart2>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart2_xfer>;
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
new file mode 100644
index 000000000..07c0a98ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Pinmux Controller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The Rockchip Pinmux Controller enables the IC to share one PAD
+  to several functional blocks. The sharing is done by multiplexing
+  the PAD input/output signals. For each PAD there are several muxing
+  options with option 0 being used as a GPIO.
+
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  The Rockchip pin configuration node is a node of a group of pins which can be
+  used for a specific device or function. This node represents both mux and
+  config of the pins in that group. The 'pins' selects the function mode
+  (also named pin mode) this pin can work on and the 'config' configures
+  various pad settings such as pull-up, etc.
+
+  The pins are grouped into up to 9 individual pin banks which need to be
+  defined as gpio sub-nodes of the pinmux controller.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,px30-pinctrl
+      - rockchip,rk2928-pinctrl
+      - rockchip,rk3066a-pinctrl
+      - rockchip,rk3066b-pinctrl
+      - rockchip,rk3128-pinctrl
+      - rockchip,rk3188-pinctrl
+      - rockchip,rk3228-pinctrl
+      - rockchip,rk3288-pinctrl
+      - rockchip,rk3308-pinctrl
+      - rockchip,rk3328-pinctrl
+      - rockchip,rk3368-pinctrl
+      - rockchip,rk3399-pinctrl
+      - rockchip,rk3568-pinctrl
+      - rockchip,rv1108-pinctrl
+
+  rockchip,grf:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description:
+      The phandle of the syscon node for the GRF registers.
+
+  rockchip,pmu:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description:
+      The phandle of the syscon node for the PMU registers,
+      as some SoCs carry parts of the iomux controller registers there.
+      Required for at least rk3188 and rk3288. On the rk3368 this should
+      point to the PMUGRF syscon.
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  ranges: true
+
+required:
+  - compatible
+  - rockchip,grf
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+patternProperties:
+  "gpio@[0-9a-f]+$":
+    type: object
+
+    $ref: "/schemas/gpio/rockchip,gpio-bank.yaml#"
+
+    unevaluatedProperties: false
+
+  "pcfg-[a-z0-9-]+$":
+    type: object
+    properties:
+      bias-disable: true
+
+      bias-pull-down: true
+
+      bias-pull-pin-default: true
+
+      bias-pull-up: true
+
+      drive-strength:
+        minimum: 0
+        maximum: 20
+
+      input-enable: true
+
+      input-schmitt-enable: true
+
+      output-high: true
+
+      output-low: true
+
+    additionalProperties: false
+
+additionalProperties:
+  type: object
+  additionalProperties:
+    type: object
+    properties:
+      rockchip,pins:
+        $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
+        minItems: 1
+        items:
+          items:
+            - minimum: 0
+              maximum: 8
+              description:
+                Pin bank.
+            - minimum: 0
+              maximum: 31
+              description:
+                Pin bank index.
+            - minimum: 0
+              maximum: 6
+              description:
+                Mux 0 means GPIO and mux 1 to N means
+                the specific device function.
+            - description:
+                The phandle of a node contains the generic pinconfig options
+                to use as described in pinctrl-bindings.txt.
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    pinctrl: pinctrl {
+      compatible = "rockchip,rk3066a-pinctrl";
+      rockchip,grf = <&grf>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      gpio0: gpio@20034000 {
+        compatible = "rockchip,gpio-bank";
+        reg = <0x20034000 0x100>;
+        interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_gates8 9>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+      };
+
+      pcfg_pull_default: pcfg-pull-default {
+        bias-pull-pin-default;
+      };
+
+      uart2 {
+        uart2_xfer: uart2-xfer {
+          rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>,
+                          <1 RK_PB1 1 &pcfg_pull_default>;
+        };
+      };
+    };
+
+    uart2: serial@20064000 {
+      compatible = "snps,dw-apb-uart";
+      reg = <0x20064000 0x400>;
+      interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&mux_uart2>;
+      pinctrl-0 = <&uart2_xfer>;
+      pinctrl-names = "default";
+      reg-io-width = <1>;
+      reg-shift = <2>;
+    };
-- 
2.20.1

