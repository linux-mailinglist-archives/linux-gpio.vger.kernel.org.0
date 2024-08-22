Return-Path: <linux-gpio+bounces-8972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F081E95B219
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 11:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718CC1F252EC
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 09:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE393188938;
	Thu, 22 Aug 2024 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okAMnoyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66985188929;
	Thu, 22 Aug 2024 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319693; cv=none; b=R/RUYVQDbKm+p2BxP6NGs4wRzX9wTyhr0Nm/kgky5z3vM4+wqgCW9GrbScGmQjWgiC7gGq7tUCXZpcAv9JxOv3vGQCi2yLyX+jsUCeiS9CF7GuCACMgU4d71jbi+tt6mmgy7CZepn+RAzM+8tZ8fJcdakLDDU54XwgU9TXFIf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319693; c=relaxed/simple;
	bh=XmnZdW+1lBMIquZrckRJYdsNtcm0aTzKiw9Pu3Y23YI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+cY8j8mMy0XiRr+Yn3rTKdmg9gR01jEZE3KaeLOKpCnWFKxaKON3nCs/tHaigIfsqjbVPEwZYy/lWrz7Tc4kreoCPUWhN9PBD+ObkbkEl8M9aG63k/XND5xZM1YWzNYU8gYbP/veWbfMnEzDmfMbcyJMx8huJaXacIEEkfq3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okAMnoyb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D057C32782;
	Thu, 22 Aug 2024 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724319693;
	bh=XmnZdW+1lBMIquZrckRJYdsNtcm0aTzKiw9Pu3Y23YI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=okAMnoybVZyD7vBwfBLA107bgtJK/ftuJUBXt/UZRPlMZdpMeCdbR54SqL1afbJkV
	 EG9HNkVi9BILQh1vf+hUgStdDOOqk5xHsVIZplQxZwbmN1vpOIpOhBJeyGCvShYy2m
	 K6Awx0Bep0rUMdlFfONWvJentxyj5b+zcmsvRjFmaiO/v58Lff3t4mbE3vYNj1YZ7q
	 zEST2z0ZEwbgNnexY3SM4ER25Lsq6thEUknV8CNQ10DZUF9YRGd+hjz0T1hAwiUeJN
	 XnEVOTiqGcz2i2J/ZUqksU/cJeZ1NT/VqC+ZbIsU2rPA9h3kJhUvR3N+5Kr4g7Bj2X
	 r6bJueX1w84+A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Aug 2024 11:40:52 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
In-Reply-To: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com
X-Mailer: b4 0.14.0

Introduce device-tree binding documentation for Airoha EN7581 pinctrl
controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    | 454 +++++++++++++++++++++
 1 file changed, 454 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
new file mode 100644
index 000000000000..a4b58bc30416
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -0,0 +1,454 @@
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
+allOf:
+  - $ref: pinctrl.yaml#
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
+      - description: GPIO bank0 register base address
+      - description: GPIO bank0 second control register base address
+      - description: GPIO bank1 second control register base address
+      - description: GPIO bank1 register base address
+
+  reg-names:
+    items:
+      - const: iomux
+      - const: led-iomux
+      - const: gpio-flash-mode
+      - const: gpio-flash-mode-ext
+      - const: ioconf
+      - const: pcie-rst-od
+      - const: gpio-bank0
+      - const: gpio-ctrl1
+      - const: gpio-ctrl2
+      - const: gpio-bank1
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
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^.*mux.*$':
+        type: object
+        additionalProperties: false
+        description:
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
+            minItems: 1
+            maxItems: 58
+
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+          input-enable: true
+          output-enable: true
+          output-low: true
+          output-high: true
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
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
+              <0x0 0x1fbf0200 0x0 0x18>,
+              <0x0 0x1fbf0220 0x0 0x4>,
+              <0x0 0x1fbf0260 0x0 0x8>,
+              <0x0 0x1fbf0270 0x0 0x28>;
+        reg-names = "iomux", "led-iomux",
+                    "gpio-flash-mode", "gpio-flash-mode-ext",
+                    "ioconf", "pcie-rst-od",
+                    "gpio-bank0", "gpio-ctrl1",
+                    "gpio-ctrl2", "gpio-bank1";
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
+        uart2-pins {
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


