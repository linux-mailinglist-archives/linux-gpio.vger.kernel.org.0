Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59CE256686
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 11:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgH2Jkq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Aug 2020 05:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbgH2Jkm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 29 Aug 2020 05:40:42 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FDE520E65;
        Sat, 29 Aug 2020 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598694041;
        bh=YkJWndd3eYDCkLFjOutEpPbilWAVMZ5PvWnnfsLUDBQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CvFRKLdOf+CQCBYPTfzDQXMjTgCrqLI5nC9t1XhH9w61gTvhzxqDbU9InJ7qp2o2W
         EiAvwDxEQIanxP5LbeLtM/RklYvP522TENJpNRaPLRt6zS8Kw9fQ8OdmW2QIFWtmTH
         UEF7MDJwUMvJwGgG25ErNtWsdMWW5+otkr7J/i6g=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/6] dt-bindings: gpio: Convert bindings for Maxim MAX732x family to dtschema
Date:   Sat, 29 Aug 2020 11:40:20 +0200
Message-Id: <20200829094024.31842-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829094024.31842-1-krzk@kernel.org>
References: <20200829094024.31842-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Maxim MAX732x family of GPIO expanders bindings to device
tree schema by merging it with existing PCA95xx schema.  These are quite
similar so merging reduces duplication.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-max732x.txt | 58 ---------------
 .../bindings/gpio/gpio-pca95xx.yaml           | 72 ++++++++++++++++++-
 2 files changed, 70 insertions(+), 60 deletions(-)
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
index c5bb24b3b7b5..e90433b7d52b 100644
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
 
 required:
   - compatible
@@ -83,6 +96,27 @@ required:
 
 unevaluatedProperties: false
 
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
+        reset-gpios:
+          maxItems: 0
+        vcc-supply:
+          maxItems: 0
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -136,3 +170,37 @@ examples:
             ti,micbias = <0>;	/* 2.1V */
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
+        // MAX7325 with interrupt support enabled
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
+        // MAX7325 with interrupt support disabled
+        gpio@6e {
+            compatible = "maxim,max7325";
+            reg = <0x6e>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.17.1

