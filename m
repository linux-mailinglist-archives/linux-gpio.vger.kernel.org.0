Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A63228B582
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 15:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbgJLNHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 09:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729521AbgJLNHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 09:07:47 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B202C0613D0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 06:07:47 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id e10so13468814pfj.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/a7wbaJ04JD0bcRFVWoqvejOOmYpFcxP+OS4nrzlEl8=;
        b=fc4z71dA/v9Ot85BZ0nS16yLb5fqh5Byifjuir7xyXuAWMcHAk0wOdyPGDdbtoMi9j
         FOnw6ZSV075GQLmnw3BoZdgDFi6mBnnm8x7/MRXSfTgkOf0Oe8cNN8FkOBUWMaJNVGfd
         4ifUsr58T3BCJ0fBw7kOO8Oq/YaOyf+yLfIFNAEqfTok8aPTBRAoxiGPETPEgZfzjc07
         /NCnjmi6+xiwmGqD/V/WNobzmOkmvrJ/CcqUqOFlmHTYG0Y5hA6+yEEVX4plKPk0JCJ9
         ZPZvmotuChBIUPxpLjhBL4iG9XMikljJo85L9ThQch38MJB516m5txBxMbEvLbF/8quc
         g60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/a7wbaJ04JD0bcRFVWoqvejOOmYpFcxP+OS4nrzlEl8=;
        b=Hzr5JT7k11JJJzu9B/sybyN5ZXXY/37RDbZocRWOXsdQ2JGHUQ3RfpGTahLoMfLpp7
         3LldgnPag+XY8mr987mIR/4ELObHiuq+npwhjloMsba9U2+giYpduMwb1xdPWemRprBT
         SPyjuUBIgNtBWlcxbOnoUaKmqljJlY5rvv+Vco1dvZWiRYgVp+PmKJ4Erq3o8i+j2ca9
         5AAiAtRJbX0OkBV6x76gKH5XTPjZO+XykWzm8oibIvOoc4NO1aBqGMXKpDji5StcEMXU
         DpYLR+TLXQ0u07q+vtwXKMBukbHf8Q6iVsA/ynBlG6EMOyVUVIN8rS5qxtmafHfJBMrT
         B5BA==
X-Gm-Message-State: AOAM531CyoyBBgxuH3jotK2vYvey8MjxorVdZPw1T97q9lActR3G8U56
        G48LHd4/bfmrgN0ng4Gatfg=
X-Google-Smtp-Source: ABdhPJxy1YYUBWUC3dpiRZEbDtUVGiOxxNYFZhNfI2Bug4tt5J3/sEvG7MwzroC1sxx4zvPkRxCo/Q==
X-Received: by 2002:a63:2148:: with SMTP id s8mr13692569pgm.252.1602508066920;
        Mon, 12 Oct 2020 06:07:46 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id b21sm12723293pfb.97.2020.10.12.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 06:07:46 -0700 (PDT)
Date:   Mon, 12 Oct 2020 21:07:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Switch to use
 compat_need_64bit_alignment_fixup() helper
Message-ID: <20201012130741.GA58711@sol>
References: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 08, 2020 at 04:41:05PM +0300, Andy Shevchenko wrote:
> The new compat_need_64bit_alignment_fixup() helper allows to avoid
> ugly ifdeffery in IOCTL compatible code. Use it in GPIO cdev code.
> 

I'd re-arrange that checkin comment to

"Use the new compat_need_64bit_alignment_fixup() helper to avoid
ugly ifdeffery in IOCTL compatibility code."

but otherwise all good.

+1 on the deuglification, and it still works too.

Tested-by: Kent Gibson <warthog618@gmail.com>

> Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
> Depends-on: cc7886d25bca ("compat: lift compat_s64 and compat_u64 to <asm-generic/compat.h>")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: removed lineevent_get_size() completely, fixed typo in commit message
>  drivers/gpio/gpiolib-cdev.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e9faeaf65d14..192721f829a3 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1479,21 +1479,10 @@ static __poll_t lineevent_poll(struct file *file,
>  	return events;
>  }
>  
> -static ssize_t lineevent_get_size(void)
> -{
> -#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
> -	/* i386 has no padding after 'id' */
> -	if (in_ia32_syscall()) {
> -		struct compat_gpioeevent_data {
> -			compat_u64	timestamp;
> -			u32		id;
> -		};
> -
> -		return sizeof(struct compat_gpioeevent_data);
> -	}
> -#endif
> -	return sizeof(struct gpioevent_data);
> -}
> +struct compat_gpioeevent_data {
> +	compat_u64	timestamp;
> +	u32		id;
> +};
>  
>  static ssize_t lineevent_read(struct file *file,
>  			      char __user *buf,
> @@ -1515,7 +1504,10 @@ static ssize_t lineevent_read(struct file *file,
>  	 * actual sizeof() and pass this as an argument to copy_to_user() to
>  	 * drop unneeded bytes from the output.
>  	 */
> -	ge_size = lineevent_get_size();
> +	if (compat_need_64bit_alignment_fixup())
> +		ge_size = sizeof(struct compat_gpioeevent_data);
> +	else
> +		ge_size = sizeof(struct gpioevent_data);
>  	if (count < ge_size)
>  		return -EINVAL;
>  
> -- 
> 2.28.0
> 
