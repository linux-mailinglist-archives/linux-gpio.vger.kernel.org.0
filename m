Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CFC3AD7A2
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jun 2021 06:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhFSEOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Jun 2021 00:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhFSEOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Jun 2021 00:14:04 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F157C061574
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 21:11:51 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id v13so5682125ple.9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 21:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=Jl0W1E+T79cuWaOOVMDL4OpuRn06uzU0wTXyYvHMGy4=;
        b=p9JaVTSTZKxmidIyn3LMv8wps6CMEjAj6GTAt9Dp+mJOTQkcLriiPk9vNPvr6OPfSg
         b4e0k1GVVcNnQn13MhsTO4az6Xas79YbJKjwypwfxk0e2HvYK4wxPKRWHSrhgXgo0J5N
         dgtFfb9aVdHuUGPWukwZtKG7uGKz0LP5HzAhBa2GSLc8bEpqPOYK6Bfuj6plteGYZr9o
         5rlpuLMtCZf5NGjh0m5BmdcM4hbRdAGS0m7KEdriVxgSDxB4OjwHzif8Eg0VZgklpysl
         6cx3sfDuG9fUhBepcLkv3fwlFAQzIG3IzILeEByp3JIefaRQ2Rdp3a7vXOr4zDCyNG1i
         mIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=Jl0W1E+T79cuWaOOVMDL4OpuRn06uzU0wTXyYvHMGy4=;
        b=pY8GLbzK2DeGNsof7yjRFLI9ZbdT+WCGe+2QxcV3LzvayJ1gA5dprXqE3XLSvXi4VG
         xNApaGbEIewJH7BhAcR2az5wE7zE6rRbOVp4PWFrctgUnj04d1iEi2wA9kAJN+0XJuMp
         0T19hIXGd8voPwN4f4pb3yDOGEBtu1K/8kY5NWO/vyTq2J8z+YYBJ3wL3I7/8XtbFE8I
         yqacicoZ26RC65Sn4Ilm/nFniJ7F2x2R0Dl/0f+m2gpbAVetKkQ+SeBRZEJWvx4IIcv8
         N5cr2NelSGdWVa7BSm+yJqYbD62z/L5gyZaRE11qFq62LrC/Xn5gdSGQZqQ3GfQRSB9F
         svfw==
X-Gm-Message-State: AOAM533Pe6084nEWUBPjREbDAGyKHmHV8ctqXsEe2vifL52IXdbQ+60f
        0vqWTLLi/YRU/aoYILCRuX8=
X-Google-Smtp-Source: ABdhPJyWKBMmq0N40tsGTwTARBAc10RznrWDo7Bi9ynlgPfu8dZjv6sAOCBKoPK+5asQi6/Ej2pVtQ==
X-Received: by 2002:a17:90a:7e0c:: with SMTP id i12mr25689964pjl.172.1624075910792;
        Fri, 18 Jun 2021 21:11:50 -0700 (PDT)
Received: from sol (106-69-169-160.dyn.iinet.net.au. [106.69.169.160])
        by smtp.gmail.com with ESMTPSA id w123sm2166780pff.186.2021.06.18.21.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 21:11:50 -0700 (PDT)
Date:   Sat, 19 Jun 2021 12:11:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Knezek <gabeknez@linux.microsoft.com>
Cc:     linux-gpio@vger.kernel.org,
        Gabriel Knezek <gabeknez@microsoft.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpiolib: cdev: zero padding during conversion to
 gpioline_info_changed
Message-ID: <20210619041144.GA15015@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624056311-6836-1-git-send-email-gabeknez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 18, 2021 at 03:45:11PM -0700, Gabriel Knezek wrote:

Probably should've been [PATCH v2], despite the subject rename.

And CC the maintainers (LinusW and Bart here) and past reviewers (Andy
and me).

> From: Gabriel Knezek <gabeknez@microsoft.com>
> 

A second From: header?  With a different address?
Perhaps you could pick one?
Neither git nor checkpatch.pl seem to mind, but it is odd.

> When userspace requests a GPIO v1 line info changed event, the kernel
> populates and returns the gpioline_info_changed structure. That structure
> contains 5 words of padding at the end of the structure that are not
> initialized before being returned to usermode:
> 

Avoid code snippets in checkin comments - try to stick to plain English.
So replace "the kernel" with "lineinfo_watch_read()" and drop the
snippets.

And "usermode" -> "userspace".

> struct gpioline_info_changed {
>                 struct gpioline_info info;
>                 __u64 timestamp;
>                 __u32 event_type;
>                 __u32 padding[5]; /* for future use */
> };
> 
> Which is used here in the lineinfo_watch_read routine:
> } else {
>                 struct gpioline_info_changed event_v1;
>                 gpio_v2_line_info_changed_to_v1(&event, &event_v1);
>                 if (copy_to_user(buf + bytes_read, &event_v1,
>                                                 event_size))
>                                 return -EFAULT;
> 
> Fix this by zeroing the structure in gpio_v2_line_info_change_to_v1
> before populating its contents.
> 

Make that "gpio_v2_line_info_change_to_v1()" as you are referring to a
function.

And maybe "Fix this by zeroing" to just "Zero"?

> Signed-off-by: Gabriel Knezek <gabeknez@microsoft.com>

You should retain the Fixes tag from v1 - it is important to identify
where this patch will need to be backported to.
And include at least the first twelve characters of the SHA-1 [1].

> ---
>  drivers/gpio/gpiolib-cdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index ee5903aac497..af68532835fe 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1865,6 +1865,7 @@ static void gpio_v2_line_info_changed_to_v1(
>  		struct gpio_v2_line_info_changed *lic_v2,
>  		struct gpioline_info_changed *lic_v1)
>  {
> +	memset(lic_v1, 0, sizeof(*lic_v1));
>  	gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
>  	lic_v1->timestamp = lic_v2->timestamp_ns;
>  	lic_v1->event_type = lic_v2->event_type;
> -- 
> 2.25.1
> 

Still good with this bit ;)

Cheers,
Kent.
[1] https://www.kernel.org/doc/html/v5.12/process/submitting-patches.html
