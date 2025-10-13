Return-Path: <linux-gpio+bounces-27052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F06BD5E5F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 21:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEAA14F1790
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 19:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC102D97A1;
	Mon, 13 Oct 2025 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsKbZj3W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435C1C860E;
	Mon, 13 Oct 2025 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382760; cv=none; b=N/FwDRd21yz9923Nv3WJuR7IceCZzooSrCSSSwqvuYau4EyIZMUvMaDjB3PIlFiTAzo9vusTB95Pgeq3cYuwLgnjJZEX9OrLhMIcde6C55MK0o+S7JtHiM9CnsbbyK52AXR2Z76/7eWOiP1gp/VkFNZec1rgb8jRFjYVTwpb880=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382760; c=relaxed/simple;
	bh=BExf5fk0DyeNynHM+enUNSLiZYcDSXeiOTkv5qJUqtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jx1fkLj+QCVj48R72vjdG+1KuP/ubLvStOGfEnnjdinT/tBid9+rgYbs2SZFw7JmhUJCfH/EYlEtwbaLl1miSEHNfEjpG8yLalYuz8eI/DvdjS1gNMKvICK5O+V53x9A2OAqlYOXWWSEOmEKLFKmcP3f7yilz3J4x1+7+gSzNss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsKbZj3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD86EC116D0;
	Mon, 13 Oct 2025 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760382760;
	bh=BExf5fk0DyeNynHM+enUNSLiZYcDSXeiOTkv5qJUqtM=;
	h=From:To:Cc:Subject:Date:From;
	b=CsKbZj3WA3mNPW3bT9XR3pQo6+3yiBpa5f7CSuXWwhTPc+Sc4T04aH7oYud4YOEcL
	 NioxwaxGBBdVSi1RlnuWuZaTakzsvfjYAOherRzUrLqT2oX70QVyeLzykewRXuPEjW
	 HSr5Zhlu0VLxX0pRjVgfQe8Y7xxhPjeiNUgRH+k+qJhfKXkoIGgUxK4xZELSTl6xt+
	 wNbqWfHDdkP9VooL0786vCHNNjC0ZKb5/HtbQyepKl01LpeC/Zgw3Cj++WUdMmhnGA
	 LCtDR8bTExdkPlpG2E6CHwKYMBRSw6/ZhRbkrM4rwTN9o8/CPGqhyEQUici4KNvyZl
	 2u0HxpapmsD2g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: Convert bitmain,bm1880-pinctrl to DT schema
Date: Mon, 13 Oct 2025 14:12:33 -0500
Message-ID: <20251013191235.4139259-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the bitmain,bm1880-pinctrl binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/bitmain,bm1880-pinctrl.txt        | 126 -----------------
 .../pinctrl/bitmain,bm1880-pinctrl.yaml       | 132 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 133 insertions(+), 127 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
deleted file mode 100644
index 4980776122cc..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
+++ /dev/null
@@ -1,126 +0,0 @@
-Bitmain BM1880 Pin Controller
-
-This binding describes the pin controller found in the BM1880 SoC.
-
-Required Properties:
-
-- compatible:   Should be "bitmain,bm1880-pinctrl"
-- reg:          Offset and length of pinctrl space in SCTRL.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-The pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration for BM1880 SoC
-includes pinmux and various pin configuration parameters, such as pull-up,
-slew rate etc...
-
-Each configuration node can consist of multiple nodes describing the pinmux
-options. The name of each subnode is not important; all subnodes should be
-enumerated and processed purely based on their content.
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pinmux subnode:
-
-Required Properties:
-
-- pins:           An array of strings, each string containing the name of a pin.
-                  Valid values for pins are:
-
-                  MIO0 - MIO111
-
-- groups:         An array of strings, each string containing the name of a pin
-                  group. Valid values for groups are:
-
-                  nand_grp, spi_grp, emmc_grp, sdio_grp, eth0_grp, pwm0_grp,
-                  pwm1_grp, pwm2_grp, pwm3_grp, pwm4_grp, pwm5_grp, pwm6_grp,
-                  pwm7_grp, pwm8_grp, pwm9_grp, pwm10_grp, pwm11_grp, pwm12_grp,
-                  pwm13_grp, pwm14_grp, pwm15_grp, pwm16_grp, pwm17_grp,
-                  pwm18_grp, pwm19_grp, pwm20_grp, pwm21_grp, pwm22_grp,
-                  pwm23_grp, pwm24_grp, pwm25_grp, pwm26_grp, pwm27_grp,
-                  pwm28_grp, pwm29_grp, pwm30_grp, pwm31_grp, pwm32_grp,
-                  pwm33_grp, pwm34_grp, pwm35_grp, pwm36_grp, i2c0_grp,
-                  i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp, uart0_grp, uart1_grp,
-                  uart2_grp, uart3_grp, uart4_grp, uart5_grp, uart6_grp,
-                  uart7_grp, uart8_grp, uart9_grp, uart10_grp, uart11_grp,
-                  uart12_grp, uart13_grp, uart14_grp, uart15_grp, gpio0_grp,
-                  gpio1_grp, gpio2_grp, gpio3_grp, gpio4_grp, gpio5_grp,
-                  gpio6_grp, gpio7_grp, gpio8_grp, gpio9_grp, gpio10_grp,
-                  gpio11_grp, gpio12_grp, gpio13_grp, gpio14_grp, gpio15_grp,
-                  gpio16_grp, gpio17_grp, gpio18_grp, gpio19_grp, gpio20_grp,
-                  gpio21_grp, gpio22_grp, gpio23_grp, gpio24_grp, gpio25_grp,
-                  gpio26_grp, gpio27_grp, gpio28_grp, gpio29_grp, gpio30_grp,
-                  gpio31_grp, gpio32_grp, gpio33_grp, gpio34_grp, gpio35_grp,
-                  gpio36_grp, gpio37_grp, gpio38_grp, gpio39_grp, gpio40_grp,
-                  gpio41_grp, gpio42_grp, gpio43_grp, gpio44_grp, gpio45_grp,
-                  gpio46_grp, gpio47_grp, gpio48_grp, gpio49_grp, gpio50_grp,
-                  gpio51_grp, gpio52_grp, gpio53_grp, gpio54_grp, gpio55_grp,
-                  gpio56_grp, gpio57_grp, gpio58_grp, gpio59_grp, gpio60_grp,
-                  gpio61_grp, gpio62_grp, gpio63_grp, gpio64_grp, gpio65_grp,
-                  gpio66_grp, gpio67_grp, eth1_grp, i2s0_grp, i2s0_mclkin_grp,
-                  i2s1_grp, i2s1_mclkin_grp, spi0_grp
-
-- function:       An array of strings, each string containing the name of the
-                  pinmux functions. The following are the list of pinmux
-                  functions available:
-
-                  nand, spi, emmc, sdio, eth0, pwm0, pwm1, pwm2, pwm3, pwm4,
-                  pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, pwm12, pwm13,
-                  pwm14, pwm15, pwm16, pwm17, pwm18, pwm19, pwm20, pwm21, pwm22,
-                  pwm23, pwm24, pwm25, pwm26, pwm27, pwm28, pwm29, pwm30, pwm31,
-                  pwm32, pwm33, pwm34, pwm35, pwm36, i2c0, i2c1, i2c2, i2c3,
-                  i2c4, uart0, uart1, uart2, uart3, uart4, uart5, uart6, uart7,
-                  uart8, uart9, uart10, uart11, uart12, uart13, uart14, uart15,
-                  gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7, gpio8,
-                  gpio9, gpio10, gpio11, gpio12, gpio13, gpio14, gpio15, gpio16,
-                  gpio17, gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
-                  gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30,
-                  gpio31, gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
-                  gpio38, gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
-                  gpio45, gpio46, gpio47, gpio48, gpio49, gpio50, gpio51,
-                  gpio52, gpio53, gpio54, gpio55, gpio56, gpio57, gpio58,
-                  gpio59, gpio60, gpio61, gpio62, gpio63, gpio64, gpio65,
-                  gpio66, gpio67, eth1, i2s0, i2s0_mclkin, i2s1, i2s1_mclkin,
-                  spi0
-
-Optional Properties:
-
-- bias-disable:  No arguments. Disable pin bias.
-- bias-pull-down: No arguments. The specified pins should be configured as
-                  pull down.
-- bias-pull-up:   No arguments. The specified pins should be configured as
-                  pull up.
-- input-schmitt-enable: No arguments: Enable schmitt trigger for the specified
-                  pins
-- input-schmitt-disable: No arguments: Disable schmitt trigger for the specified
-                  pins
-- slew-rate:      Integer. Sets slew rate for the specified pins.
-                  Valid values are:
-                  <0>  - Slow
-                  <1>  - Fast
-- drive-strength: Integer. Selects the drive strength for the specified
-                  pins in mA.
-                  Valid values are:
-                  <4>
-                  <8>
-                  <12>
-                  <16>
-                  <20>
-                  <24>
-                  <28>
-                  <32>
-
-Example:
-        pinctrl: pinctrl@400 {
-                compatible = "bitmain,bm1880-pinctrl";
-                reg = <0x400 0x120>;
-
-                pinctrl_uart0_default: uart0-default {
-                        pinmux {
-                                groups = "uart0_grp";
-                                function = "uart0";
-                        };
-                };
-        };
diff --git a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.yaml
new file mode 100644
index 000000000000..542be9870838
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/bitmain,bm1880-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bitmain BM1880 Pin Controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+properties:
+  compatible:
+    const: bitmain,bm1880-pinctrl
+
+  reg:
+    maxItems: 1
+
+additionalProperties:
+  description: A pin configuration node.
+  type: object
+  additionalProperties: false
+
+  properties:
+    pinmux:
+      type: object
+      description: Pin multiplexing parameters.
+      allOf:
+        - $ref: /schemas/pinctrl/pincfg-node.yaml#
+        - $ref: /schemas/pinctrl/pinmux-node.yaml#
+      additionalProperties: false
+
+      properties:
+        pins:
+          items:
+            pattern: '^MIO[0-9]+$'
+
+        groups:
+          items:
+            enum: [
+              nand_grp, spi_grp, emmc_grp, sdio_grp, eth0_grp, pwm0_grp,
+              pwm1_grp, pwm2_grp, pwm3_grp, pwm4_grp, pwm5_grp, pwm6_grp,
+              pwm7_grp, pwm8_grp, pwm9_grp, pwm10_grp, pwm11_grp, pwm12_grp,
+              pwm13_grp, pwm14_grp, pwm15_grp, pwm16_grp, pwm17_grp,
+              pwm18_grp, pwm19_grp, pwm20_grp, pwm21_grp, pwm22_grp,
+              pwm23_grp, pwm24_grp, pwm25_grp, pwm26_grp, pwm27_grp,
+              pwm28_grp, pwm29_grp, pwm30_grp, pwm31_grp, pwm32_grp,
+              pwm33_grp, pwm34_grp, pwm35_grp, pwm36_grp, i2c0_grp,
+              i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp, uart0_grp, uart1_grp,
+              uart2_grp, uart3_grp, uart4_grp, uart5_grp, uart6_grp,
+              uart7_grp, uart8_grp, uart9_grp, uart10_grp, uart11_grp,
+              uart12_grp, uart13_grp, uart14_grp, uart15_grp, gpio0_grp,
+              gpio1_grp, gpio2_grp, gpio3_grp, gpio4_grp, gpio5_grp,
+              gpio6_grp, gpio7_grp, gpio8_grp, gpio9_grp, gpio10_grp,
+              gpio11_grp, gpio12_grp, gpio13_grp, gpio14_grp, gpio15_grp,
+              gpio16_grp, gpio17_grp, gpio18_grp, gpio19_grp, gpio20_grp,
+              gpio21_grp, gpio22_grp, gpio23_grp, gpio24_grp, gpio25_grp,
+              gpio26_grp, gpio27_grp, gpio28_grp, gpio29_grp, gpio30_grp,
+              gpio31_grp, gpio32_grp, gpio33_grp, gpio34_grp, gpio35_grp,
+              gpio36_grp, gpio37_grp, gpio38_grp, gpio39_grp, gpio40_grp,
+              gpio41_grp, gpio42_grp, gpio43_grp, gpio44_grp, gpio45_grp,
+              gpio46_grp, gpio47_grp, gpio48_grp, gpio49_grp, gpio50_grp,
+              gpio51_grp, gpio52_grp, gpio53_grp, gpio54_grp, gpio55_grp,
+              gpio56_grp, gpio57_grp, gpio58_grp, gpio59_grp, gpio60_grp,
+              gpio61_grp, gpio62_grp, gpio63_grp, gpio64_grp, gpio65_grp,
+              gpio66_grp, gpio67_grp, eth1_grp, i2s0_grp, i2s0_mclkin_grp,
+              i2s1_grp, i2s1_mclkin_grp, spi0_grp
+            ]
+
+        function:
+          items:
+            enum: [
+              nand, spi, emmc, sdio, eth0, pwm0, pwm1, pwm2, pwm3, pwm4,
+              pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, pwm12, pwm13,
+              pwm14, pwm15, pwm16, pwm17, pwm18, pwm19, pwm20, pwm21, pwm22,
+              pwm23, pwm24, pwm25, pwm26, pwm27, pwm28, pwm29, pwm30, pwm31,
+              pwm32, pwm33, pwm34, pwm35, pwm36, i2c0, i2c1, i2c2, i2c3,
+              i2c4, uart0, uart1, uart2, uart3, uart4, uart5, uart6, uart7,
+              uart8, uart9, uart10, uart11, uart12, uart13, uart14, uart15,
+              gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7, gpio8,
+              gpio9, gpio10, gpio11, gpio12, gpio13, gpio14, gpio15, gpio16,
+              gpio17, gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
+              gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30,
+              gpio31, gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
+              gpio38, gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
+              gpio45, gpio46, gpio47, gpio48, gpio49, gpio50, gpio51,
+              gpio52, gpio53, gpio54, gpio55, gpio56, gpio57, gpio58,
+              gpio59, gpio60, gpio61, gpio62, gpio63, gpio64, gpio65,
+              gpio66, gpio67, eth1, i2s0, i2s0_mclkin, i2s1, i2s1_mclkin,
+              spi0
+            ]
+
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
+        input-schmitt-enable: true
+        input-schmitt-disable: true
+
+        slew-rate:
+          description: >
+            Sets slew rate. Valid values: 0 = Slow, 1 = Fast.
+          enum: [0, 1]
+
+        drive-strength:
+          enum: [4, 8, 12, 16, 20, 24, 28, 32]
+
+      oneOf:
+        - required:
+            - pins
+        - required:
+            - groups
+
+      required:
+        - function
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pinctrl@400 {
+        compatible = "bitmain,bm1880-pinctrl";
+        reg = <0x400 0x120>;
+
+        uart0-default {
+            pinmux {
+                groups = "uart0_grp";
+                function = "uart0";
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 04193ceb9365..e72a9e529625 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2529,7 +2529,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/bitmain.yaml
 F:	Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
-F:	Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
+F:	Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.yaml
 F:	arch/arm64/boot/dts/bitmain/
 F:	drivers/clk/clk-bm1880.c
 F:	drivers/pinctrl/pinctrl-bm1880.c
-- 
2.51.0


