Return-Path: <linux-gpio+bounces-19235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C9A9A50F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 09:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34CBC924476
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 07:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB4E1F4604;
	Thu, 24 Apr 2025 07:57:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C11DCB09;
	Thu, 24 Apr 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481457; cv=none; b=VdvPoIBhgNMZgeRI/XAI/WqkRXWscbJvWw6lVL3yLJI0EuTeBKf1DEXxWm7AfcVrZ7d7kvqy0aJANqBpWgRkvWyUzvhCSQBCktQIrSaFJByNbaN1iShPBHPRPjtvO5MRbzxzvaVbVLtkoyNrq5yChIH1dorlSWQQTna+4xmBIWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481457; c=relaxed/simple;
	bh=j7Zexj83D8yHHiDWxpa8pxiPd8J8YZHl0x0DF/vohQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMN5s2u6Cafa/ZgIr9J6C4eYsMbm5S5jnntAwCbBjAfQvnvOlFsWOP4O82L93nzDYLtFidz75Od4ub1IMHLOLYjjPuLxoYj/o3de8QVy1z67CciewZCBeoutYcU+gyw0PYPLO/bgyIRuNEZCap0zsTQDQqRNRu++UFJfULlXl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8EB50B4C1596;
	Thu, 24 Apr 2025 09:57:28 +0200 (CEST)
Message-ID: <0ce7dff4-a6cf-4e5b-a5b1-3c58926ef9ab@freeshell.de>
Date: Thu, 24 Apr 2025 00:57:26 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pinctrl: starfive: jh7110: add support for
 PAD_INTERNAL_* for GPI
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-3-uwu@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250424062017.652969-3-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 23:20, Icenowy Zheng wrote:
> The JH7110 SoC's both pin controller support routing GPI signals to
> internal fixed low/high level.
> 
> As we allocated two special "pin" numbers for these situations
> (PAD_INTERNAL_{LOW,HIGH}), add special handling code for these "pins".
> The DOEn/DOUT/FUNCTION fields are ignored and the internal input signal
> specified by the DIN field is routed to fixed low/high level.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../starfive/pinctrl-starfive-jh7110.c        | 41 +++++++++++++++----
>  1 file changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 1d0d6c224c104..fb18c7974ec86 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -291,6 +291,24 @@ void jh7110_set_gpiomux(struct jh7110_pinctrl *sfp, unsigned int pin,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_set_gpiomux);
>  

> +static void jh7110_set_gpi(struct jh7110_pinctrl *sfp, u32 gpi, u32 val)
> +{
> +	u32 offset, shift;
> +	u32 reg_val;
> +	const struct jh7110_pinctrl_soc_info *info = sfp->info;
> +
> +	offset = 4 * (gpi / 4);
> +	shift  = 8 * (gpi % 4);
> +
> +	reg_val = readl_relaxed(sfp->base +
> +				info->gpi_reg_base + offset);
> +	reg_val &= info->gpi_mask << shift;
> +	reg_val |= (val & info->gpi_mask) << shift;
> +
> +	writel_relaxed(reg_val, sfp->base +
> +				info->gpi_reg_base + offset);
> +}
> +

Are there some bit ops masking macros common to Linux that should be
used here?

>  static int jh7110_set_mux(struct pinctrl_dev *pctldev,
>  			  unsigned int fsel, unsigned int gsel)
>  {
> @@ -307,14 +325,23 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
>  	pinmux = group->data;
>  	for (i = 0; i < group->grp.npins; i++) {
>  		u32 v = pinmux[i];
> +		u32 pin = jh7110_pinmux_pin(v);
>  
> -		if (info->jh7110_set_one_pin_mux)
> -			info->jh7110_set_one_pin_mux(sfp,
> -					jh7110_pinmux_pin(v),
> -					jh7110_pinmux_din(v),
> -					jh7110_pinmux_dout(v),
> -					jh7110_pinmux_doen(v),
> -					jh7110_pinmux_function(v));

I cannot think of any reason why you would need to do it this way:

> +		switch (pin) {
> +		case PAD_INTERNAL_LOW:
> +		case PAD_INTERNAL_HIGH:
> +			jh7110_set_gpi(sfp, jh7110_pinmux_din(v),
> +				       pin == PAD_INTERNAL_HIGH);
> +			break;

Please, just more readable and let compiler do its job to optimize:

		switch (pin) {
		case PAD_INTERNAL_LOW:
			jh7110_set_gpi(sfp, jh7110_pinmux_din(v), 0);
			break;

		case PAD_INTERNAL_HIGH:
			jh7110_set_gpi(sfp, jh7110_pinmux_din(v), 1);
			break;

> +		default:
> +			if (info->jh7110_set_one_pin_mux)
> +				info->jh7110_set_one_pin_mux(sfp,
> +						jh7110_pinmux_pin(v),
> +						jh7110_pinmux_din(v),
> +						jh7110_pinmux_dout(v),
> +						jh7110_pinmux_doen(v),
> +						jh7110_pinmux_function(v));
> +		}
>  	}
>  
>  	return 0;

Thank you for your work on this series!  -E

