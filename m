Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10416275A76
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 16:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgIWOkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 10:40:45 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39268 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgIWOkm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 10:40:42 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 0D6AF3B2800;
        Wed, 23 Sep 2020 14:39:27 +0000 (UTC)
X-Originating-IP: 90.65.92.90
Received: from localhost (lfbn-lyo-1-1913-90.w90-65.abo.wanadoo.fr [90.65.92.90])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DB6D0FF80F;
        Wed, 23 Sep 2020 14:39:02 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 14/15] ARM: dts: armada: align GPIO hog names with dtschema
In-Reply-To: <20200916155715.21009-15-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org> <20200916155715.21009-15-krzk@kernel.org>
Date:   Wed, 23 Sep 2020 16:39:02 +0200
Message-ID: <87a6xgimm1.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.


Applied on mvebu/dt

Thanks,

Gregory

>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/armada-388-clearfog.dts  |  4 ++--
>  arch/arm/boot/dts/armada-388-clearfog.dtsi | 10 +++++-----
>  arch/arm/boot/dts/armada-388-helios4.dts   |  6 +++---
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
> index 20f8d4667753..4140a5303b48 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dts
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dts
> @@ -73,13 +73,13 @@
>  	 * 14-SFP_TX_DISABLE
>  	 * 15-SFP_MOD_DEF0
>  	 */
> -	pcie2_0_clkreq {
> +	pcie2-0-clkreq-hog {
>  		gpio-hog;
>  		gpios = <4 GPIO_ACTIVE_LOW>;
>  		input;
>  		line-name = "pcie2.0-clkreq";
>  	};
> -	pcie2_0_w_disable {
> +	pcie2-0-w-disable-hog {
>  		gpio-hog;
>  		gpios = <7 GPIO_ACTIVE_LOW>;
>  		output-low;
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
> index a0aa1d188f0c..f8a06ae4a3c9 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
> @@ -141,31 +141,31 @@
>  		#gpio-cells = <2>;
>  		reg = <0x20>;
>  
> -		pcie1_0_clkreq {
> +		pcie1-0-clkreq-hog {
>  			gpio-hog;
>  			gpios = <0 GPIO_ACTIVE_LOW>;
>  			input;
>  			line-name = "pcie1.0-clkreq";
>  		};
> -		pcie1_0_w_disable {
> +		pcie1-0-w-disable-hog {
>  			gpio-hog;
>  			gpios = <3 GPIO_ACTIVE_LOW>;
>  			output-low;
>  			line-name = "pcie1.0-w-disable";
>  		};
> -		usb3_ilimit {
> +		usb3-ilimit-hog {
>  			gpio-hog;
>  			gpios = <5 GPIO_ACTIVE_LOW>;
>  			input;
>  			line-name = "usb3-current-limit";
>  		};
> -		usb3_power {
> +		usb3-power-hog {
>  			gpio-hog;
>  			gpios = <6 GPIO_ACTIVE_HIGH>;
>  			output-high;
>  			line-name = "usb3-power";
>  		};
> -		m2_devslp {
> +		m2-devslp-hog {
>  			gpio-hog;
>  			gpios = <11 GPIO_ACTIVE_HIGH>;
>  			output-low;
> diff --git a/arch/arm/boot/dts/armada-388-helios4.dts b/arch/arm/boot/dts/armada-388-helios4.dts
> index fb49df2a3bce..b3728de3bd3f 100644
> --- a/arch/arm/boot/dts/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/armada-388-helios4.dts
> @@ -166,19 +166,19 @@
>  					interrupt-controller;
>  					#interrupt-cells = <2>;
>  
> -					board_rev_bit_0 {
> +					board-rev-bit-0-hog {
>  						gpio-hog;
>  						gpios = <0 GPIO_ACTIVE_LOW>;
>  						input;
>  						line-name = "board-rev-0";
>  					};
> -					board_rev_bit_1 {
> +					board-rev-bit-1-hog {
>  						gpio-hog;
>  						gpios = <1 GPIO_ACTIVE_LOW>;
>  						input;
>  						line-name = "board-rev-1";
>  					};
> -					usb3_ilimit {
> +					usb3-ilimit-hog {
>  						gpio-hog;
>  						gpios = <5 GPIO_ACTIVE_HIGH>;
>  						input;
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
