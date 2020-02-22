Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 847FF168CD3
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2020 07:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgBVGFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Feb 2020 01:05:55 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:42396 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgBVGFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Feb 2020 01:05:54 -0500
X-Greylist: delayed 100448 seconds by postgrey-1.27 at vger.kernel.org; Sat, 22 Feb 2020 01:05:52 EST
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 01M64cSK007264;
        Sat, 22 Feb 2020 15:04:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 01M64cSK007264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582351480;
        bh=QDsj9fQRh1dUOvTWAuvPScwGCLineeDyL2Vs+90dfww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=brdOKtaqTcaIBKZLJlFWtWmuZ/ritj3jrT5KxuqiYwuCbJ2G3yDExIZ9Hy7qIkzT0
         dWnOlIFIJLcvozpjwWswrg/jQoYJa4aV7onyLY3Vaq0rPTvpco738GyON1s4cUHOyQ
         /I6LEYeQAIbcJkCym07tVMqjM+6q1H5iFhgA60uBm/tltZV7CKDBIvmTueMhDX0WbM
         i4XfJ1eeovVtPx+042/VZew8LZkbikZteg1Fe4mq/TuW64W+FZKl1Inb7oisAsbmoJ
         fC2RkMoD7pfauf+DeC87iYIKvwx9dQ9ZpSXNDIMbmyn79zZH2iRbyzY4QRP8rqVCuZ
         8U5bKZdQd2Zeg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: gpio: Convert UniPhier GPIO to json-schema
Date:   Sat, 22 Feb 2020 15:04:34 +0900
Message-Id: <20200222060435.971-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222060435.971-1-yamada.masahiro@socionext.com>
References: <20200222060435.971-1-yamada.masahiro@socionext.com>
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

Changes in v2:
  - fix the build error in the example

 .../bindings/gpio/gpio-uniphier.txt           | 51 ----------
 .../gpio/socionext,uniphier-gpio.yaml         | 92 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 93 insertions(+), 52 deletions(-)
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
index 000000000000..580a39e09d39
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -0,0 +1,92 @@
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/gpio/uniphier-gpio.h>
+
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
+    // numbering. (That is, PORT 8, 9, 18, 19, 28, 29, ... do not exist.)
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

