Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D543166CCB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 03:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgBUCUe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 21:20:34 -0500
Received: from condef-06.nifty.com ([202.248.20.71]:36691 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbgBUCUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 21:20:34 -0500
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Feb 2020 21:20:32 EST
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-06.nifty.com with ESMTP id 01L2Bk9T029212
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 11:11:46 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01L2A7H7001755;
        Fri, 21 Feb 2020 11:10:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01L2A7H7001755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582251013;
        bh=95ajj3A8zakPKExEWEowteIJzcxYdgGQ9juu7oiRGCI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RsdOmAYt/yKao+5tU02MNmciYOJHtrvfRhisd+fEPXVJFZj4jWuD3ETXhBgNwkztF
         OLZlO1aklAb/GuUoSmyC4W5OZcCLJ/Qwx8FZTv/JKtA4QKg1TSbgVw0+tEaxqrHjK4
         pk+DHdMBe2Q7+RQS04DTJfKVsBYEgSbgQRLkzRXBhGaf2tLez9dw7fW4xOqA04VrOt
         2B31sPm5mfCePSvcljcZP+x8bfVdYuMWUPUoKfJPeWVJaLoetpSXOs2YGOmGUNqRQ/
         Eimoe7U/JtelM/aZhMNuUOn/ZAe1nUEHNsQCJ68K70ikmw8HCwBBrfuRyR/Ks+i8ul
         Wr716v/uF4T0A==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bingings: pinctrl: Convert UniPhier pin controller to json-schema
Date:   Fri, 21 Feb 2020 11:10:02 +0900
Message-Id: <20200221021002.18795-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221021002.18795-1-yamada.masahiro@socionext.com>
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the UniPhier pin controller binding to DT schema format.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

In the original .txt file, there is a description:
The UniPhier pinctrl should be a subnode of a "syscon" compatible node

I did not figure out how to represent (or check) it in dt-schema.
I just moved it to a comment line in 'examples'.
If there is a better way, please let me know.


 .../pinctrl/socionext,uniphier-pinctrl.txt    | 27 ------------
 .../pinctrl/socionext,uniphier-pinctrl.yaml   | 42 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 43 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
deleted file mode 100644
index 8173b12138ad..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-UniPhier SoCs pin controller
-
-Required properties:
-- compatible: should be one of the following:
-    "socionext,uniphier-ld4-pinctrl"  - for LD4 SoC
-    "socionext,uniphier-pro4-pinctrl" - for Pro4 SoC
-    "socionext,uniphier-sld8-pinctrl" - for sLD8 SoC
-    "socionext,uniphier-pro5-pinctrl" - for Pro5 SoC
-    "socionext,uniphier-pxs2-pinctrl" - for PXs2 SoC
-    "socionext,uniphier-ld6b-pinctrl" - for LD6b SoC
-    "socionext,uniphier-ld11-pinctrl" - for LD11 SoC
-    "socionext,uniphier-ld20-pinctrl" - for LD20 SoC
-    "socionext,uniphier-pxs3-pinctrl" - for PXs3 SoC
-
-Note:
-The UniPhier pinctrl should be a subnode of a "syscon" compatible node.
-
-Example:
-	soc-glue@5f800000 {
-		compatible = "socionext,uniphier-pro4-soc-glue",
-			     "simple-mfd", "syscon";
-		reg = <0x5f800000 0x2000>;
-
-		pinctrl: pinctrl {
-			compatible = "socionext,uniphier-pro4-pinctrl";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
new file mode 100644
index 000000000000..f8a93d8680f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/socionext,uniphier-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UniPhier SoCs pin controller
+
+maintainers:
+  - Masahiro Yamada <yamada.masahiro@socionext.com>
+
+properties:
+  $nodename:
+    pattern: "pinctrl"
+
+  compatible:
+    enum:
+      - socionext,uniphier-ld4-pinctrl
+      - socionext,uniphier-pro4-pinctrl
+      - socionext,uniphier-sld8-pinctrl
+      - socionext,uniphier-pro5-pinctrl
+      - socionext,uniphier-pxs2-pinctrl
+      - socionext,uniphier-ld6b-pinctrl
+      - socionext,uniphier-ld11-pinctrl
+      - socionext,uniphier-ld20-pinctrl
+      - socionext,uniphier-pxs3-pinctrl
+
+required:
+  - compatible
+
+examples:
+  - |
+    // The UniPhier pinctrl should be a subnode of a "syscon" compatible node.
+
+    soc-glue@5f800000 {
+        compatible = "socionext,uniphier-pro4-soc-glue", "simple-mfd", "syscon";
+        reg = <0x5f800000 0x2000>;
+
+        pinctrl: pinctrl {
+            compatible = "socionext,uniphier-pro4-pinctrl";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3cb4c8a9107d..920bef1f5308 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2548,7 +2548,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-uniphier.gi
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
 F:	Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
-F:	Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
+F:	Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
 F:	arch/arm/boot/dts/uniphier*
 F:	arch/arm/include/asm/hardware/cache-uniphier.h
 F:	arch/arm/mach-uniphier/
-- 
2.17.1

