Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E493448CA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 16:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhCVPIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 11:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhCVPHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 11:07:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBE3C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 08:07:45 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n138so21820503lfa.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yFDw71qJFMSxMWTR3W66s2G473yPzgJkMDNPxDQ7IS8=;
        b=1qT2oNvng+LQ5Tlac00mv4jOEZZpxJ406q2tGtP3um4LRovSyG29CTW8/gIY5P00ci
         TzhYbdHRxWgXGs1aFF2GRHwIWOH+5HnarEj7mqU4vq1JaMSFDTOh2XdlYeH6+3pexvxY
         9mYIFEjhqpGmQkORybb1M1OVWeNeILK+vnnw23htLh/pNfYppTYTt+Z2t/HXxLojyPFq
         +BxHTY6H+AwS79vTMb31jCeAeNN3nL0rpUhG6YMWgwFgrOHo/uqHc5H669qu+l0Vx77b
         QNheNYQ3yHhvwYHl7JN9EEpy4prCkwgaLK+P32xFd114J/b3K+lh7BV/kpz0RRVCT29U
         Us1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yFDw71qJFMSxMWTR3W66s2G473yPzgJkMDNPxDQ7IS8=;
        b=A4/SEF+688PhxAzF96cCgyMkRkaVMUWIXTl9zb5t2Z8AagSW43OIUTSAAu2YWcEDoV
         gEstAD/gp1OSYoIP1c9fDiXH5eMAvYMkSIINnxGsjT11jL5ig+3h66kRg8jBincVpjHx
         vpfVyKe1gOHDVtxznbniBvY7yU7G/KygSaUP341g7VF7Oc2b8WGvYyCMJGRsXKXrelmA
         9NVxSQJg6gzHrtqjyT23wKBxVRsOsN/DNq4iRvAH+9bpzmlOjHGRb5ROtReua0MZrpzv
         6O62rfNKErF2yHx3JqTFaqgPWxXDk4AES7ScaCx3nCONa/0dSkwYjBaqlmtvirwQKsYO
         0fEQ==
X-Gm-Message-State: AOAM530bsjI+EyW1u/84HqM0JJtRUUTEbxKSLnryrOUPwRdZ2x5yFPSd
        Rr6/93TK4bvK4CsHizQ/Uslx2g==
X-Google-Smtp-Source: ABdhPJw6UbXcH/wsJjdvTCcURtvZ5l9mdBy+u3rGgUKWWEk1strgkWZFXzalrVtcA1FCYMtwkrRjyA==
X-Received: by 2002:a19:74c:: with SMTP id 73mr9262607lfh.316.1616425663849;
        Mon, 22 Mar 2021 08:07:43 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y22sm1966684ljg.32.2021.03.22.08.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:07:43 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:07:42 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/6] pinctrl: renesas: Add support for R-Car SoCs with
 pull-down only pins
Message-ID: <YFiyvr30r6O6qFgH@oden.dyn.berto.se>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
 <20210303132619.3938128-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303132619.3938128-6-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-03-03 14:26:18 +0100, Geert Uytterhoeven wrote:
> Currently, the common R-Car bias handling supports pin controllers with
> either:
>   1. Separate pin Pull-Enable (PUEN) and pin Pull-Up/Down control (PUD)
>      registers, for controlling both pin pull-up and pin pull-down,
>   2. A single pin Pull-Up control register (PUPR), for controlling pin
>      pull-up.
> 
> Add support for a variant of #2, where some bits in the single pin

s/bits/bit/ ?

> Pull-Up control register (PUPR) control pin pull-down instead of pin
> pull-up.  This is the case for the "ASEBRK#/ACK" pin on R-Car M2-W,
> M2-N, and E2, and the "ACK" pin on RZ/G1M, RZ/G1N, RZ/G1E, and RZ/G1C.
> To describe such a register, SoC-specific drivers need to provide two
> instances of pinmux_bias_reg: a first one with the puen field filled in,
> listing pins with pull-up functionality, and a second one with the pud
> field filled in, listing pins with pull-down functionality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pinctrl.c | 49 ++++++++++++++++++++-----------
>  drivers/pinctrl/renesas/sh_pfc.h  |  4 +--
>  2 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
> index b7ebbc877b544305..bb488af298623407 100644
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -847,7 +847,7 @@ rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
>  {
>  	unsigned int i, j;
>  
> -	for (i = 0; pfc->info->bias_regs[i].puen; i++) {
> +	for (i = 0; pfc->info->bias_regs[i].puen || pfc->info->bias_regs[i].pud; i++) {
>  		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
>  			if (pfc->info->bias_regs[i].pins[j] == pin) {
>  				*bit = j;
> @@ -870,12 +870,19 @@ unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
>  	if (!reg)
>  		return PIN_CONFIG_BIAS_DISABLE;
>  
> -	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
> -		return PIN_CONFIG_BIAS_DISABLE;
> -	else if (!reg->pud || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
> -		return PIN_CONFIG_BIAS_PULL_UP;
> -	else
> -		return PIN_CONFIG_BIAS_PULL_DOWN;
> +	if (reg->puen) {
> +		if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
> +			return PIN_CONFIG_BIAS_DISABLE;
> +		else if (!reg->pud || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
> +			return PIN_CONFIG_BIAS_PULL_UP;
> +		else
> +			return PIN_CONFIG_BIAS_PULL_DOWN;
> +	} else {
> +		if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
> +			return PIN_CONFIG_BIAS_PULL_DOWN;
> +		else
> +			return PIN_CONFIG_BIAS_DISABLE;
> +	}
>  }
>  
>  void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> @@ -889,19 +896,27 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
>  	if (!reg)
>  		return;
>  
> -	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
> -	if (bias != PIN_CONFIG_BIAS_DISABLE)
> -		enable |= BIT(bit);
> +	if (reg->puen) {
> +		enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
> +		if (bias != PIN_CONFIG_BIAS_DISABLE)
> +			enable |= BIT(bit);
>  
> -	if (reg->pud) {
> -		updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> -		if (bias == PIN_CONFIG_BIAS_PULL_UP)
> -			updown |= BIT(bit);
> +		if (reg->pud) {
> +			updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> +			if (bias == PIN_CONFIG_BIAS_PULL_UP)
> +				updown |= BIT(bit);
>  
> -		sh_pfc_write(pfc, reg->pud, updown);
> -	}
> +			sh_pfc_write(pfc, reg->pud, updown);
> +		}
>  
> -	sh_pfc_write(pfc, reg->puen, enable);
> +		sh_pfc_write(pfc, reg->puen, enable);
> +	} else {
> +		enable = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> +		if (bias == PIN_CONFIG_BIAS_PULL_DOWN)
> +			enable |= BIT(bit);
> +
> +		sh_pfc_write(pfc, reg->pud, enable);
> +	}
>  }
>  
>  #define PORTnCR_PULMD_OFF	(0 << 6)
> diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
> index fc8391712af8cf4b..320898861c4b4c56 100644
> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -188,9 +188,9 @@ struct pinmux_drive_reg {
>  	.reg = r, \
>  	.fields =
>  
> -struct pinmux_bias_reg {
> +struct pinmux_bias_reg {	/* At least one of puen/pud must exist */
>  	u32 puen;		/* Pull-enable or pull-up control register */
> -	u32 pud;		/* Pull-up/down control register (optional) */
> +	u32 pud;		/* Pull-up/down or pull-down control register */
>  	const u16 pins[32];
>  };
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
