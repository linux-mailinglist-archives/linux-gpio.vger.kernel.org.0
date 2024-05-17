Return-Path: <linux-gpio+bounces-6423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422AE8C83FD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 11:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657591C223E2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 09:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F8035280;
	Fri, 17 May 2024 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ye47qP03"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816FA29437;
	Fri, 17 May 2024 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715938770; cv=none; b=d6muNwFyiBMVqsrLO4zU3U/GBKhGDyu5wGHJoxHkpwwUH2qRxwdXLi+ZzklGnXlJl8Ozriku5zHtCrdIZn178vSgCwtwHDOvEwcwBzShrjqJtolo/XOnK/jt4IYX9IyZf/crdvrpB55EOfbFaa8hpKvbtLY0cCZZZ2Df2yyN+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715938770; c=relaxed/simple;
	bh=FdikcfHL3VvTqnXtwWMqag4N1YbLOOeOD0V2nQdPNQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVNMqapCJViU1KL29TCDW8oq0DuPGPOfKoyxH8eIXRD8ezk2yvUJi7at3X+o75pwUBuwvhdovQqMggBNEao8bLv49OuWIBjtkDOYxMUYubszUu1f5Ke9mEJgOQYoAT7H4mq3xJRsjo6apvCPXAayjUgUvqweqZbWQZwRAdHGK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ye47qP03; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f447976de7so1036227b3a.1;
        Fri, 17 May 2024 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715938769; x=1716543569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oc2uBF5T8zF0ET39Oe1WycC/ZOj2j52tx2g3ICPIqhc=;
        b=Ye47qP03UeNAi1abK03b8u+TBFf79HKQTMEQ+5uBfW+lBYNEGKUF6XWRTtOXhWIesK
         TprhhDpCPnOwjuvWzILrD19rjiN29Cc0bR6TNzBtzVh+705Ni6ie5I/l4NHi4LboJfZ7
         cawJ7JxZXpzGf8Rr4FlI46++hdo2N4OdvJRIvMFICC26SItkhltr2eeWiUbxG0SMnDWw
         Ke8pGnONVXKmIMUM8qBsQIsfH3oVKEs91tNO7ONuc2az7qH4KUVKpSbRCQtEjRVN4TDR
         p4ZjCYnkQVKyycuejXaPE6Qa8BmQLsmNmi1I8LWeIWpd0obvn1ShYDGweVaS5hre0Ni4
         xi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715938769; x=1716543569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc2uBF5T8zF0ET39Oe1WycC/ZOj2j52tx2g3ICPIqhc=;
        b=U+WA/auREFL/IgxbVVycvuK+WhYKUcDt3Qm1Ee/EqHndA3i4k9FJvfgK0WfI79ItPB
         Uhtwsir3CuMTyXGQt+Kf7CganxCfe6xsHEHJ8kmzfkYqvH4pB+MsGRn2pVAd+WIROPS5
         rjm6es0hbX5jXlIJRV3YXpTA+CopwacQmIoP9zQxmvSXGA6uXa+O+YxppXcnuxc8DaiC
         dkBBWGhKyaRxq4f9geiIfUpjwbScgutyp7zziYSufjoESqs6XpcUPJfHFVXZts4tdenr
         wBLHAkoYMN0U32JQUfYJNLJcOAbCt+JUmMAMLnwGjROqolMZyCfjmhtIAj0ruVr59kRa
         pECg==
X-Forwarded-Encrypted: i=1; AJvYcCWipro9a0kxW93lxofLqT7lvlDes1qtMwfr+oZYuFb/hgADc/fqttPlWx9KH4RzJk8o92ZRYGgR2Xx5bw3HFrKJ91zAQs2Bcmp+KRIhh8v0TKW855xAxWPaGmzYXPLLpgZBKn9rTMaCrA==
X-Gm-Message-State: AOJu0YxJrXK6Pm2EoCw08OOzNc38MOhaZTqlxcop9lbEzNbVpYINGlIV
	T/xkIrpwG6Rup7bibPZSB7+ua+BPqc9lKoRF84qXTYKyrvRxVt1H
X-Google-Smtp-Source: AGHT+IFPhSxDqxZRvQG9PjdOXJJT7QyE9XyM8BeWhaaq1lU2bP5iBoGBO8qiVU1mcasmMzIpmmILgA==
X-Received: by 2002:a05:6a00:2195:b0:6ec:db05:36c3 with SMTP id d2e1a72fcca58-6f4e029bb2bmr21169676b3a.4.1715938768667;
        Fri, 17 May 2024 02:39:28 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2a77sm14883698b3a.144.2024.05.17.02.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:39:28 -0700 (PDT)
Date: Fri, 17 May 2024 17:39:22 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: Norbert Manthey <nmanthey@amazon.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240517093922.GA337309@rigel>
References: <20240517090904.22812-1-hagarhem@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517090904.22812-1-hagarhem@amazon.com>

On Fri, May 17, 2024 at 09:09:04AM +0000, Hagar Hemdan wrote:
> Users can call the gpio_ioctl() interface to get information about gpio
> chip lines.
> Lines on the chip are identified by an offset in the range
> of [0,chip.lines).
> Offset is copied from user and then used as an array index to get
> the gpio descriptor without sanitization.
>
> This change ensures that the offset is sanitized by
> "using array_index_nospec" to mitigate any possibility of speculative
> information leaks.
>

This could better describe the problem.  I'm still not 100% sure I
understand it, so it would be great if the comment could clarify it,
specifically what "speculation leaks" means.

And when referencing functions use (), so array_index_nospec(), rather
than quotes.

> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
>
> Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")

This is not the correct commit(s) - the bug would've been present in the
character device uAPI since it was first added.
In fact two out of three places you patched in v1 pre-date this commit.

> Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
> ---
> v2: call array_index_nospec() after the bounds check.
> ---
>  drivers/gpio/gpiolib.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fa50db0c3605..b58e4fe78cec 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -17,6 +17,7 @@
>  #include <linux/list.h>
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
> +#include <linux/nospec.h>
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/seq_file.h>
> @@ -201,7 +202,7 @@ gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
>  	if (hwnum >= gdev->ngpio)
>  		return ERR_PTR(-EINVAL);
>
> -	return &gdev->descs[hwnum];
> +	return &gdev->descs[array_index_nospec(hwnum, gdev->ngpio)];
>  }
>  EXPORT_SYMBOL_GPL(gpio_device_get_desc);
>

That makes more sense to me, so I no problem with the code change.

Cheers,
Kent.

