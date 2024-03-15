Return-Path: <linux-gpio+bounces-4378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD987CA60
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Mar 2024 10:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96A4CB21280
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Mar 2024 09:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9561717991;
	Fri, 15 Mar 2024 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uxb9xEco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302B175A6
	for <linux-gpio@vger.kernel.org>; Fri, 15 Mar 2024 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710493570; cv=none; b=qOAeOyJF63UWgvKM92A+OQJQ3Au2WWkTMwChQuY17QjG/lM+GyOfevkeD5qWH5eAvqCCuwnoBGeUFiQsz4+l4clSC6B16ObkqSPoVukmyLFr/0TJ3VZnYVaSTHSS8QjnbQFx2avhnM6nJT4xe2yzh0aRUa9UEBkm8jeBdb4bG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710493570; c=relaxed/simple;
	bh=VYYch6XeureEVUpN2Mw2LknizCfpr7ksjmijCa7rU1g=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=Dh7ykN0Uohbpo98K+Wvt1Jp3Ywf+QDlprI4NDvjfbhztGaKM2GvT+OBdKoPi9rJ86EeI2zWcVKEVDa5OirPMkJ6P0t80CuK1aGWJrVGCbcjoqzmqiKVUJ1iBNRZKS39WxJ8Kp1gFBQEmbQtRzD1tHiWJk+PwOKhQCrgxSVqvFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uxb9xEco; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41400a9844aso1671705e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Mar 2024 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710493565; x=1711098365; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpMSBa9vXitkcuu7vgMM3w3/yA6IqPigK2dGLCTN5uc=;
        b=uxb9xEcoW06sfo43xA0iTAYPNc/sHcZzFzBdFoMm+3EOzpxR7jYZ/onGi6nNR8uU/v
         hl02w0ZJJNgsZcO+8zUMT/ZhxT7Ey0uKjCJnmqRq86yVfuKsQntH3/BKSW6mbMMDPDIs
         9t6UgkeVK8jQ72uKve4rd1X8oaBEKaVXA+ZkyDOoQYuNXEMneLNEABWHxQUjJBbEpGzY
         /I+RhDbrsHd9aCGoUaVegA21Y7cErzy+NM5ghfysg2RlnChMoeDwYEyHATPnBBGLmnCL
         5izbvTWkvXkmUI63aC40YFTXBmYB/uzsyes0oRGna1aEKGa7wfOsaTouDqyBioAxPrT0
         WaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710493565; x=1711098365;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpMSBa9vXitkcuu7vgMM3w3/yA6IqPigK2dGLCTN5uc=;
        b=sm5OT2ddLJdasQE8JiFvmZgRrWgLBWUreHg15WO9N7OBewyyn7wwMjYyeJAy1W4QI4
         fzWZvzdHp9+hfcfQIIzDV/JHzuBGgOD3QX3yRThgI27U6YDekR4C4m0LSlkwxEb88Xx4
         +gFQsMYW65dvDKJPLdOQuujgt5gUx9/B2za6jgKxBEY7SQgFfDAjElmhFC8y/8/7+8Qf
         SxK0Yc4IAgAlun04h08qvOqCXCiqAh8GkM3OmS3nDAFGfOb7pmTlabBQlwBR/j7X8Ad2
         xOON1UGaL7gdwgeaO7ouZttsliDSjwQIJzI+u1hHQS8IjM/8Adr1K8PemkyHgX7cUqa6
         VxBA==
X-Forwarded-Encrypted: i=1; AJvYcCU1YYG3oaXGh3pNfNwktwL0Squ5cS8KuFflkx11DLE5wdB+y8IzsjHkzh8TXVkdTipPfm3A74CktRxPN4TqyJyLykKY+kZZRIFkGA==
X-Gm-Message-State: AOJu0YxgqU39GOXE7hyYMuusehI2g9S3vSFvywuQrb6e18HIaqixApGe
	kuj7y+JcKzBnG4pFTuBBuZUcogQ4wnMcmjfxZEkgBnF8ln4w9IwVlu17r3ECIzY=
X-Google-Smtp-Source: AGHT+IGv2qeT4+XV+fkhSqD7rZTLCUTw8RubHWgYTp3yu9LMq3zgewNkauR43y7qOB4OhUkwae7l8g==
X-Received: by 2002:a05:600c:4f11:b0:414:37f:2798 with SMTP id l17-20020a05600c4f1100b00414037f2798mr483210wmq.6.1710493564904;
        Fri, 15 Mar 2024 02:06:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id fj6-20020a05600c0c8600b00414024b2f49sm900044wmb.0.2024.03.15.02.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 02:06:04 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Fri, 15 Mar 2024 09:58:50 +0100
In-reply-to: <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
Message-ID: <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Existing values were insufficient to produce accurate clock for audio
> devices. New values are safe and most suitable to produce 48000Hz sample
> rate.

The hifi pll is not about 48k only. I see no reason to restrict the PLL
to a single setting.

You've provided no justification why the PLL driver can't reach the same
setting for 48k. The setting below is just the crude part. the fine
tuning is done done with the frac parameter so I doubt this provides a
more accurate rate.

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 4325e8a6a3ef..00e06d03445b 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>  	},
>  };
>  
> -static const struct pll_mult_range hifi_pll_mult_range = {
> -	.min = 32,
> -	.max = 64,
> +static const struct pll_params_table hifi_pll_params_table[] = {
> +	PLL_PARAMS(128, 5),
> +	{ },
>  };
>  
>  static const struct reg_sequence hifi_init_regs[] = {
> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>  			.shift   = 6,
>  			.width   = 1,
>  		},
> -		.range = &hifi_pll_mult_range,
> +		.table = hifi_pll_params_table,
>  		.init_regs = hifi_init_regs,
>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>  	},


-- 
Jerome

