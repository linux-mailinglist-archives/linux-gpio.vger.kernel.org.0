Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79AC530616
	for <lists+linux-gpio@lfdr.de>; Sun, 22 May 2022 23:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbiEVVLC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 May 2022 17:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351614AbiEVVKz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 May 2022 17:10:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2ABA3A187
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 14:10:52 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u30so22499339lfm.9
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lWll2HLJ8E68D1ZMX24mVL0ZYsDnBwKFL3FZwiDRl5I=;
        b=RVNnRi2/vL4kT9h+O5Ks7YXx5CHonP28XnBAAbZHgJSFCAYfgKVjUZFaL3HR5fCBMQ
         9uoxssTTnrUpus8vID/3wZvX94ZtdEZmeVuvUDjemriAmEEa2n3QCtTlt25Aefmakxvd
         QVldtkE6hVA4DCPyz499bUU+p/7TwJWA6fnG8Y2Pe7x5cO74pSUFy1kwfIXbKxvkjfaZ
         bWejnQdVsJu/7/V5T0c6A4ptNXs+nKpk2QI+ihO0JIUVZRocj1SbBOCCLh9yDK099U7L
         h9YuBlAdNs3US+54oBDvse//kjUA9oUmiFS5UeBQmwn9IVU+Mr1xMlZ4YAE0HPDCWQMQ
         Tr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lWll2HLJ8E68D1ZMX24mVL0ZYsDnBwKFL3FZwiDRl5I=;
        b=n5FdFGtlYoM4LlzZA1E2wD29XmaRjmJR3L45TBeBulwUFYVoXIXcHf6rAjrA8OmoXc
         VsDspLcYSH/uaR8lMMTpm0NhGpCj5xqExvpSIKNntOaeusi1Ss5Jpu1kYu2pgrmBlgq2
         Mw7HziHv1i9TWNohpUvwntI75H/1aAnz5y3Yg6sYmzB+49yBplCqH7BWUGfHcKCf7BDR
         DSQXCIx1TXwmAGrAZwRgo1tC7T+cadaAknZx7FJ/uBnWSTG/E/hr18+9Hk3FtJfy2Jpa
         M1vbTYIHZJGv7Ugfd+fw10jVmibfEKKraJx5hbriZvTDk3SlLB7MXVZWXcn8zEMLPtJD
         iK+w==
X-Gm-Message-State: AOAM531ZMwX4W5psslX7HuAbh6R7UpF8iRqMzy+1YfSpLE1ZFbZF7iIF
        J4rqDkLKhz/QYXo1rGfUeFI=
X-Google-Smtp-Source: ABdhPJyQxgk2BvbT3VAUTOg3igZViSIE0BxoU3BthOrwHuJ7qyArITVch0GigjRPaBmiP7PAg3Uk6Q==
X-Received: by 2002:a05:6512:230f:b0:478:6c52:1646 with SMTP id o15-20020a056512230f00b004786c521646mr2661025lfu.494.1653253851025;
        Sun, 22 May 2022 14:10:51 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a0565123b8a00b004785abcb0e0sm992081lfv.78.2022.05.22.14.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 14:10:50 -0700 (PDT)
Date:   Mon, 23 May 2022 00:10:48 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] gpio: dwapb: Make the irqchip immutable
Message-ID: <20220522211048.5n6krpzgc4hzv4jg@mobilestation>
References: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 18, 2022 at 04:39:42PM +0200, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
> 
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the dwapb driver immutable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

> Against linux-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).

Currently no objection against the change. Thanks.

Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> ---
>  drivers/gpio/gpio-dwapb.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7130195da48d75dd..29b9395548151992 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -95,7 +95,6 @@ struct dwapb_context {
>  #endif
>  
>  struct dwapb_gpio_port_irqchip {
> -	struct irq_chip		irqchip;
>  	unsigned int		nr_irqs;
>  	unsigned int		irq[DWAPB_MAX_GPIOS];
>  };
> @@ -259,6 +258,8 @@ static void dwapb_irq_mask(struct irq_data *d)
>  	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
>  	dwapb_write(gpio, GPIO_INTMASK, val);
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	gpiochip_disable_irq(gc, d->hwirq);
>  }
>  
>  static void dwapb_irq_unmask(struct irq_data *d)
> @@ -268,6 +269,8 @@ static void dwapb_irq_unmask(struct irq_data *d)
>  	unsigned long flags;
>  	u32 val;
>  
> +	gpiochip_enable_irq(gc, d->hwirq);
> +
>  	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>  	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
>  	dwapb_write(gpio, GPIO_INTMASK, val);
> @@ -364,8 +367,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  
>  	return 0;
>  }
> +#else
> +#define dwapb_irq_set_wake	NULL
>  #endif
>  
> +static const struct irq_chip dwapb_irq_chip = {
> +	.name		= DWAPB_DRIVER_NAME,
> +	.irq_ack	= dwapb_irq_ack,
> +	.irq_mask	= dwapb_irq_mask,
> +	.irq_unmask	= dwapb_irq_unmask,
> +	.irq_set_type	= dwapb_irq_set_type,
> +	.irq_enable	= dwapb_irq_enable,
> +	.irq_disable	= dwapb_irq_disable,
> +	.irq_set_wake	= dwapb_irq_set_wake,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>  				   unsigned offset, unsigned debounce)
>  {
> @@ -439,16 +457,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	girq->default_type = IRQ_TYPE_NONE;
>  
>  	port->pirq = pirq;
> -	pirq->irqchip.name = DWAPB_DRIVER_NAME;
> -	pirq->irqchip.irq_ack = dwapb_irq_ack;
> -	pirq->irqchip.irq_mask = dwapb_irq_mask;
> -	pirq->irqchip.irq_unmask = dwapb_irq_unmask;
> -	pirq->irqchip.irq_set_type = dwapb_irq_set_type;
> -	pirq->irqchip.irq_enable = dwapb_irq_enable;
> -	pirq->irqchip.irq_disable = dwapb_irq_disable;
> -#ifdef CONFIG_PM_SLEEP
> -	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
> -#endif
>  
>  	/*
>  	 * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
> @@ -475,7 +483,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		girq->parent_handler = dwapb_irq_handler;
>  	}
>  
> -	girq->chip = &pirq->irqchip;
> +	gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
>  
>  	return;
>  
> -- 
> 2.25.1
> 
