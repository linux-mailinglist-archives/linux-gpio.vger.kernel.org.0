Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F219B38D821
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 03:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhEWB4O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 May 2021 21:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhEWB4N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 May 2021 21:56:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F9FC061574;
        Sat, 22 May 2021 18:54:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 528CC2A8;
        Sun, 23 May 2021 03:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621734886;
        bh=mt3BmzUkkbwAPZo+48A+5jvHoVbrmN5gMsI38J8dHV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U/On/TWJfqmFyqVqOMGAx+BSRHee3oIo5evarL0Iv9THZXKXvHozfyKHiwk0EKOLi
         k0bR1R5k8DyGDrszw7fOGMBAKIJNsCym3XU3z2I4BdT7WmiVrujY56Aqaohj86jiP6
         OXovOQAs24Pzd0SXupXOrCvBcvuPs0Qz2W7jgCYI=
Date:   Sun, 23 May 2021 04:54:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: dts: dra7x-evm: Align GPIO hog names with
 dt-schema
Message-ID: <YKm146xfBZHXXV7N@pendragon.ideasonboard.com>
References: <cover.1621583562.git.geert+renesas@glider.be>
 <e8350ea542c92465020f03481d76943168df2935.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e8350ea542c92465020f03481d76943168df2935.1621583562.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Fri, May 21, 2021 at 09:54:06AM +0200, Geert Uytterhoeven wrote:
> The dt-schema for nxp,pcf8575 expects GPIO hogs node names to end with a
> 'hog' suffix.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/dra7-evm.dts          | 2 +-
>  arch/arm/boot/dts/dra71-evm.dts         | 2 +-
>  arch/arm/boot/dts/dra72-evm-common.dtsi | 2 +-
>  arch/arm/boot/dts/dra76-evm.dts         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
> index 38530dbb89a00b7c..3dcb6e1f49bcf1f0 100644
> --- a/arch/arm/boot/dts/dra7-evm.dts
> +++ b/arch/arm/boot/dts/dra7-evm.dts
> @@ -366,7 +366,7 @@ pcf_hdmi: gpio@26 {
>  		reg = <0x26>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
> -		p1 {
> +		hdmi-audio-hog {
>  			/* vin6_sel_s0: high: VIN6, low: audio */
>  			gpio-hog;
>  			gpios = <1 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
> index 6d2cca6b44883e59..a64364443031525b 100644
> --- a/arch/arm/boot/dts/dra71-evm.dts
> +++ b/arch/arm/boot/dts/dra71-evm.dts
> @@ -187,7 +187,7 @@ &pcf_gpio_21 {
>  };
>  
>  &pcf_hdmi {
> -	p0 {
> +	hdmi-i2c-disable-hog {
>  		/*
>  		 * PM_OEn to High: Disable routing I2C3 to PM_I2C
>  		 * With this PM_SEL(p3) should not matter
> diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> index b65b2dd094d0ff57..f2384277d5dcdc5c 100644
> --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> @@ -268,7 +268,7 @@ pcf_hdmi: pcf8575@26 {
>  		 */
>  		lines-initial-states = <0x0f2b>;
>  
> -		p1 {
> +		hdmi-audio-hog {
>  			/* vin6_sel_s0: high: VIN6, low: audio */
>  			gpio-hog;
>  			gpios = <1 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
> index 9bd01ae40b1d1fbb..df47ea59c9c404c2 100644
> --- a/arch/arm/boot/dts/dra76-evm.dts
> +++ b/arch/arm/boot/dts/dra76-evm.dts
> @@ -381,7 +381,7 @@ pcf_hdmi: pcf8575@26 {
>  		reg = <0x26>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
> -		p1 {
> +		hdmi-audio-hog {
>  			/* vin6_sel_s0: high: VIN6, low: audio */
>  			gpio-hog;
>  			gpios = <1 GPIO_ACTIVE_HIGH>;

-- 
Regards,

Laurent Pinchart
