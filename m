Return-Path: <linux-gpio+bounces-11474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A439A1681
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CDC71F21F23
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178F7469D;
	Thu, 17 Oct 2024 00:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="yoXz3BsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8302161;
	Thu, 17 Oct 2024 00:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123715; cv=none; b=uDDlaW0i4Dk3Dth4/ZN3sH/T4hda3lfF6HLV/h6F8KT7pMHHYyjv1jXpV7Zj2WycfOhtuKuF/B3MZyrWwPLJpuLgwM2VSJTuM7vTlh8pticI5WSM+SG6GT8nXZAJlEf00u6dYD3I3H3cQ/lO6/ALLd1ZWhx5tvLYi62yuburQVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123715; c=relaxed/simple;
	bh=ZbI6pMVL3QkXnbAwLCgB2mJ2kwaTVYFOS7/spHZEeBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWMBGeroliPW2RObgsox0YWdNyhDk2m5+R967PnsPcj6LPabhwfNivsi8UKHu20pQqk6tnE9SV/ni80W54eWEYhvZHIvkEaQb0Ec4BK2vK8UJzxQgQodLg0pDvBsIrN857nQnTp58ZTBnXNxeEMZakYNxbiK+4TcRWnDm2m0O0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=yoXz3BsB; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C70948657F;
	Thu, 17 Oct 2024 02:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123710;
	bh=qBZykJ1Uo+ecFJxDsAnT4ZEsZFZ/zQ7VlvPQYC1QS7A=;
	h=From:To:Cc:Subject:Date:From;
	b=yoXz3BsBJsd5pBgTZjUAr2TfJ6K488EOo22Uy5S17QSWL+LEIVy9XtRomqk93y8xC
	 YEJqDab9cLWIz6TDzz/36ReDDC0C6fF0tmsGDQ8zkGYK5iTv53QLL4iNVxoN5zE9yn
	 ianXK6HfgFpVCnFwg0DFWbpoGfOPnjUk1iAv6y/smBbmrkiqhMaQT5VFK8j6webGz7
	 +1X3X0EtrnnBmTIvV2RJBIBs3Ej75EpQF+DEuvNgOwGn1QiW6Auuw+4oUswc3kj6A1
	 1I6KWBlADvXKJLZyt2Qn+7DvMNWZeqq21kz9+3a8AAYwxDBHENy0ZLo8PwJ9n8Qf3u
	 jv4CUETPSQCjw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl: Convert i.MX35/5x/6 to YAML
Date: Thu, 17 Oct 2024 02:06:47 +0200
Message-ID: <20241017000801.149276-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
except for the configuration bits which differ across SoCs. Rename the
fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
strings for the other SoCs and fill in the various bits into desciption.
This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
Remove the old text DT bindings description.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: - Use DT schema to refer to the fsl,imx35-pinctrl.yaml file
    - Special-case the iMX50 compatible string
---
 .../bindings/pinctrl/fsl,imx35-pinctrl.txt    | 33 -------
 ...ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} | 88 ++++++++++++++++---
 .../bindings/pinctrl/fsl,imx50-pinctrl.txt    | 32 -------
 .../bindings/pinctrl/fsl,imx51-pinctrl.txt    | 32 -------
 .../bindings/pinctrl/fsl,imx53-pinctrl.txt    | 32 -------
 .../bindings/pinctrl/fsl,imx6dl-pinctrl.txt   | 38 --------
 .../bindings/pinctrl/fsl,imx6q-pinctrl.txt    | 38 --------
 .../bindings/pinctrl/fsl,imx6sl-pinctrl.txt   | 39 --------
 .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt  | 40 ---------
 .../bindings/pinctrl/fsl,imx6sx-pinctrl.txt   | 36 --------
 10 files changed, 78 insertions(+), 330 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
 rename Documentation/devicetree/bindings/pinctrl/{fsl,imx6ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} (50%)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
deleted file mode 100644
index c083dfd25db93..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Freescale IMX35 IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx35-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx35 datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_DRIVE_VOLAGAGE_18	(1 << 13)
-PAD_CTL_DRIVE_VOLAGAGE_33	(0 << 13)
-PAD_CTL_HYS			(1 << 8)
-PAD_CTL_PKE			(1 << 7)
-PAD_CTL_PUE			(1 << 6)
-PAD_CTL_PUS_100K_DOWN		(0 << 4)
-PAD_CTL_PUS_47K_UP		(1 << 4)
-PAD_CTL_PUS_100K_UP		(2 << 4)
-PAD_CTL_PUS_22K_UP		(3 << 4)
-PAD_CTL_ODE_CMOS		(0 << 3)
-PAD_CTL_ODE_OPENDRAIN		(1 << 3)
-PAD_CTL_DSE_NOMINAL		(0 << 1)
-PAD_CTL_DSE_HIGH		(1 << 1)
-PAD_CTL_DSE_MAX			(2 << 1)
-PAD_CTL_SRE_FAST		(1 << 0)
-PAD_CTL_SRE_SLOW		(0 << 0)
-
-Refer to imx35-pinfunc.h in device tree source folder for all available
-imx35 PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
similarity index 50%
rename from Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
index 906b264a9e3cd..265c43ab76f4c 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/fsl,imx6ul-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Freescale IMX6UL IOMUX Controller
+title: Freescale IMX35/IMX5x/IMX6 IOMUX Controller
 
 maintainers:
   - Dong Aisheng <aisheng.dong@nxp.com>
@@ -18,9 +18,21 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx6ul-iomuxc
-      - fsl,imx6ull-iomuxc-snvs
+    oneOf:
+      - enum:
+          - fsl,imx35-iomuxc
+          - fsl,imx51-iomuxc
+          - fsl,imx53-iomuxc
+          - fsl,imx6dl-iomuxc
+          - fsl,imx6q-iomuxc
+          - fsl,imx6sl-iomuxc
+          - fsl,imx6sll-iomuxc
+          - fsl,imx6sx-iomuxc
+          - fsl,imx6ul-iomuxc
+          - fsl,imx6ull-iomuxc-snvs
+      - items:
+          - const: fsl,imx50-iomuxc
+          - const: fsl,imx53-iomuxc
 
   reg:
     maxItems: 1
@@ -39,9 +51,9 @@ patternProperties:
           each entry consists of 6 integers and represents the mux and config
           setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
           mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm/boot/dts/imx6ul-pinfunc.h>. The last integer
+          be found in <arch/arm/boot/dts/nxp/imx/imx*-pinfunc.h>. The last integer
           CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MX6UL Reference Manual for detailed CONFIG settings.
+          refer to matching i.MX Reference Manual for detailed CONFIG settings.
         $ref: /schemas/types.yaml#/definitions/uint32-matrix
         items:
           items:
@@ -56,7 +68,41 @@ patternProperties:
             - description: |
                 "input_val" indicates the select input value to be applied.
             - description: |
-                "pad_setting" indicates the pad configuration value to be applied:
+                "pad_setting" indicates the pad configuration value to be applied.
+                Common i.MX35
+                  PAD_CTL_DRIVE_VOLAGAGE_18       (1 << 13)
+                  PAD_CTL_DRIVE_VOLAGAGE_33       (0 << 13)
+                  PAD_CTL_HYS                     (1 << 8)
+                  PAD_CTL_PKE                     (1 << 7)
+                  PAD_CTL_PUE                     (1 << 6)
+                  PAD_CTL_PUS_100K_DOWN           (0 << 4)
+                  PAD_CTL_PUS_47K_UP              (1 << 4)
+                  PAD_CTL_PUS_100K_UP             (2 << 4)
+                  PAD_CTL_PUS_22K_UP              (3 << 4)
+                  PAD_CTL_ODE_CMOS                (0 << 3)
+                  PAD_CTL_ODE_OPENDRAIN           (1 << 3)
+                  PAD_CTL_DSE_NOMINAL             (0 << 1)
+                  PAD_CTL_DSE_HIGH                (1 << 1)
+                  PAD_CTL_DSE_MAX                 (2 << 1)
+                  PAD_CTL_SRE_FAST                (1 << 0)
+                  PAD_CTL_SRE_SLOW                (0 << 0)
+                Common i.MX50/i.MX51/i.MX53 bits
+                  PAD_CTL_HVE                     (1 << 13)
+                  PAD_CTL_HYS                     (1 << 8)
+                  PAD_CTL_PKE                     (1 << 7)
+                  PAD_CTL_PUE                     (1 << 6)
+                  PAD_CTL_PUS_100K_DOWN           (0 << 4)
+                  PAD_CTL_PUS_47K_UP              (1 << 4)
+                  PAD_CTL_PUS_100K_UP             (2 << 4)
+                  PAD_CTL_PUS_22K_UP              (3 << 4)
+                  PAD_CTL_ODE                     (1 << 3)
+                  PAD_CTL_DSE_LOW                 (0 << 1)
+                  PAD_CTL_DSE_MED                 (1 << 1)
+                  PAD_CTL_DSE_HIGH                (2 << 1)
+                  PAD_CTL_DSE_MAX                 (3 << 1)
+                  PAD_CTL_SRE_FAST                (1 << 0)
+                  PAD_CTL_SRE_SLOW                (0 << 0)
+                Common i.MX6 bits
                   PAD_CTL_HYS                     (1 << 16)
                   PAD_CTL_PUS_100K_DOWN           (0 << 14)
                   PAD_CTL_PUS_47K_UP              (1 << 14)
@@ -69,6 +115,11 @@ patternProperties:
                   PAD_CTL_SPEED_MED               (1 << 6)
                   PAD_CTL_SPEED_HIGH              (3 << 6)
                   PAD_CTL_DSE_DISABLE             (0 << 3)
+                  PAD_CTL_SRE_FAST                (1 << 0)
+                  PAD_CTL_SRE_SLOW                (0 << 0)
+                i.MX6SL/MX6SLL specific bits
+                  PAD_CTL_LVE                     (1 << 22) (MX6SL/SLL only)
+                i.MX6SLL/i.MX6SX/i.MX6UL/i.MX6ULL specific bits
                   PAD_CTL_DSE_260ohm              (1 << 3)
                   PAD_CTL_DSE_130ohm              (2 << 3)
                   PAD_CTL_DSE_87ohm               (3 << 3)
@@ -76,8 +127,14 @@ patternProperties:
                   PAD_CTL_DSE_52ohm               (5 << 3)
                   PAD_CTL_DSE_43ohm               (6 << 3)
                   PAD_CTL_DSE_37ohm               (7 << 3)
-                  PAD_CTL_SRE_FAST                (1 << 0)
-                  PAD_CTL_SRE_SLOW                (0 << 0)
+                i.MX6DL/i.MX6Q/i.MX6SL specific bits
+                  PAD_CTL_DSE_240ohm              (1 << 3)
+                  PAD_CTL_DSE_120ohm              (2 << 3)
+                  PAD_CTL_DSE_80ohm               (3 << 3)
+                  PAD_CTL_DSE_60ohm               (4 << 3)
+                  PAD_CTL_DSE_48ohm               (5 << 3)
+                  PAD_CTL_DSE_40ohm               (6 << 3)
+                  PAD_CTL_DSE_34ohm               (7 << 3)
 
     required:
       - fsl,pins
@@ -114,3 +171,14 @@ examples:
         >;
       };
     };
+  - |
+    iomuxc_mx6q: pinctrl@20e0000 {
+        compatible = "fsl,imx6q-iomuxc";
+        reg = <0x20e0000 0x4000>;
+
+        pinctrl_uart4: uart4grp {
+            fsl,pins =
+                <0x288 0x658 0x000 0x3 0x0	0x140>,
+                <0x28c 0x65c 0x938 0x3 0x3	0x140>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
deleted file mode 100644
index 6da01d619d33e..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Freescale IMX50 IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx50-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx50 datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_HVE			(1 << 13)
-PAD_CTL_HYS			(1 << 8)
-PAD_CTL_PKE			(1 << 7)
-PAD_CTL_PUE			(1 << 6)
-PAD_CTL_PUS_100K_DOWN		(0 << 4)
-PAD_CTL_PUS_47K_UP		(1 << 4)
-PAD_CTL_PUS_100K_UP		(2 << 4)
-PAD_CTL_PUS_22K_UP		(3 << 4)
-PAD_CTL_ODE			(1 << 3)
-PAD_CTL_DSE_LOW			(0 << 1)
-PAD_CTL_DSE_MED			(1 << 1)
-PAD_CTL_DSE_HIGH		(2 << 1)
-PAD_CTL_DSE_MAX			(3 << 1)
-PAD_CTL_SRE_FAST		(1 << 0)
-PAD_CTL_SRE_SLOW		(0 << 0)
-
-Refer to imx50-pinfunc.h in device tree source folder for all available
-imx50 PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
deleted file mode 100644
index 4d1408fcc99cf..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Freescale IMX51 IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx51-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx51 datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_HVE			(1 << 13)
-PAD_CTL_HYS			(1 << 8)
-PAD_CTL_PKE			(1 << 7)
-PAD_CTL_PUE			(1 << 6)
-PAD_CTL_PUS_100K_DOWN		(0 << 4)
-PAD_CTL_PUS_47K_UP		(1 << 4)
-PAD_CTL_PUS_100K_UP		(2 << 4)
-PAD_CTL_PUS_22K_UP		(3 << 4)
-PAD_CTL_ODE			(1 << 3)
-PAD_CTL_DSE_LOW			(0 << 1)
-PAD_CTL_DSE_MED			(1 << 1)
-PAD_CTL_DSE_HIGH		(2 << 1)
-PAD_CTL_DSE_MAX			(3 << 1)
-PAD_CTL_SRE_FAST		(1 << 0)
-PAD_CTL_SRE_SLOW		(0 << 0)
-
-Refer to imx51-pinfunc.h in device tree source folder for all available
-imx51 PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
deleted file mode 100644
index 25dcb77cfaf74..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Freescale IMX53 IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx53-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx53 datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_HVE			(1 << 13)
-PAD_CTL_HYS			(1 << 8)
-PAD_CTL_PKE			(1 << 7)
-PAD_CTL_PUE			(1 << 6)
-PAD_CTL_PUS_100K_DOWN		(0 << 4)
-PAD_CTL_PUS_47K_UP		(1 << 4)
-PAD_CTL_PUS_100K_UP		(2 << 4)
-PAD_CTL_PUS_22K_UP		(3 << 4)
-PAD_CTL_ODE			(1 << 3)
-PAD_CTL_DSE_LOW			(0 << 1)
-PAD_CTL_DSE_MED			(1 << 1)
-PAD_CTL_DSE_HIGH		(2 << 1)
-PAD_CTL_DSE_MAX			(3 << 1)
-PAD_CTL_SRE_FAST		(1 << 0)
-PAD_CTL_SRE_SLOW		(0 << 0)
-
-Refer to imx53-pinfunc.h in device tree source folder for all available
-imx53 PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
deleted file mode 100644
index 0ac5bee875056..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Freescale IMX6 DualLite/Solo IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx6dl-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx6dl datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_HYS                     (1 << 16)
-PAD_CTL_PUS_100K_DOWN           (0 << 14)
-PAD_CTL_PUS_47K_UP              (1 << 14)
-PAD_CTL_PUS_100K_UP             (2 << 14)
-PAD_CTL_PUS_22K_UP              (3 << 14)
-PAD_CTL_PUE                     (1 << 13)
-PAD_CTL_PKE                     (1 << 12)
-PAD_CTL_ODE                     (1 << 11)
-PAD_CTL_SPEED_LOW               (1 << 6)
-PAD_CTL_SPEED_MED               (2 << 6)
-PAD_CTL_SPEED_HIGH              (3 << 6)
-PAD_CTL_DSE_DISABLE             (0 << 3)
-PAD_CTL_DSE_240ohm              (1 << 3)
-PAD_CTL_DSE_120ohm              (2 << 3)
-PAD_CTL_DSE_80ohm               (3 << 3)
-PAD_CTL_DSE_60ohm               (4 << 3)
-PAD_CTL_DSE_48ohm               (5 << 3)
-PAD_CTL_DSE_40ohm               (6 << 3)
-PAD_CTL_DSE_34ohm               (7 << 3)
-PAD_CTL_SRE_FAST                (1 << 0)
-PAD_CTL_SRE_SLOW                (0 << 0)
-
-Refer to imx6dl-pinfunc.h in device tree source folder for all available
-imx6dl PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
deleted file mode 100644
index 546610cf2ae71..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Freescale IMX6Q IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx6q-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx6q datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_HYS                     (1 << 16)
-PAD_CTL_PUS_100K_DOWN           (0 << 14)
-PAD_CTL_PUS_47K_UP              (1 << 14)
-PAD_CTL_PUS_100K_UP             (2 << 14)
-PAD_CTL_PUS_22K_UP              (3 << 14)
-PAD_CTL_PUE                     (1 << 13)
-PAD_CTL_PKE                     (1 << 12)
-PAD_CTL_ODE                     (1 << 11)
-PAD_CTL_SPEED_LOW               (1 << 6)
-PAD_CTL_SPEED_MED               (2 << 6)
-PAD_CTL_SPEED_HIGH              (3 << 6)
-PAD_CTL_DSE_DISABLE             (0 << 3)
-PAD_CTL_DSE_240ohm              (1 << 3)
-PAD_CTL_DSE_120ohm              (2 << 3)
-PAD_CTL_DSE_80ohm               (3 << 3)
-PAD_CTL_DSE_60ohm               (4 << 3)
-PAD_CTL_DSE_48ohm               (5 << 3)
-PAD_CTL_DSE_40ohm               (6 << 3)
-PAD_CTL_DSE_34ohm               (7 << 3)
-PAD_CTL_SRE_FAST                (1 << 0)
-PAD_CTL_SRE_SLOW                (0 << 0)
-
-Refer to imx6q-pinfunc.h in device tree source folder for all available
-imx6q PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
deleted file mode 100644
index e5f6d1f065a42..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-* Freescale IMX6 SoloLite IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx6sl-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
-  pin working on a specific function, CONFIG is the pad setting value like
-  pull-up for this pin. Please refer to imx6sl datasheet for the valid pad
-  config settings.
-
-CONFIG bits definition:
-PAD_CTL_LVE                     (1 << 22)
-PAD_CTL_HYS                     (1 << 16)
-PAD_CTL_PUS_100K_DOWN           (0 << 14)
-PAD_CTL_PUS_47K_UP              (1 << 14)
-PAD_CTL_PUS_100K_UP             (2 << 14)
-PAD_CTL_PUS_22K_UP              (3 << 14)
-PAD_CTL_PUE                     (1 << 13)
-PAD_CTL_PKE                     (1 << 12)
-PAD_CTL_ODE                     (1 << 11)
-PAD_CTL_SPEED_LOW               (1 << 6)
-PAD_CTL_SPEED_MED               (2 << 6)
-PAD_CTL_SPEED_HIGH              (3 << 6)
-PAD_CTL_DSE_DISABLE             (0 << 3)
-PAD_CTL_DSE_240ohm              (1 << 3)
-PAD_CTL_DSE_120ohm              (2 << 3)
-PAD_CTL_DSE_80ohm               (3 << 3)
-PAD_CTL_DSE_60ohm               (4 << 3)
-PAD_CTL_DSE_48ohm               (5 << 3)
-PAD_CTL_DSE_40ohm               (6 << 3)
-PAD_CTL_DSE_34ohm               (7 << 3)
-PAD_CTL_SRE_FAST                (1 << 0)
-PAD_CTL_SRE_SLOW                (0 << 0)
-
-Refer to imx6sl-pinfunc.h in device tree source folder for all available
-imx6sl PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
deleted file mode 100644
index 175e8939a3018..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Freescale i.MX6 SLL IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx6sll-iomuxc"
-- fsl,pins: each entry consists of 6 integers and represents the mux and config
-  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
-  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
-  imx6sll-pinfunc.h under device tree source folder.  The last integer CONFIG is
-  the pad setting value like pull-up on this pin.  Please refer to i.MX6SLL
-  Reference Manual for detailed CONFIG settings.
-
-CONFIG bits definition:
-PAD_CTL_LVE			(1 << 22)
-PAD_CTL_HYS                     (1 << 16)
-PAD_CTL_PUS_100K_DOWN           (0 << 14)
-PAD_CTL_PUS_47K_UP              (1 << 14)
-PAD_CTL_PUS_100K_UP             (2 << 14)
-PAD_CTL_PUS_22K_UP              (3 << 14)
-PAD_CTL_PUE                     (1 << 13)
-PAD_CTL_PKE                     (1 << 12)
-PAD_CTL_ODE                     (1 << 11)
-PAD_CTL_SPEED_LOW               (0 << 6)
-PAD_CTL_SPEED_MED               (1 << 6)
-PAD_CTL_SPEED_HIGH              (3 << 6)
-PAD_CTL_DSE_DISABLE             (0 << 3)
-PAD_CTL_DSE_260ohm              (1 << 3)
-PAD_CTL_DSE_130ohm              (2 << 3)
-PAD_CTL_DSE_87ohm               (3 << 3)
-PAD_CTL_DSE_65ohm               (4 << 3)
-PAD_CTL_DSE_52ohm               (5 << 3)
-PAD_CTL_DSE_43ohm               (6 << 3)
-PAD_CTL_DSE_37ohm               (7 << 3)
-PAD_CTL_SRE_FAST                (1 << 0)
-PAD_CTL_SRE_SLOW                (0 << 0)
-
-Refer to imx6sll-pinfunc.h in device tree source folder for all available
-imx6sll PIN_FUNC_ID.
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt
deleted file mode 100644
index b1b595220f1bd..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Freescale i.MX6 SoloX IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,imx6sx-iomuxc"
-- fsl,pins: each entry consists of 6 integers and represents the mux and config
-  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
-  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
-  imx6sx-pinfunc.h under device tree source folder.  The last integer CONFIG is
-  the pad setting value like pull-up on this pin.  Please refer to i.MX6 SoloX
-  Reference Manual for detailed CONFIG settings.
-
-CONFIG bits definition:
-PAD_CTL_HYS                     (1 << 16)
-PAD_CTL_PUS_100K_DOWN           (0 << 14)
-PAD_CTL_PUS_47K_UP              (1 << 14)
-PAD_CTL_PUS_100K_UP             (2 << 14)
-PAD_CTL_PUS_22K_UP              (3 << 14)
-PAD_CTL_PUE                     (1 << 13)
-PAD_CTL_PKE                     (1 << 12)
-PAD_CTL_ODE                     (1 << 11)
-PAD_CTL_SPEED_LOW               (0 << 6)
-PAD_CTL_SPEED_MED               (1 << 6)
-PAD_CTL_SPEED_HIGH              (3 << 6)
-PAD_CTL_DSE_DISABLE             (0 << 3)
-PAD_CTL_DSE_260ohm              (1 << 3)
-PAD_CTL_DSE_130ohm              (2 << 3)
-PAD_CTL_DSE_87ohm               (3 << 3)
-PAD_CTL_DSE_65ohm               (4 << 3)
-PAD_CTL_DSE_52ohm               (5 << 3)
-PAD_CTL_DSE_43ohm               (6 << 3)
-PAD_CTL_DSE_37ohm               (7 << 3)
-PAD_CTL_SRE_FAST                (1 << 0)
-PAD_CTL_SRE_SLOW                (0 << 0)
-- 
2.45.2


