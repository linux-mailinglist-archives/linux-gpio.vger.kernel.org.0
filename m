Return-Path: <linux-gpio+bounces-6366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1678C5618
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 14:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DB3D282878
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 12:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E84A6BFA8;
	Tue, 14 May 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdUBJOcy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4BE42A98;
	Tue, 14 May 2024 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715690548; cv=none; b=lUIfwZaJGv54NMhEsUXb+qDI+Z1a263fvPRMIV2vhc5jdDDgt7FyKj6WsvUbcqJ3NDQeUbsXXGZ2S9iOVxlLgAtPj87XnZcQQTiayEaDVl3ohC99OMJphIPRg/LLJh2wuMKYO4jkxtqEH/D2+3Jql905MvNZazXN94FKJS3MFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715690548; c=relaxed/simple;
	bh=Hzybv0ZnTrpR4AWXuutVofcBl76owQvTU7LlgMcj/9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iln9Q+//le6OsqAkCfGyRkEj59X0ZFcQhjmy6qOn921wQzwQ6Mt+8bOFKFv20iKCecctyEhoXC965Y6zwVsN3y4QMdIpTNUZdEzy4yvV/sX4ZKPhCwbie+xPw1RI1lSzoqkYPF98r9foUP/flsWyj8AfFu2xBbBssaNDNftk40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdUBJOcy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f457853950so4318221b3a.0;
        Tue, 14 May 2024 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715690546; x=1716295346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1YeAwgqmGFiWDHi7YEeyDDdEvor4QpkzTYylwt6Hos=;
        b=HdUBJOcy7YGZ+GGNLDJwNtKPARHWh9SeZJ3qR72qGtORwapHpDdgEbjPLZl8tvucs8
         ZQ/jSES+Mrbw+w1x93wiFNVQFa76DLea1Sf1pwM8tf0hVgsn/HP43gy17kiGrrRzmjWp
         ygDs21kKxF1HG5dWym8MhcTFgMWoClO8iEsL2ADavCvA5Vbkq+eL2F0cODOAo5oB7ev3
         ckQqyemCPWLGZCOPbmxVoRlTwN6k/h1i1KRFJi3z/9vVPrMHJh7y/fseerC/DdrnQxk5
         Vul9LLJgi7j372u7Vbj8Oy/fFE/yWZIsgv+BcH2u7yxzrPDiFJtuxOPKL3HaVpg7SjVR
         Uxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715690546; x=1716295346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1YeAwgqmGFiWDHi7YEeyDDdEvor4QpkzTYylwt6Hos=;
        b=Tf+km28Spt/N/jShEOiXXDi+5umz7xrONnk26/v8D6y9KWKdsuyS5jBiki45yZ215K
         Yy9DNDUgHwk+Cv+tNn5ja2Nq47dwUKDxDIX7fOzi0Cc7yzD2MzLtS1GA2AtCyM03ciFP
         q3np0XRcyb5B9HPSaYO3hTsqwC/r4j3SHuk/qB0C0LKqjzNvkJ0Guf90tM+S9k/z9Nie
         iLxAA8GAK8wsNRj+VVzu7xMVyq6cwa3f4SST4NwFavPUizXOMQg4VC20NpqH8/ewcd+V
         P1nApm5alZuYfKhFl0XrhQ/Fn0hSKm1WaPOdjdB+38IOZwGCIabDopisdXKhpWV3OXJR
         jXCA==
X-Forwarded-Encrypted: i=1; AJvYcCXXfCPmRe2bFuPMlJb6q63spxfbTPnDbQtRiNXIfRHQsGIpoC1F9+8mm7C+LFr8LF0dzxbmgqW76OVE2uz8Ud8sdlqSstBb3dVtdhYZA7if3RqY8ZTO8Y8K7wKx5UkVedcN9umOqvLnRg==
X-Gm-Message-State: AOJu0YxG2nt+upx/LoNke4QZFpULnHbpfwcfjgLlOSCwf3zTKcbBWFOu
	1Db/Y2CwhmGRQjqaQH0kI7BHyTB/27gPf+xCUGt3e1msljSYt9PN
X-Google-Smtp-Source: AGHT+IEuZgBfRlCELuju1acZdAR4f9lKleu9hlxeVkY1yJpmYFzfQ6+FCyCrOVgQNrs6ma/IXaYl9w==
X-Received: by 2002:a05:6a20:3cab:b0:1af:fff9:1c59 with SMTP id adf61e73a8af0-1affff91d50mr6018016637.2.1715690546454;
        Tue, 14 May 2024 05:42:26 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b300d9sm9009831b3a.215.2024.05.14.05.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 05:42:26 -0700 (PDT)
Date: Tue, 14 May 2024 20:42:21 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: Norbert Manthey <nmanthey@amazon.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240514124221.GA76024@rigel>
References: <20240514122601.15261-1-hagarhem@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514122601.15261-1-hagarhem@amazon.com>

On Tue, May 14, 2024 at 12:26:01PM +0000, Hagar Hemdan wrote:
> Users can call the gpio_ioctl() interface to get information about gpio
> chip lines.

Indeed they can, assuming they have access to the gpiochip device. So what?

> Lines on the chip are identified by an offset in the range
> of [0,chip.lines).
> Offset is copied from user and then used as an array index to get
> the gpio descriptor without sanitization.

Yup, and it returns an -EINVAL, via gpio_device_get_desc(), if it is out
of range.

>
> This change ensures that the offset is sanitized by
> using "array_index_nospec" to mitigate any possibility of speculative
> information leaks.
>

Speculative leaks of what?  The size of the array?
That is explicitly public knowledge - if they call GPIO_GET_CHIPINFO_IOCTL
it will tell them.

> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
>
> Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
> ---
> Only compile tested, no access to HW.
> ---
>  drivers/gpio/gpiolib-cdev.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 9dad67ea2597..215c03e6808f 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/kfifo.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/nospec.h>
>  #include <linux/overflow.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/poll.h>
> @@ -2170,7 +2171,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  	lflags = eventreq.handleflags;
>  	eflags = eventreq.eventflags;
>
> -	desc = gpio_device_get_desc(gdev, offset);
> +	desc = gpio_device_get_desc(gdev,
> +				array_index_nospec(offset, gdev->ngpio));

Moving an out of bounds index INTO bounds here is totally wrong.
That is NOT what the user asked for, and in that case they should get an
error, as they currently do, no an actual different line - which is what
this change does.

NACK.

Cheers,
Kent.

>  	if (IS_ERR(desc))
>  		return PTR_ERR(desc);
>
> @@ -2477,7 +2479,8 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
>  		return -EFAULT;
>
>  	/* this doubles as a range check on line_offset */
> -	desc = gpio_device_get_desc(cdev->gdev, lineinfo.line_offset);
> +	desc = gpio_device_get_desc(cdev->gdev,
> +				array_index_nospec(lineinfo.line_offset, cdev->gdev->ngpio));
>  	if (IS_ERR(desc))
>  		return PTR_ERR(desc);
>
> @@ -2514,7 +2517,8 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
>  	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
>  		return -EINVAL;
>
> -	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
> +	desc = gpio_device_get_desc(cdev->gdev,
> +				array_index_nospec(lineinfo.offset, cdev->gdev->ngpio));
>  	if (IS_ERR(desc))
>  		return PTR_ERR(desc);
>
> --
> 2.40.1
>

