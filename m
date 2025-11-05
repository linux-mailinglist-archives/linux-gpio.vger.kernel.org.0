Return-Path: <linux-gpio+bounces-28113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA492C35B81
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 13:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 666E5567151
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 12:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DC3316197;
	Wed,  5 Nov 2025 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IyFHUqzQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1C5313E04;
	Wed,  5 Nov 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347350; cv=none; b=ONIVdr1GqzNOdeNgy8gJb62UyaK5LB0pVthZgcT9YrIKIUWfCIC+KJJuQaNvTLs3sI+hPlfJ9DbVc6BUQ7MwgrlY8keizP3GMixydDnxl+B3zaW+m0/NyP+M+JgYsXhSallB/8wuN2a5tbLwTmkIqeUiZwb0xU1AmtDVHtcvUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347350; c=relaxed/simple;
	bh=i/cNt7Yk+QN3eCsujqgkzXWMVipa6Kw/x/Xo6I7/S+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noyFAzK2x7qQ7arKP6G1yZxSjcY2nPoM2WSLA/k9MD0d0tC+o5XDhnUZ2/+g9Dhek/oWT6d5wt+cfqmMa9s+OXwPD2UlnRipkjVNNRY/nv517SMXNUVNE1Wm2Zql1qv0k9IALGI0YCdUfhpqJTHcdsGzZ/YWhsDTysMRqdBouag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IyFHUqzQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762347344;
	bh=i/cNt7Yk+QN3eCsujqgkzXWMVipa6Kw/x/Xo6I7/S+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IyFHUqzQukf9MkRS3j1CsJ1aiI3Itk+yMzpmmOYLOcuxqaFNVslIDiscH4UVAYShj
	 beeKpA21X1jG5eJE4oAG4z10uIqFsTve2CE0pDFRgnnKVFkWHW64dCY116bKeW/0HN
	 t7ER3b1j44cQBju5uvWqB05Othdjui8L2AD0fGFo6vT4sva9K7/T8O/9X3b/snwD4L
	 8w6QxTsSkv93AbQm/4PsXqIW14R0UWuNSHTIbKg+7q+C4p6zKlI8c+dY7gmZJl1JLp
	 NnS+XfAwP8E1E//3lerWUyjbG9YGoHtxSknTFQBnf346QHTFSL6oZdIzfSoS0jHqKO
	 j5I81RkaCEogg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9276E17E0927;
	Wed,  5 Nov 2025 13:55:43 +0100 (CET)
Message-ID: <017b2ebb-e6b0-40a2-a6e6-47ced8909f55@collabora.com>
Date: Wed, 5 Nov 2025 13:55:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] arm64: dts: mt7988: Add devicetree for BananaPi R4
 Pro
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251027132817.212534-1-linux@fw-web.de>
 <20251027132817.212534-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251027132817.212534-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/10/25 14:28, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add devicetree for Bpi-R4-Pro.

Thanks for this!

Overall, this looks good - there are just a few small things to fix, but hey,
I bet you're getting this upstream as early as v2 :-D

> 
> BananaPi R4 Pro is a MT7988A based board which exists in 2 different
> hardware versions:
> 
> - 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
> - 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys
> 
> common parts:
> 
> - MediaTek MT7988A Quad-core Arm Corex-A73,1.8GHz processor
> - 8GB eMMC flash
> - 256MB SPI-NAND Flash
> - Micro SD card slot
> - 1x 10G SFP+ WAN
> - 1x 10G SFP+ LAN
> - 4x 2.5G RJ45 LAN (MxL86252C)
> - 1x 1G RJ45 LAN (MT7988 internal switch)
> - 2x miniPCIe slots with PCIe3.0 2lane interface for Wi-Fi NIC
> - 2x M.2 M-KEY slots with PCIe3.0 1lane interface for NVME SSD
> - 3x M.2 B-KEY slots with USB3.2 for 5G Module (PCIe shared with key-m)
> - 1x USB3.2 slot
> - 1x USB2.0 slot
> - 1x USB TypeC Debug Console
> - 2x13 PIN Header for expanding application
> 
> https://docs.banana-pi.org/en/BPI-R4_Pro/BananaPi_BPI-R4_Pro
> 
> The PCIe is per default in key-m state and can be changed to key-b with
> the pcie-overlays.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   4 +
>   .../mt7988a-bananapi-bpi-r4-pro-4e.dts        |  16 +
>   .../mt7988a-bananapi-bpi-r4-pro-8x.dts        |  16 +
>   .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 559 ++++++++++++++++++
>   4 files changed, 595 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a4df4c21399e..8640e5f32d4b 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -24,6 +24,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-4e.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
> @@ -111,4 +113,6 @@ DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
>   DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
>   DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
>   DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-pro-4e := -@
> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-pro-8x := -@
>   DTC_FLAGS_mt8395-radxa-nio-12l := -@
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> new file mode 100644
> index 000000000000..c7ea6e88c4f4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + * Author: Frank Wunderlich <frank-w@public-files.de>
> + */
> +
> +/dts-v1/;
> +
> +#include "mt7988a-bananapi-bpi-r4-pro.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R4";
> +	compatible = "bananapi,bpi-r4-pro-4e",
> +		     "bananapi,bpi-r4-pro",
> +		     "mediatek,mt7988a";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> new file mode 100644
> index 000000000000..c9a0e69e9dd5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + * Author: Frank Wunderlich <frank-w@public-files.de>
> + */
> +
> +/dts-v1/;
> +
> +#include "mt7988a-bananapi-bpi-r4-pro.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R4";
> +	compatible = "bananapi,bpi-r4-pro-8x",
> +		     "bananapi,bpi-r4-pro",
> +		     "mediatek,mt7988a";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> new file mode 100644
> index 000000000000..44406e23c042
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + * Author: Frank Wunderlich <frank-w@public-files.de>
> + */
> +
> +/dts-v1/;
> +
> +#include "mt7988a.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
> +
> +/*
> + * ----------------------------------- Bananapi Bpi R4 Pro PINs ---------------------------------
> + * |    | Function                               | Function                                |    |
> + * |----|----------------------------------------|-----------------------------------------|----|
> + * | 1  | 3V3                                    | 5V                                      | 2  |
> + * | 3  | GPIO18/I2C_1_SDA                       | 5V                                      | 4  |
> + * | 5  | GPIO17/I2C_1_SCL                       | GND                                     | 6  |
> + * | 7  | GPIO62/JTAG_JTRST_N/PWM6/I2P5G_LED1_P0 | GPIO59/JTAG_JTDO/UART2_TX/GBE_LED1_P1   | 8  |
> + * | 9  | GND                                    | GPIO58/JTAG_JTDI/UART2_RX/GBE_LED1_P0   | 10 |
> + * | 11 | GPIO81/UART1_TXD                       | GPIO51/PCM_CLK_I2S_BCLK                 | 12 |
> + * | 13 | GPIO80/UART1_RXD                       | GND                                     | 14 |
> + * | 15 | GPIO50/PCM_FS_I2S_LRCK                 | GPIO61/JTAG_JTCLK/UART2_RTS/GBE_LED1_P3 | 16 |
> + * | 17 | 3v3                                    | GPIO60/JTAG_JTMS/UART2_CTS/GBE_LED1_P2  | 18 |
> + * | 19 | GPIO30/SPI1_MOSI                       | GND                                     | 20 |
> + * | 21 | GPIO29/SPI1_MISO                       | GPIO53/PCM_DTX_I2S_DOUT                 | 22 |
> + * | 23 | GPIO31/SPI1_CLK                        | GPIO28/SPI1_CSB                         | 24 |
> + * | 25 | GND                                    | GPIO52/PCM_DRX_I2S_DIN                  | 26 |
> + * |----|----------------------------------------|-----------------------------------------|----|
> + */

Nice! Is this a "raspberry pi header" thingy?

Let's say that the header is called "CON89" on the schematics (if unsure, you
should find that name by looking at the PCB), so a better title would be:

* ------------------------------------- CON89 Pi header pins 
-----------------------------------

Also this relates to PIO, right? You could move that as a pio node comment,
either before or inside of your PIO overrides.
After all, this comment is mapping "header pin number" to "PIO pin number" ;-)

> +
> +/ {
> +	aliases {
> +		ethernet0 = &gmac0;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		/* PCA9548 (0-0070) provides 4 i2c channels */
> +		i2c3 = &imux0;
> +		i2c4 = &imux1_sfp1;
> +		i2c5 = &imux2_sfp2;
> +		i2c6 = &imux3_wifi;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial0;
> +		bootargs = "console=ttyS0,115200n1 \
> +			    earlycon=uart8250,mmio32,0x11000000";

No, don't use bootargs - besides, earlycon is supposed to be for development
purposes only, and it *has to* be unnecessary after development, on upstreamed
devicetrees.
> +	};
> +
> +	fan: pwm-fan {
> +		compatible = "pwm-fan";
> +		/* cooling level (0, 1, 2, 3) : (0% duty, 30% duty, 50% duty, 100% duty) */
> +		cooling-levels = <0 80 128 255>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm0_pins>;
> +		pwms = <&pwm 0 50000>;
> +		#cooling-cells = <2>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-reset {
> +			label = "reset";
> +			linux,code = <KEY_RESTART>;
> +			gpios = <&pio 13 GPIO_ACTIVE_LOW>;

Please treat the linux,code property as a vendor property. Means...

label =
gpios =
linux,code =

> +		};
> +
> +		button-wps {
> +			label = "WPS";
> +			linux,code = <KEY_WPS_BUTTON>;
> +			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led_red: sys-led-red {
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		led_blue: sys-led-blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.8V";

Have you got the board schematics?

If so, can you please change the regulator-name to the one from the schematics?

> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	/* SFP1 cage (LAN) */
> +	sfp1: sfp1 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&imux1_sfp1>;
> +		los-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;//change4
> +		mod-def0-gpios = <&pio 69 GPIO_ACTIVE_LOW>; //change3
> +		tx-disable-gpios = <&pio 21 GPIO_ACTIVE_HIGH>; //change1

What does "change4", "change3", "change1" even mean?

Please remove.

> +		maximum-power-milliwatt = <3000>;
> +	};
> +
> +	/* SFP2 cage (WAN) */
> +	sfp2: sfp2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&imux2_sfp2>;
> +		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&pio 1 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
> +		maximum-power-milliwatt = <3000>;
> +	};
> +};
> +

..snip..

> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&gsw_phy0 {
> +	pinctrl-names = "gbe-led";
> +	pinctrl-0 = <&gbe0_led0_pins>;
> +};
> +
> +&gsw_phy0_led0 {
> +	status = "okay";
> +	color = <LED_COLOR_ID_YELLOW>;

color first, status last

> +};
> +

..snip..

> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_1_pins>;
> +	status = "okay";
> +
> +	pca9545: i2c-mux@70 {
> +		reg = <0x70>;
> +		compatible = "nxp,pca9545";

compatible goes first. Check dts-coding-style.rst.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		imux0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;

reg goes first.

> +
> +			pca9555: i2c-gpio-expander@20 {
> +				compatible = "nxp,pca9555";

reg after compatible please

> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				reg = <0x20>;
> +			};
> +
> +			rtc@51 {
> +				compatible = "nxp,pcf8563";
> +				reg = <0x51>;
> +			};
> +
> +			eeprom@57 {
> +				compatible = "atmel,24c02";
> +				reg = <0x57>;
> +				address-width = <8>;
> +				pagesize = <8>;
> +				size = <256>;
> +			};
> +		};
> +
> +		imux1_sfp1: i2c@1 {

reg first, cells later;

reg = <1>;
#address-cells = <1>;
#size-cells = <0>;

here and everywhere else.

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux2_sfp2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux3_wifi: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&int_2p5g_phy {
> +	status = "disabled";
> +};
> +
> +/* mPCIe SIM2 (11300000) */
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +/* mPCIe (11310000 near leds) SIM3 */
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +/* M.2 (11280000) 1L0 key-m SSD1 CN13 / key-b SIM1 CN15 */
> +&pcie2 {
> +	status = "okay";
> +};
> +
> +/* M.2 (11290000) 1L1 key-m SSD2 CN14 / key-b SIM2 CN18 */
> +&pcie3 {
> +	status = "okay";
> +};
> +
> +&pio {

--snip..

> +
> +	mmc0_pins_sdcard: mmc0-sdcard-pins {
> +		mux {
> +			function = "flash";
> +			groups = "sdcard";
> +		};
> +	};
> +
> +	// 1L0 0=key-b (CN15), 1=key-m (CN13)

Please fix the comments
/* 1L0 0=key-b (CN15), 1=key-m (CN13) */

> +	pcie-2-hog {
> +		gpio-hog;
> +		gpios = <79 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};

Extra space here please, and

> +	// 1L1 0=key-b (CN18), 1=key-m (CN14)

/* 1L1 0=key-b (CN18), 1=key-m (CN14) */

> +	pcie-3-hog {
> +		gpio-hog;
> +		gpios = <63 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
> +
> +	pwm0_pins: pwm0-pins {
> +		mux {
> +			groups = "pwm0";
> +			function = "pwm";
> +		};
> +	};
> +
> +	spi0_flash_pins: spi0-flash-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi0", "spi0_wp_hold";
> +		};
> +	};
> +};
> +

..snip..

> +
> +/* back USB */
> +&ssusb0 {
> +	/* Use U2P only instead of both U3P/U2P due to U3P serdes shared with pcie2 */
> +	phys = <&xphyu2port0 PHY_TYPE_USB2>;
> +	mediatek,u3p-dis-msk = <1>;
> +	/delete-property/ mediatek,p0_speed_fixup;

Where's that property defined, even?
Am I blind, or it's nowhere to be found (in any dtsi)?

(no, seriously, I'm not sarcastic :P)

> +	status = "okay";
> +};
> +

Cheers,
Angelo

