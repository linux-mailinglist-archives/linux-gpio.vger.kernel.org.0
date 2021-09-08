Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E5A403C56
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Sep 2021 17:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351965AbhIHPOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Sep 2021 11:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236245AbhIHPOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Sep 2021 11:14:03 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A401C061575;
        Wed,  8 Sep 2021 08:12:55 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id dc3so2487584ejb.10;
        Wed, 08 Sep 2021 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zuBZfV6vJZPKFQy+aOoidKoUi1hB6Ie2mFXF0yWb9E=;
        b=XwBfxrfLvJRx1zSmVgSjmjc7MXhXeB/o8oVLu+4GrfwzRSIYleKnvY18cJ3gUtwVGG
         rWS8akLqmO5IfhsEny85syBcLIOJiXYbdgr5W5XOiRn5jiIuITROmgo5xVC4Z4R3VNKa
         /rEcXDF6B8YP+LEpkFgf9QEG67/UEA0GncQ5fhttM8KD2GvZ8aSDCPBUeEx2qMy+dsuU
         RO1kYb2kSvfE597joKJlCE1k2TaUHmv1MlCFzruIAIPVSdJujLWZbIWPyEa3Pt2gN4Ut
         EolUiJpLt3ZoTo2J775vrjFwECdqysuD/RCcgQ/lLDDWs3Qfuh8FOUyeVUpDIlcyrX/r
         S5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zuBZfV6vJZPKFQy+aOoidKoUi1hB6Ie2mFXF0yWb9E=;
        b=x8LNAqhiH7Kum9shOOeLh4UA81jp2YsLlwZ515ii+aoJqGdU/HaFwU3ENAS24XUvdS
         PHkgUBEWn9y9z1j0+2FL+Bf05OIj92y0sVuqn6ZxjD+MCw/My6GJq+H54+stnqvNKJt3
         m3sMmYxOx1i683nFgTKGmz/TDXLQ+YXWm0ioWyZOXxk3AVa3GK2lfg9dodkCJC/9wQDM
         EatQNcG+vVloCoBKTm3+7yHiQ4KCzIydzx7Ae5b5hJHgcW6G0liN+MFAlcrQwwBHzOUA
         vJoIDUbT1lHpwC2W+fD57seCdHMFP0U+Ut0hvAVoBprKUMemKLxE6+T9SfHsZOk93Umx
         l5Ag==
X-Gm-Message-State: AOAM531xHYEWerGWPYZcYxYBEIN5CDA4w5GUL8h3YjQl+uIfwfrGQAEH
        UhAXcoVfocZ7RCJc7VJOKBQ=
X-Google-Smtp-Source: ABdhPJy7uPhEJ8ZZaTsOcD7JZOytjwzAR96Z2kL/GA1SJmvsqZrRMgnynl20JsdJcuUO8AbXxUFEUg==
X-Received: by 2002:a17:907:4ce:: with SMTP id vz14mr365602ejb.552.1631113973914;
        Wed, 08 Sep 2021 08:12:53 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id h22sm1171110eji.112.2021.09.08.08.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 08:12:53 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: pinctrl: convert rockchip,pinctrl.txt to YAML
Date:   Wed,  8 Sep 2021 17:12:46 +0200
Message-Id: <20210908151246.8781-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert rockchip,pinctrl.txt to YAML

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Note for rob+dt:

To reduce notifications and to support legacy DT the patternProperties
regex is:
"gpio[0-8]?@[0-9a-f]+$"

or should we move to:
"gpio@[0-9a-f]+$"
and change all Rockchip pinctrl DT nodes?
Is the Linux driver / U-boot ready for it now?
---
 .../bindings/pinctrl/rockchip,pinctrl.txt     | 114 -----------
 .../bindings/pinctrl/rockchip,pinctrl.yaml    | 178 ++++++++++++++++++
 2 files changed, 178 insertions(+), 114 deletions(-)
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
index 000000000..7c45122d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -0,0 +1,178 @@
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
+description:
+  The Rockchip Pinmux Controller enables the IC to share one PAD
+  to several functional blocks. The sharing is done by multiplexing
+  the PAD input/output signals. For each PAD there are several muxing
+  options with option 0 being the use as a GPIO.
+
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  The Rockchip pin configuration node is a node of a group of pins which can be
+  used for a specific device or function. This node represents both mux and
+  config of the pins in that group. The 'pins' selects the function mode(also
+  named pin mode) this pin can work on and the 'config' configures various pad
+  settings such as pull-up, etc.
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
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the GRF registers.
+
+  rockchip,pmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
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
+patternProperties:
+  "gpio[0-8]?@[0-9a-f]+$":
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
+        type: array
+        minItems: 1
+        items:
+          items:
+            - minimum: 0
+              maximum: 8
+            - minimum: 0
+              maximum: 31
+            - minimum: 0
+              maximum: 6
+            - maximum: 0xffffffff
+        description:
+          A 3 integers array represents a group of pins mux and
+          config setting. The format is
+
+          rockchip,pins = <PIN_BANK PIN_BANK_IDX MUX &phandle>
+
+          The MUX 0 means gpio and MUX 1 to N mean the specific
+          device function. The phandle of a node contains the
+          generic pinconfig options to use, as described in
+          pinctrl-bindings.txt in this directory.
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

