Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0DB3C5A8E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 13:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbhGLKHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 06:07:03 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:18766 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbhGLKGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jul 2021 06:06:51 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 16C9lQ50099566;
        Mon, 12 Jul 2021 17:47:26 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 18:03:20 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <steven_lee@aspeedtech.com>, <Hongweiz@ami.com>,
        <ryan_chen@aspeedtech.com>, <billy_tsai@aspeedtech.com>
Subject: [PATCH v6 1/9] dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
Date:   Mon, 12 Jul 2021 18:03:08 +0800
Message-ID: <20210712100317.23298-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16C9lQ50099566
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sgpio-aspeed bindings should be converted to yaml format.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpio/aspeed,sgpio.yaml           | 75 +++++++++++++++++++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ------------
 2 files changed, 75 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
new file mode 100644
index 000000000000..b2ae211411ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed SGPIO controller
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description:
+  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
+  featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
+  support the following options
+  - Support interrupt option for each input port and various interrupt
+    sensitivity option (level-high, level-low, edge-high, edge-low)
+  - Support reset tolerance option for each output port
+  - Directly connected to APB bus and its shift clock is from APB bus clock
+    divided by a programmable value.
+  - Co-work with external signal-chained TTL components (74LV165/74LV595)
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-sgpio
+      - aspeed,ast2500-sgpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  clocks:
+    maxItems: 1
+
+  ngpios: true
+
+  bus-frequency: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-controller
+  - ngpios
+  - clocks
+  - bus-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    sgpio: sgpio@1e780200 {
+        #gpio-cells = <2>;
+        compatible = "aspeed,ast2500-sgpio";
+        gpio-controller;
+        interrupts = <40>;
+        reg = <0x1e780200 0x0100>;
+        clocks = <&syscon ASPEED_CLK_APB>;
+        interrupt-controller;
+        ngpios = <80>;
+        bus-frequency = <12000000>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
deleted file mode 100644
index be329ea4794f..000000000000
--- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Aspeed SGPIO controller Device Tree Bindings
---------------------------------------------
-
-This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
-featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
-support the following options:
-- Support interrupt option for each input port and various interrupt
-  sensitivity option (level-high, level-low, edge-high, edge-low)
-- Support reset tolerance option for each output port
-- Directly connected to APB bus and its shift clock is from APB bus clock
-  divided by a programmable value.
-- Co-work with external signal-chained TTL components (74LV165/74LV595)
-
-Required properties:
-
-- compatible : Should be one of
-  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
-- #gpio-cells : Should be 2, see gpio.txt
-- reg : Address and length of the register set for the device
-- gpio-controller : Marks the device node as a GPIO controller
-- interrupts : Interrupt specifier, see interrupt-controller/interrupts.txt
-- interrupt-controller : Mark the GPIO controller as an interrupt-controller
-- ngpios : number of *hardware* GPIO lines, see gpio.txt. This will expose
-  2 software GPIOs per hardware GPIO: one for hardware input, one for hardware
-  output. Up to 80 pins, must be a multiple of 8.
-- clocks : A phandle to the APB clock for SGPM clock division
-- bus-frequency : SGPM CLK frequency
-
-The sgpio and interrupt properties are further described in their respective
-bindings documentation:
-
-- Documentation/devicetree/bindings/gpio/gpio.txt
-- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-  Example:
-	sgpio: sgpio@1e780200 {
-		#gpio-cells = <2>;
-		compatible = "aspeed,ast2500-sgpio";
-		gpio-controller;
-		interrupts = <40>;
-		reg = <0x1e780200 0x0100>;
-		clocks = <&syscon ASPEED_CLK_APB>;
-		interrupt-controller;
-		ngpios = <8>;
-		bus-frequency = <12000000>;
-	};
-- 
2.17.1

