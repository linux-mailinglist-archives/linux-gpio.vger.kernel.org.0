Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C975F26573B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 05:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgIKDFs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 23:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgIKDFr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 23:05:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1111C061573
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2020 20:05:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk9so1005840pjb.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2020 20:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m8+m6zOx5J2uNlxnehafyJOeCgobSsYVVtaXGYfvVYk=;
        b=utK/x0sdI8xkTCPA9gl/OSJXj+wfdOyeOqIhTvygpwMGXeq4RkkNhNmV4ExuDn9fDY
         fEP6dxjSnfhScfL4g93U+hBzUQftJgG1msZfa82glcvvA/AozgtxGNBz7hMf+QkwFQB5
         gZjZ7KOMV4uz1SsqUkg6q1UytFYLZnKc5WT5bOW8svri8ZOSWMBNO0l5I4ydH6KUbXTx
         CUr0q1YwjDcEAKFXkk/EiNHvwAcyHYBskANnG8eTbDHzFrby0nXb+s0rrHSsfKmmz4vw
         uD6jlsJdFLxZ+yHKOS4ys0ljWF9dSYN3IKxxpOz0w/Wp2RKV9PGYgg41LVd+kvXA9G9V
         0caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m8+m6zOx5J2uNlxnehafyJOeCgobSsYVVtaXGYfvVYk=;
        b=ZTcismTtXv2eRdI5PpB9dCdVBeEeoLJX0xukSFgpN0r9FoO8DjV1OpqxL/1iGR8P5I
         k6970whgtr+irhx2lWtnlCK+itrjtbaXlGjOH1TB9Zl63fCiMBQbCo3+R1qsqI9Z35FD
         UyVqngJShMaRR69tQDuG1BFfH7UvSg4KOjaUz4s8JiV2wUNftZNsNOE4OPlmahiE6k6z
         hm/SoYpunShVT06DgD63KYKx19WI3UEJ7OrvJ+KiOkETP+/JFWPN3+neq1VwBH/6TiZS
         3DhZVaZgZWEUOODrXnHD8rUZN87f4v1A/GeDDJBi5K2hC+6F+5h8Ii+B4oCcvoFlUD+g
         1Low==
X-Gm-Message-State: AOAM531xYs3afy08alaT5ijTiZSUrYWgeVNpb745l8Mi+AtU7W3w/q/1
        B0KYFCgXYWq/esQRQ2WdfMI=
X-Google-Smtp-Source: ABdhPJw3vQqdsj8W5V3fJFUEFankuqgNZZ58miuJAA+m23eVlsbfdKAurT+2O8wQ5+5TzH7iiBGk3A==
X-Received: by 2002:a17:90a:f83:: with SMTP id 3mr262704pjz.132.1599793545811;
        Thu, 10 Sep 2020 20:05:45 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id s19sm490751pfc.69.2020.09.10.20.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 20:05:44 -0700 (PDT)
Date:   Fri, 11 Sep 2020 11:05:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200911030539.GA574097@sol>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:
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

And again here.

> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 41 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e6c9b78adfc2..a6a8384c8255 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -423,6 +423,33 @@ static __poll_t lineevent_poll(struct file *file,
>  	return events;
>  }
>  
> +static ssize_t lineevent_to_user(char __user *buf, struct gpioevent_data *ge)
> +{
> +#ifdef __x86_64__
> +	/* i386 has no padding after 'id' */
> +	if (in_ia32_syscall()) {
> +		struct compat_ge {
> +			compat_u64	timestamp __packed;
> +			u32		id;
> +		} cge;
> +
> +		if (buf && ge) {
> +			cge = (struct compat_ge){ ge->timestamp, ge->id };
> +			if (copy_to_user(buf, &cge, sizeof(cge)))
> +				return -EFAULT;
> +		}
> +
> +		return sizeof(cge);
> +	}
> +#endif
> +
> +	if (buf && ge) {
> +		if (copy_to_user(buf, ge, sizeof(*ge)))
> +			return -EFAULT;
> +	}
> +
> +	return sizeof(*ge);
> +}
>  

The dual-purpose nature of this function makes it more complicated than
it needs to be.
I was going to suggest splitting it into separate functions, but...

Given that struct compat_ge is a strict truncation of struct
gpioevent_data, how about reducing this function to just determining the
size of the event for user space, say lineevent_user_size(), and
replacing sizeof(ge) with that calculcated size throughout
lineevent_read()?

>  static ssize_t lineevent_read(struct file *file,
>  			      char __user *buf,
> @@ -432,9 +459,12 @@ static ssize_t lineevent_read(struct file *file,
>  	struct lineevent_state *le = file->private_data;
>  	struct gpioevent_data ge;
>  	ssize_t bytes_read = 0;
> +	ssize_t ge_size;
>  	int ret;
>  
> -	if (count < sizeof(ge))
> +	/* When argument is NULL it returns size of the structure in user space */
> +	ge_size = lineevent_to_user(NULL, NULL);
> +	if (count < ge_size)
>  		return -EINVAL;
>  
>  	do {
> @@ -470,10 +500,11 @@ static ssize_t lineevent_read(struct file *file,
>  			break;
>  		}
>  
> -		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
> -			return -EFAULT;
> -		bytes_read += sizeof(ge);
> -	} while (count >= bytes_read + sizeof(ge));
> +		ret = lineevent_to_user(buf + bytes_read, &ge);
> +		if (ret < 0)
> +			return ret;
> +		bytes_read += ret;
> +	} while (count >= bytes_read + ge_size);
>  
>  	return bytes_read;
>  }
> -- 
> 2.28.0
> 

Is patch 2 in any way related to this patch?

Cheers,
Kent.
