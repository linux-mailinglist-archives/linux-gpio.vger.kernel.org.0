Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B85382071
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 20:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhEPSlK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 14:41:10 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48149 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231724AbhEPSlJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 May 2021 14:41:09 -0400
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 May 2021 14:41:08 EDT
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud7.xs4all.net with ESMTP
        id iLZ1lyWmcMajpiLZCl0Ad8; Sun, 16 May 2021 20:32:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621189962; bh=5ElH9uOL6nQqPho5uwOWryUINL9gmKx0dZLCtNDJe+Q=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Ubq/HtDTBB5qlKLG6CwV2aBsDWT/lf4pCCeJDBrVVXctWy+AZ7fSW0gX86ktpiUA0
         yLqgIfrTo3VzPxwguM2GjSw9QAywGXCknP/Bb0seGwKU9AN7OOA/Az1mkWg3Pu6Shb
         UL562i7/WRVwpBE0DkLMC6ey+f6JZt8dJ+RbD35yAcmPSVeZA90/gvOVVAtXahvuTC
         NF5GsWiNpP7D9tnlVRrHMx/APw5FeStMEz3StYVburxiGySGug/AvaPGv3uXBFDNC7
         DimzJGT628QGM+JQC6rCGZ2m5CRMBuZIR1CJY48YqQSpfP3ry+oy8ycQrSlYDNqjNy
         FI2r0Y87XahxA==
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
Date:   Sun, 16 May 2021 20:32:17 +0200
Message-Id: <20210516183221.93686-2-mark.kettenis@xs4all.nl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516183221.93686-1-mark.kettenis@xs4all.nl>
References: <20210516183221.93686-1-mark.kettenis@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJOae1O34/GSTXgUESVm4hMKxxGlPUgWAm2tPbUTIclNaqwhSrZJgxNolmj/01PD2I1fBxOQ9IsXWkw2AQoFtrw+pS/4YftUSlqJMM73Zgf59hhVRHbg
 Yghjd7GXGaRd8RGHp1zoEK3Yups4wNo8VjnWoxKPI7SE1nyYbrSa0YtWgpqR58asKO5l+u2yaQZ6RI7l6VBZ7BWYwYh+KQ22tNbn2TtwbIR6rUh28NPcHjYE
 jd7k9qGgimnMjpg7W2KifrXeIw5OtSEu/qCaVQmctX1dwRZcRm0lffhPX3cdeVcTrJ7ONQ3g/wBSNjrEvHanrSw9CHxRGUDf7IRE+AKDF0Y2GULwVdcLOunn
 p2KTk12cH8+/adZP9/PIAv4cubUoMZobQ0pN3gWp5+w9bk5Sfh8DEwqFdWHGZJzaNqCiFQ7fDLZVi89uTrbUuvetPEqja6xiYrgQokFnl0ZsFM8fC/6sub+j
 f0TsGVD6zxXhc1Fp
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Mark Kettenis <kettenis@openbsd.org>

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
index 000000000000..fae23e1d845e
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
+  The Apple GPIO controller is a simple combined pin and GPIO
+  controller present on Apple ARM SoC platforms, including various
+  iPhone and iPad devices and the "Apple Silicon" Macs.
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

