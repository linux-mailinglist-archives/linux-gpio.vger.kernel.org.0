Return-Path: <linux-gpio+bounces-27483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9BBFD683
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 18:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2BE9188569A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C0235B152;
	Wed, 22 Oct 2025 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnXAbjqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028035B13B;
	Wed, 22 Oct 2025 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152188; cv=none; b=dJ8W88csTsA1rAT3NDuNpvhChjx4jbd3xrD0W5+vHchbU7mU1VQGQQ6GAHreoiqDIUGc88T3Ko9pUAwQxIJjq35LxTEvKizB1BBL3ljAoouJTSKEHGSU5xpvvCxoiUWh6Sp2AUIoMjBNr3RbrkKXQBss92uXJ6XcQKZZskMcRuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152188; c=relaxed/simple;
	bh=fU32P6Lx8964rFPEMOn0c+UzG3iFB2cTMWtNBMgOCGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahcF1L3SP/YtEyXhwHi4deT6OPeas9PoKSyTjfJyRrwVfZzWfqqMLtxRHlpmjlBct6E4yDpmGyDqmEg1C48smNfUMSlFqizMCO280at9vqDhb2C0tBydwL/ASaVXvPTNW7qEXsDUjqhRry47YYsLuQYRvLUvUHrAD1yMJqjON7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnXAbjqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D392C4CEE7;
	Wed, 22 Oct 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761152187;
	bh=fU32P6Lx8964rFPEMOn0c+UzG3iFB2cTMWtNBMgOCGE=;
	h=From:To:Cc:Subject:Date:From;
	b=gnXAbjqICbalZ7fMfBviO6N3MqEHlj+Exva+U+TP1HSN4iWFRRjE351XyYdI+531N
	 APZVK/KVZJp5+zmanFnDNXjs6Y7uICVHEKD0//1mh+5kwJl6cvdIEBWm75OpevYKum
	 iIzQ8IQizZL98IBraR9hSSrBqSJW1pCMZAuY7P9zJ3w/vEObQ6Lc8Ldcr2RQL5nMTd
	 Tf1zxIbzPIjuvwDjHFRaEPPJ4fLnW0c5s8u/blVHDmjwn/4qQc810IXVKz7zKvCFFi
	 YF9hSHAfp/1qno39ECBEHsrQ0f4FsB+3QrtLuIqKBmOwAbEwp2gxTOGMva9wacM4os
	 +lQPQT/VJINIw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System Controller to DT schema
Date: Wed, 22 Oct 2025 11:55:08 -0500
Message-ID: <20251022165509.3917655-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell CP110 System Controller binding to DT schema
format.

There's not any specific compatible for the whole block which is a
separate problem, so just the child nodes are documented. Only the
pinctrl and clock child nodes need to be converted as the GPIO node
already has a schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
- Keep documentation on individual clocks
- Drop 'io' from marvell,function values

 .../arm/marvell/cp110-system-controller.txt   | 191 ------------------
 .../bindings/clock/marvell,cp110-clock.yaml   |  70 +++++++
 .../pinctrl/marvell,armada-7k-pinctrl.yaml    |  72 +++++++
 3 files changed, 142 insertions(+), 191 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,cp110-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-7k-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
deleted file mode 100644
index 54ff9f218328..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
+++ /dev/null
@@ -1,191 +0,0 @@
-Marvell Armada CP110 System Controller
-======================================
-
-The CP110 is one of the two core HW blocks of the Marvell Armada 7K/8K
-SoCs. It contains system controllers, which provide several registers
-giving access to numerous features: clocks, pin-muxing and many other
-SoC configuration items. This DT binding allows to describe these
-system controllers.
-
-For the top level node:
- - compatible: must be: "syscon", "simple-mfd";
- - reg: register area of the CP110 system controller
-
-SYSTEM CONTROLLER 0
-===================
-
-Clocks:
--------
-
-The Device Tree node representing this System Controller 0 provides a
-number of clocks:
-
- - a set of core clocks
- - a set of gateable clocks
-
-Those clocks can be referenced by other Device Tree nodes using two
-cells:
- - The first cell must be 0 or 1. 0 for the core clocks and 1 for the
-   gateable clocks.
- - The second cell identifies the particular core clock or gateable
-   clocks.
-
-The following clocks are available:
- - Core clocks
-   - 0 0	APLL
-   - 0 1	PPv2 core
-   - 0 2	EIP
-   - 0 3	Core
-   - 0 4	NAND core
-   - 0 5	SDIO core
- - Gateable clocks
-   - 1 0	Audio
-   - 1 1	Comm Unit
-   - 1 2	NAND
-   - 1 3	PPv2
-   - 1 4	SDIO
-   - 1 5	MG Domain
-   - 1 6	MG Core
-   - 1 7	XOR1
-   - 1 8	XOR0
-   - 1 9	GOP DP
-   - 1 11	PCIe x1 0
-   - 1 12	PCIe x1 1
-   - 1 13	PCIe x4
-   - 1 14	PCIe / XOR
-   - 1 15	SATA
-   - 1 16	SATA USB
-   - 1 17	Main
-   - 1 18	SD/MMC/GOP
-   - 1 21	Slow IO (SPI, NOR, BootROM, I2C, UART)
-   - 1 22	USB3H0
-   - 1 23	USB3H1
-   - 1 24	USB3 Device
-   - 1 25	EIP150
-   - 1 26	EIP197
-
-Required properties:
-
- - compatible: must be:
-     "marvell,cp110-clock"
- - #clock-cells: must be set to 2
-
-Pinctrl:
---------
-
-For common binding part and usage, refer to the file
-Documentation/devicetree/bindings/pinctrl/marvell,mvebu-pinctrl.txt.
-
-Required properties:
-
-- compatible: "marvell,armada-7k-pinctrl", "marvell,armada-8k-cpm-pinctrl",
-  "marvell,armada-8k-cps-pinctrl" or "marvell,cp115-standalone-pinctrl"
-  depending on the specific variant of the SoC being used.
-
-Available mpp pins/groups and functions:
-Note: brackets (x) are not part of the mpp name for marvell,function and given
-only for more detailed description in this document.
-
-name	pins	functions
-================================================================================
-mpp0	0	gpio, dev(ale1), au(i2smclk), ge0(rxd3), tdm(pclk), ptp(pulse), mss_i2c(sda), uart0(rxd), sata0(present_act), ge(mdio)
-mpp1	1	gpio, dev(ale0), au(i2sdo_spdifo), ge0(rxd2), tdm(drx), ptp(clk), mss_i2c(sck), uart0(txd), sata1(present_act), ge(mdc)
-mpp2	2	gpio, dev(ad15), au(i2sextclk), ge0(rxd1), tdm(dtx), mss_uart(rxd), ptp(pclk_out), i2c1(sck), uart1(rxd), sata0(present_act), xg(mdc)
-mpp3	3	gpio, dev(ad14), au(i2slrclk), ge0(rxd0), tdm(fsync), mss_uart(txd), pcie(rstoutn), i2c1(sda), uart1(txd), sata1(present_act), xg(mdio)
-mpp4	4	gpio, dev(ad13), au(i2sbclk), ge0(rxctl), tdm(rstn), mss_uart(rxd), uart1(cts), pcie0(clkreq), uart3(rxd), ge(mdc)
-mpp5	5	gpio, dev(ad12), au(i2sdi), ge0(rxclk), tdm(intn), mss_uart(txd), uart1(rts), pcie1(clkreq), uart3(txd), ge(mdio)
-mpp6	6	gpio, dev(ad11), ge0(txd3), spi0(csn2), au(i2sextclk), sata1(present_act), pcie2(clkreq), uart0(rxd), ptp(pulse)
-mpp7	7	gpio, dev(ad10), ge0(txd2), spi0(csn1), spi1(csn1), sata0(present_act), led(data), uart0(txd), ptp(clk)
-mpp8	8	gpio, dev(ad9), ge0(txd1), spi0(csn0), spi1(csn0), uart0(cts), led(stb), uart2(rxd), ptp(pclk_out), synce1(clk)
-mpp9	9	gpio, dev(ad8), ge0(txd0), spi0(mosi), spi1(mosi), pcie(rstoutn), synce2(clk)
-mpp10	10	gpio, dev(readyn), ge0(txctl), spi0(miso), spi1(miso), uart0(cts), sata1(present_act)
-mpp11	11	gpio, dev(wen1), ge0(txclkout), spi0(clk), spi1(clk), uart0(rts), led(clk), uart2(txd), sata0(present_act)
-mpp12	12	gpio, dev(clk_out), nf(rbn1), spi1(csn1), ge0(rxclk)
-mpp13	13	gpio, dev(burstn), nf(rbn0), spi1(miso), ge0(rxctl), mss_spi(miso)
-mpp14	14	gpio, dev(bootcsn), dev(csn0), spi1(csn0), spi0(csn3), au(i2sextclk), spi0(miso), sata0(present_act), mss_spi(csn)
-mpp15	15	gpio, dev(ad7), spi1(mosi), spi0(mosi), mss_spi(mosi), ptp(pulse_cp2cp)
-mpp16	16	gpio, dev(ad6), spi1(clk), mss_spi(clk)
-mpp17	17	gpio, dev(ad5), ge0(txd3)
-mpp18	18	gpio, dev(ad4), ge0(txd2), ptp(clk_cp2cp)
-mpp19	19	gpio, dev(ad3), ge0(txd1), wakeup(out_cp2cp)
-mpp20	20	gpio, dev(ad2), ge0(txd0)
-mpp21	21	gpio, dev(ad1), ge0(txctl), sei(in_cp2cp)
-mpp22	22	gpio, dev(ad0), ge0(txclkout), wakeup(in_cp2cp)
-mpp23	23	gpio, dev(a1), au(i2smclk), link(rd_in_cp2cp)
-mpp24	24	gpio, dev(a0), au(i2slrclk)
-mpp25	25	gpio, dev(oen), au(i2sdo_spdifo)
-mpp26	26	gpio, dev(wen0), au(i2sbclk)
-mpp27	27	gpio, dev(csn0), spi1(miso), mss_gpio4, ge0(rxd3), spi0(csn4), ge(mdio), sata0(present_act), uart0(rts), rei(in_cp2cp)
-mpp28	28	gpio, dev(csn1), spi1(csn0), mss_gpio5, ge0(rxd2), spi0(csn5), pcie2(clkreq), ptp(pulse), ge(mdc), sata1(present_act), uart0(cts), led(data)
-mpp29	29	gpio, dev(csn2), spi1(mosi), mss_gpio6, ge0(rxd1), spi0(csn6), pcie1(clkreq), ptp(clk), mss_i2c(sda), sata0(present_act), uart0(rxd), led(stb)
-mpp30	30	gpio, dev(csn3), spi1(clk), mss_gpio7, ge0(rxd0), spi0(csn7), pcie0(clkreq), ptp(pclk_out), mss_i2c(sck), sata1(present_act), uart0(txd), led(clk)
-mpp31	31	gpio, dev(a2), mss_gpio4, pcie(rstoutn), ge(mdc)
-mpp32	32	gpio, mii(col), mii(txerr), mss_spi(miso), tdm(drx), au(i2sextclk), au(i2sdi), ge(mdio), sdio(v18_en), pcie1(clkreq), mss_gpio0
-mpp33	33	gpio, mii(txclk), sdio(pwr10), mss_spi(csn), tdm(fsync), au(i2smclk), sdio(bus_pwr), xg(mdio), pcie2(clkreq), mss_gpio1
-mpp34	34	gpio, mii(rxerr), sdio(pwr11), mss_spi(mosi), tdm(dtx), au(i2slrclk), sdio(wr_protect), ge(mdc), pcie0(clkreq), mss_gpio2
-mpp35	35	gpio, sata1(present_act), i2c1(sda), mss_spi(clk), tdm(pclk), au(i2sdo_spdifo), sdio(card_detect), xg(mdio), ge(mdio), pcie(rstoutn), mss_gpio3
-mpp36	36	gpio, synce2(clk), i2c1(sck), ptp(clk), synce1(clk), au(i2sbclk), sata0(present_act), xg(mdc), ge(mdc), pcie2(clkreq), mss_gpio5
-mpp37	37	gpio, uart2(rxd), i2c0(sck), ptp(pclk_out), tdm(intn), mss_i2c(sck), sata1(present_act), ge(mdc), xg(mdc), pcie1(clkreq), mss_gpio6, link(rd_out_cp2cp)
-mpp38	38	gpio, uart2(txd), i2c0(sda), ptp(pulse), tdm(rstn), mss_i2c(sda), sata0(present_act), ge(mdio), xg(mdio), au(i2sextclk), mss_gpio7, ptp(pulse_cp2cp)
-mpp39	39	gpio, sdio(wr_protect), au(i2sbclk), ptp(clk), spi0(csn1), sata1(present_act), mss_gpio0
-mpp40	40	gpio, sdio(pwr11), synce1(clk), mss_i2c(sda), au(i2sdo_spdifo), ptp(pclk_out), spi0(clk), uart1(txd), ge(mdio), sata0(present_act), mss_gpio1
-mpp41	41	gpio, sdio(pwr10), sdio(bus_pwr), mss_i2c(sck), au(i2slrclk), ptp(pulse), spi0(mosi), uart1(rxd), ge(mdc), sata1(present_act), mss_gpio2, rei(out_cp2cp)
-mpp42	42	gpio, sdio(v18_en), sdio(wr_protect), synce2(clk), au(i2smclk), mss_uart(txd), spi0(miso), uart1(cts), xg(mdc), sata0(present_act), mss_gpio4
-mpp43	43	gpio, sdio(card_detect), synce1(clk), au(i2sextclk), mss_uart(rxd), spi0(csn0), uart1(rts), xg(mdio), sata1(present_act), mss_gpio5, wakeup(out_cp2cp)
-mpp44	44	gpio, ge1(txd2), uart0(rts), ptp(clk_cp2cp)
-mpp45	45	gpio, ge1(txd3), uart0(txd), pcie(rstoutn)
-mpp46	46	gpio, ge1(txd1), uart1(rts)
-mpp47	47	gpio, ge1(txd0), spi1(clk), uart1(txd), ge(mdc)
-mpp48	48	gpio, ge1(txctl_txen), spi1(mosi), xg(mdc), wakeup(in_cp2cp)
-mpp49	49	gpio, ge1(txclkout), mii(crs), spi1(miso), uart1(rxd), ge(mdio), pcie0(clkreq), sdio(v18_en), sei(out_cp2cp)
-mpp50	50	gpio, ge1(rxclk), mss_i2c(sda), spi1(csn0), uart2(txd), uart0(rxd), xg(mdio), sdio(pwr11)
-mpp51	51	gpio, ge1(rxd0), mss_i2c(sck), spi1(csn1), uart2(rxd), uart0(cts), sdio(pwr10)
-mpp52	52	gpio, ge1(rxd1), synce1(clk), synce2(clk), spi1(csn2), uart1(cts), led(clk), pcie(rstoutn), pcie0(clkreq)
-mpp53	53	gpio, ge1(rxd2), ptp(clk), spi1(csn3), uart1(rxd), led(stb), sdio(led)
-mpp54	54	gpio, ge1(rxd3), synce2(clk), ptp(pclk_out), synce1(clk), led(data), sdio(hw_rst), sdio_wp(wr_protect)
-mpp55	55	gpio, ge1(rxctl_rxdv), ptp(pulse), sdio(led), sdio_cd(card_detect)
-mpp56	56	gpio, tdm(drx), au(i2sdo_spdifo), spi0(clk), uart1(rxd), sata1(present_act), sdio(clk)
-mpp57	57	gpio, mss_i2c(sda), ptp(pclk_out), tdm(intn), au(i2sbclk), spi0(mosi), uart1(txd), sata0(present_act), sdio(cmd)
-mpp58	58	gpio, mss_i2c(sck), ptp(clk), tdm(rstn), au(i2sdi), spi0(miso), uart1(cts), led(clk), sdio(d0)
-mpp59	59	gpio, mss_gpio7, synce2(clk), tdm(fsync), au(i2slrclk), spi0(csn0), uart0(cts), led(stb), uart1(txd), sdio(d1)
-mpp60	60	gpio, mss_gpio6, ptp(pulse), tdm(dtx), au(i2smclk), spi0(csn1), uart0(rts), led(data), uart1(rxd), sdio(d2)
-mpp61	61	gpio, mss_gpio5, ptp(clk), tdm(pclk), au(i2sextclk), spi0(csn2), uart0(txd), uart2(txd), sata1(present_act), ge(mdio), sdio(d3)
-mpp62	62	gpio, mss_gpio4, synce1(clk), ptp(pclk_out), sata1(present_act), spi0(csn3), uart0(rxd), uart2(rxd), sata0(present_act), ge(mdc)
-
-GPIO:
------
-
-For common binding part and usage, refer to
-Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml.
-
-Required properties:
-
-- compatible: "marvell,armada-8k-gpio"
-
-- offset: offset address inside the syscon block
-
-Example:
-
-CP110_LABEL(syscon0): system-controller@440000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0x440000 0x1000>;
-
-	CP110_LABEL(clk): clock {
-		compatible = "marvell,cp110-clock";
-		#clock-cells = <2>;
-	};
-
-	CP110_LABEL(pinctrl): pinctrl {
-		compatible = "marvell,armada-8k-cpm-pinctrl";
-	};
-
-	CP110_LABEL(gpio1): gpio@100 {
-		compatible = "marvell,armada-8k-gpio";
-		offset = <0x100>;
-		ngpios = <32>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&CP110_LABEL(pinctrl) 0 0 32>;
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/clock/marvell,cp110-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,cp110-clock.yaml
new file mode 100644
index 000000000000..ad0bc79b24c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,cp110-clock.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,cp110-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada CP110 System Controller Clocks
+
+maintainers:
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: >
+  The CP110 is one of the two core HW blocks of the Marvell Armada 7K/8K/931x
+  SoCs. It contains system controllers, which provide several registers giving
+  access to numerous features: clocks, pin-muxing and many other SoC
+  configuration items.
+
+properties:
+  compatible:
+    const: marvell,cp110-clock
+
+  "#clock-cells":
+    const: 2
+    description: >
+      The first cell must be 0 or 1. 0 for the core clocks and 1 for the
+      gateable clocks. The second cell identifies the particular core clock or
+      gateable clocks.
+
+      The following clocks are available:
+
+        - Core clocks
+          - 0 0       APLL
+          - 0 1       PPv2 core
+          - 0 2       EIP
+          - 0 3       Core
+          - 0 4       NAND core
+          - 0 5       SDIO core
+
+        - Gateable clocks
+          - 1 0       Audio
+          - 1 1       Comm Unit
+          - 1 2       NAND
+          - 1 3       PPv2
+          - 1 4       SDIO
+          - 1 5       MG Domain
+          - 1 6       MG Core
+          - 1 7       XOR1
+          - 1 8       XOR0
+          - 1 9       GOP DP
+          - 1 11      PCIe x1 0
+          - 1 12      PCIe x1 1
+          - 1 13      PCIe x4
+          - 1 14      PCIe / XOR
+          - 1 15      SATA
+          - 1 16      SATA USB
+          - 1 17      Main
+          - 1 18      SD/MMC/GOP
+          - 1 21      Slow IO (SPI, NOR, BootROM, I2C, UART)
+          - 1 22      USB3H0
+          - 1 23      USB3H1
+          - 1 24      USB3 Device
+          - 1 25      EIP150
+          - 1 26      EIP197
+
+required:
+  - compatible
+  - "#clock-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada-7k-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,armada-7k-pinctrl.yaml
new file mode 100644
index 000000000000..88910ad170e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-7k-pinctrl.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 7K/8K pin controller
+
+maintainers:
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - marvell,armada-7k-pinctrl
+      - marvell,armada-8k-cpm-pinctrl
+      - marvell,armada-8k-cps-pinctrl
+      - marvell,cp115-standalone-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins(-.+)?$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      marvell,function:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          Indicates the function to select.
+        enum: [
+          au, dev, ge, ge0, ge1, gpio, i2c0, i2c1, led, link, mii, mss_gpio0,
+          mss_gpio1, mss_gpio2, mss_gpio3, mss_gpio4, mss_gpio5, mss_gpio6,
+          mss_gpio7, mss_i2c, mss_spi, mss_uart, nf, pcie, pcie0, pcie1, pcie2,
+          ptp, rei, sata0, sata1, sdio, sdio_cd, sdio_wp, sei, spi0, spi1,
+          synce1, synce2, tdm, uart0, uart1, uart2, uart3, wakeup, xg
+        ]
+
+      marvell,pins:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          Array of MPP pins to be used for the given function.
+        minItems: 1
+        maxItems: 63
+        items:
+          pattern: '^mpp([1-5]?[0-9]|6[0-2])$'
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "marvell,armada-7k-pinctrl";
+
+        nand_pins: nand-pins {
+            marvell,pins =
+                "mpp15", "mpp16", "mpp17", "mpp18",
+                "mpp19", "mpp20", "mpp21", "mpp22",
+                "mpp23", "mpp24", "mpp25", "mpp26",
+                "mpp27";
+            marvell,function = "dev";
+        };
+    };
-- 
2.51.0


