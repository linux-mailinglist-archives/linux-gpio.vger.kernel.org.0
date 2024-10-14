Return-Path: <linux-gpio+bounces-11251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030199BD85
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 03:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845381C2203A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 01:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B4F1BC58;
	Mon, 14 Oct 2024 01:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJTY5v6x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6D3A1B6;
	Mon, 14 Oct 2024 01:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728871104; cv=none; b=pkBTWVkFbv6Am1PW1c0pcj3FtsrUTvZCdPGT/tX7R7DVrz10SSPKHo2lh1TGqa94e+urgJzXKCraTi/JfLPr5aJOwO/1nOwpf51N9wlmHhZvd8tbFLJYLaTxxVjE7NpUq1Xmq1ASWzpFe21F62jyj3qDmDoCC6KdMc4Jwv+hBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728871104; c=relaxed/simple;
	bh=47gZKqvgx0nAqb33qbsE6DkX2b4H5WDShawomZ7RvGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYLWZdj+7a2sTru/NyNAFvGLFjpB1RpveWwxUvGtRIt4MUms7M4+MAt3sy1O+TqqwprtXvE2+6Lmik3p+wpy6gOBn/8D9AwerYQMEGkeNqYz9Tp7zPP/GBcic4m40YhW07TA3kjATaRLZO7bi5SdhonAaQKiEa3WKSzGctfj30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJTY5v6x; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so2526973a91.1;
        Sun, 13 Oct 2024 18:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728871102; x=1729475902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GFpJjv4Nk17l7P9yGLT2zIxctvhL0J8NnyJmHG1haY=;
        b=UJTY5v6x4h3BPBFi8cy0jtVJROLaDqVd7wdB1Z9hU0WS70UH7Uq62oaQKKn3rw0Ilp
         sD6OW1bh7Da5qdKB55ZyvDfD4xVedWSKWyHOY79BqlimpHeeR2Mpbdeeo3OzVO+Q2V4y
         qUlYsyZKTtnh8rdBkfJZQ5hKEKNwbKSJ0BzL+PCgEZdd92TaVMf8ld/SkQy0WQ8ukHyV
         495TWiAbbHRxhm0JzkzsyAIi7KoVYFY6JA7o9kLkwiX1o13cK69+gIleEDHn193gOsRT
         vXwtfdGYDTNQ/4NVshjuvx9tKTF5hq+iOUCAewB96u/dpopceV2HGPQPBcvCs1km2nZF
         dv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728871102; x=1729475902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFpJjv4Nk17l7P9yGLT2zIxctvhL0J8NnyJmHG1haY=;
        b=r9B84xnMW/Rn0Idx+j4PugDcicv/BclvRi3Do836PblWnBrL7IJV52fIIlSRwpNAKG
         6zxlIs2q10XfSSEIpilCJw1wxlgQgX9iovV5toiAuSTkScMiKsDOMZKn0Qx6aE/bezLq
         WPbh2OoxutfNMF+qtxKsMexlqeI1woqxItwCNmILpM3i9Z4FdD0N+2Mswl6EDBNxBaY1
         QRpsVIE+02W1Pgk5SHVeUISkvmZd3iDRMfPZnyIklErtdz1aKi4PiVOVLSOrEjnAVsr0
         +ebxYS5XomSaiBdDCZqmirTeGLdCxoUHj81+1bgLxSInE0CFIoJZ1HPYhwzDoMONHUaj
         eMug==
X-Forwarded-Encrypted: i=1; AJvYcCXjh8teC/8kGB7Fo4wigMXM1p9hBVgMZ6SXmu70ryeF6QIx2QcRarCHC8RK453nPsHEnvSCS3iU/746@vger.kernel.org, AJvYcCXswCAqYxRF6O7bN1h1YSyPhTJ3unGQ0D+Ir2GqiXHNXpCzr7G6XMRyt0Pv6DoUJCmibN47yy7ic0n16OZi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4jDw6JcAODAIb6Yhyf6BRF4yZ4GyHazqzTQAtVYCaADrDUJGD
	7oV0oZtkhO1vwez2spYeDMFbRxu/CqP7gX2cLC3DiQaqcVS0+cGM7UjO/xUq
X-Google-Smtp-Source: AGHT+IGcT5iG2KPIKLBcE6tvDiBjeW2Z/j7R/r89gZotMS4G9h6wdYZsPZkFxLLHF7QMpISxi/OV4g==
X-Received: by 2002:a17:90a:e613:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2e2f0a49381mr14399663a91.4.1728871101984;
        Sun, 13 Oct 2024 18:58:21 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a55fd43asm9816761a91.14.2024.10.13.18.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 18:58:21 -0700 (PDT)
Date: Mon, 14 Oct 2024 09:58:17 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/6] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
Message-ID: <20241014015817.GA20620@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-2-b560411f7c59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-2-b560411f7c59@linaro.org>

On Thu, Oct 10, 2024 at 11:10:23AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In order to prepare gpio_desc_to_lineinfo() to being called from atomic
> context, add a new argument - bool atomic - which, if set, indicates
> that no sleeping functions must be called (currently: only
> pinctrl_gpio_can_use_line()).
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index b0050250ac3a..8c48a53b4fa8 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2361,7 +2361,7 @@ static void gpio_v2_line_info_changed_to_v1(
>  #endif /* CONFIG_GPIO_CDEV_V1 */
>
>  static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
> -				  struct gpio_v2_line_info *info)
> +				  struct gpio_v2_line_info *info, bool atomic)
>  {
>  	unsigned long dflags;
>  	const char *label;
> @@ -2402,9 +2402,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
>  	    test_bit(FLAG_EXPORT, &dflags) ||
>  	    test_bit(FLAG_SYSFS, &dflags) ||
> -	    !gpiochip_line_is_valid(guard.gc, info->offset) ||
> -	    !pinctrl_gpio_can_use_line(guard.gc, info->offset))
> +	    !gpiochip_line_is_valid(guard.gc, info->offset))
>  		info->flags |= GPIO_V2_LINE_FLAG_USED;
> +
> +	if (!atomic) {
> +		if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
> +			info->flags |= GPIO_V2_LINE_FLAG_USED;
> +	}
>

Should be else if.

Cheers,
Kent.

>  	if (test_bit(FLAG_IS_OUT, &dflags))
>  		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
> @@ -2502,7 +2506,7 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
>  			return -EBUSY;
>  	}
>
> -	gpio_desc_to_lineinfo(desc, &lineinfo_v2);
> +	gpio_desc_to_lineinfo(desc, &lineinfo_v2, false);
>  	gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
>
>  	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
> @@ -2539,7 +2543,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
>  		if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
>  			return -EBUSY;
>  	}
> -	gpio_desc_to_lineinfo(desc, &lineinfo);
> +	gpio_desc_to_lineinfo(desc, &lineinfo, false);
>  	supinfo_to_lineinfo(desc, &lineinfo);
>
>  	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
> @@ -2632,7 +2636,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>  	memset(&chg, 0, sizeof(chg));
>  	chg.event_type = action;
>  	chg.timestamp_ns = ktime_get_ns();
> -	gpio_desc_to_lineinfo(desc, &chg.info);
> +	gpio_desc_to_lineinfo(desc, &chg.info, false);
>  	supinfo_to_lineinfo(desc, &chg.info);
>
>  	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
>
> --
> 2.43.0
>

