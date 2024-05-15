Return-Path: <linux-gpio+bounces-6405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8678C6B29
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 19:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDE1E284EDD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 17:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC0639863;
	Wed, 15 May 2024 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="l13p/AzF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08836AF2;
	Wed, 15 May 2024 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715792458; cv=none; b=gew5b/mjjc+z4bc3AnAzK/jJ7hFAyc8XQ7xmaV/ZnjdiBtjbX1m4tYwbRJkeC16ev7mwczArPBm/ZJIiLgDuXSMM0ZUnNNnF91tAQN1ZUqJeBPzuPOfoptw8zy54PCiAlZzh4l7AJF0sVQjZw5zO611v++Z1vfb5sNLUpwZPeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715792458; c=relaxed/simple;
	bh=XROEA3lTHts4wb7I2Uwge8OsoOt7tXaMz27MB6n/u6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyvrHPSPE1Q4KlV6WVbFhwVIRhcH/Atz/OQSqQP6IemDZIjfIZEKPOEnqGKQbGNfClZe/uU5xpYWcaDE01FHaQCz9kOEG/fTc6r+GKyn79MFD6CvFXjWaXHrElS//nDYAyKlS42kuIodqQ8dcVJifiL390WzAN7PuLl04bXtVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=l13p/AzF; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 7Hzes2damneGh7Hzes8m3C; Wed, 15 May 2024 19:00:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715792447;
	bh=uAPBiVpF/LesUtYKfiBkex5dpCAGm4bpcdCFjHILMPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=l13p/AzFVdQnSJBQg3ARSek/TirfLo9RIgL6Bf38BtaZl27yEu05RTS4kX39dVSob
	 XJ5Wy+Y0vKojkeQn3Lwu7KoA+DdteKq8UFv0qQiSvibo6ZfhzERIt0B1Pqh/VAE4T6
	 emfGYv39p/JQQN1wbHNHqyxVeVmu7D8kc6Zw5DOOaPj1l9g1AMBsfVebzhgHAl+w48
	 OnywulfPJCXH3t5iXOHpzVo7kehbl+DkzsDJwmx1c94E5qEh4WWhLsOVD62+GOXF4P
	 NKa593bnAzkhTwu7QIz7r33Fx5O5h6M41b/sErZqt3co5RHLs+2Egd511smBLJekvR
	 TcIglie92Rz8w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 May 2024 19:00:47 +0200
X-ME-IP: 86.243.17.157
Message-ID: <d2c0bc2b-91a1-4533-bd14-3973277b5f6f@wanadoo.fr>
Date: Wed, 15 May 2024 19:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add rk3308b SoC support
To: Dmitry Yashin <dmt.yashin@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
 <20240515121634.23945-4-dmt.yashin@gmail.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240515121634.23945-4-dmt.yashin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/05/2024 à 14:16, Dmitry Yashin a écrit :
> Add pinctrl support for rk3308b. This pin controller much the same as
> rk3308's, but with additional iomux routes and 3bit iomuxes selected
> via gpio##_sel_src_ctrl registers. Set them up in the function
> rk3308b_soc_sel_src_init to use new 3bit iomuxes over some 2bit old ones.
> 
> Fixes: 1f3e25a06883 ("pinctrl: rockchip: fix RK3308 pinmux bits")
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>   drivers/pinctrl/pinctrl-rockchip.c | 200 +++++++++++++++++++++++++++++
>   drivers/pinctrl/pinctrl-rockchip.h |   1 +
>   2 files changed, 201 insertions(+)

Hi,

> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index cc647db76927..15d2045f929e 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -632,6 +632,115 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
>   	},
>   };
>   
> +static struct rockchip_mux_recalced_data rk3308b_mux_recalced_data[] = {

It is likely that it would require some other changes, but it looks to 
be a good candidate for static const struct.

> +	{
> +		/* gpio1b6_sel */
> +		.num = 1,
> +		.pin = 14,
> +		.reg = 0x28,
> +		.bit = 12,
> +		.mask = 0xf
> +	}, {

...

> @@ -882,6 +991,35 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
>   	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
>   };
>   
> +static struct rockchip_mux_route_data rk3308b_mux_route_data[] = {

Same

> +	RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
> +	RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
> +	RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
> +	RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x608, BIT(16 + 8) | BIT(16 + 9)), /* i2c3_sdam0 */

...

> @@ -3746,6 +3929,21 @@ static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
>   		.schmitt_calc_reg	= rk3308_calc_schmitt_reg_and_bit,
>   };
>   
> +static struct rockchip_pin_ctrl rk3308b_pin_ctrl = {

This one could be constify without any other changes I think (and also 
makes more sense because of its function pointers)

Just my 2c.

CJ

> +		.pin_banks		= rk3308_pin_banks,
> +		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
> +		.label			= "RK3308b-GPIO",
> +		.type			= RK3308B,
> +		.grf_mux_offset		= 0x0,
> +		.iomux_recalced		= rk3308b_mux_recalced_data,
> +		.niomux_recalced	= ARRAY_SIZE(rk3308b_mux_recalced_data),
> +		.iomux_routes		= rk3308b_mux_route_data,
> +		.niomux_routes		= ARRAY_SIZE(rk3308b_mux_route_data),
> +		.pull_calc_reg		= rk3308_calc_pull_reg_and_bit,
> +		.drv_calc_reg		= rk3308_calc_drv_reg_and_bit,
> +		.schmitt_calc_reg	= rk3308_calc_schmitt_reg_and_bit,
> +};

...


