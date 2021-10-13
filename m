Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E34E42CEF4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhJMXJj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:09:39 -0400
Received: from gloria.sntech.de ([185.11.138.130]:49818 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhJMXJi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Oct 2021 19:09:38 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1manLN-0007nY-N9; Thu, 14 Oct 2021 01:07:29 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: change gpio nodenames
Date:   Thu, 14 Oct 2021 01:07:29 +0200
Message-ID: <8500866.vLymJHTRYH@diego>
In-Reply-To: <20211007144019.7461-3-jbx6244@gmail.com>
References: <20211007144019.7461-1-jbx6244@gmail.com> <20211007144019.7461-3-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Donnerstag, 7. Oktober 2021, 16:40:19 CEST schrieb Johan Jonker:
> Currently all gpio nodenames are sort of identical to there label.
> Nodenames should be of a generic type, so change them all.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi   |  8 ++++----
>  arch/arm64/boot/dts/rockchip/rk3308.dtsi | 10 +++++-----
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi |  8 ++++----
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi |  8 ++++----
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 +++++-----
>  5 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 64f643145..17a64c3f0 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1297,7 +1297,7 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> -		gpio0: gpio0@ff040000 {
> +		gpio0: gpio@ff040000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff040000 0x0 0x100>;
>  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1309,7 +1309,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio1: gpio1@ff250000 {
> +		gpio1: gpio@ff250000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff250000 0x0 0x100>;
>  			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1321,7 +1321,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio2: gpio2@ff260000 {
> +		gpio2: gpio@ff260000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff260000 0x0 0x100>;
>  			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1333,7 +1333,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio3: gpio3@ff270000 {
> +		gpio3: gpio@ff270000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff270000 0x0 0x100>;
>  			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> index ce6f4a28d..cec6d179b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> @@ -790,7 +790,7 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> -		gpio0: gpio0@ff220000 {
> +		gpio0: gpio@ff220000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff220000 0x0 0x100>;
>  			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> @@ -801,7 +801,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio1: gpio1@ff230000 {
> +		gpio1: gpio@ff230000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff230000 0x0 0x100>;
>  			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> @@ -812,7 +812,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio2: gpio2@ff240000 {
> +		gpio2: gpio@ff240000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff240000 0x0 0x100>;
>  			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> @@ -823,7 +823,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio3: gpio3@ff250000 {
> +		gpio3: gpio@ff250000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff250000 0x0 0x100>;
>  			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> @@ -834,7 +834,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio4: gpio4@ff260000 {
> +		gpio4: gpio@ff260000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff260000 0x0 0x100>;
>  			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index 5b2020590..6edb1a537 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -1014,7 +1014,7 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> -		gpio0: gpio0@ff210000 {
> +		gpio0: gpio@ff210000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff210000 0x0 0x100>;
>  			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1027,7 +1027,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio1: gpio1@ff220000 {
> +		gpio1: gpio@ff220000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff220000 0x0 0x100>;
>  			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1040,7 +1040,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio2: gpio2@ff230000 {
> +		gpio2: gpio@ff230000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff230000 0x0 0x100>;
>  			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1053,7 +1053,7 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		gpio3: gpio3@ff240000 {
> +		gpio3: gpio@ff240000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff240000 0x0 0x100>;
>  			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> index 4217897cd..ef6847014 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -797,7 +797,7 @@
>  		#size-cells = <0x2>;
>  		ranges;
>  
> -		gpio0: gpio0@ff750000 {
> +		gpio0: gpio@ff750000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff750000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO0>;
> @@ -810,7 +810,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio1: gpio1@ff780000 {
> +		gpio1: gpio@ff780000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff780000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO1>;
> @@ -823,7 +823,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio2: gpio2@ff790000 {
> +		gpio2: gpio@ff790000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff790000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO2>;
> @@ -836,7 +836,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio3: gpio3@ff7a0000 {
> +		gpio3: gpio@ff7a0000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff7a0000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO3>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 44def886b..577c02047 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1978,7 +1978,7 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> -		gpio0: gpio0@ff720000 {
> +		gpio0: gpio@ff720000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff720000 0x0 0x100>;
>  			clocks = <&pmucru PCLK_GPIO0_PMU>;
> @@ -1991,7 +1991,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio1: gpio1@ff730000 {
> +		gpio1: gpio@ff730000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff730000 0x0 0x100>;
>  			clocks = <&pmucru PCLK_GPIO1_PMU>;
> @@ -2004,7 +2004,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio2: gpio2@ff780000 {
> +		gpio2: gpio@ff780000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff780000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO2>;
> @@ -2017,7 +2017,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio3: gpio3@ff788000 {
> +		gpio3: gpio@ff788000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff788000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO3>;
> @@ -2030,7 +2030,7 @@
>  			#interrupt-cells = <0x2>;
>  		};
>  
> -		gpio4: gpio4@ff790000 {
> +		gpio4: gpio@ff790000 {
>  			compatible = "rockchip,gpio-bank";
>  			reg = <0x0 0xff790000 0x0 0x100>;
>  			clocks = <&cru PCLK_GPIO4>;
> 




