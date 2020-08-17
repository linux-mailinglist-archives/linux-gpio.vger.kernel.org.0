Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830292461B1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 11:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgHQJAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 05:00:52 -0400
Received: from disco-boy.misterjones.org ([51.254.78.96]:50816 "EHLO
        disco-boy.misterjones.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgHQJAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 05:00:51 -0400
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@misterjones.org>)
        id 1k7b0X-003VQu-GQ; Mon, 17 Aug 2020 10:00:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 17 Aug 2020 10:00:45 +0100
From:   Marc Zyngier <maz@misterjones.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, linux-gpio@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] arm64: dts: visconti: Add device tree for TMPV7708 RM
 main board
In-Reply-To: <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <53f40628f3d05e3224978ddeb67613b0@misterjones.org>
X-Sender: maz@misterjones.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: nobuhiro1.iwamatsu@toshiba.co.jp, robh+dt@kernel.org, linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, punit1.agrawal@toshiba.co.jp, linux-gpio@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-08-17 02:46, Nobuhiro Iwamatsu wrote:
> Add basic support for the Visconti TMPV7708 SoC peripherals -
>   - CPU
>     - CA53 x 4 and 2 cluster.
>     - not support PSCI, currently only spin-table is supported.

We have pushed back on other SoCs in the past when they didn't
implement PSCI. There really is not good reason not to have
even the most trivial PSCI implementation these days.

>   - Interrupt controller (ARM Generic Interrupt Controller)
>   - Timer (ARM architected timer)
>   - UART (ARM PL011 UART controller)
>   - SPI (ARM PL022 SPI controller)
>   - I2C (Synopsys DesignWare APB I2C Controller)
>   - Pin control (Visconti specific)
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/toshiba/Makefile          |   2 +
>  .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  44 ++
>  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 390 ++++++++++++++++++
>  .../arm64/boot/dts/toshiba/tmpv7708_pins.dtsi |  93 +++++
>  5 files changed, 530 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
>  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
>  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
>  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> 

[...]

> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> new file mode 100644
> index 000000000000..a883d3ab1858
> --- /dev/null
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree File for TMPV7708 RM main board
> + *
> + * (C) Copyright 2020, Toshiba Corporation.
> + * (C) Copyright 2020, Nobuhiro Iwamatsu 
> <nobuhiro1.iwamatsu@toshiba.co.jp>
> + */
> +
> +/dts-v1/;
> +
> +#include "tmpv7708.dtsi"
> +
> +/ {
> +	model = "Toshiba TMPV7708 RM main board";
> +	compatible = "toshiba,tmpv7708-rm-mbrc", "toshiba,tmpv7708";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +	};
> +
> +	chosen {
> +		bootargs = "earlycon=pl011,0x28200000";
> +		stdout-path = "serial0:115200n8";

These should be provided by the bootloader, and not hardcoded.

> +	};
> +
> +	/* 768MB memory */
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x30000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +	clocks = <&uart_clk>;
> +	clock-names = "apb_pclk";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	clocks = <&uart_clk>;
> +	clock-names = "apb_pclk";
> +};
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> new file mode 100644
> index 000000000000..f78ebb707aa4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> @@ -0,0 +1,390 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree Source for the TMPV7708
> + *
> + * (C) Copyright 2018 - 2020, Toshiba Corporation.
> + * (C) Copyright 2020, Nobuhiro Iwamatsu 
> <nobuhiro1.iwamatsu@toshiba.co.jp>
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/memreserve/ 0x81000000 0x00300000;	/* cpu-release-addr */
> +
> +/ {
> +	compatible = "toshiba,tmpv7708";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x00>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x01>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x02>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x03>;
> +		};
> +
> +		cpu4: cpu@100 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x100>;
> +		};
> +
> +		cpu5: cpu@101 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x101>;
> +		};
> +
> +		cpu6: cpu@102 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x102>;
> +		};
> +
> +		cpu7: cpu@103 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x81100000>;
> +			reg = <0x103>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		always-on;

That's unlikely to be true. A53 does have low-power modes that
will kill the comparator, and you will miss timer deadlines.
This property really only applies to virtual machines, which isn't
the case here.

> +		interrupts =
> +			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	uart_clk: uart-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <150000000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		ranges;
> +
> +		gic: interrupt-controller@24001000 {
> +			compatible = "arm,gic-400";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0 0x24001000 0 0x1000>,
> +			      <0 0x24002000 0 0x2000>,
> +			      <0 0x24004000 0 0x2000>,
> +			      <0 0x24006000 0 0x2000>;

You are missing the maintenance interrupt.

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?
