Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5B43D9018
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236440AbhG1OJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:09:03 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50184 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235464AbhG1OJD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:09:03 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8kEz-0005xo-Uz; Wed, 28 Jul 2021 16:08:57 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: rockchip: adjust rk3568 pll clocks
Date:   Wed, 28 Jul 2021 16:08:57 +0200
Message-ID: <3555961.44csPzL39Z@diego>
In-Reply-To: <20210728135534.703028-8-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-8-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

Am Mittwoch, 28. Juli 2021, 15:55:32 CEST schrieb Peter Geis:
> The rk3568 gpll should run at 1200mhz and the ppll should run at 200mhz.
> These are set incorrectly by the bootloader, so fix them here.

Can you specify where the "should run at" comes from?
Normally I'd assume setting desired PLL frequencies would be quite
board-specific.

So if we're setting defaults for all boards, I'd like some reasoning
behind that ;-) ... especially when the other option would be to
fix the bootloader.

Thanks
Heiko

> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 8ba0516eedd8..91ae3c541c1a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -230,6 +230,8 @@ cru: clock-controller@fdd20000 {
>  		rockchip,grf = <&grf>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> +		assigned-clocks = <&cru PLL_GPLL>, <&pmucru PLL_PPLL>;
> +		assigned-clock-rates = <1200000000>, <200000000>;
>  	};
>  
>  	i2c0: i2c@fdd40000 {
> 




