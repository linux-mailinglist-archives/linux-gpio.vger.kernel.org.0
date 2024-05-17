Return-Path: <linux-gpio+bounces-6429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38B8C8681
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 14:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1362833EE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 12:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168CA4EB55;
	Fri, 17 May 2024 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g93ddjKa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5A481C7;
	Fri, 17 May 2024 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950158; cv=none; b=lsMJ3cKFqbeydFQd4etv9N6CUHSqJCWWyN88rHWZN67NJ8/fWd4++u5PxUf7GwjwG0pdHF8ZgKpwAK9l4RwbdJ106ELLR81S+/VS2LsFaVob6467iqC+SIRLk/zFUAxvM94p8ciPV+Ee/cSJEaV9XLymhHISDmsLw8lUgEkXfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950158; c=relaxed/simple;
	bh=dFdaHos0UdTJQEbHjqSGh82k3xs2CBpBqd+kZi11i8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPtUrxiQrbsgKv4XeEQK2te7u9uZWU+jHh6Dz04tw+oxnVOEI9/WBxbtI+wLW3tNIfJSam+tFfNTj8NHIsLJvQW7uFHi8WS8cvfGNhoD2+radt0juEFWJMbe6kikjLKKmus2lbt3DiBXeQ8xyaOWRElzdlPrzgq6HYkE873OaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g93ddjKa; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2b9cdbd6da9so926857a91.1;
        Fri, 17 May 2024 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715950157; x=1716554957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfAjld03szr0Dl9MxPW24cnUDUMLGuL4kllMrODJJg4=;
        b=g93ddjKaCTQAVH5AsNVJu8SB19p+8X8UY1vzcIXIOI6vUr/b1tE9nKfuGoRIrKqMS+
         b7EVC72l4ndE7dA5FvfzeSaxGf/4Nib1W9YFwtasI8WqLcfIB2+AqYgkxfxZ5lSLkmTw
         q6f73kRRKjcBhbpRYuoUfCB1OlSH+RfcA1i0AIj0xcP3pDqH0+Y6p0wbAdSzEn9l/ffa
         /s08TFsFbR+Zw/eXs5MVZSvHy1f7zV4WhTlUpIvw0sPVS2ZVQ8zibXlqsxb+iSEk0ImQ
         hhoP6hlYlCPvyIw+NOJA9QqamHGEw9YcbXqj+qL7KK7qavw+oMTpZO0iwY36h36UWHSE
         Dk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715950157; x=1716554957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfAjld03szr0Dl9MxPW24cnUDUMLGuL4kllMrODJJg4=;
        b=DjqSevAX2uhjjyLiqbSWZ78Gg2gPFdzx9yCZEMWsF5TjquSzl2qxzN8WmosqyhzXC3
         je9s+4kshb1909h3RZwVp0lQMVvUPyiplsmdJMHXQNTddZkmZrD9Eoz1qgwWlucVt8Fu
         czROL/FHsom0Dl9KP5vu2CKkOzAeAhhqHAhY/CRPdCySuJkA6Bc05OpaO8tqwe4n2W68
         WRHrLOsUX1xIt5BZ/tPqTEEgI7dGfVWR5IE4+inYNyd4f1CURAjGy/h6eUFMVViARMOg
         wCWyv/wbM9UQumSX2YBzEht8gEt7jpmmNrAUMnibZtzvPviK5rcQy47IPq5/36pElZei
         KZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVNs+x1ZYicKUgG3zCl/2RyxkMREFQMeQo8LdCaUTmEKEkBLfNWzhcKi5Mw4enCVRFB5Cmb6UUc8GGrk9IjrvgV4QuBKpG6JvZaJ827nKP3hfFLjCY3L+JZZCY9ka/ATYPnX+XNnvtReQ==
X-Gm-Message-State: AOJu0YwG2k0Xe4noWSRg3FXrWrTkoil8+kh0g7bT8HvvUm06OfVza+kP
	iDbTJLLne3NkF1iWZbuOgoYeQcv4vSoRB1h20vH1h2OQXWAjCY4m
X-Google-Smtp-Source: AGHT+IGJ+sh/UuHCqsSKSmlt2bfJowQnq7DLmIOltX9wlrRABLAulYmoELkb4dnfkZLe7fbfJDMA7g==
X-Received: by 2002:a17:90a:a108:b0:2b0:e497:56f2 with SMTP id 98e67ed59e1d1-2b6c70faab7mr32624976a91.10.1715950156637;
        Fri, 17 May 2024 05:49:16 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b6710565e3sm15392349a91.11.2024.05.17.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 05:49:16 -0700 (PDT)
Date: Fri, 17 May 2024 20:49:11 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: Norbert Manthey <nmanthey@amazon.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240517124911.GA435070@rigel>
References: <20240517101227.12118-1-hagarhem@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517101227.12118-1-hagarhem@amazon.com>

On Fri, May 17, 2024 at 10:12:27AM +0000, Hagar Hemdan wrote:
> Userspace may trigger a speculative read of an address outside the gpio
> descriptor array.
> Users can do that by calling gpio_ioctl() with an offset out of range.
> Offset is copied from user and then used as an array index to get
> the gpio descriptor without sanitization in gpio_device_get_desc().
>
> This change ensures that the offset is sanitized by using
> array_index_nospec() to mitigate any possibility of speculative
> information leaks.
>
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
>
> Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")

I still don't think this Fixes commit is right, and that would impact
where this gets backported to, but Bart can weigh in on that.

Cheers,
Kent.


> Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
> ---
> v3: update the commit mesg
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
> --
> 2.40.1
>

