Return-Path: <linux-gpio+bounces-7294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDF0901A8D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 07:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4AAA1C22A12
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 05:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258AC4436A;
	Mon, 10 Jun 2024 05:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nJ//xrUB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316E63F9FB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998811; cv=none; b=iEAYpsGD71+PKYKI3LdOX+X3/JHjlnWUM+7BDgt3iFjoqBQHs94NkuDbL2gHsGF31Si3lIABr1lD+RRZ+1EQ50rBgocvlJEOeX9Yj4qlx1cPJ1eOyo+8M+PCD+FJeGJ0a1paaEuty4hURPvh0NpLonyXRIfWuE/3JQVcKvIp/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998811; c=relaxed/simple;
	bh=3alQsF5cXJcp1eB6veFck3wP14TcpMIr2boHKhCezgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wpy51TgTyXG8L0NMyDSMPmBQ3h9Ilb5gnsndOiEjFM9tookjEdmlMYvIHfM5VODsAAMB5SL3V2HL5V7K/ju+DWLBj6bNafRiuYRjpxPqDDR92171u1FuZgtqvFGwlkcW8Eu8tPDMvvSvhTAdwrGSxF0FQEQzVru78hk98Coc6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nJ//xrUB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4217d451f69so9820155e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2024 22:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998808; x=1718603608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkUhmOLbHVpb+NlbhLeXbIAVL7bf+BVkPJnytKdhiUQ=;
        b=nJ//xrUBGdAPGGKYPtLyj68p2YDNqhoR1odLs95uv1F0PjHw6IsE5pQ7YNwNF30+Bx
         dIbQDEiLWOPQ12sYCQDC65LvuIvp7Rus6CjiXsskJZ7vFZiOvCJMw6j0F3g4NVwsoU/7
         o1+G17rxLTUiU5yOIBrMRPpfxH1pxkKMLluO3XCi+knyDTIEkkIBP4IHNRhEu6wg5MGO
         xM9jN+lEW5WpaK9+zZCwIE0ODXDq3nNCegKm0xb/YrzKluIM/CEtddGcZtXtePsAdDtF
         SeogudDndydWnjS321EDzK6PxJGbmuunH08s5h7kuO9sK+ujVP59MzMi2/uDPFGmKWyP
         MCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998808; x=1718603608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkUhmOLbHVpb+NlbhLeXbIAVL7bf+BVkPJnytKdhiUQ=;
        b=XNHm71oragnYYkxmsjRcMp9Bg/CLw7QXwXZ5BC2Kdu0p2KGLQLcVTNz37L6/CtVhan
         kD6bMnVJRB+74Xn3gj92gh8ZMdDZjJJzOkGb5CGTm/l7wXtw/AoPEyzj3jCUlqH2ejgK
         cA9IoMlFm679bKjFgPRq1dIFd9WoamYYG05Bo/LegpmKWmxSAmXFT4NmX16P6WujSc0r
         twsmIymLYFn6zM5+t1KdMMWfeGi1N9QMP63VbMp8d9zP1p60OVaU+MTAxrWZhZPKMllq
         DNL0fuml5i8lfLT1SmFpB4O1D3oopzIYlb569w/kUTApCc+vUL4JAbqvMZdsW2QZYpGV
         IwBA==
X-Forwarded-Encrypted: i=1; AJvYcCVu1Zhg8Xj+2D3ujHFi5IN3Q1CVW4pm6FekkNkcD8TrqL8007RQmkWPOl4Sb1HQ1Vk7ZsQLC3Qvf2cU7loc/pmLG2ci9tcJ2N/6cw==
X-Gm-Message-State: AOJu0Yxs3TBemn2dj2ajZ09UlyNFPJOeHGI0nqopjxnBBIZfrJEaPPDj
	4GmdFFHdMiP7ohKRvfWUxb0lCtxAbpESje8mV/Tm3s2AFwDhIGtLoqQ5zXhit/g=
X-Google-Smtp-Source: AGHT+IHg2tNbYnA2TznKTM7iMvhXh86Wjk4NqEykG9atDu1gG/ivW7L/85gd91UYrGOEEtVjRWrFLw==
X-Received: by 2002:a05:600c:350f:b0:422:1163:44b2 with SMTP id 5b1f17b1804b1-422116354d0mr1096165e9.7.1717998808576;
        Sun, 09 Jun 2024 22:53:28 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cc89e055sm25464975e9.13.2024.06.09.22.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:53:27 -0700 (PDT)
Message-ID: <438a8c1e-5d78-49ae-86de-4f91acf9e76d@tuxon.dev>
Date: Mon, 10 Jun 2024 08:53:26 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointer for locking/unlocking the PFC register
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
> However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit controls
> writing to both PFC and PMC registers. Additionally, BIT(7) B0WI is
> undocumented for the PWPR register on RZ/V2H(P) SoC. To accommodate these
> differences across SoC variants, introduce the pwpr_pfc_lock_unlock()
> function pointer.
> 
> Note, in rzg2l_pinctrl_set_pfc_mode() the pwpr_pfc_lock_unlock(.., false)
> is now called before PMC read/write and pwpr_pfc_lock_unlock(.., true) is
> now called after PMC read/write this is to keep changes minimal for
> RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Introduced single function pointer to (un)lock
> - Updated commit message
> 
> RFC->v2
> - Introduced function pointer for (un)lock
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 44 +++++++++++++++----------
>  1 file changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 6e3b1adb95f6..a3fd14b95c5a 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -241,6 +241,8 @@ struct rzg2l_dedicated_configs {
>  	u64 config;
>  };
>  
> +struct rzg2l_pinctrl;
> +
>  struct rzg2l_pinctrl_data {
>  	const char * const *port_pins;
>  	const u64 *port_pin_configs;
> @@ -251,6 +253,7 @@ struct rzg2l_pinctrl_data {
>  	const struct rzg2l_hwcfg *hwcfg;
>  	const u64 *variable_pin_cfg;
>  	unsigned int n_variable_pin_cfg;
> +	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
>  };
>  
>  /**
> @@ -383,7 +386,6 @@ static const u64 r9a07g043f_variable_pin_cfg[] = {
>  static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>  				       u8 pin, u8 off, u8 func)
>  {
> -	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
>  	unsigned long flags;
>  	u32 reg;
>  
> @@ -394,27 +396,23 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>  	reg &= ~(PM_MASK << (pin * 2));
>  	writew(reg, pctrl->base + PM(off));
>  
> +	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
> +
>  	/* Temporarily switch to GPIO mode with PMC register */
>  	reg = readb(pctrl->base + PMC(off));
>  	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
>  
> -	/* Set the PWPR register to allow PFC register to write */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> -	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
> -
>  	/* Select Pin function mode with PFC register */
>  	reg = readl(pctrl->base + PFC(off));
>  	reg &= ~(PFC_MASK << (pin * 4));
>  	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
>  
> -	/* Set the PWPR register to be write-protected */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> -	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
> -
>  	/* Switch to Peripheral pin function with PMC register */
>  	reg = readb(pctrl->base + PMC(off));
>  	writeb(reg | BIT(pin), pctrl->base + PMC(off));
>  
> +	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
> +
>  	spin_unlock_irqrestore(&pctrl->lock, flags);
>  };
>  
> @@ -2439,12 +2437,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
>  static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  {
>  	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
> -	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
> -	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
>  
> -	/* Set the PWPR register to allow PFC register to write. */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> -	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
> +	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
>  
>  	/* Restore port registers. */
>  	for (u32 port = 0; port < nports; port++) {
> @@ -2487,9 +2481,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  		}
>  	}
>  
> -	/* Set the PWPR register to be write-protected. */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> -	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
> +	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
>  }
>  
>  static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
> @@ -2551,6 +2543,21 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
>  	return 0;
>  }
>  
> +static void rzg2l_pwpr_pfc_lock_unlock(struct rzg2l_pinctrl *pctrl, bool lock)
> +{
> +	const struct rzg2l_register_offsets *regs = &pctrl->data->hwcfg->regs;
> +
> +	if (lock) {
> +		/* Set the PWPR register to be write-protected */
> +		writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> +		writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
> +	} else {
> +		/* Set the PWPR register to allow PFC register to write */
> +		writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> +		writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
> +	}
> +}
> +
>  static const struct rzg2l_hwcfg rzg2l_hwcfg = {
>  	.regs = {
>  		.pwpr = 0x3014,
> @@ -2608,6 +2615,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
>  	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
>  	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
>  #endif
> +	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
>  };
>  
>  static struct rzg2l_pinctrl_data r9a07g044_data = {
> @@ -2619,6 +2627,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
>  	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common) +
>  		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
>  	.hwcfg = &rzg2l_hwcfg,
> +	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
>  };
>  
>  static struct rzg2l_pinctrl_data r9a08g045_data = {
> @@ -2629,6 +2638,7 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
>  	.n_port_pins = ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT,
>  	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
>  	.hwcfg = &rzg3s_hwcfg,
> +	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
>  };
>  
>  static const struct of_device_id rzg2l_pinctrl_of_table[] = {

