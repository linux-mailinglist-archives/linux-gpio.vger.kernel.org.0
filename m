Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC3F42090B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 12:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhJDKLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 06:11:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231904AbhJDKLH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Oct 2021 06:11:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F52E61350;
        Mon,  4 Oct 2021 10:09:18 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mXKuK-00EaXF-96; Mon, 04 Oct 2021 11:09:16 +0100
MIME-Version: 1.0
Date:   Mon, 04 Oct 2021 11:09:16 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     matthias.bgg@gmail.com, Ryder.Lee@mediatek.com,
        devicetree@vger.kernel.org, enric.balletbo@collabora.com,
        fparent@baylibre.com, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        mpm@selenic.com, mturquette@baylibre.com, robh+dt@kernel.org,
        sboyd@kernel.org, sean.wang@kernel.org, seiya.wang@mediatek.com,
        wim@linux-watchdog.org
Subject: Re: [v4,9/9] arm64: dts: mediatek: add mt7986b support
In-Reply-To: <20211004091617.31436-1-sam.shih@mediatek.com>
References: <20210924112701.18459-1-sam.shih@mediatek.com>
 <20211004091617.31436-1-sam.shih@mediatek.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <39193058d8c206e616d7b179762a7829@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sam.shih@mediatek.com, matthias.bgg@gmail.com, Ryder.Lee@mediatek.com, devicetree@vger.kernel.org, enric.balletbo@collabora.com, fparent@baylibre.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, linux@roeck-us.net, mpm@selenic.com, mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org, sean.wang@kernel.org, seiya.wang@mediatek.com, wim@linux-watchdog.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-10-04 10:16, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986b, include
> uart nodes with correct clocks, rng node with correct clock,
> and watchdog node and mt7986b pinctrl node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware,
> 
> Add clock controller nodes, include 40M clock source, topckgen, 
> infracfg,
> apmixedsys and ethernet subsystem.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
> v4: added missing gic register bases, and fixed range of GICR
> v3: used the stdout-path instead of console=ttyS0
> v2: modified clock and uart node due to clock driver updated
> ---
>  arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  26 +++
>  arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 230 +++++++++++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> b/arch/arm64/boot/dts/mediatek/Makefile
> index e6c3a73b9e4a..d555e43d1ccc 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> new file mode 100644
> index 000000000000..95a202505bb2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include "mt7986b.dtsi"
> +
> +/ {
> +	model = "MediaTek MT7986b RFB";
> +	compatible = "mediatek,mt7986b-rfb";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon=uart8250,mmio32,0x11002000 swiotlb=512";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> new file mode 100644
> index 000000000000..06c3381a5170
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/mt7986-clk.h>
> +
> +/ {
> +	compatible = "mediatek,mt7986b";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clk40m: oscillator@0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +		clock-output-names = "clkxtal";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x1>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x2>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			#cooling-cells = <2>;
> +		};
> +	};
> +
> +	psci {
> +		compatible  = "arm,psci-0.2";
> +		method      = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon_reserved: secmon@43000000 {
> +			reg = <0 0x43000000 0 0x30000>;
> +			no-map;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		clock-frequency = <13000000>;

As previously mentioned, please fix your firmware and drop this.

> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,  /* GICD */

This is not a valid value for GICD.

Thanks,

         M.
