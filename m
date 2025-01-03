Return-Path: <linux-gpio+bounces-14496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C26A0112E
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 00:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FEA73A46B6
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29841C3BE3;
	Fri,  3 Jan 2025 23:58:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25711E4AD;
	Fri,  3 Jan 2025 23:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948710; cv=none; b=lCemjSO//ZW76UtXp5SlFeBUwUMkJ7n1jZV0H7TNMasQWznPxpm0F7ILYS1kMiw483eQw+RUwa+pHmxeSYNoyazIdhLurA5Z9exTODMpEC4vFwvBxwpLY3IqqLd/YW56NL2N4fLf1e3sxIylds9LEgghaeMD1YdvrlP9z9uUwB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948710; c=relaxed/simple;
	bh=1CpFBqlCwQv7mn/1ybcL7b2Ba9h44nbWG+ByW/ZLD1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVC2lLWCMAhZeEkYIon6apnJ5bkaDPh8E2IFvufqmF3+vYLMcUg265UuvQR4aHgNipEyP/kkVew3Mm6ybpADO2kaZJYl8p9DH/3aRoX3NlDb9FugIYbaHr8Z0vAATPTn6nbU1OYe9d3urnfYVVbTE1PyZ+bTs5SpVkFwaRh8+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ABCC1480;
	Fri,  3 Jan 2025 15:58:56 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8358C3F59E;
	Fri,  3 Jan 2025 15:58:26 -0800 (PST)
Date: Fri, 3 Jan 2025 23:57:23 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Icenowy Zheng
 <icenowy@aosc.io>
Subject: Re: [PATCH v3 4/4] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat
Message-ID: <20250103235723.6a893773@minigeek.lan>
In-Reply-To: <20250103204523.3779-5-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-5-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Jan 2025 20:45:20 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

(CC:ing Icenowy for a question about the RTC below ...)

> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
> 
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 290 ++++++++++++++++++
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
>  3 files changed, 298 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index 48666f73e638..d799ad153b37 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc := -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
> +DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
>  dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-a23-evb.dtb \
>  	sun8i-a23-gt90h-v4.dtb \
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
> +	sun8i-v3s-netcube-kumquat.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> new file mode 100644
> index 000000000000..e5d2a716eb69
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-v3s.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/{
> +	model = "NetCube Systems Kumquat";
> +	compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &emac;
> +		rtc0 = &ds3232;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	/* 40 MHz Crystal Oscillator on PCB */
> +	clk_can0: clock-can0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency  = <40000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		key-user {
> +			label = "GPIO Key User";
> +			linux,code = <KEY_PROG1>;
> +			gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PB2 */
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-heartbeat {
> +			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +			linux,default-trigger = "heartbeat";
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +		};
> +
> +		led-mmc0-act {
> +			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +			linux,default-trigger = "mmc0";
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_DISK;
> +		};
> +	};
> +
> +	/* XC6206-3.0 Linear Regualtor */
> +	reg_vcc3v0: regulator-3v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v0";
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +		vin-supply = <&reg_vcc3v3>;
> +	};
> +
> +	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
> +	reg_vcc3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_vcc5v0>;
> +	};
> +
> +	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
> +	reg_vcc5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +&mmc1 {

what's connected here? Are both MMC ports on headers/connectors, and
it's up to the user to connect some SDIO device or an SD/eMMC
card/slot? Or is this port connected to the ESP32?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +&usb_otg {

I think traditionally referenced nodes in the board .dts files are
ordered by label name, so usb_otg is but-last. Yes, this is in contrast
to nodes in the SoC .dtsi file, which are ordered by MMIO addresses.

> +	extcon = <&tusb320 0>;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +	status = "okay";
> +};
> +
> +&ehci {
> +	status = "okay";
> +};
> +
> +&ohci {
> +	status = "okay";
> +};
> +
> +&rtc {
> +	status = "disabled";

Please can you explain a bit more what's going on here? I saw you
mentioning in the cover letter that you brought the "disabled" back,
but I still don't see how this is working when the CCU and the pinctrl
nodes reference the RTC clocks? So what is broken, exactly? Is this
some bug in the SoC? Or don't you supply the SoC's VCC_RTC, so the
calendar is not working when the board is not powered - in contrast to
the external RTC?

> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pe-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +
> +	gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96 32>, <153 7>, <167 25>, <198 26>;

As mentioned in the reply to the previous patch, this doesn't look
right here. Why do you need this, exactly?

> +	gpio-line-names = "", "", "", "", // PA
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "", 
> +			  "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
> +			  "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
> +			  "UART0_TX", "UART0_RX", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI", // PC
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "", 
> +			  "", "", "", "", // PD
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "Q12", "Q11", "Q10", "Q9", // PE
> +			  "LED_SYS0", "I1", "Q1", "Q2",
> +			  "I2", "I3", "Q3", "Q4",
> +			  "I4", "I5", "Q5", "Q6",
> +			  "I6", "I7", "Q7", "Q8",
> +			  "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
> +			  "ESP_nBOOT", "", "", "",
> +			  "", "", "", "",
> +			  "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
> +			  "SD_D3", "SD_D2", "LED_SYS1", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> +			  "ESP_D2", "ESP_D3", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
> +&lradc {
> +	vref-supply = <&reg_vcc3v0>;
> +	status = "okay";
> +};
> +
> +&codec {
> +	allwinner,audio-routing =
> +		"Headphone", "HP",
> +		"Headphone", "HPCOM",
> +		"MIC1", "Mic",
> +		"Mic", "HBIAS";
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-0 = <&uart1_pe_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ds3232: rtc@68 {
> +		compatible = "dallas,ds3232";
> +		reg = <0x68>;
> +	};
> +
> +	eeprom0: eeprom@50 {
> +		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
> +		pagesize = <16>;
> +		read-only;
> +		reg = <0x50>;
> +		vcc-supply = <&reg_vcc3v3>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		eth0_macaddress: macaddress@fa {
> +			reg = <0xfa 0x06>;
> +		};
> +	};
> +
> +	tusb320: typec@60 {
> +		compatible = "ti,tusb320";
> +		reg = <0x60>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&emac {
> +	allwinner,leds-active-low;
> +	nvmem-cells = <&eth0_macaddress>;		/* custom nvmem reference */
> +	nvmem-cell-names = "mac-address";		/* see ethernet-controller.yaml */
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;

Those two lines look redundant, as they are already specified in the
.dtsi file.

> +	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "jedec,spi-nor";

I think traditionally we have the compatible first, and #a-c and #s-c
last in the node.
And do you have anything partitioned in there? If not, you wouldn't
need the #a-c and #s-c properties, I think.

> +		reg = <0>;
> +		label = "firmware";
> +		spi-max-frequency = <40000000>;
> +	};
> +
> +	can@1 {
> +		compatible = "microchip,mcp2518fd";
> +		reg = <1>;
> +		clocks = <&clk_can0>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
> +		spi-max-frequency = <20000000>;
> +		vdd-supply = <&reg_vcc3v3>;
> +		xceiver-supply = <&reg_vcc3v3>;
> +	};
> +};
> \ No newline at end of file

Please add a newline at the end.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi

I don't know for sure if people want SoC .dtsi patches separately?

Cheers,
Andre

> index 9e13c2aa8911..f909b1d4dbca 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
>  				function = "uart0";
>  			};
>  
> +			/omit-if-no-ref/
> +			uart1_pe_pins: uart1-pe-pins {
> +				pins = "PE21", "PE22";
> +				function = "uart1";
> +			};
> +
>  			uart2_pins: uart2-pins {
>  				pins = "PB0", "PB1";
>  				function = "uart2";


