Return-Path: <linux-gpio+bounces-11253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4399BDAA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 04:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F13E31C218AC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 02:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E55219FC;
	Mon, 14 Oct 2024 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6aivFUN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05CF9DA;
	Mon, 14 Oct 2024 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728871906; cv=none; b=XhcEh4S+ntBFu5NKwydzPYhVpxOJVt+FZWEyG+VW0cgXZRMgriJpCA5Re/2l02P9HgNoz+lom/Weecg5+6QgjDx3jpC8KTHEsvvwkgJJSNi3YO/zRNhnYl5HUDT1nY2ce6Xq0wkuniZcpRYL8eFD/m2htW0pUrB062vwVCUVygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728871906; c=relaxed/simple;
	bh=eR5nb+ha7teyVIeMo8sEL3Ytv8oApQt+0yyjsm0hwbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+yRspTvcqnhaum88b/SpuNN5vMatyHdVmnTd38KqKCCdt0nLfHSfBwLLDyXxm2cL/gTpA/4pfIdLUxoPUTcZ0+Nbg3f3nKxdJ/eJA2X++4S9FwPwNidXNRp+QG8xqBbBYyd9hrlxpzM9YDDlqCmtmztrxx68J8XUXvCvlWz6/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6aivFUN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c693b68f5so37561395ad.1;
        Sun, 13 Oct 2024 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728871905; x=1729476705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZVmvANQwert9MkK3q/umjF7kdgjB0UGT3uvsZbmVxw=;
        b=a6aivFUNF6hwlhzsNjgdNvXVF6pAF+JklwyZqSHaYdn/LrKsGfII/CQsMO1hR1DTlq
         7tin8cIfrivj3zNM3JrO4C/mu1ehhNphDxOx95JNp6dyask+kjwmDQyA/Ms1DxSa/0+I
         Wi615dk35Sj9V4y0m3NzJAXILOcnLedVxzsR2fypjAf0ftS8Oe4SECqun/XXTKZhdvuz
         poltc6xUBn1F4GTjfqAh+t56AF2eMGaamH7hKbzyaHYibTAMyFtV5Otacf1q11ajbbQl
         gxqKaqLMYJ53BTJ2VjOFaHoo7+PXYvSe5iPR2DdqqDAiZmIX4Jkll1idqjUsyHwxSJtK
         lnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728871905; x=1729476705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZVmvANQwert9MkK3q/umjF7kdgjB0UGT3uvsZbmVxw=;
        b=UjOK04DDyHJWy2dWblWYPFIaxOOulJhzcNLRRz02Q1Guv0//ZqJkOLW/HU6PMIMtNk
         d3J4zoh8ibZy0QF2nd6JLoMcDqMCVtSfyoKXuRZ4YKWTdHbyW0mDqyt8/iiQX7GRHbqo
         vhTKH/esspQV7BSjTeFpBBzlNfvlZTEOC6LVN4QHRQm6zDTn/nCUIayCM7SulJv/0c0J
         TF4aV+lEBdKATLN9hDhaAcVaGTVVtAbIXn0mppvgZ4qkgSD9bff2POu41o0QDZKregNk
         mG1lT9ElAR/G7pG4dfcmrHuwsqbob4SAZtoG/DR3gBEJCeo3mpvjt68lUICFEkfhqGU5
         bkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqnrfJg9JZHYKI7f2zmrpNIVdm4xbTxlfrNNL/tZc1sxEZALJ0nSXRxRz3Hh7Px/O8JTY8MeM7bb41px0B@vger.kernel.org, AJvYcCX8halBi+o0JUfIbKqf7JVp7s9HognzZFRUBX62Chpo6UhpFlaYqg2WXwwe+seE8xD0KR/zWPNmQVeE@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjuV7SQrz/PIo3KCsuBwx6AYQeLVN6mJs1lc6DfCSqYv7NunA
	mvxF6gn8gpTXXGLE2jw3vPAyBybl1qB2z6ECerRAIq4k07anmGFoPlZcwbIn
X-Google-Smtp-Source: AGHT+IFt2R26g+txKjwbESaX4/AoQ6nlNpfrcdk3Q+kNB9FjE1Rh1XuH30o6kwsxGPkO164clEcI4A==
X-Received: by 2002:a17:902:d4cf:b0:20c:f9ec:cd9e with SMTP id d9443c01a7336-20cf9eccf40mr10202455ad.41.1728871904761;
        Sun, 13 Oct 2024 19:11:44 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c2132a0sm55746925ad.207.2024.10.13.19.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 19:11:44 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:11:40 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
Message-ID: <20241014021140.GC20620@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>

On Thu, Oct 10, 2024 at 11:10:26AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With everything else ready, we can now switch to using the atomic
> notifier for line state events which will allow us to notify user-space
> about direction changes from atomic context.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 22 ++++++++++++++++------
>  drivers/gpio/gpiolib.c      |  6 +++---
>  drivers/gpio/gpiolib.h      |  2 +-
>  3 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 2677134b52cd..7eae0b17a1d6 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2673,6 +2673,16 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>  	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
>  		return NOTIFY_DONE;
>
> +	/*
> +	 * This is called from atomic context (with a spinlock taken by the
> +	 * atomic notifier chain). Any sleeping calls must be done outside of
> +	 * this function in process context of the dedicated workqueue.
> +	 *
> +	 * Let's gather as much info as possible from the descriptor and
> +	 * postpone just the call to pinctrl_gpio_can_use_line() until the work
> +	 * is executed.
> +	 */
> +

Should be in patch 4?  You aren't otherwise changing that function here.

Cheers,
Kent.

