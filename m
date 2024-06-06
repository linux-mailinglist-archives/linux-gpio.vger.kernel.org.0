Return-Path: <linux-gpio+bounces-7232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6868FE3CE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 12:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F268E1F21685
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE0318F2E4;
	Thu,  6 Jun 2024 10:08:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5017D36B;
	Thu,  6 Jun 2024 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717668520; cv=none; b=e9VIKk87wXuSU7BuTbfVPzp+BxPAJnWY0hCD9zvV6a0Bq/FGv28pFEOIjNEPzuJz3Bb/SX8ZDyXXnXTxMxtUgD3cXL+NMlgeCkLWsNftEAcKy028p75pgcmXR6caag9m7yWTiLV+zeljj0LHtIkaxyEiWHzJT3D5JqtWL0vk6Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717668520; c=relaxed/simple;
	bh=O4Hl1CJ9U+tfQkDb3eVAbFT3e6iHQs+MpqFGSGK4EgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIuVqsSktVHt3ByYAIeeVDzoRMjyyaIgIvuc05vYPBDgrHO+VKRZDGtdPOFqjA/Jr8dJ4xfML5rxfxTVc1YHkT1mFlXxhnKUaNw7SV0dfNdtA+EuyC9sSRuYER0sqvfXzogiUUhJ5Q6ctfGiTMN9oAtXv9ahu77zZTEjCzn87p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFA2t-0007q0-Lu; Thu, 06 Jun 2024 12:08:35 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject: Re: [PATCH 1/3] pinctrl: rockchip: fix RK3328 pinmux bits
Date: Thu, 06 Jun 2024 12:08:34 +0200
Message-ID: <3862456.FjKLVJYuhi@diego>
In-Reply-To: <20240606060435.765716-2-i@mail.eh5.me>
References:
 <20240606060435.765716-1-i@eh5.me> <20240606060435.765716-2-i@mail.eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Donnerstag, 6. Juni 2024, 08:04:33 CEST schrieb Huang-Huang Bao:
> The pinmux bits for GPIO2-B0 to GPIO2-B6 actually have 2 bits width,
> correct the bank flag for GPIO2-B. The pinmux bits for GPIO2-B7 is
> recalculated so it remain unchanged.

I've verified the gpio2-related pin settings via the TRM, so this part
looks good :-)


> The pinmux bits for GPIO3-B1 to GPIO3-B6 have different register offset
> than common rockhip pinmux, set the correct value for those pins in
> rk3328_mux_recalced_data.
> 
> The pinmux bits for those pins are not explicitly specified in RK3328
> TRM, however we can get hint from pad name and its correspinding IOMUX
> setting for pins in interface descriptions, e.g.
> IO_SPIclkm0_GPIO2B0vccio5 with GRF_GPIO2B_IOMUX[1:0]=2'b01 setting.
> 
> This fix has been tested on NanoPi R2S for fixing confliting pinmux bits
> between GPIO2-15 with GPIO2-13.

As you said, the gpio3-based pins are not documented in the TRM,
but in your description above you're talking about pins in the gpio2-
group?

So where did the gpio3-related pin information come from?

Also, could you please split this patch in two pieces, one fixing the
gpio2-area and one for the new gpio3 pins please?


Thanks
Heiko

> Signed-off-by: Huang-Huang Bao <i@eh5.me>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 59 ++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 3bedf36a0019..23531ea0d088 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -634,23 +634,68 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
>  
>  static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
>  	{
> -		.num = 2,
> -		.pin = 12,
> -		.reg = 0x24,
> -		.bit = 8,
> -		.mask = 0x3
> -	}, {
> +		/* gpio2_b7_sel */
>  		.num = 2,
>  		.pin = 15,
>  		.reg = 0x28,
>  		.bit = 0,
>  		.mask = 0x7
>  	}, {
> +		/* gpio2_c7_sel */
>  		.num = 2,
>  		.pin = 23,
>  		.reg = 0x30,
>  		.bit = 14,
>  		.mask = 0x3
> +	}, {
> +		/* gpio3_b1_sel */
> +		.num = 3,
> +		.pin = 9,
> +		.reg = 0x44,
> +		.bit = 2,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b2_sel */
> +		.num = 3,
> +		.pin = 10,
> +		.reg = 0x44,
> +		.bit = 4,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b3_sel */
> +		.num = 3,
> +		.pin = 11,
> +		.reg = 0x44,
> +		.bit = 6,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b4_sel */
> +		.num = 3,
> +		.pin = 12,
> +		.reg = 0x44,
> +		.bit = 8,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b5_sel */
> +		.num = 3,
> +		.pin = 13,
> +		.reg = 0x44,
> +		.bit = 10,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b6_sel */
> +		.num = 3,
> +		.pin = 14,
> +		.reg = 0x44,
> +		.bit = 12,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b7_sel */
> +		.num = 3,
> +		.pin = 15,
> +		.reg = 0x44,
> +		.bit = 14,
> +		.mask = 0x3
>  	},
>  };
>  
> @@ -3763,7 +3808,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
>  	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
>  	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
>  	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
> -			     IOMUX_WIDTH_3BIT,
> +			     0,
>  			     IOMUX_WIDTH_3BIT,
>  			     0),
>  	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
> 





