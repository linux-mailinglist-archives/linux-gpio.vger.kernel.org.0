Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F939FD8D5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 10:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfKOJZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 04:25:22 -0500
Received: from mga14.intel.com ([192.55.52.115]:47552 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfKOJZW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Nov 2019 04:25:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 01:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,307,1569308400"; 
   d="scan'208";a="356065503"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2019 01:25:18 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v8 2/2] dt-bindings: pinctrl: intel: Add for new SoC
Date:   Fri, 15 Nov 2019 17:25:08 +0800
Message-Id: <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dt bindings document for pinmux & GPIO controller driver of
Intel Lightning Mountain SoC.

Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
new file mode 100644
index 000000000000..240d429f773b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    const: intel,lgm-io
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  '-pins$':
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
+          - $ref: "/schemas/types.yaml#/definitions/uint32-array"
+
+      bias-pull-up:
+        type: boolean
+
+      bias-pull-down:
+        type: boolean
+
+      drive-strength:
+        description: |
+          Selects the drive strength for the specified pins in mA.
+          0: 2 mA
+          1: 4 mA
+          2: 8 mA
+          3: 12 mA
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2, 3]
+
+      slew-rate:
+        type: boolean
+        description: |
+          Sets slew rate for specified pins.
+          0: slow slew
+          1: fast slew
+
+      drive-open-drain:
+        type: boolean
+
+      output-enable:
+        type: boolean
+
+    required:
+      - function
+      - groups
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    pinctrl: pinctrl@e2880000 {
+        compatible = "intel,lgm-pinctrl";
+        reg = <0xe2880000 0x100000>;
+
+        uart0-pins {
+             pins = <64>, /* UART_RX0 */
+                    <65>; /* UART_TX0 */
+             function = "CONSOLE_UART0";
+             pinmux = <1>,
+                      <1>;
+             groups = "CONSOLE_UART0";
+          };
+    };
+
+...
-- 
2.11.0

