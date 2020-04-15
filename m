Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F8C1AABB3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 17:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394203AbgDOPTD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 11:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394202AbgDOPTB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 11:19:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B477C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 08:19:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m8so4145270lji.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9VU+eql55Y7sKJLQLJsQLG7OAlvIASXjyicZXcOnkg8=;
        b=Z06FrYie8Tfyt32hPImaQ6ow4eubrb9jFs8hxUHk8FdS8n89B0icr5/xUSIiHXrSMw
         jUKpJK0uL06Xrrqn6au6l6kMclEcr6hRpxPgm1QhTmWMUNRYh+SNf3/tP0bpm9n+i7z4
         ozC2VMA2hYz7jCqJc/GrvXrYQRFqxtUcFSnTcbvajNIyrvgW7e6afOd1rHzFTxVTQTOF
         imMn5NAoRaSgu/88snuaRoVajkwZYjNOxuoXmZveJaejN2FdxI3Zp1vBacHkUlgX6F26
         dkSopTmZpVUNNpwuwjdbYnsF+bBk12k/gvdDl9GjXyn1CRGjYDTz9ADUS231pZOzjOJg
         Nubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9VU+eql55Y7sKJLQLJsQLG7OAlvIASXjyicZXcOnkg8=;
        b=mY+rF5PnvH5NABkHJBqzYz92/G0peiByzQzmHR7uc0twwlhaWFm3dfdAyFno834eZM
         3kfQQswQXchXmWALi7qphOTq2sDtAu6KwocJ62BwscRcU1r1Uot9G+ardrUKCzRubn7F
         yZRHIj2fPoGU6KL2CU7nMmr3PLZkpmc+d0pIQtBnwygyOfX++34eKNZu6w3HkMUd0m6q
         sCd2jJABQO85Y2mq106Co7zf44nEe+uhsnSHPXJLP2UpHYk4TnLlsJ/esMuswayTV2Ox
         gkXaL5n1f/9VOXVV57PiD7NGLkyHiA3yROGW43tYTOG29bo4DmsPfLCv854RKQD6jBZm
         NPRg==
X-Gm-Message-State: AGi0PuZw0sdaP596bKAJwkEOmvSdmKYLx6nFWIkwu4dZuWa6g1yrxsr5
        WkdL3+lATi8P6xmTSglogUk=
X-Google-Smtp-Source: APiQypKi6SnNT0FghPQI1TSoEFwcTxmVVXlPh78ZipwfJPp1pZ/5wmCWNBRD9R6Y63YoFVbz8qvbng==
X-Received: by 2002:a2e:580e:: with SMTP id m14mr3724955ljb.78.1586963939032;
        Wed, 15 Apr 2020 08:18:59 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id l18sm5466386lje.19.2020.04.15.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:18:57 -0700 (PDT)
Date:   Wed, 15 Apr 2020 18:18:56 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 06/14] gpio: dwapb: Convert to use irqd_to_hwirq()
Message-ID: <20200415151856.g7c6mxzwjp5imfl7@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415141534.31240-7-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 05:15:26PM +0300, Andy Shevchenko wrote:
> Convert to use irqd_to_hwirq() instead of direct access to the hwirq member.
> Also amend the type of the hwirq holding variable to be irq_hw_number_t.

I meant to leave the int-s in the cases where the corresponding variable was used
as the BIT()-macro argument, because in that context it's used as the bit
number. Though using irq_hw_number_t everywhere seems also fine.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index c0c267cddd80..2edccc5bbc25 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -194,7 +194,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
>  static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
>  {
>  	unsigned long irq_status;
> -	int hwirq;
> +	irq_hw_number_t hwirq;
>  
>  	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
>  	for_each_set_bit(hwirq, &irq_status, 32) {
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
> @@ -255,7 +255,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio = igc->private;
>  	struct gpio_chip *gc = &gpio->ports[0].gc;
> -	int bit = d->hwirq;
> +	irq_hw_number_t bit = irqd_to_hwirq(d);
>  	unsigned long level, polarity, flags;
>  
>  	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
> @@ -305,11 +305,12 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio = igc->private;
>  	struct dwapb_context *ctx = gpio->ports[0].ctx;
> +	irq_hw_number_t bit = irqd_to_hwirq(d);
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
