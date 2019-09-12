Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E493CB09CF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 10:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbfILH7d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 03:59:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:33645 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbfILH7d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Sep 2019 03:59:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 00:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="385962552"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2019 00:59:27 -0700
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v1 2/2] dt-bindings: pinctrl: intel: Add for new SoC
Date:   Thu, 12 Sep 2019 15:59:11 +0800
Message-Id: <c53173f380d47e9a5feaef9a35de535c6de9f6cb.1568274587.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dt bindings document & include file for pinmux & GPIO controller driver of
Intel Lightning Mountain SoC.

Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 131 +++++++++++++++++++++
 include/dt-bindings/pinctrl/intel,equilibrium.h    |  23 ++++
 2 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/intel,equilibrium.h

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
new file mode 100644
index 000000000000..1aee42f0057e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightning Mountain SoC pinmux & GPIO controller binding
+
+maintainers:
+  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
+
+description: |
+  Pinmux & GPIO controller controls pin multiplexing & configuration including
+  GPIO function selection & GPIO attributes configuration.
+
+  Please refer to [1] for details of the common pinctrl bindings used by the
+  client devices.
+
+  [1] Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+properties:
+  compatible:
+    const: intel,lgm-pinctrl
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  "^.*@[0-9a-fA-F]+$":
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below defined properties.
+
+    properties:
+      intel,function:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          A string containing the name of the function to mux to the group.
+
+      intel,groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          An array of strings identifying the list of groups.
+
+      intel,pins:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          List of pins to select with this function.
+
+      intel,mux:
+        description: The applicable mux group.
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/uint32"
+          - enum:
+              # Refer include/dt-bindings/pinctrl/intel,equilibrium.h
+              - PINMUX_0 # 0 PINMUX_GPIO
+              - PINMUX_1 # 1
+              - PINMUX_2 # 2
+              - PINMUX_3 # 3
+              - PINMUX_4 # 4
+
+      intel,pullup:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies pull-up configuration.
+
+      intel,pulldown:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies pull-down configuration.
+
+      intel,drive-current:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Enables driver-current.
+
+      intel,slew-rate:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Enables slew-rate.
+
+      intel,open-drain:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies open-drain configuration.
+
+      intel,output:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies if the pin is to be configured as output.
+
+
+    required:
+      - intel,function
+      - intel,groups
+
+required:
+  - compatible
+  - reg
+
+examples:
+  # Pinmux controller node
+  - |
+    pinctrl: pinctrl@e2880000 {
+          compatible = "intel,lgm-pinctrl";
+          reg = <0xe2880000 0x100000>;
+    };
+
+  # Client device node
+  - |
+    asc0: serial@e0a00000 {
+          compatible = "intel,lgm-asc";
+          reg = <0xe0a00000 0x1000>;
+          interrupt-parent = <&ioapic1>;
+          interrupts = <128 1>;
+          interrupt-names = "asc_irq";
+          clocks = <&cgu0 31>, <&cgu0 98>;
+          clock-names = "freq", "asc";
+          pinctrl-names = "default";
+          pinctrl-0 = <&uart0>;
+    };
+
+   # Client device subnode
+  - |
+    uart0:uart0 {
+          intel,pins = <64>, /* UART_RX0 */
+                       <65>; /* UART_TX0 */
+          intel,function = "CONSOLE_UART0";
+          intel,mux = <1>,
+                      <1>;
+          intel,groups = "CONSOLE_UART0";
+    };
+
+
+...
diff --git a/include/dt-bindings/pinctrl/intel,equilibrium.h b/include/dt-bindings/pinctrl/intel,equilibrium.h
new file mode 100644
index 000000000000..c37bfbea8ff1
--- /dev/null
+++ b/include/dt-bindings/pinctrl/intel,equilibrium.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_PINCTRL_INTEL_EQUILIBRIUM_H_
+#define __DT_BINDINGS_PINCTRL_INTEL_EQUILIBRIUM_H_
+
+#define PINCTRL_DRCC_2_MA	0
+#define PINCTRL_DRCC_4_MA	1
+#define PINCTRL_DRCC_8_MA	2
+#define PINCTRL_DRCC_12_MA	3
+
+#define PINMUX_0		0
+#define PINMUX_1		1
+#define PINMUX_2		2
+#define PINMUX_3		3
+#define PINMUX_4		4
+#define PINMUX_GPIO		PINMUX_0
+
+#define PINCTRL_GROUP		"intel,groups"
+#define PINCTRL_FUNCTION	"intel,function"
+#define PINCTRL_PINS		"intel,pins"
+#define PINCTRL_MUX		"intel,mux"
+
+#endif /* __DT_BINDINGS_PINCTRL_INTEL_EQUILIBRIUM_H_ */
-- 
2.11.0

