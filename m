Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F89D388314
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 01:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhERX0R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 19:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhERX0Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 19:26:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A4CC061573;
        Tue, 18 May 2021 16:24:58 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id c17so8578018pfn.6;
        Tue, 18 May 2021 16:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FTF5xfQUi9rq73u8UhSiFIg3U+v2ywpSRf/wbD9ZbIs=;
        b=Kic7eSJyxdf5rrMmuTri/4ZD+gAmSKGSaTH6uNqOKCj8oUeYcRMHuHWUDVvb37AzBq
         9KprYsGbwHIkvRKo/va/QOpomDqphxZSfX7Y5gzKQzOMzTDH6aqG2vJEGlDLeM7/p0v5
         jbiJPrf5SoO7PrDfThUd5sURTPEnzu//9mtTv0MKVbnsMSb6GzUBWVHv41eRrE4XNVx8
         /vP0w2PwxzZLpvijs26vP/Ob1PaF38fwxciasZ8w3n9W01iYz75U5woX6wpOPMpV7H7D
         53SAeI0AXrbGs+RnhPWvO2R63pjvI/EeZggM85LD4rH8JPuNfrke6rSm9hy9RYhjjEDb
         bSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FTF5xfQUi9rq73u8UhSiFIg3U+v2ywpSRf/wbD9ZbIs=;
        b=aC+fZ+esRtDIocOti0EwZmx4su2IbsaFfLCIi/xLfmKXypAPh89gITm1naWpoeCnWF
         5P72VfjIchDUo/tM+Nc+6uv4C9cc1fUx2NS0REETiowS4QPM1L/gQ7bZcDcGo8ymDhnZ
         JQygMQrtPe5ZF0/RZRdsHZoAFn+vKDzYezS3qsB63kqDw4lROkEnuIGUfcFMl9xCDiyX
         c7dl6W/OHgstH6uSlh+fivVs9trRKbdWz8TAgwaUCyqmpENtL/Hl5Iu10k4fSk1KU3Xi
         t1JrudhREQn1fFdL9siCVxwQKzfpkwmQjs1Uber5gI/El+KyB/S3anWZcsXXuuEGYPLy
         h+MQ==
X-Gm-Message-State: AOAM532p/Tdh4nfWYPp82ej9ClKNDkH7Xlglbg/J22TMh0Eet+Q2oBK0
        xEGv/Vgi4lGHghX3ev3jxnk=
X-Google-Smtp-Source: ABdhPJzFn9Y4VXMN6hXKO0lmhrVWfnhknQd0nvF3ILFEkC/6+qrXXNAT8im59T5o/UGocYWNt7u/fg==
X-Received: by 2002:a65:6844:: with SMTP id q4mr7535519pgt.224.1621380297618;
        Tue, 18 May 2021 16:24:57 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id l126sm13859362pga.41.2021.05.18.16.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 16:24:56 -0700 (PDT)
Date:   Wed, 19 May 2021 07:24:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to
 user space
Message-ID: <20210518232451.GA7362@sol>
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
> Currently it's possible that character device interface may return
> the error codes which are not supposed to be seen by user space.
> In this case it's EPROBE_DEFER.
> 
> Wrap it to return -ENODEV instead as sysfs does.
> 
> Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> Reported-by: Suresh Balakrishnan <suresh.balakrishnan@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 1631727bf0da..1d8f66880d63 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -331,8 +331,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  		}
>  
>  		ret = gpiod_request(desc, lh->label);
> -		if (ret)
> +		if (ret) {
> +			if (ret == -EPROBE_DEFER)
> +				ret = -ENODEV;
>  			goto out_free_lh;
> +		}
>  		lh->descs[i] = desc;
>  		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
>  
> @@ -1379,8 +1382,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  		}
>  
>  		ret = gpiod_request(desc, lr->label);
> -		if (ret)
> +		if (ret) {
> +			if (ret == -EPROBE_DEFER)
> +				ret = -ENODEV;
>  			goto out_free_linereq;
> +		}
>  
>  		lr->lines[i].desc = desc;
>  		flags = gpio_v2_line_config_flags(lc, i);
> @@ -1765,8 +1771,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  	}
>  
>  	ret = gpiod_request(desc, le->label);
> -	if (ret)
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			ret = -ENODEV;
>  		goto out_free_le;
> +	}
>  	le->desc = desc;
>  	le->eflags = eflags;
>  

You immediately revert this patch in patch 2.
My understanding is that is not allowed within a patch set.
Why split the patches instead of going direct to the new helper?

Cheers,
Kent.
