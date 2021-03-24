Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB0534838F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 22:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238292AbhCXVXt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 17:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238282AbhCXVXj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 17:23:39 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED987C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 24 Mar 2021 14:23:38 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9f01:9a93:b6b:1adc:3da7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id AE1561E4FF7;
        Wed, 24 Mar 2021 22:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616621016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GpKdNEJ4r004QUpfZvXpoZXcjNtQLPDfrL1bOUk0JfM=;
        b=X9o7FlNo2Glj1KDQ7u0mPoDZORhvUdB+gQb5YoBcOwteyRbGFJZ2CsUtZyX0cBAfvz5S+3
        VI4JBDwxNhnI2kybcOFSUrRN7cVI2Jz7h7o3QTmh5Jyv1R58IyMX0/EBy4yBLcWHOo7BDd
        d8hkmO+B258fHECjeUAYMFWp8SaDYHj3xm62xKozfYXOVOo3sVNS/3tJ2DCaY1h4u5ExRI
        ws08lLUEgNURXPSht/Yj7hrDVfFodYuiCpAHdq6tbIaHQGpPiAGazoqfzwzSMyqdVW4rOu
        k3i+giSy7UrRy8dpHcFGrAfdfB56sEnr/l6vpDvpVUQJeaJQ0M7TKtaEg889ZA==
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     bert@biot.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v3 1/2] dt-bindings: gpio: Binding for Realtek Otto GPIO
Date:   Wed, 24 Mar 2021 22:22:40 +0100
Message-Id: <cda4ad68a031b60d407629e9232df495d3e260c2.1616620884.git.sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616620884.git.sander@svanheule.net>
References: <cover.1616620884.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a binding description for Realtek's GPIO controller found on several
of their MIPS-based SoCs (codenamed Otto), such as the RTL838x and
RTL839x series of switch SoCs.

A fallback binding 'realtek,otto-gpio' is provided for cases where the
actual port ordering is not known yet, and enabling the interrupt
controller may result in uncaught interrupts.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/gpio/realtek,otto-gpio.yaml      | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
new file mode 100644
index 000000000000..100f20cebd76
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/realtek,otto-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Otto GPIO controller
+
+maintainers:
+  - Sander Vanheule <sander@svanheule.net>
+  - Bert Vermeulen <bert@biot.com>
+
+description: |
+  Realtek's GPIO controller on their MIPS switch SoCs (Otto platform) consists
+  of two banks of 32 GPIOs. These GPIOs can generate edge-triggered interrupts.
+  Each bank's interrupts are cascased into one interrupt line on the parent
+  interrupt controller, if provided.
+  This binding allows defining a single bank in the devicetree. The interrupt
+  controller is not supported on the fallback compatible name, which only
+  allows for GPIO port use.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - realtek,rtl8380-gpio
+          - realtek,rtl8390-gpio
+      - const: realtek,otto-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+dependencies:
+  interrupt-controller: [ interrupts ]
+
+examples:
+  - |
+      gpio@3500 {
+        compatible = "realtek,rtl8380-gpio", "realtek,otto-gpio";
+        reg = <0x3500 0x1c>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <24>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&rtlintc>;
+        interrupts = <23>;
+      };
+
+...
-- 
2.30.2

