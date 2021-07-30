Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EFD3DBD50
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 18:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhG3QvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 12:51:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhG3Qu6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 12:50:58 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59F1360E09;
        Fri, 30 Jul 2021 16:50:53 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1m9Vil-0023AS-Ha; Fri, 30 Jul 2021 17:50:51 +0100
MIME-Version: 1.0
Date:   Fri, 30 Jul 2021 17:50:51 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
In-Reply-To: <20210730144922.29111-13-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: semen.protsenko@linaro.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, krzysztof.kozlowski@canonical.com, linus.walleij@linaro.org, tomasz.figa@gmail.com, robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com, jirislaby@kernel.org, gregkh@linuxfoundation.org, ckeepax@opensource.wolfsonmicro.com, ryu.real@samsung.com, tom.gall@linaro.org, sumit.semwal@linaro.org, john.stultz@linaro.org, amit.pundir@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-07-30 15:49, Sam Protsenko wrote:
> Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
> 
> Features:
>  * CPU: Cortex-A55 Octa (8 cores), up to 2 GHz
>  * Memory interface: LPDDR4/4x 2 channels (12.8 GB/s)
>  * SD/MMC: SD 3.0, eMMC5.1 DDR 8-bit
>  * Modem: 4G LTE, 3G, GSM/GPRS/EDGE
>  * RF: Quad GNSS, WiFi 5 (802.11ac), Bluetooth 5.0
>  * GPU: Mali-G52 MP1
>  * Codec: 1080p 60fps H64, HEVC, JPEG HW Codec
>  * Display: Full HD+ (2520x1080)@60fps LCD
>  * Camera: 16+5MP/13+8MP ISP, MIPI CSI 4/4/2, FD, DRC
>  * Connectivity: USB 2.0 DRD, USI (SPI/UART/I2C), HSI2C, I3C, ADC, 
> Audio
> 
> This patch adds minimal SoC support. Particular board device tree files
> can include exynos850.dtsi file to get SoC related nodes, and then
> reference those nodes further as needed.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>  3 files changed, 1057 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> new file mode 100644
> index 000000000000..4cf0a22cc6db

[...]

> +	gic: interrupt-controller@12a00000 {
> +		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";

One thing for sure, it cannot be both. And given that it is
an A55-based SoC, it isn't either. It is more likely a GIC400.

> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +		interrupt-controller;
> +		reg = <0x0 0x12a01000 0x1000>,
> +		      <0x0 0x12a02000 0x1000>,

This is wrong. It is architecturally set to 8kB.

> +		      <0x0 0x12a04000 0x2000>,
> +		      <0x0 0x12a06000 0x2000>;
> +		interrupts = <GIC_PPI 9
> +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

4? With 8 CPUs?

I also find it curious that you went through the unusual
(and IMO confusing) effort to allocate a name to each and
every SPI in the system, but didn't do it for any on the PPIs...


> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <26000000>;

No, please. Fix the firmware to program CNTFRQ_EL0 on each
and every CPU. This isn't 2012 anymore.

You are also missing the hypervisor virtual timer interrupt.

> +		use-clocksource-only;
> +		use-physical-timer;

Thankfully, these two properties do not exist.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
