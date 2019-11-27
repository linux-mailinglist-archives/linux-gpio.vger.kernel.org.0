Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9BE810ABF4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 09:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfK0InJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 03:43:09 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:48454 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfK0InJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 03:43:09 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Wwiu2100X5USYZQ01wiuc6; Wed, 27 Nov 2019 09:43:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xl-Oj; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004Or-Ld; Wed, 27 Nov 2019 09:42:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 4/7] dt-bindings: gpio: Add gpio-repeater bindings
Date:   Wed, 27 Nov 2019 09:42:50 +0100
Message-Id: <20191127084253.16356-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Device Tree bindings for a GPIO repeater, with optional translation
of physical signal properties.  This is useful for describing explicitly
the presence of e.g. an inverter on a GPIO line, and was inspired by the
non-YAML gpio-inverter bindings by Harish Jenny K N
<harish_kandiga@mentor.com>[1].

Note that this is different from a GPIO Nexus Node[2], which cannot do
physical signal property translation.

While an inverter can be described implicitly by exchanging the
GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags, this has its limitations.
Each GPIO line has only a single GPIO_ACTIVE_* flag, but applies to both
th provider and consumer sides:
  1. The GPIO provider (controller) looks at the flags to know the
     polarity, so it can translate between logical (active/not active)
     and physical (high/low) signal levels.
  2. While the signal polarity is usually fixed on the GPIO consumer
     side (e.g. an LED is tied to either the supply voltage or GND),
     it may be configurable on some devices, and both sides need to
     agree.  Hence the GPIO_ACTIVE_* flag as seen by the consumer must
     match the actual polarity.
     There exists a similar issue with interrupt flags, where both the
     interrupt controller and the device generating the interrupt need
     to agree, which breaks in the presence of a physical inverter not
     described in DT (see e.g. [3]).

[1] "[PATCH V4 2/2] gpio: inverter: document the inverter bindings"
    https://lore.kernel.org/linux-gpio/1561699236-18620-3-git-send-email-harish_kandiga@mentor.com/

[2] Devicetree Specification v0.3-rc2, Section 2.5
    https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3-rc2

[3] "[PATCH] wlcore/wl18xx: Add invert-irq OF property for physically
    inverted IRQ"
    https://lore.kernel.org/linux-renesas-soc/20190607172958.20745-1-erosca@de.adit-jv.com/

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 .../bindings/gpio/gpio-repeater.yaml          | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-repeater.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-repeater.yaml b/Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
new file mode 100644
index 0000000000000000..efdee0c3be43f731
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-repeater.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO Repeater
+
+maintainers:
+  - Harish Jenny K N <harish_kandiga@mentor.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  This represents a repeater for one or more GPIOs, possibly including physical
+  signal property translation (e.g. polarity inversion).
+
+properties:
+  compatible:
+    const: gpio-repeater
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpios:
+    description:
+      Phandle and specifier, one for each repeated GPIO.
+
+  gpio-line-names:
+    description:
+      Strings defining the names of the GPIO lines going out of the GPIO
+      controller.
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - gpios
+
+additionalProperties: false
+
+examples:
+  # Device node describing a polarity inverter for a single GPIO
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    inverter: gpio-repeater {
+        compatible = "gpio-repeater";
+        #gpio-cells = <2>;
+        gpio-controller;
+        gpios = <&gpio 95 GPIO_ACTIVE_LOW>;
+    };
-- 
2.17.1

