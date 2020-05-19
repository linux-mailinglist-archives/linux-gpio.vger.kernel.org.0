Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB3B11D91D1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 10:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgESIMB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 04:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgESIMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 04:12:01 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3DAC05BD0A
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2020 01:12:00 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by andre.telenet-ops.be with bizsmtp
        id gYBz220034CPMDc01YBzt3; Tue, 19 May 2020 10:11:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaxLz-0000ke-0k; Tue, 19 May 2020 10:11:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaxLy-0007a0-Uq; Tue, 19 May 2020 10:11:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: Add renesas,em-gio bindings
Date:   Tue, 19 May 2020 10:11:57 +0200
Message-Id: <20200519081157.29095-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document Device Tree bindings for the Renesas EMMA Mobile General
Purpose I/O Interface.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/gpio/renesas,em-gio.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
new file mode 100644
index 0000000000000000..8bdef812c87c3771
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/renesas,em-gio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas EMMA Mobile General Purpose I/O Interface
+
+maintainers:
+  - Magnus Damm <magnus.damm@gmail.com>
+
+properties:
+  compatible:
+    const: renesas,em-gio
+
+  reg:
+    items:
+      - description: First set of contiguous registers
+      - description: Second set of contiguous registers
+
+  interrupts:
+    items:
+      - description: Interrupt for the first set of 16 GPIO ports
+      - description: Interrupt for the second set of 16 GPIO ports
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - ngpios
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpio0: gpio@e0050000 {
+            compatible = "renesas,em-gio";
+            reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
+            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pfc 0 0 32>;
+            ngpios = <32>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+    };
-- 
2.17.1

