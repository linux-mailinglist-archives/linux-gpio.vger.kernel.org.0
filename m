Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2EB1AAE76
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 18:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416166AbgDOQhT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 12:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416090AbgDOQhQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 12:37:16 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2805C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 09:37:14 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so4422672ljd.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GoiYSyt2odyWGe0ZZIZ1DSCTGS4/UqBocVVYip+DhDc=;
        b=qqzhGhzbAHptANG0Nygm8g5D7Zq9osnHDzMY+/jgOaGoCIT1KIrhhzNJV3sqdDx3xj
         TZPLawP1QDET+GGF/skmYPAtKVOdzZw6DrdVjaYjq5fMczMLN9yUGlURy63rfF/I9tIr
         R/8/F11UjeUPIX8kfZbCmXm8Xa5d8+aTih8m+T6mzyOh+2RRPK5vh7vg43cz0DJZ4po+
         ZW2jrE6Hq9LsOdMjiq9xHn1KdT3xbHwW5UKBkHcHuaNCUqixsvbUD2jCMsh96GPI/xdS
         W37wxNJEig5EDJPm6RC4bpTKlVRp32l8IIWhngn7LAUdFOSRvi3gzkVv6XFQigd+11//
         2h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GoiYSyt2odyWGe0ZZIZ1DSCTGS4/UqBocVVYip+DhDc=;
        b=bzZnz890H4OuLQvPTyLLJIBfl8cH2Jk3wBpYG/+PC1Z7FCUG5NRctljXp6KlLuIzaP
         lBmZVYeW+OT1f1FZMjj91hx9y0oVUcq3uZZfIUvs1hPpXHFs5oKgPciqSbEZmymjNtUm
         6qIVSdzGdvmcn62gJ6sPoa9/RGSRbk3Pj3HVAYGXWSZ+FbwQKzVajPAsRvKCHGDrP/6P
         grelU6tMLFnhmC0fIoUaP/K/zXLiW1kjO/qlxCZUR1/ryHi8RxCGNCZhbkOzjiQCFrEh
         t+ipDHsn+6/ewTQEBC0FmRRZp4xOGY06lC5T/IOfMTmGyo2Yyx4ZsV2+zHzf5xB1XjYG
         3X7Q==
X-Gm-Message-State: AGi0PuYnXn8Io2f0DnRd7qa8ZaALUs27zCXr37D+bAsKzfBbot7SR+bL
        dwPI3HwwficJwklT6KZwqBs=
X-Google-Smtp-Source: APiQypJLckF0Thcj2Xnrbs6iHoKYWZ41zBjm8LrtYAakvVdrptr4K7ZgD4TDXJL7gXGtZqbEa9KS1A==
X-Received: by 2002:a2e:9acd:: with SMTP id p13mr3579513ljj.131.1586968633494;
        Wed, 15 Apr 2020 09:37:13 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id f21sm13075592lfk.94.2020.04.15.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:37:12 -0700 (PDT)
Date:   Wed, 15 Apr 2020 19:37:10 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in
 dwapb_configure_irqs()
Message-ID: <20200415163710.e26czil5abouujzu@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 05:15:33PM +0300, Andy Shevchenko wrote:
> The negative conditionals are harder to parse by reader.
> Switch to positive one in dwapb_configure_irqs().

Sorry as for me this modification is redundant. Yes, I know that if-else
statement in some cases better to start with positive expression to make it
a bit more clear, but in this case I'd leave it as is. First this rule is
applicable if both branches are more or less equal, but here I see the most
normal case of using the dt-based generic device, which doesn't declare the
IRQs as shared seeing it is selected by far more devices at the moment.
Second the non-shared IRQs case also covers a combined and multiple-lined
GPIO IRQs (chained cascaded GPIO irqchip), while the irq_shared clause have
only a single IRQ source supported. Finally If the code was like you
suggested from the very beginning I wouldn't say a word, but this patch seems
to me at least just moving the code around with gaining less than we have at
the moment.

Linus, Bartosz and other GPIO-ers may think differently though. Lets see their
opinion.

Regards,
-Sergey

> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 31d29ec6ab5c..84c971e0adf0 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -413,15 +413,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	irq_gc->chip_types[1].type = IRQ_TYPE_EDGE_BOTH;
>  	irq_gc->chip_types[1].handler = handle_edge_irq;
>  
> -	if (!pp->irq_shared) {
> -		int i;
> -
> -		for (i = 0; i < pp->ngpio; i++) {
> -			if (pp->irq[i] >= 0)
> -				irq_set_chained_handler_and_data(pp->irq[i],
> -						dwapb_irq_handler, gpio);
> -		}
> -	} else {
> +	if (pp->irq_shared) {
>  		/*
>  		 * Request a shared IRQ since where MFD would have devices
>  		 * using the same irq pin
> @@ -435,6 +427,14 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  			gpio->domain = NULL;
>  			return;
>  		}
> +	} else {
> +		int i;
> +
> +		for (i = 0; i < pp->ngpio; i++) {
> +			if (pp->irq[i] >= 0)
> +				irq_set_chained_handler_and_data(pp->irq[i],
> +						dwapb_irq_handler, gpio);
> +		}
>  	}
>  
>  	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
> -- 
> 2.25.1
> 
