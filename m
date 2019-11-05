Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE11FEF5B9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 07:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387668AbfKEGuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 01:50:00 -0500
Received: from mga14.intel.com ([192.55.52.115]:36586 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387556AbfKEGuA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 01:50:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 22:49:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="213798760"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga002.jf.intel.com with ESMTP; 04 Nov 2019 22:49:56 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v3 2/2] dt-bindings: pinctrl: intel: Add for new SoC
Date:   Tue,  5 Nov 2019 14:49:43 +0800
Message-Id: <f91001d8c5f0cb2860fda720d0cb6298a4856dd3.1572926608.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dt bindings document for pinmux & GPIO controller driver of
Intel Lightning Mountain SoC.

Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
new file mode 100644
index 000000000000..961ac877a962
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
@@ -0,0 +1,114 @@
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
+      Client device subnodes use below standard properties.
+
+    properties:
+      function:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          A string containing the name of the function to mux to the group.
+
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          An array of strings identifying the list of groups.
+
+      pins:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          List of pins to select with this function.
+
+      pinmux:
+        description: The applicable mux group.
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/uint32"
+          - enum:
+              - 0 #PINMUX_GPIO
+              - 1
+              - 2
+              - 3
+              - 4
+
+      bias-pull-up:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies pull-up configuration.
+
+      bias-pull-down:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies pull-down configuration.
+
+      drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Enables driver-current.
+
+      slew-rate:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Enables slew-rate.
+
+      drive-open-drain:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies open-drain configuration.
+
+      output-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specifies if the pin is to be configured as output.
+
+
+    required:
+      - function
+      - groups
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
+
+          # Client device subnode
+          uart0:uart0 {
+                pins = <64>, /* UART_RX0 */
+                             <65>; /* UART_TX0 */
+                function = "CONSOLE_UART0";
+                pinmux = <1>,
+                         <1>;
+                groups = "CONSOLE_UART0";
+          };
+    };
+
+...
-- 
2.11.0

