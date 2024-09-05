Return-Path: <linux-gpio+bounces-9814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C570A96CC25
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 03:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042CC1C221A1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 01:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DD49454;
	Thu,  5 Sep 2024 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMviWp1M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5240946F;
	Thu,  5 Sep 2024 01:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725498957; cv=none; b=qiddM6muNlIu5iRn80fofXx5Gq38bhQyB5abDF0xiPkCu09mU7fYakz0vTT6JjcSdYSjnaROrMU99lkdwotv2cJy1It7GcDf0cMVc6juWAiPsG1SkJLI5xPaarht12/oNd4LCHSPv5osCfxJNldrtotMOXzU5x93+ep4QhssW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725498957; c=relaxed/simple;
	bh=8ekNUNmJ5B7JlGsLgDmDPyFcmVABctn18IfLiXOwrM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agbv2C6DeJfbOvp2PKA5aImmQUDaBLV3agdMXLoYqvtN3mNYWRw4XzMnYD3eQI+TGeIHTvxE2l+xCXqcTNOgHmvFPr/8Z10GP/MbMq1B5OiOrkK4L+RxT9P05bvNyd6AubPlbwyZy5fwpP0WihEvZJt6jKZY4P3flxw9XOQoYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMviWp1M; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-717594b4ce7so205235b3a.0;
        Wed, 04 Sep 2024 18:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725498955; x=1726103755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lfqkii3Xuadydf2OgjL825gCtliAjphhJk+LUWBeNs4=;
        b=MMviWp1MUdhvUBUDh8xxKDjDOqYjSSypGmO1bVdaueO2jWSENtC1jjKk0n/qeuKbFK
         yz2+PdVTJvfxplSKA+rPTGblrueD4lCiMm4jl0WkvkfbU4xrVdMJ+YE6emLxULXC/Yw7
         /TQ1cMJPMJ/Q+To/TMa1LWQVEq+PoQHANrtCPpNUhv8hpR0Dhqm8doeodIYNCSlaz+L4
         c/NIUea5H5rxr3gNeOUTuiehiQB+82rMMEnqMXuwo4RnQKsw/gRRfoisY2iTTgn13H6e
         D+w+DKufrwnA0matUz/fLv9lUqVHpyxWbBXVB2zZWKwRxvX1XGRuEVu1t3YCRPLPGaoL
         rKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725498955; x=1726103755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfqkii3Xuadydf2OgjL825gCtliAjphhJk+LUWBeNs4=;
        b=o85DuhlFzAyiLVFcc034WTyKKVB/lq5ryUqrNHfx58l3253ckLejjLbEpKCDXQzvyN
         HeDTw40wqHsm6li02KC82MXLieQ/4bRyAEh+L9OnLK4b+qE2IY3jPXzLLRwP2l7uV5YI
         A1XRKJUwB/7kwELI9izhUBAP4pUqQzw/q26FBQJ+DEROiRjQ2aeBzw0NlLpMs4ldTiG8
         Lya/v7EZTZS6XtwVOpsRJLmVeXH7/jicwjF1AHipaqOOE92bjXg+iaSQTIjlsv35RCiU
         WgFMm8u3A1+ougO1+pWLH0vmT+K0H/LrzJgN29lWPRA3SIim5+x+QFPoywzXVX+YZzhZ
         SrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFUcQQloDc1Z5S7C12Dy+xZAZv4adelhll3ZvoP4Iok18k+h2NTLX+OkeCx64pnKKYbnT7y6hHK7os@vger.kernel.org, AJvYcCXEiCZZvAssjDvn+BFMGMhdjMbfILyNg1vuw/hPijRHugeZTXV+fxYsroNBvlM2pDJYqTOugpkqaQKjROd3@vger.kernel.org
X-Gm-Message-State: AOJu0YwKo+wRgwGiRs4JQrwqSqZhf3dvazuBa9I7Nmducc6p+yRVkOcZ
	D3juK8n/rtWqo1MZlT+T+8suUSnHL6/l/NlDn3fHvyOTXJQVKot3
X-Google-Smtp-Source: AGHT+IHPuGTBuTh6l98ghabXikw9n1vplmTWdBl2JwA6Qq8GNc2eWq/DMEYnvYdG9PF280wjE6cHnQ==
X-Received: by 2002:a05:6a00:13a6:b0:70b:5394:8cae with SMTP id d2e1a72fcca58-715dfc76152mr26554296b3a.28.1725498954865;
        Wed, 04 Sep 2024 18:15:54 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778534bd1sm2202573b3a.79.2024.09.04.18.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 18:15:54 -0700 (PDT)
Date: Thu, 5 Sep 2024 09:15:49 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of
 memchr_inv(s, 0, n)
Message-ID: <20240905011549.GA7299@rigel>
References: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090743.1204593-1-andy.shevchenko@gmail.com>

On Wed, Sep 04, 2024 at 12:07:43PM +0300, Andy Shevchenko wrote:
> Use the mem_is_zero() helper where possible.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Somehow I still don't receive mail directly from you, so I only picked
this up via the list. Weird. It should be gmail to gmail, right - WTH?
Unless it isn't - and that is the problem.

I'm ok with the change, though mem_is_zero() hasn't hit any of the trees
I have in front of me, and I had to find the corresponding patch on lore.
Given this is explicitly the use case for it, I would've embedded the
negation in the function and the name, so mem_not_zero() rather than
!mem_is_zero(), as that reads better for me, but ok.

Acked-by: Kent Gibson <warthog618@gmail.com>

> ---
>  drivers/gpio/gpiolib-cdev.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 5aac59de0d76..e98d75dd8acd 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -16,7 +16,6 @@
>  #include <linux/hte.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> -#include <linux/kernel.h>
>  #include <linux/kfifo.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -26,6 +25,7 @@
>  #include <linux/rbtree.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
> +#include <linux/string.h>
>  #include <linux/timekeeping.h>
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
> @@ -1331,7 +1331,7 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>  	if (lc->num_attrs > GPIO_V2_LINE_NUM_ATTRS_MAX)
>  		return -EINVAL;
>
> -	if (memchr_inv(lc->padding, 0, sizeof(lc->padding)))
> +	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
>  		return -EINVAL;
>
>  	for (i = 0; i < num_lines; i++) {
> @@ -1746,7 +1746,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  	if ((ulr.num_lines == 0) || (ulr.num_lines > GPIO_V2_LINES_MAX))
>  		return -EINVAL;
>
> -	if (memchr_inv(ulr.padding, 0, sizeof(ulr.padding)))
> +	if (!mem_is_zero(ulr.padding, sizeof(ulr.padding)))
>  		return -EINVAL;
>
>  	lc = &ulr.config;
> @@ -2516,7 +2516,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
>  	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>  		return -EFAULT;
>
> -	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
> +	if (!mem_is_zero(lineinfo.padding, sizeof(lineinfo.padding)))
>  		return -EINVAL;
>
>  	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
> --
> 2.46.0
>

