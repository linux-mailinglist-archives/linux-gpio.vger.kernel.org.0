Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C8526996F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 01:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINXFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 19:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgINXFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 19:05:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199BFC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 16:05:33 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id u3so723882pjr.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=koUM6TLL4gOHg6wzp/rripQvyzanoQbJbQAJdMuHN1w=;
        b=O7SbNGYBuBSAbjmkpkkRSP6P25VtzF5ZgvKJjEOjzUc8OBdmDa9qhBU/zGvGSzZiB3
         VyN41XTi61F4KlF59rbH60gDg86dhyfTl1RaSSoD5Nz/v3hwblwXoTqHkM+WZwyCd+WI
         WC5iDYnoUyCskt4NCDObOZ5NAGVJg2L/TCzaja/nazxkp7BLMjCGSLgW9suSzhAOORF/
         IgxNk+CzMvXLJ8DSpV/rW7FcKEuKe6ecO3stObf2O/NM0b7vR7oTulsAqCAcHfctJY1h
         S02LIvxi3UleCbaP10iEIwgmT+EA96X1JcBPWNF6SRd8bazrp9S8kFwffMxNUnYb5sf1
         umaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=koUM6TLL4gOHg6wzp/rripQvyzanoQbJbQAJdMuHN1w=;
        b=sCFtXxpkYW+lMs6WvfNwAfcclYTkQSLEyqdKH6m9res4g4vT35HAI7SCaaQbUh6x56
         QflA0GEIwLvAQgpbx8D9PI0m5u9jwSwld+GlKxfFuB7d7uAPibvNpS1/4mBK6PFg4eE2
         1GHT2lfzvORgSTskELcVTH5V0PeAyTteb9IDCv/0i22MtmPVbGaZlANCGY9kvd1osk3U
         9p3OZLzkhs+6NrpSGR2tT1VFpd9WhfpV255pKypt5PU223geCXZ5d4v5FoAH31d+xhSX
         QwTggxHCbKZei4p45lb4LRVv+4cRAqjNeeU3hsYLqUB51zLHbQlPefjavzJqv9gJWchY
         i5VA==
X-Gm-Message-State: AOAM530le6LRC5OurH3iqVO7UqhH9w6E+6cULll8iNIk9qHxBURjm7hP
        NuvA8pCG6Ua/Y419lguBzE8=
X-Google-Smtp-Source: ABdhPJzglnb+mYqdXlDjtBG39EanfjAH+SJftTRg5hfgUISSBuidrtYG+8ST1I9vSl0yhKDD94c2qw==
X-Received: by 2002:a17:902:7b82:b029:d0:89f3:28d3 with SMTP id w2-20020a1709027b82b02900d089f328d3mr16910543pll.15.1600124732341;
        Mon, 14 Sep 2020 16:05:32 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id q4sm11125287pfs.193.2020.09.14.16.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 16:05:31 -0700 (PDT)
Date:   Tue, 15 Sep 2020 07:05:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200914230526.GA4138@sol>
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 05:37:43PM +0300, Andy Shevchenko wrote:
> The introduced line even handling ABI in the commit
> 

s/even/event/

>   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> 
> missed the fact that 64-bit kernel may serve for 32-bit applications.
> In such case the very first check in the lineevent_read() will fail
> due to alignment differences.
> 
> To workaround this introduce lineeven_to_user() helper which returns actual
> size of the structure and copies its content to user if asked.
> 

s/lineeven_to_user/lineevent_get_size/

and

s/structure and copies its content to user if asked/structure in userspace/

> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: moved to just calculate size (Arnd, Kent), added good comment (Arnd)
>  drivers/gpio/gpiolib-cdev.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e6c9b78adfc2..95af4a470f1e 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -423,6 +423,21 @@ static __poll_t lineevent_poll(struct file *file,
>  	return events;
>  }
>  
> +static ssize_t lineevent_get_size(void)
> +{
> +#ifdef __x86_64__
> +	/* i386 has no padding after 'id' */
> +	if (in_ia32_syscall()) {
> +		struct compat_gpioeevent_data {
> +			compat_u64	timestamp;
> +			u32		id;
> +		};
> +
> +		return sizeof(struct compat_gpioeevent_data);
> +	}
> +#endif
> +	return sizeof(struct gpioevent_data);
> +}
>  

It can return size_t now.

>  static ssize_t lineevent_read(struct file *file,
>  			      char __user *buf,
> @@ -432,9 +447,20 @@ static ssize_t lineevent_read(struct file *file,
>  	struct lineevent_state *le = file->private_data;
>  	struct gpioevent_data ge;
>  	ssize_t bytes_read = 0;
> +	ssize_t ge_size;

Similarly here.

>  	int ret;
>  
> -	if (count < sizeof(ge))
> +	/*
> +	 * When compatible system call is being used the struct gpioevent_data,
> +	 * in case of at least ia32, has different size due to the alignment
> +	 * differences. Because we have first member 64 bits followed by one of
> +	 * 32 bits there is no gap between them. The only problematic is the
> +	 * padding at the end of the data structure. Hence, we calculate the
> +	 * actual sizeof() and pass this as an argument to copy_to_user() to
> +	 * drop unneeded bytes from the output.
> +	 */

s/problematic/difference/

> +	ge_size = lineevent_get_size();
> +	if (count < ge_size)
>  		return -EINVAL;
>  
>  	do {
> @@ -470,10 +496,10 @@ static ssize_t lineevent_read(struct file *file,
>  			break;
>  		}
>  
> -		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
> +		if (copy_to_user(buf + bytes_read, &ge, ge_size))
>  			return -EFAULT;
> -		bytes_read += sizeof(ge);
> -	} while (count >= bytes_read + sizeof(ge));
> +		bytes_read += ge_size;
> +	} while (count >= bytes_read + ge_size);
>  
>  	return bytes_read;
>  }
> -- 
> 2.28.0
> 

Cheers,
Kent.
