Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A638D3D90E3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235530AbhG1OqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:46:23 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50628 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235521AbhG1OqW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:46:22 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8kp8-0006C1-2O; Wed, 28 Jul 2021 16:46:18 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: add rk3568 tsadc nodes
Date:   Wed, 28 Jul 2021 16:46:17 +0200
Message-ID: <8410057.NyiUUSuA9g@diego>
In-Reply-To: <20210728135534.703028-6-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-6-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mittwoch, 28. Juli 2021, 15:55:30 CEST schrieb Peter Geis:
> Add the thermal and tsadc nodes to the rk3568 device tree.
> There are two sensors, one for the cpu, one for the gpu.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     |  6 ++
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 71 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> index a588ca95ace2..b464c7bda1f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> @@ -2420,6 +2420,12 @@ spi3m1_cs1: spi3m1-cs1 {
>  	};
>  
>  	tsadc {
> +		/omit-if-no-ref/
> +		tsadc_gpio: tsadc-gpio {
> +			rockchip,pins =
> +				<0 RK_PA1 0 &pcfg_pull_none>;
> +		};
> +
>  		/omit-if-no-ref/
>  		tsadcm0_shut: tsadcm0-shut {
>  			rockchip,pins =
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 77c679304916..0905fac0726a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -51,6 +51,7 @@ cpu0: cpu@0 {
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x0>;
>  			clocks = <&scmi_clk 0>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -59,6 +60,7 @@ cpu1: cpu@100 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x100>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -67,6 +69,7 @@ cpu2: cpu@200 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x200>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -75,6 +78,7 @@ cpu3: cpu@300 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a55";
>  			reg = <0x0 0x300>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			operating-points-v2 = <&cpu0_opp_table>;
>  		};
> @@ -774,6 +778,73 @@ uart9: serial@fe6d0000 {
>  		status = "disabled";
>  	};
>  
> +	thermal_zones: thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsadc 0>;
> +
> +			trips {
> +				cpu_alert0: cpu_alert0 {
> +					temperature = <70000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu_alert1: cpu_alert1 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu_crit: cpu_crit {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert0>;
> +					cooling-device =
> +						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		gpu_thermal: gpu-thermal {
> +			polling-delay-passive = <20>; /* milliseconds */
> +			polling-delay = <1000>; /* milliseconds */
> +
> +			thermal-sensors = <&tsadc 1>;
> +		};
> +	};
> +
> +	tsadc: tsadc@fe710000 {
> +		compatible = "rockchip,rk3568-tsadc";
> +		reg = <0x0 0xfe710000 0x0 0x100>;
> +		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +		assigned-clocks = <&cru CLK_TSADC_TSEN>, <&cru CLK_TSADC>;
> +		assigned-clock-rates = <17000000>, <700000>;
> +		clocks = <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
> +		clock-names = "tsadc", "apb_pclk";
> +		resets = <&cru SRST_TSADC>, <&cru SRST_P_TSADC>,
> +			 <&cru SRST_TSADCPHY>;
> +		reset-names = "tsadc", "tsadc-apb", "tsadc-phy";
> +		rockchip,grf = <&grf>;
> +		rockchip,hw-tshut-temp = <95000>;
> +		rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> +		rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
> +		pinctrl-names = "gpio", "otpout";
> +		pinctrl-0 = <&tsadc_gpio>;
> +		pinctrl-1 = <&tsadc_shutorg>;

The mainline thermal driver doesn't specify these pinctrl states at all.

Heiko

> +		#thermal-sensor-cells = <1>;
> +		status = "disabled";
> +	};
> +
>  	saradc: saradc@fe720000 {
>  		compatible = "rockchip,rk3568-saradc", "rockchip,rk3399-saradc";
>  		reg = <0x0 0xfe720000 0x0 0x100>;
> 




