Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29112E93C4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 11:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhADKzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 05:55:31 -0500
Received: from foss.arm.com ([217.140.110.172]:58888 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbhADKzb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Jan 2021 05:55:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07EDDED1;
        Mon,  4 Jan 2021 02:54:45 -0800 (PST)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DA843F70D;
        Mon,  4 Jan 2021 02:54:43 -0800 (PST)
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC
 connection
To:     Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20210103100007.32867-1-samuel@sholland.org>
 <20210103100007.32867-5-samuel@sholland.org>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com>
Date:   Mon, 4 Jan 2021 10:54:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210103100007.32867-5-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/01/2021 10:00, Samuel Holland wrote:
> On boards where the only peripheral connected to PL0/PL1 is an X-Powers
> PMIC, configure the connection to use the RSB bus rather than the I2C
> bus. Compared to the I2C controller that shares the pins, the RSB
> controller allows a higher bus frequency, and it is more CPU-efficient.

But is it really necessary to change the DTs for those boards in this
way? It means those newer DTs now become incompatible with older
kernels, and I don't know if those reasons above really justify this.

I understand that we officially don't care about "newer DTs on older
kernels", but do we really need to break this deliberately, for no
pressing reasons?

Cheers,
Andre

P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
just want to avoid breaking existing ones.

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
>  3 files changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> index 7c9dbde645b5..3452add30cc4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> @@ -150,12 +150,28 @@ &pio {
>  	vcc-pg-supply = <&reg_aldo1>;
>  };
>  
> -&r_i2c {
> +&r_ir {
> +	linux,rc-map-name = "rc-beelink-gs1";
> +	status = "okay";
> +};
> +
> +&r_pio {
> +	/*
> +	 * FIXME: We can't add that supply for now since it would
> +	 * create a circular dependency between pinctrl, the regulator
> +	 * and the RSB Bus.
> +	 *
> +	 * vcc-pl-supply = <&reg_aldo1>;
> +	 */
> +	vcc-pm-supply = <&reg_aldo1>;
> +};
> +
> +&r_rsb {
>  	status = "okay";
>  
> -	axp805: pmic@36 {
> +	axp805: pmic@745 {
>  		compatible = "x-powers,axp805", "x-powers,axp806";
> -		reg = <0x36>;
> +		reg = <0x745>;
>  		interrupt-parent = <&r_intc>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
> @@ -273,22 +289,6 @@ sw {
>  	};
>  };
>  
> -&r_ir {
> -	linux,rc-map-name = "rc-beelink-gs1";
> -	status = "okay";
> -};
> -
> -&r_pio {
> -	/*
> -	 * PL0 and PL1 are used for PMIC I2C
> -	 * don't enable the pl-supply else
> -	 * it will fail at boot
> -	 *
> -	 * vcc-pl-supply = <&reg_aldo1>;
> -	 */
> -	vcc-pm-supply = <&reg_aldo1>;
> -};
> -
>  &rtc {
>  	clocks = <&ext_osc32k>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index 15c9dd8c4479..16702293ac0b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -175,12 +175,16 @@ &pio {
>  	vcc-pg-supply = <&reg_vcc_wifi_io>;
>  };
>  
> -&r_i2c {
> +&r_ir {
> +	status = "okay";
> +};
> +
> +&r_rsb {
>  	status = "okay";
>  
> -	axp805: pmic@36 {
> +	axp805: pmic@745 {
>  		compatible = "x-powers,axp805", "x-powers,axp806";
> -		reg = <0x36>;
> +		reg = <0x745>;
>  		interrupt-parent = <&r_intc>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
> @@ -291,10 +295,6 @@ sw {
>  	};
>  };
>  
> -&r_ir {
> -	status = "okay";
> -};
> -
>  &rtc {
>  	clocks = <&ext_osc32k>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index ebc120a9232f..23e3cb2ffd8d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -112,12 +112,20 @@ &pio {
>  	vcc-pg-supply = <&reg_aldo1>;
>  };
>  
> -&r_i2c {
> +&r_ir {
> +	status = "okay";
> +};
> +
> +&r_pio {
> +	vcc-pm-supply = <&reg_bldo3>;
> +};
> +
> +&r_rsb {
>  	status = "okay";
>  
> -	axp805: pmic@36 {
> +	axp805: pmic@745 {
>  		compatible = "x-powers,axp805", "x-powers,axp806";
> -		reg = <0x36>;
> +		reg = <0x745>;
>  		interrupt-parent = <&r_intc>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
> @@ -232,14 +240,6 @@ sw {
>  	};
>  };
>  
> -&r_ir {
> -	status = "okay";
> -};
> -
> -&r_pio {
> -	vcc-pm-supply = <&reg_bldo3>;
> -};
> -
>  &rtc {
>  	clocks = <&ext_osc32k>;
>  };
> 

