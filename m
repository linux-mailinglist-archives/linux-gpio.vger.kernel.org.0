Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A763D900F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbhG1OGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:06:36 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50104 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233439AbhG1OGg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:06:36 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8kCc-0005wH-22; Wed, 28 Jul 2021 16:06:30 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: rockchip: add missing rk3568 cru phandles
Date:   Wed, 28 Jul 2021 16:06:29 +0200
Message-ID: <13247009.uLZWGnKmhe@diego>
In-Reply-To: <20210728135534.703028-7-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-7-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

Am Mittwoch, 28. Juli 2021, 15:55:31 CEST schrieb Peter Geis:
> The grf and pmugrf phandles are necessary for the pmucru and cru to
> modify clocks. Add these phandles to permit adjusting the clock rates
> and muxes.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 0905fac0726a..8ba0516eedd8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -218,6 +218,8 @@ grf: syscon@fdc60000 {
>  	pmucru: clock-controller@fdd00000 {
>  		compatible = "rockchip,rk3568-pmucru";
>  		reg = <0x0 0xfdd00000 0x0 0x1000>;
> +		rockchip,grf = <&grf>;
> +		rockchip,pmugrf = <&pmugrf>;

I don't think the pmucru needs both and in fact the mainline
clock driver should just reference its specific grf at all, i.e.
	pmucru -> pmugrf (via the rockchip,grf handle)
	cru -> grf

I've not seen anything breaking this scope so far.


Heiko

>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  	};
> @@ -225,6 +227,7 @@ pmucru: clock-controller@fdd00000 {
>  	cru: clock-controller@fdd20000 {
>  		compatible = "rockchip,rk3568-cru";
>  		reg = <0x0 0xfdd20000 0x0 0x1000>;
> +		rockchip,grf = <&grf>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  	};
> 




