Return-Path: <linux-gpio+bounces-11956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C396B9AE6ED
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5964AB217BE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE20D1DD0E6;
	Thu, 24 Oct 2024 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7Z0nI3P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6A1CB9E5;
	Thu, 24 Oct 2024 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777491; cv=none; b=R0svMP/0iuJ9/TDMvOHxlZrEsz1yHjnqBYaJjJj171/Wkbpbuhx/GdkfSavMg1qOdgijn7v2WfbeqKvxXaqexSgORPm9Yt9LKm+S/1+YVx6MgPJPBfvwBfAA19al9PjbHHzE4xC3/pi6Pqm8NAj32uP/rE39yE4mvok+Jol0668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777491; c=relaxed/simple;
	bh=XTewxsxxjlV5dDLPKlnRSukTISb74KPpJNXbcBloW88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9393FlkAI/eknALlonOb36bypdmDutzNFCc1L2PbF1OeWYwA7mHcHsVD0jEJfEXHDdlJDB2w5xjWuQNFGLLQu0qBBqJ0ZWZxb7ErGZXTfTgc5NWJ2HJ6XFmivaZFh8QWzDWnSoulY8HHGBuQvQsZT2KbfbDxbtjJp+U0oz7Q4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7Z0nI3P; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cb74434bc5so1267659a12.0;
        Thu, 24 Oct 2024 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729777488; x=1730382288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZiLuNyR5XkI8Z1F/5hyoXvT4DkwkFu6+ESHxxLSKL7Q=;
        b=M7Z0nI3PpUjvafXMKOv3JnziScCKcKcuqrvO0R7hN+cmwL6idVUpIdbteRpbbwIfsc
         4whRB7E7p3IDIrWAkv3/f5xeMKjrlehD8KQ08flLY1fEmyFBpaaPQQ6NwaA6Py6kSF5j
         bwbR2PMP4IWfGFI8UAMNVlOFFbejkzu7ERXMbq+OxWEPHmJA80BWfhew5J8gBGGYzprM
         A1b4O7XjdT9WlIrV5CGk7gtJRB6RmCx1USCnV+bOFezkP3sJMyedK4pzfH/pR/kpAX6N
         ERjdGF44HB9Kgxip9plKrhMyGtm6vN+tuaki9StT6eMDc1MkG2dpHFe5SKRK57EpUFqA
         jg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729777488; x=1730382288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiLuNyR5XkI8Z1F/5hyoXvT4DkwkFu6+ESHxxLSKL7Q=;
        b=RapqgNCrWwWjn12k2ck9QXo86EARZCbSPI7r7kUojr7ZcQK6Y0KsefeAaNTVWi7eCA
         46rB8VUjd8XCtVeHK0eOpWRrD7i+Z60q3d4KIB0xo9Mi9yulgrlxZJgRaueyQWMf2ugK
         OyygO7Amr6hGr5yYrxaHlfoxQ9DOPcSEvTIXXq7bmMj4KfhI0VCJQeVxknK0d8yirQdI
         zXwxmMyVAHS8xzeYmY27YZQ8f4z9Uqvhyb6SjsZ0dIDTpxH4zDoInMpPH0sskK7xqGp5
         plY0Qftn3TXVoW5pYTwbxQROPhH4OJbyXnyXxelKED/mSHz4F7+KxJ4ii38iTLfnXHAz
         BJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVCitcKiKZxSQEWxMRBCfLXM/wGQpmmqObkHzdV7j1aey/C8bEIous6jY2Iaa1QWPD+QzC/hmaiRtv2UUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20lKBbpK3H4bxpegdTPLmAFHTwznLT+XZjMFQVqfaRjKkQO3N
	P0S9Ablf8BV/4mZ+vDS5vk0bBPvOxBTblQaFOXNHNzJfrKwrVKmI
X-Google-Smtp-Source: AGHT+IEzUqGR2U1alJ6x5JZOW1PnTfiy1JvAVUmme0zRXIN/ch5n3eHycjvVdH1bImmFSqkvgAYAEg==
X-Received: by 2002:a05:6402:194e:b0:5cb:6ca3:af96 with SMTP id 4fb4d7f45d1cf-5cb8b1c43f6mr5462539a12.19.1729777487355;
        Thu, 24 Oct 2024 06:44:47 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c726besm5736945a12.93.2024.10.24.06.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 06:44:46 -0700 (PDT)
Message-ID: <bcaa681e-7ea2-40b0-8f9f-0bcba5010b11@gmail.com>
Date: Thu, 24 Oct 2024 15:44:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: fix a NULL-pointer dereference when setting
 direction
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Kent Gibson
 <warthog618@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241024133834.47395-1-brgl@bgdev.pl>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20241024133834.47395-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-24 15:38, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For optional GPIOs we may pass NULL to gpiod_direction_(input|output)().
> With the call to the notifier chain added by commit 07c61d4da43f
> ("gpiolib: notify user-space about in-kernel line state changes") we
> will now dereference a NULL pointer in this case. The reason for that is
> the fact that the expansion of the VALIDATE_DESC() macro (which returns
> 0 for NULL descriptors) was moved into the nonotify variants of the
> direction setters.
> 
> Move them back to the top-level interfaces as the nonotify ones are only
> ever called from inside the GPIO core and are always passed valid GPIO
> descriptors. This way we'll never call the line_state notifier chain
> with non-valid descs.
> 
> Fixes: 07c61d4da43f ("gpiolib: notify user-space about in-kernel line state changes")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpiolib.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ae758ba6dc3d1..6001ec96693c5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2695,6 +2695,8 @@ int gpiod_direction_input(struct gpio_desc *desc)
>   {
>   	int ret;
>   
> +	VALIDATE_DESC(desc);
> +
>   	ret = gpiod_direction_input_nonotify(desc);
>   	if (ret == 0)
>   		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> @@ -2707,8 +2709,6 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
>   {
>   	int ret = 0;
>   
> -	VALIDATE_DESC(desc);
> -
>   	CLASS(gpio_chip_guard, guard)(desc);
>   	if (!guard.gc)
>   		return -ENODEV;
> @@ -2841,6 +2841,8 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
>   {
>   	int ret;
>   
> +	VALIDATE_DESC(desc);
> +
>   	ret = gpiod_direction_output_nonotify(desc, value);
>   	if (ret == 0)
>   		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> @@ -2854,8 +2856,6 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
>   	unsigned long flags;
>   	int ret;
>   
> -	VALIDATE_DESC(desc);
> -
>   	flags = READ_ONCE(desc->flags);
>   
>   	if (test_bit(FLAG_ACTIVE_LOW, &flags))

This patch fixes the issue for me, thanks!

Tested-by: Klara Modin <klarasmodin@gmail.com>

