Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC243CBA89
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 18:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhGPQa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 12:30:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:27626 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhGPQaZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 12:30:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210806023"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="210806023"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 09:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="656442890"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2021 09:27:27 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com,
        lakshmi.bai.raja.subramanian@intel.com, tamal.saha@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay pinctrl driver
Date:   Fri, 16 Jul 2021 21:57:23 +0530
Message-Id: <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add Device Tree bindings documentation for Intel Keem Bay
SoC's pin controller.
Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file

Acked-by: Mark Gross <mgross@linux.intel.com>
Co-developed-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
Co-developed-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 .../pinctrl/intel,pinctrl-keembay.yaml        | 134 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
new file mode 100644
index 000000000000..6c6f45ac75a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
@@ -0,0 +1,134 @@
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
index 6c8be735cc91..f2f3fda0bf60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14636,6 +14636,11 @@ S:	Maintained
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

