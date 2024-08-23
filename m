Return-Path: <linux-gpio+bounces-9022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A895C4CD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19622859D3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 05:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C07951016;
	Fri, 23 Aug 2024 05:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="wMIYuRmP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3339FD8;
	Fri, 23 Aug 2024 05:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724390417; cv=none; b=ZWf1CMuCY9br1fpWHda8qVNkTqkoMDOdDThg7MtHVD4vb0F32iogtalzW2oMNfG7znPJ4q9fgAT2QUkA9u16dq0ZN804RgWUD0kO7RmWfBa/qEl8YKsD2aSGVEZz2SoG1KqK0yaaNa5MeLtS0yGYMs//jUYjNfa2B4YiMpjJ6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724390417; c=relaxed/simple;
	bh=/Canr7HhDOmG2hoOtOFZcFhxPAtQzZiCTecd/4UjjqA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZRaAR8jbIirzK8YVmf8wOyZr8IL0Ry5A1wngs5PF3TRzAIU1pjy5SHid8cI4g1CR7YlZs076dQKjwvSMYeu1RQNxBIEe4DdJIqjLgKxyGzgO3nJgpkhKanF1PedI1Wh4yld/4vHSclcIyd+lisK7iNYTMmuWGAwwGOqFtCdW3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=wMIYuRmP; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1724390413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7E/u42pJNxk5be6E2/2XU4a6u/o0sOR6tbh89n5oThc=;
	b=wMIYuRmPDknAgxp71sNt2tRfbbIfw5LBNaq29wmvGT78kd1A1LnSSq5jmrk27/Ms+/sq0R
	yP9t/3zvRkz9nM8ShzOpH5snCf7SxNMdZaWuSXUgBl7EhRezXkK+PnwQy0SP2K1Njc1DmR
	Rmcr36ZQ5puZMngpP6VruF+cxC/jOAgHlClCoxw44v1wmkieJf37svzltY3Mg3XxjhsVQ6
	/Yr1Un20ze7AAgKR9v+4gnt1qrxfUhcm1/aMpWtsIyAzV3joVmzqwD32vCI7U9urtR3rz6
	XwCIPAXMFoUkmmJ/UX13BH8HO5BT04rYD6OqsGQ9rN25wfEjWoDJTIKWteoexg==
Date: Fri, 23 Aug 2024 07:20:13 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Linus
 Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Shresth Prasad
 <shresthprasad7@gmail.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] grf: rk3576: Add default GRF values
In-Reply-To: <20240822195706.920567-3-detlev.casanova@collabora.com>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
 <20240822195706.920567-3-detlev.casanova@collabora.com>
Message-ID: <b310ade62af0ade2c157177dc5b205e8@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Detlev,

On 2024-08-22 21:53, Detlev Casanova wrote:
> Set SW controlled i3c weak pull up and disable JTAG function on SDMMC 
> IO.
> 
> The i3c weak pull up is activated to let all gpio banks be controlled
> by the pinctrl driver.
> 
> Disabling the JTAG function lets the SDMMC core use its full IO width.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Thanks for the patch.  I had a rather detailed look at the patch,
while focusing on having no regressions introduced, and I found none.
So, please feel free to include:

Acked-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/soc/rockchip/grf.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
> index 5fd62046b28a..4607fc0779e7 100644
> --- a/drivers/soc/rockchip/grf.c
> +++ b/drivers/soc/rockchip/grf.c
> @@ -121,6 +121,29 @@ static const struct rockchip_grf_info
> rk3566_pipegrf __initconst = {
>  	.num_values = ARRAY_SIZE(rk3566_defaults),
>  };
> 
> +#define RK3576_SYSGRF_SOC_CON1		0x0004
> +
> +static const struct rockchip_grf_value rk3576_defaults_sys_grf[]
> __initconst = {
> +	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 6) },
> +	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 8) },
> +};
> +
> +static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
> +	.values = rk3576_defaults_sys_grf,
> +	.num_values = ARRAY_SIZE(rk3576_defaults_sys_grf),
> +};
> +
> +#define RK3576_IOCGRF_MISC_CON		0x04F0
> +
> +static const struct rockchip_grf_value rk3576_defaults_ioc_grf[]
> __initconst = {
> +	{ "jtag switching", RK3576_IOCGRF_MISC_CON, HIWORD_UPDATE(0, 1, 1) },
> +};
> +
> +static const struct rockchip_grf_info rk3576_iocgrf __initconst = {
> +	.values = rk3576_defaults_ioc_grf,
> +	.num_values = ARRAY_SIZE(rk3576_defaults_ioc_grf),
> +};
> +
>  #define RK3588_GRF_SOC_CON6		0x0318
> 
>  static const struct rockchip_grf_value rk3588_defaults[] __initconst = 
> {
> @@ -132,7 +155,6 @@ static const struct rockchip_grf_info
> rk3588_sysgrf __initconst = {
>  	.num_values = ARRAY_SIZE(rk3588_defaults),
>  };
> 
> -
>  static const struct of_device_id rockchip_grf_dt_match[] __initconst = 
> {
>  	{
>  		.compatible = "rockchip,rk3036-grf",
> @@ -158,6 +180,12 @@ static const struct of_device_id
> rockchip_grf_dt_match[] __initconst = {
>  	}, {
>  		.compatible = "rockchip,rk3566-pipe-grf",
>  		.data = (void *)&rk3566_pipegrf,
> +	}, {
> +		.compatible = "rockchip,rk3576-sys-grf",
> +		.data = (void *)&rk3576_sysgrf,
> +	}, {
> +		.compatible = "rockchip,rk3576-ioc-grf",
> +		.data = (void *)&rk3576_iocgrf,
>  	}, {
>  		.compatible = "rockchip,rk3588-sys-grf",
>  		.data = (void *)&rk3588_sysgrf,

