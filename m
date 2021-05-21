Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DFE38D194
	for <lists+linux-gpio@lfdr.de>; Sat, 22 May 2021 00:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhEUWeb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 18:34:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39268 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhEUWeS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 18:34:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LMWrxo125706;
        Fri, 21 May 2021 17:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621636373;
        bh=P0uN7MmZ9ueAxD4Ft4U0SxHkdiO5DIvjcLI0TK12KlY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EiaR6CwfVTWuwdpDYXMwcKBsfS1DseMYNbGDdumQ/9s1Ol9ohZ+lO7hYGehFJZLyv
         w7f+ZLdu2NO8f3dx7WSwn8gJqylxFEPbB5ikQgXuUvHERbirVI5ZagJoHwqYkXPBl/
         3MjzrQgiMrKCvw0vStjTSz0petwc+kvGH1xkQ30k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LMWrrE062974
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 17:32:53 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 17:32:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 17:32:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LMWpDb067569;
        Fri, 21 May 2021 17:32:52 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 5/5] dt-bindings: gpio: omap: Convert to json-schema
Date:   Sat, 22 May 2021 01:32:36 +0300
Message-ID: <20210521223236.18324-6-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521223236.18324-1-grygorii.strashko@ti.com>
References: <20210521223236.18324-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the OMAP GPIO Device Tree binding documentation to json-schema.
The GPIO hogs node names defined to end with a 'hog' suffix.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 .../devicetree/bindings/gpio/gpio-omap.txt    |  45 --------
 .../bindings/gpio/ti,omap-gpio.yaml           | 108 ++++++++++++++++++
 2 files changed, 108 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-omap.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-omap.txt b/Documentation/devicetree/bindings/gpio/gpio-omap.txt
deleted file mode 100644
index e57b2cb28f6c..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-omap.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-OMAP GPIO controller bindings
-
-Required properties:
-- compatible:
-  - "ti,omap2-gpio" for OMAP2 controllers
-  - "ti,omap3-gpio" for OMAP3 controllers
-  - "ti,omap4-gpio" for OMAP4 controllers
-- reg : Physical base address of the controller and length of memory mapped
-  region.
-- gpio-controller : Marks the device node as a GPIO controller.
-- #gpio-cells : Should be two.
-  - first cell is the pin number
-  - second cell is used to specify optional parameters (unused)
-- interrupt-controller: Mark the device node as an interrupt controller.
-- #interrupt-cells : Should be 2.
-  The first cell is the GPIO number.
-  The second cell is used to specify flags:
-    bits[3:0] trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-- interrupts : The interrupt the controller is rising as output when an
-  interrupt occures
-
-OMAP specific properties:
-- ti,hwmods:		Name of the hwmod associated to the GPIO:
-			"gpio<X>", <X> being the 1-based instance number
-			from the HW spec.
-- ti,gpio-always-on: 	Indicates if a GPIO bank is always powered and
-			so will never lose its logic state.
-
-
-Example:
-
-gpio0: gpio@44e07000 {
-    compatible = "ti,omap4-gpio";
-    reg = <0x44e07000 0x1000>;
-    ti,hwmods = "gpio1";
-    gpio-controller;
-    #gpio-cells = <2>;
-    interrupt-controller;
-    #interrupt-cells = <2>;
-    interrupts = <96>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml b/Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml
new file mode 100644
index 000000000000..ecefeb49f3f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP GPIO controller bindings
+
+maintainers:
+  - Grygorii Strashko <grygorii.strashko@ti.com>
+
+description: |
+  The general-purpose interface combines general-purpose input/output (GPIO) banks.
+  Each GPIO banks provides up to 32 dedicated general-purpose pins with input
+  and output capabilities; interrupt generation in active mode and wake-up
+  request generation in idle mode upon the detection of external events.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+        - ti,omap2-gpio
+        - ti,omap3-gpio
+        - ti,omap4-gpio
+      - items:
+          - const: ti,am4372-gpio
+          - const: ti,omap4-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  gpio-ranges: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
+  ti,gpio-always-on:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates if a GPIO bank is always powered and will never lose its logic state.
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+    description:
+      Name of the hwmod associated with the GPIO. Needed on some legacy OMAP
+      SoCs which have not been converted to the ti,sysc interconnect hierarachy.
+
+  ti,no-reset-on-init:
+    $ref: /schemas/types.yaml#/definitions/flag
+    deprecated: true
+    description:
+      Do not reset on init. Used with ti,hwmods on some legacy OMAP SoCs which
+      have not been converted to the ti,sysc interconnect hierarachy.
+
+patternProperties:
+  "^(.+-hog(-[0-9]+)?)$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    gpio0: gpio@0 {
+        compatible = "ti,omap4-gpio";
+        reg = <0x0 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <96>;
+        ti,gpio-always-on;
+
+        ls-buf-en-hog {
+            gpio-hog;
+            gpios = <10 GPIO_ACTIVE_HIGH>;
+            output-high;
+            line-name = "LS_BUF_EN";
+        };
+    };
-- 
2.17.1

