Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C721AB019
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 19:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440827AbgDORxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 13:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437449AbgDORxO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 13:53:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8C6C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 10:53:13 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h6so3375531lfc.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EbfsR42nuYqfxeWyLyKKeykYrRmBgeOrUICWoicNfFU=;
        b=mWGw3XbFjypT1bWtjIsgq+IsXzqc8jymimW2BCM7sawygNCwDfJTCAeZ2QlhbiT79H
         ESw+BIxuC7nN92Le/WwGqOP6Nt5V24o+FBgseeNv0jOnibPnebVoIaPHTlsV2sq+ubXk
         SuN6gxrjQIit52n0wOqfVVMpvt8e3QkJeyxQH93oNO8CJ7/2mHahqPd5ssD/oXRcZP3n
         ZCaiUCVpPYMWt75sxPoSg+QyFi6gu8nGhLWTfSsX5dX3wsLYcEbDp4c4UGtI9MKtx4+G
         0rKEccEVMia1cVUeUHemfcuYyfVxcucxlhuAXIP4h03bc8p1qHpXbBJXcFZk0dsIp3jI
         pL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EbfsR42nuYqfxeWyLyKKeykYrRmBgeOrUICWoicNfFU=;
        b=XUsxvOTqCbEO8cVheS/EPLaXb43AMh5H7zhRtmk8OgDLSe5GFr9WnhMIZjYb6+hwQn
         E/9EJJEaRdRW0FptmOxaZi3NFSE0E0Y2uxkmuXlZhD5EAgDl2CcdY/FSC9Q9yK0UC14D
         V9F4W8hW4rRq2DEKJIMC+MWvsgPdHIL04juzpgCyEM1UIE5SEv5ZM0KMgith7KZXLpyv
         lYSyVjKRhSOn7J1LsgJ1Sxinr8YZgJBpEwwM7pRD3SzJd71PdCPk+CVWgExkK2oWXBe/
         O84LoPpIJk/6jcu4LmCNyEbwzveLw5sbfKyOXxZbKnzDxIpDVYB9wl9dj/HGlH3SK5+w
         hwgQ==
X-Gm-Message-State: AGi0PuaDZTry3llZNbtFFFYqhumbbVHIV3Wm9rYB1vkNq0o/WWQkRIXl
        J4wLwunCAWndUn+H/5YpqiE=
X-Google-Smtp-Source: APiQypKrgGXN5RUIn73tsW0c+9pTy95IrSUwII2QkeNg2J7xSfii+drf4S9GJT4txxbVbNCifJ77WQ==
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr3768472lfe.96.1586973191864;
        Wed, 15 Apr 2020 10:53:11 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id z23sm12172479ljh.55.2020.04.15.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:53:11 -0700 (PDT)
Date:   Wed, 15 Apr 2020 20:53:09 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/14] gpio: dwapb: Convert to use IRQ core provided
 macros
Message-ID: <20200415175309.6l6skv7qsdjqsryi@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415141534.31240-9-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 05:15:28PM +0300, Andy Shevchenko wrote:
> IRQ core provides macros such as IRQ_RETVAL().
> Convert code to use them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 8b30ded9322a..4edac592c253 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -258,8 +258,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	irq_hw_number_t bit = irqd_to_hwirq(d);
>  	unsigned long level, polarity, flags;
>  
> -	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
> -		     IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> +	if (type & ~IRQ_TYPE_SENSE_MASK)
>  		return -EINVAL;
>  
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
> @@ -351,12 +350,7 @@ static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
>  
>  static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
>  {
> -	u32 worked;
> -	struct dwapb_gpio *gpio = dev_id;
> -
> -	worked = dwapb_do_irq(gpio);
> -
> -	return worked ? IRQ_HANDLED : IRQ_NONE;
> +	return IRQ_RETVAL(dwapb_do_irq(dev_id));
>  }

BTW Forgot to mention. Irrelevantly to this patch just so you know seeing
you are from Intel and this part is being utilized by the Intel Quark SoC.
dwapb_irq_handler_mfd() handler will cause a problem in RT-patched kernel
(I've seen such issue in another GPIO-driver). So if PREEMP_RT_FULL patch
is applied and the FULL-RT scheduler is enabled all interrupt handlers
specified by request_irq()-based methods will be handled by a kernel thread,
while generic_handle_irq() is supposed to be called from the atomic context
only (with interrupts disabled). As a result an ugly stack dump will be printed
to the kernel log by the next code:
https://elixir.bootlin.com/linux/latest/source/kernel/irq/handle.c#L152

A way to fix this is described in Documentation/driver-api/gpio/driver.rst

Regards,
-Sergey

>  
>  static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
> -- 
> 2.25.1
> 
