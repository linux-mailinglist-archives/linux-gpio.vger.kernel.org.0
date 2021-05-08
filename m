Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6963B377260
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 16:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbhEHO2l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 10:28:41 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49577 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229500AbhEHO2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 10:28:41 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 May 2021 10:28:35 EDT
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud7.xs4all.net with ESMTP
        id fNoalDe3DyEWwfNomlAKKF; Sat, 08 May 2021 16:20:33 +0200
From:   Mark Kettenis <kettenis@openbsd.org>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
Date:   Sat,  8 May 2021 16:19:55 +0200
Message-Id: <20210508142000.85116-2-kettenis@openbsd.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508142000.85116-1-kettenis@openbsd.org>
References: <20210508142000.85116-1-kettenis@openbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJbBo0WR8jeK3a86fYGKdaBC75+g5JT/G3Gl4amapTK5Rr69w2wT+p6ejBp4gUyFHR3/l1QzJvmajoCcEyLsti4apB2M7k5sE7uzuy4oT9ooKUTBkg6I
 y8HeKLApG382pioLX6mQSGlaKhPxOqZbMHDRIaqklb7tpwvqF9blqa1VPH71rB3XpoIfEk8lNhT94vTIwmHCBcc4fFlVjPcqOJeH5SWNDQcbGIzFwHitXMVJ
 oOMZrr3BG+Fev5SVpL7Sq1xmDg44HKyBbGV+EaEINs8OR9yYoR7OczbyqbJc97KVPVGfWdhf4OQLiLaIiuali5nncRn1GMeEhGI3yUBqX4O8yCBZEjW+XJ4U
 F1ZbzAjvAZB2xOxRVLpSotJe9IduDSuoH7josdzpfIwhy8/Ggi6wMP6XOI0Ex6EOiEpceUhozirV725DMsU5/tMjVXCVh01sBH3igCuf4ojhAnmAhCKRkSCh
 wvxdHtXQqsruqm8k
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Apple GPIO controller is a simple combined pin and GPIO conroller
present on Apple ARM SoC platforms, including various iPhone and iPad
devices and the "Apple Silicon" Macs.

Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
---
 .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 include/dt-bindings/pinctrl/apple.h           |  13 +++
 3 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/apple.h

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
new file mode 100644
index 000000000000..cc7805ca6ba1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple GPIO controller
+
+maintainers:
+  - Mark Kettenis <kettenis@openbsd.org>
+
+description: |
+  The Apple GPIO controller is a simple combined pin and GPIO conroller
+  present on Apple ARM SoC platforms, including various iPhone and iPad
+  devices and the "Apple Silicon" Macs.
+
+properties:
+  compatible:
+    items:
+      - const: apple,t8103-pinctrl
+      - const: apple,pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 7
+
+  interrupt-controller: true
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      pinmux:
+        description:
+          Values are constructed from pin number and alternate function
+          configuration number using the APPLE_PINMUX() helper macro
+          defined in include/dt-bindings/pinctrl/apple.h.
+
+    required:
+      - pinmux
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/pinctrl/apple.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pinctrl: pinctrl@23c100000 {
+        compatible = "apple,t8103-pinctrl", "apple,pinctrl";
+        reg = <0x2 0x3c100000 0x0 0x100000>;
+        clocks = <&gpio_clk>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 212>;
+
+        interrupt-controller;
+        interrupt-parent = <&aic>;
+        interrupts = <AIC_IRQ 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 17 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 18 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 19 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 20 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 21 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 22 IRQ_TYPE_LEVEL_HIGH>;
+
+        pcie_pins: pcie-pins {
+          pinmux = <APPLE_PINMUX(150, 1)>,
+                   <APPLE_PINMUX(151, 1)>,
+                   <APPLE_PINMUX(32, 1)>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ad0e9be66885..7327c9b778f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1654,9 +1654,11 @@ C:	irc://chat.freenode.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/irqchip/irq-apple-aic.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
+F:	include/dt-bindings/pinctrl/apple.h
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
diff --git a/include/dt-bindings/pinctrl/apple.h b/include/dt-bindings/pinctrl/apple.h
new file mode 100644
index 000000000000..ea0a6f466592
--- /dev/null
+++ b/include/dt-bindings/pinctrl/apple.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
+/*
+ * This header provides constants for Apple pinctrl bindings.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_APPLE_H
+#define _DT_BINDINGS_PINCTRL_APPLE_H
+
+#define APPLE_PINMUX(pin, func) ((pin) | ((func) << 16))
+#define APPLE_PIN(pinmux) ((pinmux) & 0xffff)
+#define APPLE_FUNC(pinmux) ((pinmux) >> 16)
+
+#endif /* _DT_BINDINGS_PINCTRL_APPLE_H */
-- 
2.31.1

