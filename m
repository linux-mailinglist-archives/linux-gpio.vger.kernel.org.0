Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD6338E345
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 11:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhEXJ1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 05:27:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:49299 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232545AbhEXJ1l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 05:27:41 -0400
IronPort-SDR: WvoqCkZJaT9HajsEpKNI64TcTtcXMkNvPnULzO8QU6IqqFm5F82uWX4iSGnh0XEozg3czIm7Bi
 0ybqJzR9V0cw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263104318"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="263104318"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 02:26:10 -0700
IronPort-SDR: dDXyde/0bQZfpEFSxfwGo+Y0yTNs1UEuEcj+Qdq8kH2EuYDScl8kiNjknrbj6PhAOK0qCyzt+v
 vNcylzO0IXTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="478450457"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga002.fm.intel.com with ESMTP; 24 May 2021 02:26:08 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmi.bai.raja.subramanian@intel.com, tamal.saha@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [PATCH 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay pinctrl driver
Date:   Mon, 24 May 2021 14:56:04 +0530
Message-Id: <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com>
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>

Add Device Tree bindings documentation for Intel Keem Bay
SoC's pin controller.
Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file

Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Signed-off-by: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>
Acked-by: Mark Gross <mgross@linux.intel.com>
---
 .../pinctrl/intel,pinctrl-keembay.yaml        | 135 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
new file mode 100644
index 000000000000..8d45eddf972f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/intel,pinctrl-keembay.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Keem Bay pin controller Device Tree Bindings
+
+maintainers:
+  - Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
+
+description: |
+  Intel Keem Bay SoC integrates a pin controller which enables control
+  of pin directions, input/output values and configuration
+  for a total of 80 pins.
+
+properties:
+  compatible:
+    const: intel,keembay-pinctrl
+
+  reg:
+    maxItems: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    description:
+      Specifies the interrupt lines to be used by the controller.
+    maxItems: 8
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+patternProperties:
+  '^.$':
+    type: object
+
+    description:
+      Child nodes can be specified to contain pin configuration information,
+      which can then be utilized by pinctrl client devices.
+      The following properties are supported.
+
+    properties:
+      pins:
+        description: |
+          The name(s) of the pins to be configured in the child node.
+          Supported pin names are "GPIO0" up to "GPIO79".
+
+      bias-disable:
+        type: boolean
+
+      bias-pull-down:
+        type: boolean
+
+      bias-pull-up:
+        type: boolean
+
+      drive-strength:
+        enum: [2, 4, 8, 12]
+
+      bias-bus-hold:
+        type: boolean
+
+      input-schmitt-enable:
+        type: boolean
+
+      slew-rate:
+        description: |
+         0: Fast
+         1: Slow
+        enum: [0, 1]
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    // Example 1
+    pinctrl@600B0000 {
+        compatible = "intel,keembay-pinctrl";
+        reg = <0x600b0000 0x88>,
+              <0x600b0190 0x1ac>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    // Example 2
+    pinctrl@600C0000 {
+        compatible = "intel,keembay-pinctrl";
+        reg = <0x600c0000 0x88>,
+              <0x600c0190 0x1ac>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spi_pinconf {
+            pins = "GPIO10", "GPIO11";
+            drive-strength = <4>;
+            bias-pull-down;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 81e1edeceae4..1991899c12e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14445,6 +14445,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
 F:	drivers/pinctrl/intel/
 
+PIN CONTROLLER - KEEMBAY
+M:	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
+S:	Supported
+F:	drivers/pinctrl/pinctrl-keembay*
+
 PIN CONTROLLER - MEDIATEK
 M:	Sean Wang <sean.wang@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
-- 
2.17.1

