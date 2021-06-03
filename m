Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4385839A2AE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhFCOBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 10:01:45 -0400
Received: from mx3.wp.pl ([212.77.101.10]:8051 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230386AbhFCOBn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Jun 2021 10:01:43 -0400
Received: (wp-smtpd smtp.wp.pl 2142 invoked from network); 3 Jun 2021 15:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1622728793; bh=fRnCsJG2Rwzygo40iFZgcyKGawMpbMTvyVyV/dQUXyI=;
          h=From:To:Cc:Subject;
          b=AEs4j4HOr8uXJe4VR8tYucV0To0l82/oG9GYzlGLjN5Th2xSiwtdaEbUDfYNjz2z8
           JzJ4aHAWrwSBorWNR7GvuevA6Dc7BHwTUYXrUkJj+IW71ccz5GUzCqfi4xbpn4d89D
           nYETEVktySi9LX5lyd0mB/ojPPdwXhtUiisI7vBo=
Received: from riviera.nat.ds.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linus.walleij@linaro.org>; 3 Jun 2021 15:59:53 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, john@phrozen.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v4] dt-bindings: gpio: stp: convert to json-schema
Date:   Thu,  3 Jun 2021 15:59:45 +0200
Message-Id: <20210603135945.3495-1-olek2@wp.pl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: d332e804784052e5af596d807155646f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [4QNk]                               
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Lantiq STP Device Tree binding documentation to json-schema.
Add the missing pinctrl property to the example. Add missing lantiq,phy3
and lantiq,phy4 bindings for xRX300 and xRX330 SoCs.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v3:
 - Removed description of the reg property.
 - Changed regex pattern property.
 - Moved lantiq,rising to properties.
Changes since v2:
 - Changed phy numbering in description of pattern Properties. Numbering
   should start with 1. 
Changes since v1:
 - Renamed node to gpio.
 - Dropped default pinctrl from this binding.
 - Converted lantiq,phyX to patternProperties.
---
 .../bindings/gpio/gpio-stp-xway.txt           | 42 --------
 .../bindings/gpio/gpio-stp-xway.yaml          | 99 +++++++++++++++++++
 2 files changed, 99 insertions(+), 42 deletions(-)
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
index 000000000000..d565c4b63dbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
@@ -0,0 +1,99 @@
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
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: lantiq,gpio-stp-xway
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    description:
+      The first cell is the pin number and the second cell is used to specify
+      consumer flags.
+    const: 2
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
+  lantiq,rising:
+    description:
+      Use rising instead of falling edge for the shift register.
+    type: boolean
+
+patternProperties:
+  "^lantiq,phy[1-4]$":
+    description:
+      The gphy core can control 3 bits of the gpio cascade. In the xRX200 family
+      phy[1-2] are available, in xRX330 phy[1-3] and in XRX330 phy[1-4].
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x7
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
+    gpio@e100bb0 {
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

