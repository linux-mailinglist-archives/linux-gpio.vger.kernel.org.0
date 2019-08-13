Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949ED8ADD0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 06:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbfHMEgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 00:36:11 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48859 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725298AbfHMEgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 00:36:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4747D21CC3;
        Tue, 13 Aug 2019 00:36:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 13 Aug 2019 00:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=EWo9ObTgGRCRVa/IOyqPu9IksexvX/b
        CmP9z0SZUwOY=; b=jSJb+1zGXM4MIyY6fC41MBRv9/Nz6b/kZvRpyIVaBtnfHK9
        OMvAPoLcNYzxNX1GFe3XTorMmdsuFoKyCVfKxqMG1r5KlEA3fMFlTswgVEeNBwid
        rSrIKSKezFNf47GEir5TEId11u6JOPRhrxG0ez/93/s6MOKaGpPKz6+Iv8SofeFS
        CrBbFrR9+95SL+QivmkF34FcvDt8yDvzDqea/y09D71Aal54PXab3bDRyOkKPzfr
        /sU6v+c/DFbRpybJOXqmU9Yu1vgSUiASyTMdvKQMuwWtFNuQZukNq8LQaXtW/PSH
        N8AMYuYT+wOe/lmRoKNqdTfHCXyirGMxwtdaWRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EWo9Ob
        TgGRCRVa/IOyqPu9IksexvX/bCmP9z0SZUwOY=; b=YFRnOOAAAy19O9raKMRmgh
        HvZimua8j6o98u/sLd1m8YpoaJuBwCyjjm3n3wToFckZNdnRF0e1+1bczRsUleeG
        Gzlg8d6Ckz8jnkRx/Ayb8Z3j2UsWngbmDHvMp88jwkJ0XWo5Ks9z7TXgMjwkOjjX
        6AbHsfp6f9nc0nUPxokHvbXewHNTE1bVAW1qqiORE3zlYIuIScHTXJjIdCiCByly
        kE2QodhiV7D3uMBRjscQEl1b6w+K+zj+tXV4Q1S2ABS/kcYPbyLUzAMpXezTQfsc
        LGOIEyOxYqwznxLx48RsdHGZ/CCnCXNFbgC7tKgjNdQyoWjPDnwXlNMjNG9kbSCQ
        ==
X-ME-Sender: <xms:OD5SXeUphj3npE80JJEoLlNLOQa_3C0Ir2WsOhK1wkaw4fct7tJuhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvhedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:OD5SXW8UwDEZiph0MCrX3-6LS3ZNBqfi37WC9qrB2LXwJkByCSKskQ>
    <xmx:OD5SXW3-MxzXXxy7bdvZlv16aV_ZBV936ERpRauEKwmLF0CQyqAB9A>
    <xmx:OD5SXTdXalI-7G_9CuDKDr4r4Fs-xVhm6mw9qlxtPvFlKn9jpqAxHg>
    <xmx:Oj5SXYzq-OKD_t-iULuw5ifl0OAjP5X6yTSejVr2wmj9CiWbbNT5NQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id EC4C7E00A2; Tue, 13 Aug 2019 00:36:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-864-ga937f03-fmstable-20190813v1
Mime-Version: 1.0
Message-Id: <9939c72e-771f-4247-a691-caef8e5100e7@www.fastmail.com>
In-Reply-To: <20190809125515.19094-1-linus.walleij@linaro.org>
References: <20190809125515.19094-1-linus.walleij@linaro.org>
Date:   Tue, 13 Aug 2019 14:06:36 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Thierry Reding" <treding@nvidia.com>
Subject: Re: [PATCH] gpio: aspeed: Pass irqchip when adding gpiochip
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 9 Aug 2019, at 22:25, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi Aspeed folks, it'd be great if you could test/review this
> patch.

Used it to exercise our WIP GPIO model for qemu. After fixing the qemu bugs it
worked fine there. Booted it on a Witherspoon and things worked as expected
there too. From a brief inspection it looks fine to me.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 60 ++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 13d80bfbc3b6..9defe25d4721 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -711,32 +711,6 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>  	}
>  }
>  
> -static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
> -		struct platform_device *pdev)
> -{
> -	int rc;
> -
> -	rc = platform_get_irq(pdev, 0);
> -	if (rc < 0)
> -		return rc;
> -
> -	gpio->irq = rc;
> -
> -	set_irq_valid_mask(gpio);
> -
> -	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
> -			0, handle_bad_irq, IRQ_TYPE_NONE);
> -	if (rc) {
> -		dev_info(&pdev->dev, "Could not add irqchip\n");
> -		return rc;
> -	}
> -
> -	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_gpio_irqchip,
> -				     gpio->irq, aspeed_gpio_irq_handler);
> -
> -	return 0;
> -}
> -
>  static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
>  					unsigned int offset, bool enable)
>  {
> @@ -1189,7 +1163,6 @@ static int __init aspeed_gpio_probe(struct 
> platform_device *pdev)
>  	gpio->chip.set_config = aspeed_gpio_set_config;
>  	gpio->chip.label = dev_name(&pdev->dev);
>  	gpio->chip.base = -1;
> -	gpio->chip.irq.need_valid_mask = true;
>  
>  	/* Allocate a cache of the output registers */
>  	banks = gpio->config->nr_gpios >> 5;
> @@ -1212,16 +1185,41 @@ static int __init aspeed_gpio_probe(struct 
> platform_device *pdev)
>  		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
>  	}
>  
> -	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> -	if (rc < 0)
> -		return rc;
> +	/* Optionally set up an irqchip if there is an IRQ */
> +	rc = platform_get_irq(pdev, 0);
> +	if (rc > 0) {
> +		struct gpio_irq_chip *girq;
> +
> +		gpio->irq = rc;
> +		girq = &gpio->chip.irq;
> +		girq->chip = &aspeed_gpio_irqchip;
> +		girq->parent_handler = aspeed_gpio_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(&pdev->dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		girq->parents[0] = gpio->irq;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_bad_irq;
> +		girq->need_valid_mask = true;
> +	}
>  
>  	gpio->offset_timer =
>  		devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
>  	if (!gpio->offset_timer)
>  		return -ENOMEM;
>  
> -	return aspeed_gpio_setup_irqs(gpio, pdev);
> +	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* Now the valid mask is allocated */
> +	if (gpio->irq)
> +		set_irq_valid_mask(gpio);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver aspeed_gpio_driver = {
> -- 
> 2.21.0
> 
>
