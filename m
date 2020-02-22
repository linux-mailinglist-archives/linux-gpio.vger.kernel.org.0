Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649F9168CD5
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2020 07:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgBVGFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Feb 2020 01:05:55 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:42424 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgBVGFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Feb 2020 01:05:54 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 01M64cSL007264;
        Sat, 22 Feb 2020 15:04:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 01M64cSL007264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582351481;
        bh=oDf9qz+GZWAPWYmHoFftPILijL8CHYn9USMXC9ZrbE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aorvtRolf0+JAnTTtXq8CQ3Ht2LYQ+fuE3QYJ+N30aFtxuCa0tSJfmCa+dVyr/gxX
         CSyctQ50hP9L3j/JsytSH999TqGzNmczoqqYlGEUXX6mwb5M/3Cu2pNOnFMpZxfSk9
         lGn6L6k9tIkMgbulGh3R6TyzTwJJQYf7mIl7crbD5cHIykiQYHRjHMxA89E4J2bxED
         CFdnEGy/epKX17gh6SpccBuAf+t20eKFHjDAFbbtBmUE7uRWBJzUdSTCG5OBi8uNgV
         01a6ubOIhWnuEQXmMYKEMu/6QuXoLsANS6kejVrH66VyawQLipoYZsPzsvIicYFLaK
         g53w0HXuTIVbg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bingings: pinctrl: Convert UniPhier pin controller to json-schema
Date:   Sat, 22 Feb 2020 15:04:35 +0900
Message-Id: <20200222060435.971-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222060435.971-1-yamada.masahiro@socionext.com>
References: <20200222060435.971-1-yamada.masahiro@socionext.com>
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


Changes in v2: None

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

