Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7356E26CB63
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIPRZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 13:25:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgIPRZj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:25:39 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5BFB22460;
        Wed, 16 Sep 2020 15:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271868;
        bh=IpUA1YpWh0wI7RetTzNFsnK0XI+RNJOmSBKVyk8TOyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dnjarl1Mkj44TfaBpH+SbO0/ZBka4oqzYlABRKXYK9QwKLlXitkLzN/kNScYQADa0
         apoFByFfMbG45blXE6lsQSK4wVLTnCZIshKu0+FBiLJ+QUxVm6T6YknUyzMMjvv/H6
         +pXt3lzsHjj0WYmmx2l34T8wzleiUSvPuHxVImXY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 02/15] dt-bindings: gpio: convert bindings for Maxim MAX732x family to dtschema
Date:   Wed, 16 Sep 2020 17:57:02 +0200
Message-Id: <20200916155715.21009-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Maxim MAX732x family of GPIO expanders bindings to device
tree schema by merging it with existing PCA95xx schema.  These are quite
similar so merging reduces duplication.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Add Rob's review tag
2. Use reset-gpios/vcc-supply: false instead of maxItems 0
3. Use /* for comments in example DTS
---
 .../devicetree/bindings/gpio/gpio-max732x.txt | 58 ---------------
 .../bindings/gpio/gpio-pca95xx.yaml           | 70 ++++++++++++++++++-
 2 files changed, 68 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-max732x.txt b/Documentation/devicetree/bindings/gpio/gpio-max732x.txt
deleted file mode 100644
index b3a9c0c32823..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-max732x.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* MAX732x-compatible I/O expanders
-
-Required properties:
-  - compatible: Should be one of the following:
-    - "maxim,max7319": For the Maxim MAX7319
-    - "maxim,max7320": For the Maxim MAX7320
-    - "maxim,max7321": For the Maxim MAX7321
-    - "maxim,max7322": For the Maxim MAX7322
-    - "maxim,max7323": For the Maxim MAX7323
-    - "maxim,max7324": For the Maxim MAX7324
-    - "maxim,max7325": For the Maxim MAX7325
-    - "maxim,max7326": For the Maxim MAX7326
-    - "maxim,max7327": For the Maxim MAX7327
-  - reg: I2C slave address for this device.
-  - gpio-controller: Marks the device node as a GPIO controller.
-  - #gpio-cells: Should be 2.
-    - first cell is the GPIO number
-    - second cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
-      Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
-
-Optional properties:
-
-  The I/O expander can detect input state changes, and thus optionally act as
-  an interrupt controller. When the expander interrupt line is connected all the
-  following properties must be set. For more information please see the
-  interrupt controller device tree bindings documentation available at
-  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
-
-  - interrupt-controller: Identifies the node as an interrupt controller.
-  - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
-    - first cell is the pin number
-    - second cell is used to specify flags
-  - interrupts: Interrupt specifier for the controllers interrupt.
-
-Please refer to gpio.txt in this directory for details of the common GPIO
-bindings used by client devices.
-
-Example 1. MAX7325 with interrupt support enabled (CONFIG_GPIO_MAX732X_IRQ=y):
-
-	expander: max7325@6d {
-		compatible = "maxim,max7325";
-		reg = <0x6d>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
-	};
-
-Example 2. MAX7325 with interrupt support disabled (CONFIG_GPIO_MAX732X_IRQ=n):
-
-	expander: max7325@6d {
-		compatible = "maxim,max7325";
-		reg = <0x6d>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 7ff6efadf797..183ec23eda39 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -9,6 +9,10 @@ title: NXP PCA95xx I2C GPIO multiplexer
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
+description: |+
+  Bindings for the family of I2C GPIO multiplexers/expanders: NXP PCA95xx,
+  Maxim MAX73xx
+
 properties:
   compatible:
     enum:
@@ -17,6 +21,15 @@ properties:
       - maxim,max7312
       - maxim,max7313
       - maxim,max7315
+      - maxim,max7319
+      - maxim,max7320
+      - maxim,max7321
+      - maxim,max7322
+      - maxim,max7323
+      - maxim,max7324
+      - maxim,max7325
+      - maxim,max7326
+      - maxim,max7327
       - nxp,pca6416
       - nxp,pca9505
       - nxp,pca9534
@@ -69,11 +82,11 @@ properties:
   reset-gpios:
     description:
       GPIO specification for the RESET input. This is an active low signal to
-      the PCA953x.
+      the PCA953x.  Not valid for Maxim MAX732x devices.
 
   vcc-supply:
     description:
-      Optional power supply
+      Optional power supply.  Not valid for Maxim MAX732x devices.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
@@ -103,6 +116,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max7320
+              - maxim,max7321
+              - maxim,max7322
+              - maxim,max7323
+              - maxim,max7324
+              - maxim,max7325
+              - maxim,max7326
+              - maxim,max7327
+    then:
+      properties:
+        reset-gpios: false
+        vcc-supply: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -164,3 +196,37 @@ examples:
             ti,micbias = <0>; /* 2.1V */
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c2 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* MAX7325 with interrupt support enabled */
+        gpio@6d {
+            compatible = "maxim,max7325";
+            reg = <0x6d>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+
+  - |
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* MAX7325 with interrupt support disabled */
+        gpio@6e {
+            compatible = "maxim,max7325";
+            reg = <0x6e>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.17.1

