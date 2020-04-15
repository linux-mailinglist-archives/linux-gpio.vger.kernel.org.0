Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE08A1AA18F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897529AbgDOMmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2898181AbgDOMmq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:42:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AB0C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:42:46 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x23so2527638lfq.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ugh0fRZuhaEfXnQ8Vzyoe5R9ka3H4I0iPLvK/F0oTfY=;
        b=jlSy4IWsS+VA5Wu0PcDDMTNeTjqtzyKZwtZuA1x06jL8uhH1YaO2sLxFPN9+7eBMi4
         zvxXWSEMTKhS314ABf+6QIH3ftmI2YFu2KdXzWkvZBdUZ+9vil5P6zZcF+fOCEH25q6Z
         Rr96wky8YpbTZqdGNJunkP93BbNapQCcM8b+KtTShWExf45i96A6+2CZLpWGinsoJ/6D
         bb//FLXkM3pICyfialquNjHBP3NWVX1hgHBwFWfkWc6s8Zhhl7YFw1ffFusJ6PfxkDmR
         ivVFQATolIKOTiZinN3zx3MV2JGiJkNOQGwqJzJRiuTLHmhPScqpqYjZcO0ln6BeNdwh
         1tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ugh0fRZuhaEfXnQ8Vzyoe5R9ka3H4I0iPLvK/F0oTfY=;
        b=f7Tj3mVBg32vebZddSbwcgGGUrdmJD/2Bidqxdurlkqaz6MvibuDltG5WQFSQ5QmUC
         ypf2C9QDz29PrYHA9YDcpPi5qWlBFuMmJCpXT55Nc2MuHYb3oGxIu67oO/gunsoANMBt
         NDmiXXkpzvjwWWpNyixgs4euctY8W3C9r3QhGwqZ4nigmANzjliQi24bPsdH1rGOBbBO
         UO3dcPEmhFtaqRQzLI7rlGH8sEf7hGoZ+4qJrGRVYG/S0YHIfkiSWxk9RrRwxQKNYl0q
         wlgi/zMJ1yr1IKmeMQBo77kdhoxolHnKxpstlxjb08HCGSx6UoCDVhlwft2YmHcr8MBf
         pPbw==
X-Gm-Message-State: AGi0PuZDD+2Ijck1PMpDwusiPSS7gjfqxRHPSnMQjJRHdzfCex3+Hvo3
        8U6+YJfmuHFs0NPkbbAiqyQ=
X-Google-Smtp-Source: APiQypJxyk66ZKz/KBrbqYgO8ZvFYJ9gp+c8NPOiv7xUGxw3KMTOxZaRT1eiHJRd9TUtTHwr4YOLDQ==
X-Received: by 2002:ac2:43c7:: with SMTP id u7mr3025686lfl.50.1586954564499;
        Wed, 15 Apr 2020 05:42:44 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id o25sm12264379lfg.41.2020.04.15.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:42:43 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:42:42 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 05/13] gpio: dwapb: Convert to use irqd_to_hwirq()
Message-ID: <20200415124242.nnk7wamjw6e5jyez@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-6-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:20PM +0300, Andy Shevchenko wrote:
> Convert to use irqd_to_hwirq() instead of direct access to the hwirq member.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index c0c267cddd80..3a1f3fae923f 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -230,7 +230,7 @@ static void dwapb_irq_enable(struct irq_data *d)
>  
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
>  	val = dwapb_read(gpio, GPIO_INTEN);
> -	val |= BIT(d->hwirq);
> +	val |= BIT(irqd_to_hwirq(d));
>  	dwapb_write(gpio, GPIO_INTEN, val);
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> @@ -245,7 +245,7 @@ static void dwapb_irq_disable(struct irq_data *d)
>  
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
>  	val = dwapb_read(gpio, GPIO_INTEN);
> -	val &= ~BIT(d->hwirq);
> +	val &= ~BIT(irqd_to_hwirq(d));
>  	dwapb_write(gpio, GPIO_INTEN, val);
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> @@ -255,8 +255,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio = igc->private;
>  	struct gpio_chip *gc = &gpio->ports[0].gc;
> -	int bit = d->hwirq;
>  	unsigned long level, polarity, flags;
> +	u32 bit = irqd_to_hwirq(d);

I'm not saying that the rest of the driver code is highly coherent with
ideal design and style. But here I don't really see a point in converting
the type to u32. As I see it int-like type is more appropriate since
we don't need to signify the data type width in this context.

-Sergey

>  
>  	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
>  		     IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> @@ -305,11 +305,12 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio = igc->private;
>  	struct dwapb_context *ctx = gpio->ports[0].ctx;
> +	u32 bit = irqd_to_hwirq(d);
>  
>  	if (enable)
> -		ctx->wake_en |= BIT(d->hwirq);
> +		ctx->wake_en |= BIT(bit);
>  	else
> -		ctx->wake_en &= ~BIT(d->hwirq);
> +		ctx->wake_en &= ~BIT(bit);
>  
>  	return 0;
>  }
> @@ -365,8 +366,9 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	struct gpio_chip *gc = &port->gc;
>  	struct fwnode_handle  *fwnode = pp->fwnode;
>  	struct irq_chip_generic	*irq_gc = NULL;
> -	unsigned int hwirq, ngpio = gc->ngpio;
> +	unsigned int ngpio = gc->ngpio;
>  	struct irq_chip_type *ct;
> +	irq_hw_number_t hwirq;
>  	int err, i;
>  
>  	gpio->domain = irq_domain_create_linear(fwnode, ngpio,
> -- 
> 2.25.1
> 
