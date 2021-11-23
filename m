Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFF345A6DF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 16:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238574AbhKWPzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 10:55:01 -0500
Received: from mga03.intel.com ([134.134.136.65]:49507 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238567AbhKWPy7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 10:54:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234993137"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="234993137"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 07:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="497323047"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by orsmga007.jf.intel.com with ESMTP; 23 Nov 2021 07:51:47 -0800
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        tamal.saha@intel.com, pandith.n@intel.com,
        kenchappa.demakkanavar@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: Add bindings for Intel Thunderbay pinctrl driver
Date:   Tue, 23 Nov 2021 21:21:43 +0530
Message-Id: <20211123155144.21708-2-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155144.21708-1-lakshmi.sowjanya.d@intel.com>
References: <20211123155144.21708-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add Device Tree bindings documentation and an entry in MAINTAINERS file
for Intel Thunder Bay SoC's pin controller.

Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 .../pinctrl/intel,pinctrl-thunderbay.yaml     | 113 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
new file mode 100644
index 000000000000..6a70796fcc48
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/intel,pinctrl-thunderbay.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Thunder Bay pin controller Device Tree Bindings
+
+maintainers:
+  - Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
+
+description: |
+  Intel Thunder Bay SoC integrates a pin controller which enables control
+  of pin directions, input/output values and configuration
+  for a total of 67 pins.
+
+properties:
+  compatible:
+    const: intel,thunderbay-pinctrl
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    description:
+      Specifies the interrupt lines to be used by the controller.
+    maxItems: 2
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
+          Supported pin names are "GPIO0" up to "GPIO66".
+
+      bias-disable: true
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      drive-strength:
+        description: Drive strength for the pad.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
+
+      bias-bus-hold:
+        type: boolean
+
+      input-schmitt-enable:
+        type: boolean
+
+      slew-rate:
+        description: GPIO slew rate control.
+                      0 - Slow
+                      1 - Fast
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
+    gpio@0 {
+        compatible = "intel,thunderbay-pinctrl";
+        reg = <0x600b0000 0x88>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    // Example 2
+    gpio@1 {
+        compatible = "intel,thunderbay-pinctrl";
+        reg = <0x600c0000 0x88>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5250298d2817..7741bcc23502 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15117,6 +15117,11 @@ L:	linux-omap@vger.kernel.org
 S:	Maintained
 F:	drivers/pinctrl/pinctrl-single.c
 
+PIN CONTROLLER - THUNDERBAY
+M:	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
+S:	Supported
+F:	drivers/pinctrl/pinctrl-thunderbay.c
+
 PKTCDVD DRIVER
 M:	linux-block@vger.kernel.org
 S:	Orphan
-- 
2.17.1

