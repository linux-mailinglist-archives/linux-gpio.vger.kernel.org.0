Return-Path: <linux-gpio+bounces-29227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1DC9EE8C
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 12:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 119344E1190
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 11:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0822F5A11;
	Wed,  3 Dec 2025 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK4W5xAx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D984A2F5339
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762935; cv=none; b=CKCUldtdbHXtCc7T68/j5Sm0lUG99hnllwSWnLsLEJOf4oRoJsClLNN14VwdWeqr1Fxu8cXIGvuyhizaRN8B/S+8iCZ1L/9DtKgirYyrbIlxOXFDQaEfEfRjvQ0rVq1XZ/XoYvhlvOcCXD1potmd22BS445wN5CV0hsYYsh9tA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762935; c=relaxed/simple;
	bh=fo/8CieHydQlqUvzLD8OEdPvGiBp3p5+hEpoFmCo8dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+gLs/6uCT3SNqQgsfraFc0yuP/7DS1l12XWukZIxXjqPrZQnr/DYXu5JAp29JvYPQIeikvk5ToSzaq+StcAT+qEQULG3E9qF6R5hU4sBH3a+f0n03H9GNai6tAPpk3Zj21VvIt0qfwQZKfpQ/VBrBX8iK/rrRzimXt5NWn0Q1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK4W5xAx; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-343d73d08faso512097a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 03:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764762933; x=1765367733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+J4weCANCaak38nhzr07WM8nW/AOnlIpZsvTwCxRldo=;
        b=OK4W5xAxUDosheN5GFLJeitdAaOJRCDSN+S6uf6/9i0LGaENUDzxTHon+Oiad725/T
         hbzEvzePjkA/Jmp6mylSUudJEcSIvtTE9a3oCwLrjNOgzwC6k4rBPvI3eWENmDZAOyuu
         hLsChRsAZTjjzwIwiRwEWmqxHka3EKIIS7DTAbSZqBdnKHYWos9/OIZa/8luenlC04H/
         8Sq7PUp8/wWDuxK0c3yfpwBADvi9v/yLETeOoS1UWXrqRhAzC+Rs43RIAXpw4EYbBf6G
         GEFgj184N149bKzIpdIM3tNeCYy9r+2GwCjRSq/eztgSvLUMst19gDsOYKY4EP6p0PgO
         dg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764762933; x=1765367733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+J4weCANCaak38nhzr07WM8nW/AOnlIpZsvTwCxRldo=;
        b=Je5ktJU8YMV0Q0/uwO92SlbuGQObW1NQ5tqQWedTp56yjkRNQdjiru/5OIkVW9bFwn
         Rp+xSoKU8PCBSwWS0+FxueQTDzSXJ430R+bj8VXi9V73mDA7NYykBAM/NTQJ63piTig9
         s6hyM1rDhT7DvojklDquukdhoFwuK57Uch5Y96omQs0AjKFaSgrslcQSNfpfBAz+J6ry
         yi2TAm3kTK3IwnAQuWmjpZkVTWgzSITyiYvF7UeQ3VGh4XB8OJ3aBupq4VMSmst/MpYD
         TfjeZp5vq51pgdNSV8Qa8eR9e8b0VP84LKNmprmbjGhyI8Gq/sYJZtH5Kceg6LeFB67R
         scXg==
X-Gm-Message-State: AOJu0YzR5YWAYnQ1pFS2R3irEhdqRWbyB/jPv0EG8GbAoxz3kY+WCa+d
	AZe2Rss6bFswAeNsj1fus9844MYD0PhK7CtypwAQywZbFwIV47GR7mV2Z2y9LbPY
X-Gm-Gg: ASbGncsG41vzHdOs31sUYgudwJHkqfFrhm8zgue7912JDpbMY/Ff2au0tUJoIYIRbMy
	NHXLJv+gDAxUt1JpWgvlZFqO8WtYwiPx4lVHUHqeBYIcii1wrYfGhCTPMAKA4sPtiQN6ZWez53l
	IJ3PUxJycSvltVP9pdQods6RzGf2RTD6xtrgOy5Y2fPgXBlaLgrktSj84SbEUa3nMNJFrWIORXr
	RuZc/2Hwh0YuktxwQlEAE1OJhQ5KUeQZYUwmOauh3An36U9qpIt3rPilSILOfYkcfdgzK/BK6Dr
	Z0eyHY6NXPHWWuF7KYq8hsPwSuV4ftkuUvyQfNf9bhJk5pBeIAs8Gj1UBqKdZQ9WvfpLC+CCNJR
	DHea2WtVjs6PpGA0ogozNA8msZK7rClAnaeRk2ykQcFjbr1kTnYFkjDIzbe4daWjPiIABdhmRRY
	OPDJsltL7urbuUAaAXi5jHdEPI8R0=
X-Google-Smtp-Source: AGHT+IE/xUiq5O8kqcmrzBXlAvajDBehM/epkZLxDmJTdrUUeUnnYcjRz/Vk/uzgLZHt+iNdgt0DXQ==
X-Received: by 2002:a17:90b:56c7:b0:343:72d5:2c18 with SMTP id 98e67ed59e1d1-34907fd8c71mr6766752a91.12.1764762933087;
        Wed, 03 Dec 2025 03:55:33 -0800 (PST)
Received: from [192.168.100.198] ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910e7af86sm2540786a91.9.2025.12.03.03.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:55:32 -0800 (PST)
Message-ID: <7b7145a9-cf3a-4feb-b3ea-862b9e98ff3c@gmail.com>
Date: Wed, 3 Dec 2025 16:55:24 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: starfive: use dynamic GPIO base allocation
To: kernel@esmil.dk, hal.feng@starfivetech.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20251026114241.53248-1-alitariq45892@gmail.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20251026114241.53248-1-alitariq45892@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Just checking on the status of this v3 patch:
“pinctrl: starfive: use dynamic GPIO base allocation”.

It removes the deprecated static GPIO base and aligns the driver with 
current GPIO core guidelines.

I didn’t see it in the tree yet, so I wanted to ask if anything else is 
needed from my side.
I’m happy to send a v4 if any adjustments are required.

Thanks for your time,
Ali

On 10/26/25 4:42 PM, Ali Tariq wrote:
> The JH7110 pinctrl driver currently sets a static GPIO base number from
> platform data:
> 
>    sfp->gc.base = info->gc_base;
> 
> Static base assignment is deprecated and results in the following warning:
> 
>    gpio gpiochip0: Static allocation of GPIO base is deprecated,
>    use dynamic allocation.
> 
> Set `sfp->gc.base = -1` to let the GPIO core dynamically allocate
> the base number. This removes the warning and aligns the driver
> with current GPIO guidelines.
> 
> Since the GPIO base is now allocated dynamically, remove `gc_base` field in
> `struct jh7110_pinctrl_soc_info` and the associated `JH7110_SYS_GC_BASE`
> and `JH7110_AON_GC_BASE` constants as they are no longer used anywhere
> in the driver.
> 
> Tested on VisionFive 2 (JH7110 SoC).
> 
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
> Changes in v3:
> - Add Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> - Clarify commit message wording for readability
> 
> Changes in v2:
> - Remove unused gc_base field from struct jh7110_pinctrl_soc_info
> - Drop unused JH7110_SYS_GC_BASE and JH7110_AON_GC_BASE defines
> - Remove .gc_base assignments from jh7110_sys_pinctrl_info and jh7110_aon_pinctrl_info
> - No functional change otherwise
> ---
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 2 --
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 2 +-
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h     | 1 -
>   4 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
> index cf42e204cbf0..3433b3c91692 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
> @@ -29,7 +29,6 @@
>   #include "pinctrl-starfive-jh7110.h"
>   
>   #define JH7110_AON_NGPIO		4
> -#define JH7110_AON_GC_BASE		64
>   
>   #define JH7110_AON_REGS_NUM		37
>   
> @@ -138,7 +137,6 @@ static const struct jh7110_pinctrl_soc_info jh7110_aon_pinctrl_info = {
>   	.pins		= jh7110_aon_pins,
>   	.npins		= ARRAY_SIZE(jh7110_aon_pins),
>   	.ngpios		= JH7110_AON_NGPIO,
> -	.gc_base	= JH7110_AON_GC_BASE,
>   	.dout_reg_base	= JH7110_AON_DOUT,
>   	.dout_mask	= GENMASK(3, 0),
>   	.doen_reg_base	= JH7110_AON_DOEN,
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
> index 03c2ad808d61..9b67063a0b0b 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
> @@ -29,7 +29,6 @@
>   #include "pinctrl-starfive-jh7110.h"
>   
>   #define JH7110_SYS_NGPIO		64
> -#define JH7110_SYS_GC_BASE		0
>   
>   #define JH7110_SYS_REGS_NUM		174
>   
> @@ -410,7 +409,6 @@ static const struct jh7110_pinctrl_soc_info jh7110_sys_pinctrl_info = {
>   	.pins		= jh7110_sys_pins,
>   	.npins		= ARRAY_SIZE(jh7110_sys_pins),
>   	.ngpios		= JH7110_SYS_NGPIO,
> -	.gc_base	= JH7110_SYS_GC_BASE,
>   	.dout_reg_base	= JH7110_SYS_DOUT,
>   	.dout_mask	= GENMASK(6, 0),
>   	.doen_reg_base	= JH7110_SYS_DOEN,
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 05e3af75b09f..eb5cf8c067d1 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -938,7 +938,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
>   	sfp->gc.set = jh7110_gpio_set;
>   	sfp->gc.set_config = jh7110_gpio_set_config;
>   	sfp->gc.add_pin_ranges = jh7110_gpio_add_pin_ranges;
> -	sfp->gc.base = info->gc_base;
> +	sfp->gc.base = -1;
>   	sfp->gc.ngpio = info->ngpios;
>   
>   	jh7110_irq_chip.name = sfp->gc.label;
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> index a33d0d4e1382..2da2d6858008 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
> @@ -38,7 +38,6 @@ struct jh7110_pinctrl_soc_info {
>   	const struct pinctrl_pin_desc *pins;
>   	unsigned int npins;
>   	unsigned int ngpios;
> -	unsigned int gc_base;
>   
>   	/* gpio dout/doen/din/gpioinput register */
>   	unsigned int dout_reg_base;


