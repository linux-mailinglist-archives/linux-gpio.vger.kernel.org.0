Return-Path: <linux-gpio+bounces-5826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F28B12B2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 20:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6124E1C213C4
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 18:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B242D022;
	Wed, 24 Apr 2024 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVyuWq28"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA372C1A9;
	Wed, 24 Apr 2024 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713984158; cv=none; b=JF7kLe3k3j188gJ5MDd7GTAg+lsKfa6u4I0w79BUMmbpBX+r60gSsz6MKmeza/kdbWTJCuL61GGu5c/O9ocvxeMmEKPbnAXfqQhNfoSu2H6GMJee3o5vazk+IwmRgGus8fArqED5kxmHGprnY+LA5k3BdgLUCXaC2JQna5uTzVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713984158; c=relaxed/simple;
	bh=RIsAeJuU7UNAFhX9jwZV/lLzjA/01iPJqMytHY45C18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W26w6SKNhXTYi2fYa4f6tiGzqZCzby9g+nQ6SwLfKwXP8wgOmFGng2y8frMjML1eJIytFJC7GqhvAgYfkgD7ZeVJvgu+rn7lbab5SnSbZP8+up3LYg+DEsqIqB/btvaMHLmjvSm9y2P+HG+nIpooXZDj21E3MtIeJ0bWF1aHRpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVyuWq28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8352EC4AF10;
	Wed, 24 Apr 2024 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713984157;
	bh=RIsAeJuU7UNAFhX9jwZV/lLzjA/01iPJqMytHY45C18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GVyuWq28rD/kzLBm4OyaHAwuzUWe49cI7gU9wFnfMHdUTgMMF1qwjEJHQnzErIGIb
	 8dNs7BtmDjwH61/nD1ph44tCL4WJ2D4CZd+hnIMo0ggZ+6Mayt3DUEaiouP6C8+TvA
	 5uT0TntMekMK2i5F0qVdLEhV+T/tiJFNFKtYp1ic4wP7p3CCVpdMDhDQzqew3y7roF
	 2AHZu5FhPYZp/U5HOoVQZHdYAtgkZHbOpK1EVSeXI8IMFGBsyxe/IIhR6xRbFG0+1E
	 RRPo9HoRvNnElvSey3aRY0E5Dx4540efNZYL0SD3/r+kuFti2QMAUtCEXo3vk18Rbk
	 4ewbN4Gyn/iCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7329DC19F4F;
	Wed, 24 Apr 2024 18:42:37 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Wed, 24 Apr 2024 20:42:38 +0200
Subject: [PATCH v10 11/12] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240424-pxa1908-lkml-v10-11-36cdfb5841f9@skole.hr>
References: <20240424-pxa1908-lkml-v10-0-36cdfb5841f9@skole.hr>
In-Reply-To: <20240424-pxa1908-lkml-v10-0-36cdfb5841f9@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Rob Herring <robh@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16554;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=2X0WOBPY7uHO4VCrPkeka+zQtkEuFzDwR11uUdiCpIM=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmKVKVRwoyCSEvyySdNNrX9883BoBNyWkSlbuuV
 MVfLZETNi6JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZilSlQAKCRCaEZ6wQi2W
 4c46D/wP9fQXiD9brAByCo774WP5B34GSjO1Z7ShUlbihMCcnFNGKqrnfZKen7JL6/5iQY5iyJI
 KXGbw/FosfsPctcWtFvnqE//CKM0KDadkBgZDWeAYLtBuRZG9pAOFv5xoguyA4vJbrsVlfJ+hfw
 cO/tbwrWuahy+Dc3+UBIRIxN90v+GD+rGznD9+2p+o0PtZwoI1lESVH9KloTs4sBIEQ1Xf1YQJu
 1V7m485T3tovsSom8RtH1FkFutFKuHpznDZrrSnFDAjHTK3Hnq768qsKwJaaBvt+IdMmLIS9EvL
 SpMZOwe4vvxwAJ0qVrm+nt8fXCsmXsfFAI3VL8ZreMWHUQqdmxD4Ibv1CsEMIV0a/JMhFUUBSEV
 6YnDQbn+6rPWCZTu18/nbjq2Qxwviz7AAx/7TQGEpdNhZ73y6A86IMxg7ANYnKo2orsuCBXy9J8
 xz7aGPnEWJRMkqAx2yr0D1yPnaiMtMHv3MocvblvkomaBXkweqk0LDTh/Ka1gbVpjB2Oq8laC7N
 jEwMUCwyCVtZLvuwHRlsaaMl68H4be4ZkLVfaqI7aOvJuCRg6blynl/Hc2IvMsEbifUBNl3pVck
 CMp0bCzA5z1sqiFpg9WusxlLYPxjILNgD76bhjuhAN9ubY5sAZKH7vPc1LN8Wq1Q0oMAJ4tssKw
 I0fSc49kE85kIrA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add DTS for Marvell PXA1908 SoC and Samsung Galaxy Core Prime Value
Edition LTE, a smartphone based on said SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/boot/dts/marvell/Makefile               |   3 +
 .../dts/marvell/pxa1908-samsung-coreprimevelte.dts | 328 +++++++++++++++++++++
 arch/arm64/boot/dts/marvell/pxa1908.dtsi           | 300 +++++++++++++++++++
 3 files changed, 631 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/marvell/Makefile
index 99b8cb3c49e1..687c256d95fe 100644
--- a/arch/arm64/boot/dts/marvell/Makefile
+++ b/arch/arm64/boot/dts/marvell/Makefile
@@ -28,3 +28,6 @@ dtb-$(CONFIG_ARCH_MVEBU) += cn9130-crb-A.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9130-crb-B.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += ac5x-rd-carrier-cn9131.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += ac5-98dx35xx-rd.dtb
+
+# MMP SoC Family
+dtb-$(CONFIG_ARCH_MMP) += pxa1908-samsung-coreprimevelte.dtb
diff --git a/arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts
new file mode 100644
index 000000000000..2a1f309c8e54
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "pxa1908.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	model = "Samsung Galaxy Core Prime VE LTE";
+	compatible = "samsung,coreprimevelte", "marvell,pxa1908";
+
+	aliases {
+		mmc0 = &sdh2; /* eMMC */
+		mmc1 = &sdh0; /* SD card */
+		serial0 = &uart0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		/* S-Boot places the initramfs here */
+		linux,initrd-start = <0x4d70000>;
+		linux,initrd-end = <0x5000000>;
+
+		fb0: framebuffer@17177000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			width = <480>;
+			height = <800>;
+			stride = <(480 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	/* Bootloader fills this in */
+	memory {
+		device_type = "memory";
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@17000000 {
+			reg = <0 0x17000000 0 0x1800000>;
+			no-map;
+		};
+
+		gpu@9000000 {
+			reg = <0 0x9000000 0 0x1000000>;
+		};
+
+		/* Communications processor, aka modem */
+		cp@5000000 {
+			reg = <0 0x5000000 0 0x3000000>;
+		};
+
+		cm3@a000000 {
+			reg = <0 0xa000000 0 0x80000>;
+		};
+
+		seclog@8000000 {
+			reg = <0 0x8000000 0 0x100000>;
+		};
+
+		ramoops@8100000 {
+			compatible = "ramoops";
+			reg = <0 0x8100000 0 0x40000>;
+			record-size = <0x8000>;
+			console-size = <0x20000>;
+			max-reason = <5>;
+		};
+	};
+
+
+	i2c-muic {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio 30 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio 29 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <3>;
+		i2c-gpio,timeout-ms = <100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_muic_pins>;
+
+		muic: extcon@14 {
+			compatible = "siliconmitus,sm5504-muic";
+			reg = <0x14>;
+			interrupt-parent = <&gpio>;
+			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins>;
+		autorepeat;
+
+		key-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
+		};
+
+		key-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+		};
+
+		key-voldown {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&smmu {
+	status = "okay";
+};
+
+&pmx {
+	pinctrl-single,gpio-range = <&range 55 55 0>,
+				    <&range 110 32 0>,
+				    <&range 52 1 0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&board_pins_0 &board_pins_1 &board_pins_2>;
+
+	board_pins_0: board-pins-0 {
+		pinctrl-single,pins = <
+			0x160 0
+			0x164 0
+			0x168 0
+			0x16c 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0x8000 0x8000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0x8000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	board_pins_1: board-pins-1 {
+		pinctrl-single,pins = <
+			0x44 1
+			0x48 1
+			0x20 1
+			0x18 1
+			0x14 1
+			0x10 1
+			0xc 1
+			0x8 1
+			0x68 1
+			0x58 0
+			0x54 0
+			0x7c 0
+			0x6c 0
+			0x70 0
+			0x4c 1
+			0x50 1
+			0xac 0
+			0x90 0
+			0x8c 0
+			0x88 0
+			0x84 0
+			0xc8 0
+			0x128 0
+			0x190 0
+			0x194 0
+			0x1a0 0
+			0x114 0
+			0x118 0
+			0x1d8 0
+			0x1e4 0
+			0xe8 0
+			0x100 0
+			0x204 0
+			0x210 0
+			0x218 0
+		>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xc000>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	board_pins_2: board-pins-2 {
+		pinctrl-single,pins = <
+			0x260 0
+			0x264 0
+			0x268 0
+			0x26c 0
+			0x270 0
+			0x274 0
+			0x78 0
+			0x74 0
+			0xb0 1
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	uart0_pins: uart0-pins {
+		pinctrl-single,pins = <
+			0x198 6
+			0x19c 6
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	gpio_keys_pins: gpio-keys-pins {
+		pinctrl-single,pins = <
+			0x11c 0
+			0x120 0
+			0x1a4 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa0000 0x8000 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	i2c_muic_pins: i2c-muic-pins {
+		pinctrl-single,pins = <
+			0x154 0
+			0x150 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0x288 0x388>;
+	};
+
+	sdh0_pins_0: sdh0-pins-0 {
+		pinctrl-single,pins = <
+			0x108 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh0_pins_1: sdh0-pins-1 {
+		pinctrl-single,pins = <
+			0x94 0
+			0x98 0
+			0x9c 0
+			0xa0 0
+			0xa4 0
+		>;
+		pinctrl-single,drive-strength = <0x800 0x1800>;
+		pinctrl-single,bias-pullup = <0xc000 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
+
+	sdh0_pins_2: sdh0-pins-2 {
+		pinctrl-single,pins = <
+			0xa8 0
+		>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0 0xc000 0 0xc000>;
+		pinctrl-single,bias-pulldown = <0 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0x40 0 0x40 0x70>;
+		pinctrl-single,low-power-mode = <0x208 0x388>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&twsi0 {
+	status = "okay";
+};
+
+&twsi1 {
+	status = "okay";
+};
+
+&twsi2 {
+	status = "okay";
+};
+
+&twsi3 {
+	status = "okay";
+};
+
+&usb {
+	extcon = <&muic>, <&muic>;
+};
+
+&sdh2 {
+	/* Disabled for now because initialization fails with -ETIMEDOUT. */
+	status = "disabled";
+	bus-width = <8>;
+	non-removable;
+	mmc-ddr-1_8v;
+};
+
+&sdh0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdh0_pins_0 &sdh0_pins_1 &sdh0_pins_2>;
+	cd-gpios = <&gpio 11 0>;
+	cd-inverted;
+	bus-width = <4>;
+	wp-inverted;
+};
diff --git a/arch/arm64/boot/dts/marvell/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/pxa1908.dtsi
new file mode 100644
index 000000000000..cf2b9109688c
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/pxa1908.dtsi
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/marvell,pxa1908.h>
+
+/ {
+	model = "Marvell Armada PXA1908";
+	compatible = "marvell,pxa1908";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0 3>;
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smmu: iommu@c0010000 {
+			compatible = "arm,mmu-400";
+			reg = <0 0xc0010000 0 0x10000>;
+			#global-interrupts = <1>;
+			#iommu-cells = <1>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@d1df9000 {
+			compatible = "arm,gic-400";
+			reg = <0 0xd1df9000 0 0x1000>,
+				<0 0xd1dfa000 0 0x2000>,
+				/* The subsequent registers are guesses. */
+				<0 0xd1dfc000 0 0x2000>,
+				<0 0xd1dfe000 0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		apb@d4000000 {
+			compatible = "simple-bus";
+			reg = <0 0xd4000000 0 0x200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xd4000000 0x200000>;
+
+			pdma: dma-controller@0 {
+				compatible = "marvell,pdma-1.0";
+				reg = <0 0x10000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				dma-channels = <30>;
+				#dma-cells = <2>;
+			};
+
+			twsi1: i2c@10800 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x10800 0x64>;
+				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_TWSI1>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			twsi0: i2c@11000 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x11000 0x64>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_TWSI0>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			twsi3: i2c@13800 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x13800 0x64>;
+				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_TWSI3>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			apbc: clock-controller@15000 {
+				compatible = "marvell,pxa1908-apbc";
+				reg = <0x15000 0x1000>;
+				#clock-cells = <1>;
+			};
+
+			uart0: serial@17000 {
+				compatible = "mrvl,mmp-uart", "intel,xscale-uart";
+				reg = <0x17000 0x1000>;
+				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_UART0>;
+				reg-shift = <2>;
+			};
+
+			uart1: serial@18000 {
+				compatible = "mrvl,mmp-uart", "intel,xscale-uart";
+				reg = <0x18000 0x1000>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbc PXA1908_CLK_UART1>;
+				reg-shift = <2>;
+			};
+
+			gpio: gpio@19000 {
+				compatible = "marvell,mmp-gpio";
+				reg = <0x19000 0x800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&apbc PXA1908_CLK_GPIO>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "gpio_mux";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ranges = <0 0x19000 0x800>;
+
+				gpio@0 {
+					reg = <0x0 0x4>;
+				};
+
+				gpio@4 {
+					reg = <0x4 0x4>;
+				};
+
+				gpio@8 {
+					reg = <0x8 0x4>;
+				};
+
+				gpio@100 {
+					reg = <0x100 0x4>;
+				};
+			};
+
+			pmx: pinmux@1e000 {
+				compatible = "marvell,pxa1908-padconf", "pinconf-single";
+				reg = <0x1e000 0x330>;
+
+				#pinctrl-cells = <1>;
+				pinctrl-single,register-width = <32>;
+				pinctrl-single,function-mask = <7>;
+
+				range: gpio-range {
+					#pinctrl-single,gpio-range-cells = <3>;
+				};
+			};
+
+			uart2: serial@36000 {
+				compatible = "mrvl,mmp-uart", "intel,xscale-uart";
+				reg = <0x36000 0x1000>;
+				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbcp PXA1908_CLK_UART2>;
+				reg-shift = <2>;
+			};
+
+			twsi2: i2c@37000 {
+				compatible = "mrvl,mmp-twsi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x37000 0x64>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apbcp PXA1908_CLK_TWSI2>;
+				mrvl,i2c-fast-mode;
+				status = "disabled";
+			};
+
+			apbcp: clock-controller@3b000 {
+				compatible = "marvell,pxa1908-apbcp";
+				reg = <0x3b000 0x1000>;
+				#clock-cells = <1>;
+			};
+
+			mpmu: clock-controller@50000 {
+				compatible = "marvell,pxa1908-mpmu";
+				reg = <0x50000 0x1000>;
+				#clock-cells = <1>;
+			};
+		};
+
+		axi@d4200000 {
+			compatible = "simple-bus";
+			reg = <0 0xd4200000 0 0x200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xd4200000 0x200000>;
+
+			usbphy: phy@7000 {
+				compatible = "marvell,pxa1928-usb-phy";
+				reg = <0x7000 0x200>;
+				clocks = <&apmu PXA1908_CLK_USB>;
+				#phy-cells = <0>;
+			};
+
+			usb: usb@8000 {
+				compatible = "chipidea,usb2";
+				reg = <0x8000 0x200>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_USB>;
+				phys = <&usbphy>;
+				phy-names = "usb-phy";
+			};
+
+			sdh0: mmc@80000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0x80000 0x120>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_SDH0>;
+				clock-names = "io";
+				mrvl,clk-delay-cycles = <31>;
+			};
+
+			sdh1: mmc@80800 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0x80800 0x120>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_SDH1>;
+				clock-names = "io";
+				mrvl,clk-delay-cycles = <31>;
+			};
+
+			sdh2: mmc@81000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0x81000 0x120>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&apmu PXA1908_CLK_SDH2>;
+				clock-names = "io";
+				mrvl,clk-delay-cycles = <31>;
+			};
+
+			apmu: clock-controller@82800 {
+				compatible = "marvell,pxa1908-apmu";
+				reg = <0x82800 0x400>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+};

-- 
2.44.0



