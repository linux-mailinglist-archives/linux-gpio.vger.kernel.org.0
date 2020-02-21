Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D973166CD6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 03:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgBUCW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 21:22:58 -0500
Received: from condef-03.nifty.com ([202.248.20.68]:26157 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729226AbgBUCW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 21:22:58 -0500
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-03.nifty.com with ESMTP id 01L2Bnpg001359
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 11:11:49 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01L2A7H6001755;
        Fri, 21 Feb 2020 11:10:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01L2A7H6001755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582251012;
        bh=Z9GoHg2f6AcvQqJHZJr2yEBAoHoGgMjW8BRSWDxl0Rw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AxBs5MI4q9zfaJpZdyZU9Rf6OOkBF6k05frD0OLyG1tdFHAbgQQ0OLEoTHFM2CT9g
         gLJhMXpMh6JQnbuBJTN8gdLTgYqSt8WYLFT9j+rSazcwZrX0cYMzOSuMZO4M8IoMDM
         TS1y0YMZwgumnpJt6pbFgEBo/oq3zdOZyF5VXbtdZPVBMNkT6fP2h6syVtm24Tu+M+
         oA5WY2TY5sjxpwtjrtWF1HqIdZt18o5nH4BjlfkaMjw98b+KOuoIxdT2ih3+LshQoP
         gkF52gU27dReCsDVbWPnRF6j6JkU9JPvXR/l7ag0xLwXguI8Qx2d1zEGp+X3uI8r5b
         q4TjOL5L1jaBw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: gpio: Convert UniPhier GPIO to json-schema
Date:   Fri, 21 Feb 2020 11:10:01 +0900
Message-Id: <20200221021002.18795-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221021002.18795-1-yamada.masahiro@socionext.com>
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the UniPhier GPIO controller binding to DT schema format.

I omitted the 'gpio-ranges' property because it is defined in the
dt-schema project (/schemas/gpio/gpio.yaml).

As of writing, the 'gpio-ranges-group-names' is not defined in that
file despite it is a common property described in
Documentation/devicetree/bindings/gpio/gpio.txt
So, I defined it in this schema.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I have a question about the range about 'ngpio'.

  ngpios:
    minimum: 0
    maximum: 512

The 'ngpio' property is already defined as 'uint32' in the dt-schema tool:
https://github.com/robherring/dt-schema/blob/master/schemas/gpio/gpio.yaml#L20

'uint32' is unsigned, so 'minimum: 0' looks too obvious.

I cannot omit the minimum because minimum and maximum depend on each other.
I just put a sensible number, 512, in maximum.

If this range is entirely unneeded, I will delete it.


 .../bindings/gpio/gpio-uniphier.txt           | 51 -----------
 .../gpio/socionext,uniphier-gpio.yaml         | 89 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 90 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-uniphier.txt b/Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
deleted file mode 100644
index f281f12dac18..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-UniPhier GPIO controller
-
-Required properties:
-- compatible: Should be "socionext,uniphier-gpio".
-- reg: Specifies offset and length of the register set for the device.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Should be 2.  The first cell is the pin number and the second
-  cell is used to specify optional parameters.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Should be 2.  The first cell defines the interrupt number.
-  The second cell bits[3:0] is used to specify trigger type as follows:
-    1 = low-to-high edge triggered
-    2 = high-to-low edge triggered
-    4 = active high level-sensitive
-    8 = active low level-sensitive
-  Valid combinations are 1, 2, 3, 4, 8.
-- ngpios: Specifies the number of GPIO lines.
-- gpio-ranges: Mapping to pin controller pins (as described in gpio.txt)
-- socionext,interrupt-ranges: Specifies an interrupt number mapping between
-  this GPIO controller and its interrupt parent, in the form of arbitrary
-  number of <child-interrupt-base parent-interrupt-base length> triplets.
-
-Optional properties:
-- gpio-ranges-group-names: Used for named gpio ranges (as described in gpio.txt)
-
-Example:
-	gpio: gpio@55000000 {
-		compatible = "socionext,uniphier-gpio";
-		reg = <0x55000000 0x200>;
-		interrupt-parent = <&aidet>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&pinctrl 0 0 0>;
-		gpio-ranges-group-names = "gpio_range";
-		ngpios = <248>;
-		socionext,interrupt-ranges = <0 48 16>, <16 154 5>, <21 217 3>;
-	};
-
-Consumer Example:
-
-	sdhci0_pwrseq {
-		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpio UNIPHIER_GPIO_PORT(29, 4) GPIO_ACTIVE_LOW>;
-	};
-
-Please note UNIPHIER_GPIO_PORT(29, 4) represents PORT294 in the SoC document.
-Unfortunately, only the one's place is octal in the port numbering.  (That is,
-PORT 8, 9, 18, 19, 28, 29, ... are missing.)  UNIPHIER_GPIO_PORT() is a helper
-macro to calculate 29 * 8 + 4.
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
new file mode 100644
index 000000000000..94beb4342249
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/socionext,uniphier-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UniPhier GPIO controller
+
+maintainers:
+  - Masahiro Yamada <yamada.masahiro@socionext.com>
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: socionext,uniphier-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    description: |
+      The first cell defines the interrupt number.
+      The second cell bits[3:0] is used to specify trigger type as follows:
+        1 = low-to-high edge triggered
+        2 = high-to-low edge triggered
+        4 = active high level-sensitive
+        8 = active low level-sensitive
+      Valid combinations are 1, 2, 3, 4, 8.
+    const: 2
+
+  ngpios:
+    minimum: 0
+    maximum: 512
+
+  gpio-ranges-group-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  socionext,interrupt-ranges:
+    description: |
+      Specifies an interrupt number mapping between this GPIO controller and
+      its interrupt parent, in the form of arbitrary number of
+      <child-interrupt-base parent-interrupt-base length> triplets.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+  - ngpios
+  - gpio-ranges
+  - socionext,interrupt-ranges
+
+examples:
+  - |
+    gpio: gpio@55000000 {
+        compatible = "socionext,uniphier-gpio";
+        reg = <0x55000000 0x200>;
+        interrupt-parent = <&aidet>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 0>;
+        gpio-ranges-group-names = "gpio_range";
+        ngpios = <248>;
+        socionext,interrupt-ranges = <0 48 16>, <16 154 5>, <21 217 3>;
+    };
+
+    // Consumer:
+    // Please note UNIPHIER_GPIO_PORT(29, 4) represents PORT294 in the SoC
+    // document. Unfortunately, only the one's place is octal in the port
+    // numbering. (That is, PORT 8, 9, 18, 19, 28, 29, ... are missing.)
+    // UNIPHIER_GPIO_PORT() is a helper macro to calculate 29 * 8 + 4.
+    sdhci0_pwrseq {
+        compatible = "mmc-pwrseq-emmc";
+        reset-gpios = <&gpio UNIPHIER_GPIO_PORT(29, 4) GPIO_ACTIVE_LOW>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93ccb6708ae9..3cb4c8a9107d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2547,7 +2547,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-uniphier.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
-F:	Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
+F:	Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
 F:	arch/arm/boot/dts/uniphier*
 F:	arch/arm/include/asm/hardware/cache-uniphier.h
-- 
2.17.1

