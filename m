Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFCF3E2C73
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 16:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbhHFOZt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 10:25:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:17257 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238173AbhHFOZt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Aug 2021 10:25:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="211274603"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="211274603"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 07:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="420742684"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by orsmga003.jf.intel.com with ESMTP; 06 Aug 2021 07:25:30 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com,
        lakshmi.bai.raja.subramanian@intel.com, tamal.saha@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay pinctrl driver
Date:   Fri,  6 Aug 2021 19:55:26 +0530
Message-Id: <20210806142527.29113-2-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210806142527.29113-1-lakshmi.sowjanya.d@intel.com>
References: <20210806142527.29113-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add Device Tree bindings documentation for Intel Keem Bay
SoC's pin controller.
Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file

Co-developed-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
Co-developed-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Acked-by: Mark Gross <mgross@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../pinctrl/intel,pinctrl-keembay.yaml        | 135 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
new file mode 100644
index 000000000000..5e99d79499b4
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
+  ngpios:
+    description: The number of GPIOs exposed.
+    const: 80
+
+  interrupts:
+    description:
+      Specifies the interrupt lines to be used by the controller.
+      Each interrupt line is shared by upto 4 GPIO lines.
+    maxItems: 8
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+patternProperties:
+  '^gpio@[0-9a-f]*$':
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
+      bias-disable: true
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      drive-strength:
+        description: IO pads drive strength in milli Ampere.
+        enum: [2, 4, 8, 12]
+
+      bias-bus-hold:
+        type: boolean
+
+      input-schmitt-enable:
+        type: boolean
+
+      slew-rate:
+        description: GPIO slew rate control.
+                      0 - Fast(~100MHz)
+                      1 - Slow(~50MHz)
+        enum: [0, 1]
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - ngpios
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
+    gpio@0 {
+        compatible = "intel,keembay-pinctrl";
+        reg = <0x600b0000 0x88>,
+              <0x600b0190 0x1ac>;
+        gpio-controller;
+        ngpios = <0x50>;
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
+    gpio@1 {
+        compatible = "intel,keembay-pinctrl";
+        reg = <0x600c0000 0x88>,
+              <0x600c0190 0x1ac>;
+        gpio-controller;
+        ngpios = <0x50>;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index c9467d2839f5..4265079bf90a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14643,6 +14643,11 @@ S:	Maintained
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

