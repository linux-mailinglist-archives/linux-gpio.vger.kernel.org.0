Return-Path: <linux-gpio+bounces-22696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0FAF6DE8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 10:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938F51C808E6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 08:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF842D3A8A;
	Thu,  3 Jul 2025 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ebf7m3PM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265E2D3A83
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533048; cv=none; b=VicbeXJft0l9j/M9ZXSV4wbAIHx/ET11Vz+aaV1Z1G+6Y/ZoAScgh2k5XaTJMcxqCDpq5+s7ezOyk9pt/9onsfVsIIF2HTnDw7iHgkgbL7STlnwDOXcR4NShO8fsp5vfjjuro65lMkUD4Mf6srkz4Zi2E7mOU8/SpkUi+b0HSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533048; c=relaxed/simple;
	bh=TVm8+DDLhkDgtx9Ajhal2D3NeIrHHkBgUA/sSQb7gYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhDeHAVtHT08d9TMi7Sz40/OoVBXonC+y0BYklENG2wPJcPEXgEcJ/u6jEC5nwlE8yFU1PUirmAOPy2rXGs5YTxMkPd1QQAMzqMZ6vqnE5ah4BVgycKGHdO7oBr/ldSVWj3z4KyvpJcWDCaoNf4f8D2L0enXV9w4fyxrJCC0iqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ebf7m3PM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso10198444a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751533045; x=1752137845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78CXna3pb0qeIc/0R0/I0C4DO7qLpt141+ZSwb/6aBQ=;
        b=Ebf7m3PM7N/mHzLQjWegYJEOnGD8E7kJzPdxQXexLsHwjknrpTOSGQituQrH1Nx7J6
         jYh5Pnc8N7Uq/aDuJ9B51bw9qbG7EBjRwd9jmrPDUliB5UHjQHBtBzQ/tygiCk5O6Ec7
         X4Y9mMYSMigYhUBgX2QwY2ayGuioVxVczQ/cVv6gB4Qs3WIA7eQQk23N+oH+43EeRyfG
         6+SK6VHnhMsVCT7ImpIkOCCF+c9NsE3qDLFq5GAuvKVRnwIkVEgIHxfKHPamnCTzOML6
         LkV8Iu+OEc1TFwnEfv7jFGplghVldqxX3o98lP9O75MNzrJl2b58GhMi80HLxhDNNpiJ
         jX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533045; x=1752137845;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78CXna3pb0qeIc/0R0/I0C4DO7qLpt141+ZSwb/6aBQ=;
        b=HD0Nb5rJTKVK/0eKqk/CaKSKaQi0Ava8V7Q9fyL+dLSHqgEmun46sxbqYpZunj/CMV
         gPAW3dBVEhUi2mG8YeEet7otWyap+YybfplIB1z02Z3Z5up6yIM4uhvcKHmUjzWe0BTL
         vNTqXybJuiO4AJJnuBFt4mq6QSbrQqvnWAm6g/OjpAYizlUShfakN8G8y018w2xEg5hS
         +lhSs511+qMV330SdE0z7CCTa2ATEu8uYSowiEk70Y0uy9fML1inBJy54oxSA5kAmgv3
         IWNNjsIUtqO3SrfZyIiBkOGoeEEap81TkTv/P0hVdbuliPy0Uh16r+vwVduZB6szNYXm
         hvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpYELB48Rap24sUCvP3q/mLXzOXRa0ev2inC1O9ARLuYUVYJJKPbwW7B6TKWRepDxRgYGNgLWQo8KU@vger.kernel.org
X-Gm-Message-State: AOJu0YwsC+B48gQ08zCXCffqGs7fieYMrwIEGxY9WVvO1IgmA3TTv7uW
	hl5geCBArKkHY1xOZJ52puhvaA7KuoJzDtD3wI12/IZhizyn1nCvoPv1Gcxzbg/BoU4=
X-Gm-Gg: ASbGncuKPLfCo5qzdsCUPYvC3ib0Ztpj3+Ekxd9tCy+ZoMf1zhXgzY8LOfXSYo0WYJa
	zLtXjLB60DlmxprMkx+O7YASH8J3RfS+vcMmSrJOmokgNMszWmoWwH8+FS3A61yEO2FJGrgyGyE
	BUjb1+x2NuZoMqadSwAvCrh7tKRS9xp4l080BHf4pBpM+VuWBs+X8e+hq1+1gFwXm9i0nMzAsVR
	i88MabaRVbVybgiZCttguJuTs0T9TfuAxUFtBwakJ/NnpFe05uY7TaECTrWwzFt2no0E/CrCbjc
	OsI33Yqiq2/Rg9Ee8EBjHHBjALktJcen6CrjXZZl8/aRx/BRN40T9s6ORbCzSqZnVZGLaw==
X-Google-Smtp-Source: AGHT+IH4kkRlEJNbjCPQPKfivbPiQz0F3W3JKiYJNAvOIb8qeLzZSGtP5IrxwcNinkmtlU87YxwU7w==
X-Received: by 2002:a17:907:7b8c:b0:ae0:c534:2cea with SMTP id a640c23a62f3a-ae3c2cab545mr557923666b.50.1751533044882;
        Thu, 03 Jul 2025 01:57:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01980sm1202255566b.81.2025.07.03.01.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:57:24 -0700 (PDT)
Message-ID: <79510fbd-a738-4a6d-8e5d-f1d08aa44947@tuxon.dev>
Date: Thu, 3 Jul 2025 11:57:23 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Don't switch to GPIO during
 resume
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
References: <20250701100154.37536-1-biju.das.jz@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250701100154.37536-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 01.07.2025 13:01, Biju Das wrote:
> Even though some pins are set correctly during resume(e.g.: PS0), due
> to the unconditional switch to GPIO for restoring the PFC register is
> triggering spurious IRQ on RZ/G3E. So avoid switch to GPIO if the pin
> is configured correctly during resume.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 35 ++++++++++++++++---------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 2a10ae0bf5bd..09ee771b1e36 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3118,27 +3118,36 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  		pm = readw(pctrl->base + PM(off));
>  		for_each_set_bit(pin, &pinmap, max_pin) {
>  			struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
> +			u32 pfc_mask;
> +			u32 pfc_val;
> +			u8 pmc_val;
>  
>  			/* Nothing to do if PFC was not configured before. */
>  			if (!(cache->pmc[port] & BIT(pin)))
>  				continue;
>  
> -			/* Set pin to 'Non-use (Hi-Z input protection)' */
> -			pm &= ~(PM_MASK << (pin * 2));
> -			writew(pm, pctrl->base + PM(off));
> +			pfc_val = readl(pctrl->base + PFC(off));
> +			pmc_val = readb(pctrl->base + PMC(off)) & BIT(pin);
> +			pfc_mask = PFC_MASK << (pin * 4);
>  
> -			/* Temporarily switch to GPIO mode with PMC register */
> -			pmc &= ~BIT(pin);
> -			writeb(pmc, pctrl->base + PMC(off));
> +			if (!pmc_val || ((cache->pfc[port] & pfc_mask) != (pfc_val & pfc_mask))) {

We should be restoring here the previous Linux state. This function should
not be executed for pins that weren't previously (before suspending)
configured by Linux. This condition:

if (!(cache->pmc[port] & BIT(pin)))

should allow avoiding this.

Checking pmc_val here takes into account also the settings that were done
(while suspend/resume) by other applications (e.g. bootloader involved in
the resume process).

Could you please check if the cache->pmc[port] is properly configured for
your port/pin?

By any chance, is it possible that the PMC for your port spans more than
one register and thus the cache->pmc[port] is overwritten by [1] ?

Thank you,
Claudiu

[1]
https://elixir.bootlin.com/linux/v6.15.4/source/drivers/pinctrl/renesas/pinctrl-rzg2l.c#L2986

> +				/* Set pin to 'Non-use (Hi-Z input protection)' */
> +				pm &= ~(PM_MASK << (pin * 2));
> +				writew(pm, pctrl->base + PM(off));
>  
> -			/* Select Pin function mode. */
> -			pfc &= ~(PFC_MASK << (pin * 4));
> -			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
> -			writel(pfc, pctrl->base + PFC(off));
> +				/* Temporarily switch to GPIO mode with PMC register */
> +				pmc &= ~BIT(pin);
> +				writeb(pmc, pctrl->base + PMC(off));
>  
> -			/* Switch to Peripheral pin function. */
> -			pmc |= BIT(pin);
> -			writeb(pmc, pctrl->base + PMC(off));
> +				/* Select Pin function mode. */
> +				pfc &= ~pfc_mask;
> +				pfc |= cache->pfc[port] & pfc_mask;
> +				writel(pfc, pctrl->base + PFC(off));
> +
> +				/* Switch to Peripheral pin function. */
> +				pmc |= BIT(pin);
> +				writeb(pmc, pctrl->base + PMC(off));
> +			}
>  		}
>  	}
>  


