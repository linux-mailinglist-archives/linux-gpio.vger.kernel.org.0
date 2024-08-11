Return-Path: <linux-gpio+bounces-8703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8194E232
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 18:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE19B281081
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582731537A7;
	Sun, 11 Aug 2024 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m853n3qL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144497F6;
	Sun, 11 Aug 2024 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723392765; cv=none; b=bVFk0XIbh2AlNQ1Rds1kLnWDJe9M49wKox8bPFIX8VOw8qVR1N9aZ8gorFS/wJv/EhemrEPVxn2fGHJiWqj+Dylr4/eLDcGJn8zGjDclHvf0E98oXR3qz3hSgfNANFzZCDjoI6+rEw1fC/fUoVqww8H+K6FyANMIQ41G0u9dGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723392765; c=relaxed/simple;
	bh=iNr9VkkVHXAP0E08R16/NN495PESSWAijFMFw/6Kkts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsRScmoobr5rgFFZS3ojNdpOG2YHDr9tZrkkRcCr1/MNzJGPdcS3Hopwt3fkbCeo08i4LCiqgaqpT0o2lQPtn5ZP2phoOBrLYiX0Cecok3ArloW38QT5khrUEVsK/8+XuoFiISCXu/IwyAdbqPiMzLfVk5BV40mTdXdGCLPJuLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m853n3qL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6B9C32786;
	Sun, 11 Aug 2024 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723392764;
	bh=iNr9VkkVHXAP0E08R16/NN495PESSWAijFMFw/6Kkts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m853n3qLMWnk8VJ0eKhnYicUPgqv1uIgD4ga8DdlHL6h+V8EeuUBbx8QL7aLLhejD
	 io9gJ/nXgFa9Cg8QqORv+dI32Dd4ycG83AJ3gTtMXV8HsBTxrFbWE9fob7VsUM28dl
	 zlDXwU9A9yvfEuKjLI4w+CHQRvS1GO0TPuErc+WJr4KuZALU8fDL27F17lwvZ1DDZm
	 n0QVo5lYY0OTRBDO7fqGVkh4EvanT8eCGwWSK1Rm9UdqpkZkpVpEOxPTJhJ+XtFm6U
	 xsTEBKoPnrME+tIeeJiF30fiuldObC6oO2kTYILfLjJq9gJWzgdoym9IBCs1aAb/dn
	 o1V17CCZ3Dyvg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
Date: Sun, 11 Aug 2024 18:12:12 +0200
Message-ID: <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723392444.git.lorenzo@kernel.org>
References: <cover.1723392444.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce device-tree binding documentation for Airoha EN7581 pinctrl
controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../pinctrl/airoha,en7581-pinctrl.yaml        | 467 ++++++++++++++++++
 1 file changed, 467 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
new file mode 100644
index 000000000000..b1f980613864
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -0,0 +1,467 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,en7581-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's EN7581 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    enum:
+      - airoha,en7581-pinctrl
+
+  reg:
+    items:
+      - description: IOMUX base address
+      - description: LED IOMUX base address
+      - description: GPIO flash mode base address
+      - description: GPIO flash mode extended base address
+      - description: IO pin configuration base address
+      - description: PCIE reset open-drain base address
+      - description: GPIO bank0 data register base address
+      - description: GPIO bank1 data register base address
+      - description: GPIO bank0 first control register base address
+      - description: GPIO bank0 second control register base address
+      - description: GPIO bank1 first control register base address
+      - description: GPIO bank1 second control register base address
+      - description: GPIO bank0 output enable register base address
+      - description: GPIO bank1 output enable register base address
+      - description: GPIO bank0 irq status register base address
+      - description: GPIO bank1 irq status register base address
+      - description: GPIO bank0 irq level first control register base address
+      - description: GPIO bank0 irq level second control register base address
+      - description: GPIO bank1 irq level first control register base address
+      - description: GPIO bank1 irq level second control register base address
+      - description: GPIO bank0 irq edge first control register base address
+      - description: GPIO bank0 irq edge second control register base address
+      - description: GPIO bank1 irq edge first control register base address
+      - description: GPIO bank1 irq edge second control register base address
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is
+      used, the amount of cells must be specified as 2. See the below mentioned
+      gpio binding representation for description of particular cells.
+
+  gpio-ranges:
+    maxItems: 1
+    description:
+      GPIO valid number range.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^.*mux.*$':
+        type: object
+        additionalProperties: false
+        description: |
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts, uart4,
+                           uart5]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                           pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc]
+          - if:
+              properties:
+                function:
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1, pcie_reset2]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+
+      '^.*conf.*$':
+        type: object
+        additionalProperties: false
+        description:
+          pinconf configuration nodes.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
+                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
+                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
+                     pcie_reset0, pcie_reset1, pcie_reset2]
+            maxItems: 58
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pio: pinctrl@1fa20214 {
+        compatible = "airoha,en7581-pinctrl";
+        reg = <0x0 0x1fa20214 0x0 0x30>,
+              <0x0 0x1fa2027c 0x0 0x8>,
+              <0x0 0x1fbf0234 0x0 0x4>,
+              <0x0 0x1fbf0268 0x0 0x4>,
+              <0x0 0x1fa2001c 0x0 0x50>,
+              <0x0 0x1fa2018c 0x0 0x4>,
+              <0x0 0x1fbf0204 0x0 0x4>,
+              <0x0 0x1fbf0270 0x0 0x4>,
+              <0x0 0x1fbf0200 0x0 0x4>,
+              <0x0 0x1fbf0220 0x0 0x4>,
+              <0x0 0x1fbf0260 0x0 0x4>,
+              <0x0 0x1fbf0264 0x0 0x4>,
+              <0x0 0x1fbf0214 0x0 0x4>,
+              <0x0 0x1fbf0278 0x0 0x4>,
+              <0x0 0x1fbf0208 0x0 0x4>,
+              <0x0 0x1fbf027c 0x0 0x4>,
+              <0x0 0x1fbf0210 0x0 0x4>,
+              <0x0 0x1fbf028c 0x0 0x4>,
+              <0x0 0x1fbf0290 0x0 0x4>,
+              <0x0 0x1fbf0294 0x0 0x4>,
+              <0x0 0x1fbf020c 0x0 0x4>,
+              <0x0 0x1fbf0280 0x0 0x4>,
+              <0x0 0x1fbf0284 0x0 0x4>,
+              <0x0 0x1fbf0288 0x0 0x4>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 13 47>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+        pcie1-rst-pins {
+          conf {
+            pins = "pcie_reset1";
+            drive-open-drain = <1>;
+          };
+        };
+
+        pwm-pins {
+          mux {
+            function = "pwm";
+            groups = "gpio18";
+          };
+        };
+
+        spi-pins {
+          mux {
+            function = "spi";
+            groups = "spi_quad", "spi_cs1";
+          };
+        };
+
+        uuart2-pins {
+          mux {
+            function = "uart";
+            groups = "uart2", "uart2_cts_rts";
+          };
+        };
+
+        uar5-pins {
+          mux {
+            function = "uart";
+            groups = "uart5";
+          };
+        };
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+
+        mdio-pins {
+          mux {
+            function = "mdio";
+            groups = "mdio";
+          };
+
+          conf {
+            pins = "gpio2";
+            output-enable;
+          };
+        };
+
+        gswp1-led0-pins {
+          mux {
+            function = "phy1_led0";
+            groups = "gpio33";
+          };
+        };
+
+        gswp2-led1-pins {
+          mux {
+            function = "phy2_led1";
+            groups = "gpio44";
+          };
+        };
+      };
+    };
-- 
2.46.0


