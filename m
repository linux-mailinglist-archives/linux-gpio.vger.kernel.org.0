Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFDF419475
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 14:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhI0Mm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 08:42:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234333AbhI0Mm5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Sep 2021 08:42:57 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C64260F46;
        Mon, 27 Sep 2021 12:41:19 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mUpwb-00DF4m-GL; Mon, 27 Sep 2021 13:41:17 +0100
MIME-Version: 1.0
Date:   Mon, 27 Sep 2021 13:41:17 +0100
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
Subject: Re: [v3,8/9] arm64: dts: mediatek: add mt7986a support
In-Reply-To: <20210924112017.14107-1-sam.shih@mediatek.com>
References: <016b501b-a4bf-c74d-9f7f-8145800ca6e0@gmail.com>
 <20210924112017.14107-1-sam.shih@mediatek.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0459da08cddc579f069a28e659e614fd@kernel.org>
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

On 2021-09-24 12:20, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986a, include
> uart nodes with correct clocks, rng node with correct clock,
> and watchdog node and mt7986a pinctrl node.
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
> v3: used the stdout-path instead of console=ttyS0
> v2: modified clock and uart node due to clock driver updated
> ---
>  arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  54 +++++
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 227 +++++++++++++++++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		clock-frequency = <13000000>;

No. Please fix your firmware to program CNTFRQ_EL0 on all CPUs.
This may have been OK in 2011, but not anymore.

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
> +			reg = <0 0x0c000000 0 0x40000>,
> +			      <0 0x0c080000 0 0x200000>;

This looks wrong. 128kB per redistributor frames and 4 CPUs do
no result in 2MB worth of MMIO.

This is also missing the GICV/GICV/GICH regions that are exposed
by the CPUs directly.

         M.
-- 
Jazz is not dead. It just smells funny...
