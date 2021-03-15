Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D670E33C676
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 20:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhCOTIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 15:08:45 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:52978 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbhCOTIc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 15:08:32 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9701:b4db:50a7:6f83:328f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2DBB21DE336;
        Mon, 15 Mar 2021 20:08:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1615835309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hbhhx9VKQMwSg1Od1F6afQRKhVgm7ScrAtFwuLoSS6A=;
        b=hZpHZLcHQps0vE+XiumZatcAtYvrPHh2UstyZ1Yaqej9faV3se7Pt1WhNczw85ye1i/ZkR
        SI/qbmdMiFWrvDbSbE669C6vdkJnmia7tvCZD5SyXinEkpx3xmfuQbroqdKjSZwPE8wRJT
        ZMOjqquvVBgLcuBkQWl7xB0aYhvqw7FBHbVhvBNMmyaEOMhrLNs7uAfmT45gjZd0XdU+t/
        jOlgazl+Mu8SmbZu139EfXrBcl2ClXAzlxHhNEP/xtMNgt5Uyo/r57KAXIopBHMyB02W1A
        F4OjtIyFq5HUdUuhPHsfSYeaAQKx4CFVRe1O8kXuYKGKIfz2Xx4tiVe6T0bTXg==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>, bert@biot.com
Subject: [PATCH v2 1/2] dt-bindings: gpio: Binding for Realtek Otto GPIO
Date:   Mon, 15 Mar 2021 20:08:05 +0100
Message-Id: <20210315190806.66762-2-sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315190806.66762-1-sander@svanheule.net>
References: <20210315082339.9787-1-sander@svanheule.net>
 <20210315190806.66762-1-sander@svanheule.net>
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
 .../bindings/gpio/gpio-realtek-otto.yaml      | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml b/Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
new file mode 100644
index 000000000000..3e8151e3a169
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-realtek-otto.yaml#
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
+    oneOf:
+      - items:
+          - enum:
+              - realtek,rtl8380-gpio
+              - realtek,rtl8390-gpio
+          - const: realtek,otto-gpio
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

