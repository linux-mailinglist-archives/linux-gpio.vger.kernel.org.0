Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841801AAF48
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 19:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416507AbgDORPZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 13:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1416503AbgDORPV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 13:15:21 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD6EC061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 10:15:21 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t11so3249516lfe.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 10:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pTPuHMxMX65d3OIrnqN5S3dQ4EAvvaxpzpFB8yx8UH8=;
        b=dlxdZbiYTKvmbaOCtfqyXIBCWbVt72AAC7xDDQ3FrOpmYA4faSu1e7yJHv0OwC7fp8
         pRdlZj7Pu6yk6B4mzWSR6vRuztwTq55aQs1/wur8kjT7GJ4vN55YQ8JrEqo2voNWf7ob
         +DpgpCa21y6Y2iPZ6HTPi7Z/hVg3o15sutfX/lbGUre9ePLbS7Livk5dCfBWt7FCrDDi
         6kqM2+GK6yA9jxSUbO7b1hqIHP4EVV2FPnixjKrY6fOH5vSlss3yd+Sykm0CqiPrqJM9
         g3nzIw4HfC1XjXgx81BfcFMlilbfw0klhXYdOX6ufm5XLVvTspY4sQJSjXLuIlpJVfZo
         C+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pTPuHMxMX65d3OIrnqN5S3dQ4EAvvaxpzpFB8yx8UH8=;
        b=hq5yeyO6OgNnOE/4VbdTFzsNfZXVz8UQD3gDsKGn2WUzmjdS4qeYcFngj9sfI6K/EG
         nIpap23g0EEAEbm2MTBCnQv3rke6qdd3DgzEBHEnfi2ka6sxcZqTTv4NEemAU5D4QxZt
         mu7f4DQvnz/paMrPyvXoB8Jnv9Vpli5MapHGJ/DuJVECuz9w2ZDGS9FRY4BGr9NbQOy7
         L5ZFryTQqmCWObKj33TBkrK/hySUDnBqVnmiB+AdVixfBgnKeR+6AHmE1W8gVz2oPblA
         LUyIm87gwhKVv9P3ifXmIorEoYjSDsu0zOXKRLc4ifS/xWR/adqso1y9IZWSWjQe7CGR
         UwkA==
X-Gm-Message-State: AGi0PuaUAhamnvUi24l4VKS3atOqMHpnWgmmr9mplZ3eE6Sm+Z1t54ug
        S+6QXf6O4FjelExq8kb20LY=
X-Google-Smtp-Source: APiQypKUqzerR/KQ29ssH9TMn7RThJIQlGFdCYrHWGkQr50Mo3UE9wVkzV6sPoCK9HYtYo2KHxZ6ZA==
X-Received: by 2002:a05:6512:1082:: with SMTP id j2mr3719049lfg.53.1586970919576;
        Wed, 15 Apr 2020 10:15:19 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id y199sm13338225lfa.80.2020.04.15.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:15:18 -0700 (PDT)
Date:   Wed, 15 Apr 2020 20:15:16 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
Message-ID: <20200415171516.cugbzhvjua6cygnq@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 05:15:34PM +0300, Andy Shevchenko wrote:
> In some cases indentation makes code harder to read. Amend indentation
> in those cases despite of lines go a bit over 80 character limit.
> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 84c971e0adf0..a09332d9c7fe 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -437,7 +437,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		}
>  	}
>  
> -	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
> +	for (hwirq = 0; hwirq < ngpio; hwirq++)
>  		irq_create_mapping(gpio->domain, hwirq);
>  
>  	port->gc.to_irq = dwapb_gpio_to_irq;
> @@ -453,7 +453,7 @@ static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
>  	if (!gpio->domain)
>  		return;
>  
> -	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
> +	for (hwirq = 0; hwirq < ngpio; hwirq++)
>  		irq_dispose_mapping(irq_find_mapping(gpio->domain, hwirq));
>  
>  	irq_domain_remove(gpio->domain);
> @@ -478,10 +478,9 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  		return -ENOMEM;
>  #endif
>  
> -	dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_STRIDE);
> -	set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_STRIDE);
> -	dirout = gpio->regs + GPIO_SWPORTA_DDR +
> -		(pp->idx * GPIO_SWPORT_DDR_STRIDE);
> +	dat = gpio->regs + GPIO_EXT_PORTA + pp->idx * GPIO_EXT_PORT_STRIDE;
> +	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
> +	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
>  
>  	/* This registers 32 GPIO lines per port */
>  	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
> @@ -582,17 +581,13 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  
>  		if (fwnode_property_read_u32(fwnode, "reg", &pp->idx) ||
>  		    pp->idx >= DWAPB_MAX_PORTS) {
> -			dev_err(dev,
> -				"missing/invalid port index for port%d\n", i);

> +			dev_err(dev, "missing/invalid port index for port%d\n", i);

What about shortening the message text to fit the 80 chars per line rule?
I suppose the "missing" word could be omitted.

>  			fwnode_handle_put(fwnode);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios",
> -					 &pp->ngpio)) {
> -			dev_info(dev,
> -				 "failed to get number of gpios for port%d\n",
> -				 i);
> +		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {

> +			dev_info(dev, "failed to get number of gpios for port%d\n", i);

The same here. For instance "no snps,nr-gpios found for port%d" would work here.

>  			pp->ngpio = 32;
>  		}
>  
> @@ -743,8 +738,7 @@ static int dwapb_gpio_suspend(struct device *dev)
>  			ctx->int_deb	= dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
>  
>  			/* Mask out interrupts */
> -			dwapb_write(gpio, GPIO_INTMASK,
> -				    0xffffffff & ~ctx->wake_en);

> +			dwapb_write(gpio, GPIO_INTMASK, 0xffffffff & ~ctx->wake_en);

Hm, do I need some rest and missing something or the &-operation with 1s here
does nothing seeing the operands data types have the same width?

(the change introduced by commit 6437c7ba69c3 ("gpio: dwapb: Add wakeup source support"))

-Sergey

>  		}
>  	}
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> -- 
> 2.25.1
> 
