Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F06037FFA5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 23:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhEMVM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 May 2021 17:12:26 -0400
Received: from mx4.wp.pl ([212.77.101.12]:50071 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232569AbhEMVMZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 May 2021 17:12:25 -0400
Received: (wp-smtpd smtp.wp.pl 8400 invoked from network); 13 May 2021 23:04:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1620939873; bh=UKMDBnG5p5APpb3tRL0n14Y5bMFveQTAt2xY2r5P3Ys=;
          h=From:To:Cc:Subject;
          b=f8x38V4CyT3Kz4WPRlyYZTkzgZKvyzWOm7uGGkgwBMmvzwbKgDsfI3l/Jom6MuEWf
           5gbFGgtbgGUC8jy+8KJsdKVW2Z8LeZjPA9FwLyMqYIExn0tzl8XodtqD0Ys7ylBw2G
           2XEs29tBKDgE0jr8FEiB5EGQUW7IT2buQMXusGfc=
Received: from riviera.nat.ds.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linus.walleij@linaro.org>; 13 May 2021 23:04:33 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, john@phrozen.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 1/2] dt-bindings: gpio: stp: convert to json-schema
Date:   Thu, 13 May 2021 23:03:39 +0200
Message-Id: <20210513210340.10466-1-olek2@wp.pl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: fb27e803245d34b0a93d3341ec428926
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [weOU]                               
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Lantiq STP Device Tree binding documentation to json-schema.
Add the missing pinctrl property.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/gpio/gpio-stp-xway.txt           |  42 -------
 .../bindings/gpio/gpio-stp-xway.yaml          | 117 ++++++++++++++++++
 2 files changed, 117 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
deleted file mode 100644
index 78458adbf4b7..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Lantiq SoC Serial To Parallel (STP) GPIO controller
-
-The Serial To Parallel (STP) is found on MIPS based Lantiq socs. It is a
-peripheral controller used to drive external shift register cascades. At most
-3 groups of 8 bits can be driven. The hardware is able to allow the DSL modem
-to drive the 2 LSBs of the cascade automatically.
-
-
-Required properties:
-- compatible : Should be "lantiq,gpio-stp-xway"
-- reg : Address and length of the register set for the device
-- #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters (currently
-  unused).
-- gpio-controller : Marks the device node as a gpio controller.
-
-Optional properties:
-- lantiq,shadow : The default value that we shall assume as already set on the
-  shift register cascade.
-- lantiq,groups : Set the 3 bit mask to select which of the 3 groups are enabled
-  in the shift register cascade.
-- lantiq,dsl : The dsl core can control the 2 LSBs of the gpio cascade. This 2 bit
-  property can enable this feature.
-- lantiq,phy1 : The gphy1 core can control 3 bits of the gpio cascade.
-- lantiq,phy2 : The gphy2 core can control 3 bits of the gpio cascade.
-- lantiq,rising : use rising instead of falling edge for the shift register
-
-Example:
-
-gpio1: stp@e100bb0 {
-	compatible = "lantiq,gpio-stp-xway";
-	reg = <0xE100BB0 0x40>;
-	#gpio-cells = <2>;
-	gpio-controller;
-
-	lantiq,shadow = <0xffff>;
-	lantiq,groups = <0x7>;
-	lantiq,dsl = <0x3>;
-	lantiq,phy1 = <0x7>;
-	lantiq,phy2 = <0x7>;
-	/* lantiq,rising; */
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
new file mode 100644
index 000000000000..a36acc98898c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-stp-xway.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq SoC Serial To Parallel (STP) GPIO controller
+
+description: |
+  The Serial To Parallel (STP) is found on MIPS based Lantiq socs. It is a
+  peripheral controller used to drive external shift register cascades. At most
+  3 groups of 8 bits can be driven. The hardware is able to allow the DSL modem
+  and Ethernet PHYs to drive some bytes of the cascade automatically.
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+properties:
+  $nodename:
+    pattern: "^stp@[0-9a-f]+$"
+
+  compatible:
+    const: lantiq,gpio-stp-xway
+
+  reg:
+    description:
+      Address and length of the register set for the device.
+    maxItems: 1
+
+  gpio-controller:
+    description:
+      Marks the device node as a gpio controller.
+    type: boolean
+
+  "#gpio-cells":
+    description:
+      The first cell is the pin number and the second cell is used to specify
+      consumer flags.
+    const: 2
+
+  pinctrl-0:
+    description: Should specify pin control groups used for this controller.
+
+  pinctrl-names:
+    const: default
+
+  lantiq,shadow:
+    description:
+      The default value that we shall assume as already set on the
+      shift register cascade.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x000000
+    maximum: 0xffffff
+
+  lantiq,groups:
+    description:
+      Set the 3 bit mask to select which of the 3 groups are enabled
+      in the shift register cascade.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x7
+
+  lantiq,dsl:
+    description:
+      The dsl core can control the 2 LSBs of the gpio cascade. This 2 bit
+      property can enable this feature.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x3
+
+  lantiq,phy1:
+    description:
+      The gphy1 core can control 3 bits of the gpio cascade. Available on
+      the xRX200, xRX300 and xRX330 family.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x7
+
+  lantiq,phy2:
+    description:
+      The gphy2 core can control 3 bits of the gpio cascade. Available on
+      the xRX200, xRX300 and xRX330 family.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x7
+
+  lantiq,rising:
+    description:
+      Use rising instead of falling edge for the shift register.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    stp: stp@e100bb0 {
+        compatible = "lantiq,gpio-stp-xway";
+        reg = <0xE100BB0 0x40>;
+        #gpio-cells = <2>;
+        gpio-controller;
+
+        pinctrl-0 = <&stp_pins>;
+        pinctrl-names = "default";
+
+        lantiq,shadow = <0xffffff>;
+        lantiq,groups = <0x7>;
+        lantiq,dsl = <0x3>;
+        lantiq,phy1 = <0x7>;
+        lantiq,phy2 = <0x7>;
+    };
+...
-- 
2.30.2

