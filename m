Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B28A34EC58
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 17:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhC3P1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 11:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbhC3P1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 11:27:11 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D20FC061765
        for <linux-gpio@vger.kernel.org>; Tue, 30 Mar 2021 08:27:10 -0700 (PDT)
Received: from terra.local.svanheule.net (47.118-244-81.adsl-dyn.isp.belgacom.be [81.244.118.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 8EAFF1E7DD2;
        Tue, 30 Mar 2021 17:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1617118026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n+RZIlQPEpgRSpt4D9bbTuj3H2K/8fduAo3gs+jU6bU=;
        b=vm2/7WR42WBG9hy97YGz5G5iHjI/j6U1KUCBU2+KzwfXi4byoNQ0pU2c/AU3/Ki6r3VR0K
        uZZCvZMwRCFhBtz+GHt1X4iy+qPHP3RWNyIXJ9jPrDrpufwwGJIPGGj0Z6kANmHTmkIYUW
        3HTYuBDOLAVhPgp5tT4GC9ye92jvctYgO11dt/GJSyUNLfmCPi/pxkr2bYsuhxbSNe1HNR
        vRqtYm7xo00f4KeQI8mJnJp5QBZYGQ5rtZliW/m9D/HYNOgPMC3p0etGreXDzv4BjRNJfR
        AYGwHcJVvyUMkA++yne/Q9lNiKprysK24nrC6KY59AkKEiQ6GZOdtakcb3qbjw==
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     andy.shevchenko@gmail.com, bert@biot.com,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: gpio: Binding for Realtek Otto GPIO
Date:   Tue, 30 Mar 2021 17:26:51 +0200
Message-Id: <136eeef65e3abcdb237d812889f576a32f0abc0f.1617117762.git.sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617117762.git.sander@svanheule.net>
References: <cover.1617117762.git.sander@svanheule.net>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

