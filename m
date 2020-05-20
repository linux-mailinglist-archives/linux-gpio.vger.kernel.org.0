Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0851DA66C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 02:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgETAXN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 20:23:13 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41866 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAXM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 20:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589934176; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DMwhxCTrOVmrSTXxb5KXzDhIxLNNT9TsjN6HRPoQ70k=;
        b=DeiYN9aUR/53mNrba2+DaSI2rGqVECDvpnlmtn13GZImNkkYwEahJYSzuRa5FLr6yCSB93
        VHLCqro+WkV1FSRp4Zv3zJBaKGDLbZXNhEIHzTjy96NTWTBylWyyrff7kRDxtJIBg4PzRU
        diZF3HB9XvBU9PT000d0IK4gx02Gd3w=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Boris Brezillon <bbrezillon@kernel.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 3/3] dt-bindings: mtd: Convert ingenic,jz4780-nand.txt to YAML
Date:   Wed, 20 May 2020 02:22:34 +0200
Message-Id: <20200520002234.418025-3-paul@crapouillou.net>
In-Reply-To: <20200520002234.418025-1-paul@crapouillou.net>
References: <20200520002234.418025-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the ingenic,jz4780-nand.txt doc file to ingenic,nand.yaml.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: - Don't include ingenic,nemc-client.yaml which is gone
    	- Use 'partitions' property instead of '^partitions$' pattern

 .../bindings/mtd/ingenic,jz4780-nand.txt      |  92 ------------
 .../devicetree/bindings/mtd/ingenic,nand.yaml | 132 ++++++++++++++++++
 2 files changed, 132 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
deleted file mode 100644
index c02259353327..000000000000
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-* Ingenic JZ4780 NAND/ECC
-
-This file documents the device tree bindings for NAND flash devices on the
-JZ4780. NAND devices are connected to the NEMC controller (described in
-memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
-be children of the NEMC node.
-
-Required NAND controller device properties:
-- compatible: Should be one of:
-  * ingenic,jz4740-nand
-  * ingenic,jz4725b-nand
-  * ingenic,jz4780-nand
-- reg: For each bank with a NAND chip attached, should specify a bank number,
-  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
-
-Optional NAND controller device properties:
-- ecc-engine: To make use of the hardware ECC controller, this
-  property must contain a phandle for the ECC controller node. The required
-  properties for this node are described below. If this is not specified,
-  software ECC will be used instead.
-
-Optional children nodes:
-- Individual NAND chips are children of the NAND controller node.
-
-Required children node properties:
-- reg: An integer ranging from 1 to 6 representing the CS line to use.
-
-Optional children node properties:
-- nand-ecc-step-size: ECC block size in bytes.
-- nand-ecc-strength: ECC strength (max number of correctable bits).
-- nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw" by default
-- nand-on-flash-bbt: boolean to enable on flash bbt option, if not present false
-- rb-gpios: GPIO specifier for the busy pin.
-- wp-gpios: GPIO specifier for the write protect pin.
-
-Optional child node of NAND chip nodes:
-- partitions: see Documentation/devicetree/bindings/mtd/partition.txt
-
-Example:
-
-nemc: nemc@13410000 {
-	...
-
-	nandc: nand-controller@1 {
-		compatible = "ingenic,jz4780-nand";
-		reg = <1 0 0x1000000>;	/* Bank 1 */
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ecc-engine = <&bch>;
-
-		nand@1 {
-			reg = <1>;
-
-			nand-ecc-step-size = <1024>;
-			nand-ecc-strength = <24>;
-			nand-ecc-mode = "hw";
-			nand-on-flash-bbt;
-
-			rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
-			wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
-
-			partitions {
-				#address-cells = <2>;
-				#size-cells = <2>;
-				...
-			}
-		};
-	};
-};
-
-The ECC controller is a separate SoC component used for error correction on
-NAND devices. The following is a description of the device properties for a
-ECC controller.
-
-Required ECC properties:
-- compatible: Should be one of:
-  * ingenic,jz4740-ecc
-  * ingenic,jz4725b-bch
-  * ingenic,jz4780-bch
-- reg: Should specify the ECC controller registers location and length.
-- clocks: Clock for the ECC controller.
-
-Example:
-
-bch: bch@134d0000 {
-	compatible = "ingenic,jz4780-bch";
-	reg = <0x134d0000 0x10000>;
-
-	clocks = <&cgu JZ4780_CLK_BCH>;
-};
diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
new file mode 100644
index 000000000000..8abb6d463cb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs NAND controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ingenic,jz4740-nand
+      - ingenic,jz4725b-nand
+      - ingenic,jz4780-nand
+
+  reg:
+    items:
+      - description: Bank number, offset and size of first attached NAND chip
+      - description: Bank number, offset and size of second attached NAND chip
+      - description: Bank number, offset and size of third attached NAND chip
+      - description: Bank number, offset and size of fourth attached NAND chip
+    minItems: 1
+
+  ecc-engine: true
+
+  partitions:
+    type: object
+    description:
+      Node containing description of fixed partitions.
+      See Documentation/devicetree/bindings/mtd/partition.txt
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      rb-gpios:
+        description: GPIO specifier for the busy pin.
+        maxItems: 1
+
+      wp-gpios:
+        description: GPIO specifier for the write-protect pin.
+        maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    memory-controller@13410000 {
+      compatible = "ingenic,jz4780-nemc";
+      reg = <0x13410000 0x10000>;
+      #address-cells = <2>;
+      #size-cells = <1>;
+      ranges = <1 0 0x1b000000 0x1000000>,
+         <2 0 0x1a000000 0x1000000>,
+         <3 0 0x19000000 0x1000000>,
+         <4 0 0x18000000 0x1000000>,
+         <5 0 0x17000000 0x1000000>,
+         <6 0 0x16000000 0x1000000>;
+
+      clocks = <&cgu JZ4780_CLK_NEMC>;
+
+      nand-controller@1 {
+        compatible = "ingenic,jz4780-nand";
+        reg = <1 0 0x1000000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ecc-engine = <&bch>;
+
+        ingenic,nemc-tAS = <10>;
+        ingenic,nemc-tAH = <5>;
+        ingenic,nemc-tBP = <10>;
+        ingenic,nemc-tAW = <15>;
+        ingenic,nemc-tSTRV = <100>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pins_nemc>;
+
+        nand@1 {
+          reg = <1>;
+
+          nand-ecc-step-size = <1024>;
+          nand-ecc-strength = <24>;
+          nand-ecc-mode = "hw";
+          nand-on-flash-bbt;
+
+          pinctrl-names = "default";
+          pinctrl-0 = <&pins_nemc_cs1>;
+
+          partitions {
+            compatible = "fixed-partitions";
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            partition@0 {
+              label = "u-boot-spl";
+              reg = <0x0 0x0 0x0 0x800000>;
+            };
+
+            partition@800000 {
+              label = "u-boot";
+              reg = <0x0 0x800000 0x0 0x200000>;
+            };
+
+            partition@a00000 {
+              label = "u-boot-env";
+              reg = <0x0 0xa00000 0x0 0x200000>;
+            };
+
+            partition@c00000 {
+              label = "boot";
+              reg = <0x0 0xc00000 0x0 0x4000000>;
+            };
+
+            partition@4c00000 {
+              label = "system";
+              reg = <0x0 0x4c00000 0x1 0xfb400000>;
+            };
+          };
+        };
+      };
+    };
-- 
2.26.2

