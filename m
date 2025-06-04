Return-Path: <linux-gpio+bounces-21021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C3ACE5AC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 22:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8B81677D0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 20:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E56F139B;
	Wed,  4 Jun 2025 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hROKr/xx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A15F213240
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749068106; cv=none; b=aYzeqK275z4y6xWOki681wXnCuefOUBKyCaqxgquz4u+dqOjYzF7wdLBFhUVSsuVarIUZn+RiirJTOSOj9SWTCOZtQogy3ddNqeCpfJvz7gBprEa/yfC2NdZhYvaHuJys0uJzkQPALhnAJitiXmyfTZXb/d3t2JMjW5uEdF/55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749068106; c=relaxed/simple;
	bh=3M80ApW25tcb4bzsgTYXk9LwcbWxkkiaP2Ghn2rZIkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkDnvV153iGQNsukPIjCe+C8K+ILZHBVHEEnTOIytFquA3LDS9+YIN8OYXNKwQPX3f6EVqaIc4pwaxBGTPRm5RaxMwhI1REhGjvds7n5muIT/vlN2hg67MFRnRRa+4ufXBcHyl6YY9MuhDsnR7z3spe5LkIUJ+QjP9uCK5j6130=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hROKr/xx; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e41064e247so166980fac.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749068102; x=1749672902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRfaLIDBj2llHsNUOJCUg2y9UIhPzulREBxN8ri02+M=;
        b=hROKr/xx+yxFVFNvLblMV0M0Glq7ORvO35rOObPxi2T1qcZ5jI0uohCC08vf1aQouf
         89ANJx0O4m21gde6pPJSTXbSfgqpeLgb5QjmS+dhyJdu0FHmnAugXx4RSkAVYGOCJD11
         aXVMvvNDKg2ow6m9OSpjYX2rSDywTM8rOgdYLVCClE4ed/qgmvqU0y9RGLSitPs5mj2B
         qeVWRMUC0PtAkWu7U9kJb6m+ejtCH51Yly6e1GPjWZ3veImWstMKIqdjTBe9DvgXfIUn
         1tI8OyVKR7Ik0emSAdDVhQ2XAQaMNRCcjQ5RLemhF1EM8AhEqxsNqv8fQEZ7NhfIqvG9
         JHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749068102; x=1749672902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRfaLIDBj2llHsNUOJCUg2y9UIhPzulREBxN8ri02+M=;
        b=DLXAMnSL65XBGWRYi7pZsXrxwWCwRl/fNNECJNQYvFQjfIP/YKPySOm1fWiFKva4B2
         RBLjYgMnBbBq/Xgh2Y1zCi+XBEStwVG4Eyn0CKPBPm69U1HvEb0wnP+FQ+AjUs3Kf800
         3gwn/SA3KxeYvzgNBQKIiPxPtHnHcIAruYErAGtAgOVZvz6F7EwdspqbjbXJIjqqnoqU
         uGG+zPa/j2dwrRc546RzAH8LquSNeqavFLeKMp2VEXrlbDoE6audX/7agT1+X7UAhbvt
         cxScufDSKgOpa6QEG/Xo1Faimv9xz5rnJKME423slEQbFq1C9dvfU0YmD+3zKUDlNEWC
         BfnA==
X-Forwarded-Encrypted: i=1; AJvYcCUOLNKg7asGyBPYqdI5fV3bCXFlftHuZZhu9GK2JrTKlH9uFJzEJSl84R4HjSKSwqG25JEVwQS/k76M@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxi2HT8+92hQiNUDbotLwqN5Q1a6JNz43sMRCnY9oVzgu+2HG
	ymcfCjBcUxzVTMTS9UHAI5SS8dDZI7CfzZtGbZpaXw1Hs5+U//mKhfhTIomfTYFSFD0=
X-Gm-Gg: ASbGncsLNGVaUMDPuLKhtoM0tP76UPjxfsswCfca5UGjfJt+tHDXkLnVir07rZQaP/R
	yzaSubHQ6I8ZSPdF5SOsA9apHgvhWKm92ZoCkkt4dNMTU5uXJs3FrMy98UlCqec72HMHQvEl7cz
	LlUcPLGZgMlOIubd27YW1Qj8ZKXHF5AInewiyvbPjrH6hx0b7yfnnAl6NGW6gDIZrX4M4fWS/EF
	7jgm6sXrYx7DFRKqQgdEq+8rWiLlLcHzMK/Zlfc/FsIXOGOYbXF4cex5R5EmQk9iWM+UFBcX5Lt
	mkD0hQuxksJ1HJCYNJYrCrHhJpyUmViL70vpwh2rB0s3I/jCjZPVkQ3Z7DjwNT/i268uSTErFTu
	btr/pToPp0/fH11YrfHnq2XfVJw==
X-Google-Smtp-Source: AGHT+IHQmjfLAxO850YKxxC8hykPYyb6LLSUw/IxyRagifjPWTVnvXEERLoCM79G7tZdCm40eYYEow==
X-Received: by 2002:a05:6870:200b:b0:2d4:ef88:97bb with SMTP id 586e51a60fabf-2e9bf238aaamr2633199fac.1.1749068102493;
        Wed, 04 Jun 2025 13:15:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:829:fdd0:311c:c481? ([2600:8803:e7e4:1d00:829:fdd0:311c:c481])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906457afesm2830330fac.1.2025.06.04.13.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 13:15:01 -0700 (PDT)
Message-ID: <57edc6dc-bbf7-4491-a43b-c33b9466d8d0@baylibre.com>
Date: Wed, 4 Jun 2025 15:14:59 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] iio: adc: ad7768-1: Ensure SYNC_IN pulse
 minimum timing requirement
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1749063024.git.Jonathan.Santos@analog.com>
 <d3ee92a533cd1207cf5c5cc4d7bdbb5c6c267f68.1749063024.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <d3ee92a533cd1207cf5c5cc4d7bdbb5c6c267f68.1749063024.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/4/25 2:35 PM, Jonathan Santos wrote:
> The SYNC_IN pulse width must be at least 1.5 x Tmclk, corresponding to
> ~2.5 µs at the lowest supported MCLK frequency. Add a 3 µs delay to
> ensure reliable synchronization timing even for the worst-case scenario.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

> v10 Changes:
> * New patch.
> ---
>  drivers/iio/adc/ad7768-1.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7768-1.c b/drivers/iio/adc/ad7768-1.c
> index 51134023534a..8b414a102864 100644
> --- a/drivers/iio/adc/ad7768-1.c
> +++ b/drivers/iio/adc/ad7768-1.c
> @@ -252,6 +252,24 @@ static const struct regmap_config ad7768_regmap24_config = {
>  	.max_register = AD7768_REG24_COEFF_DATA,
>  };
>  
> +static int ad7768_send_sync_pulse(struct ad7768_state *st)
> +{
> +	/*
> +	 * The datasheet specifies a minimum SYNC_IN pulse width of 1.5 × Tmclk,
> +	 * where Tmclk is the MCLK period. The supported MCLK frequencies range
> +	 * from 0.6 MHz to 17 MHz, which corresponds to a minimum SYNC_IN pulse
> +	 * width of approximately 2.5 µs in the worst-case scenario (0.6 MHz).
> +	 *
> +	 * Add a delay to ensure the pulse width is always sufficient to
> +	 * trigger synchronization.
> +	 */
> +	gpiod_set_value_cansleep(st->gpio_sync_in, 1);
> +	fsleep(3);
> +	gpiod_set_value_cansleep(st->gpio_sync_in, 0);
> +
> +	return 0;

There is no other return, so this could be a void function. In this case, it is
fine because a later patch adds another return. But in the future, be sure to
mention that in the commit message (or below the ---) so that reviewers will
know why without having to look ahead.

> +}
> +

