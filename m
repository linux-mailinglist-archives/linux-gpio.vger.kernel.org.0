Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5F61D1AE2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 18:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389351AbgEMQVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 12:21:07 -0400
Received: from disco-boy.misterjones.org ([51.254.78.96]:38078 "EHLO
        disco-boy.misterjones.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728354AbgEMQVH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 12:21:07 -0400
X-Greylist: delayed 2494 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 May 2020 12:21:04 EDT
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@misterjones.org>)
        id 1jYtTi-00C1J1-Tf; Wed, 13 May 2020 16:39:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 May 2020 16:39:26 +0100
From:   Marc Zyngier <maz@misterjones.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 06/14] arm64: dts: sparx5: Add basic cpu support
In-Reply-To: <20200513125532.24585-7-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
 <20200513125532.24585-7-lars.povlsen@microchip.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <2d230dab95ee96727a42f9c242c93c18@misterjones.org>
X-Sender: maz@misterjones.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lars.povlsen@microchip.com, soc@kernel.org, arnd@arndb.de, sboyd@kernel.org, linus.walleij@linaro.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, Steen.Hegelund@microchip.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, olof@lixom.net, mturquette@baylibre.com
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-05-13 13:55, Lars Povlsen wrote:
> This adds the basic DT structure for the Microchip Sparx5 SoC, and the
> reference boards, pcb125, pcb134 and pcb135. The two latter have a
> NAND vs a eMMC centric variant (as a mount option),
> 
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/microchip/Makefile        |   4 +
>  arch/arm64/boot/dts/microchip/sparx5.dtsi     | 135 ++++++++++++++++++
>  .../boot/dts/microchip/sparx5_pcb125.dts      |  17 +++
>  .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +++
>  .../dts/microchip/sparx5_pcb134_board.dtsi    |  15 ++
>  .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +++
>  .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +++
>  .../dts/microchip/sparx5_pcb135_board.dtsi    |  15 ++
>  .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +++
>  .../boot/dts/microchip/sparx5_pcb_common.dtsi |  15 ++
>  12 files changed, 271 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/microchip/Makefile
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5.dtsi
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
>  create mode 100644 
> arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
>  create mode 100644 
> arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
>  create mode 100644 
> arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
>  create mode 100644 
> arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
>  create mode 100644 
> arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b5a18d3dbb9f..5aa28d6e39d4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2084,6 +2084,7 @@ M:	Lars Povlsen <lars.povlsen@microchip.com>
>  M:	Steen Hegelund <Steen.Hegelund@microchip.com>
>  M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for 
> non-subscribers)
> +F:	arch/arm64/boot/dts/microchip/
>  N:	sparx5
>  S:	Supported
> 
> diff --git a/arch/arm64/boot/dts/Makefile 
> b/arch/arm64/boot/dts/Makefile
> index f19b762c008d8..9680a7f20c307 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -17,6 +17,7 @@ subdir-y += intel
>  subdir-y += lg
>  subdir-y += marvell
>  subdir-y += mediatek
> +subdir-y += microchip
>  subdir-y += nvidia
>  subdir-y += qcom
>  subdir-y += realtek
> diff --git a/arch/arm64/boot/dts/microchip/Makefile
> b/arch/arm64/boot/dts/microchip/Makefile
> new file mode 100644
> index 0000000000000..c6e0313eea0f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
> +dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
> +dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
> diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi
> b/arch/arm64/boot/dts/microchip/sparx5.dtsi
> new file mode 100644
> index 0000000000000..3136b4369f507
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "microchip,sparx5";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +			};
> +		};
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";

Really? This is 2020, not 2012 any more. Surely a new platform
boots using PSCI, and not *this*.

> +			cpu-release-addr = <0x0 0x0000fff8>;
> +			next-level-cache = <&L2_0>;
> +		};
> +		cpu1: cpu@1 {
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x0000fff8>;
> +			next-level-cache = <&L2_0>;
> +		};
> +		L2_0: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts =
> +			<GIC_PPI 13
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			<GIC_PPI 14
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			<GIC_PPI 11
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			<GIC_PPI 10
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;

You have a GICv3. These interrupt specifiers are not the ones GICv3 
expects.

> +	};
> +
> +	clocks: clocks {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +		ahb_clk: ahb-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <250000000>;
> +		};
> +		sys_clk: sys-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <625000000>;
> +		};
> +	};
> +
> +	axi: axi@600000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gic: interrupt-controller@600300000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-controller;
> +			reg = <0x6 0x00300000 0x20000>,	/* GICD */
> +			      <0x6 0x00340000 0x1000000>;	/* GICR */

You are missing the GICv3 compatibility interfaces (GICV/GICH), which
are implemented by the CPUs.

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		uart0: serial@600100000 {
> +			compatible = "ns16550a";
> +			reg = <0x6 0x00100000 0x20>;
> +			clocks = <&ahb_clk>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@600102000 {
> +			compatible = "ns16550a";
> +			reg = <0x6 0x00102000 0x20>;
> +			clocks = <&ahb_clk>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		timer1: timer@600105000 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x6 0x00105000 0x1000>;
> +			clocks = <&ahb_clk>;
> +			clock-names = "timer";
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +	};
> +};

Where is the PMU node?

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?
