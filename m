Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B171C22FB20
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 23:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgG0VNg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 17:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0VNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 17:13:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C43C061794
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 14:13:35 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k13so9822476lfo.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2020 14:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b+QHYQXvcFAChouD6WBbFVwBVD464jHOCBWtPkZSGYI=;
        b=Lm1c1pCjth6tgb+eL1ETGzj8B8Jg6s9yaAF0HSI+UyVAERp1LEZNTSNyQf00A9s7F0
         43/cI1qkCEsNVNvhjve/KgZd3vfkGqLsIqACL6J1OiDdyT+n8sfuJd1/91Q9oZ+AsfyL
         koVevGwOdX2A8ncBK7X7qQUDk4NgKA/Eo2aBALCc2uriW5tkpQFIf8jbrDlOyYgIYQx5
         8oQryi6CfsEa7sH+2IqZrdx1UWCwfMVgBNCTj7ASsYw7U2tGU97o2f1BTuhWKHPYmPOw
         d0PiQBMn8YL+9fD9sy+Ed//ofm3hmuIC5zJiVrRvpfvtBea6XWGjtppaFLTbpJ7ITOPV
         qBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b+QHYQXvcFAChouD6WBbFVwBVD464jHOCBWtPkZSGYI=;
        b=GAUleQDElkmRcSUBK3OtW6xebBS47BZ3OwvEpXRjAWQKuqAFkn0Iu/lDKTON0GP0Jl
         3NcGNWHM3AXy8dT2328uymPPtaxyckqeeg1VppawNRxy8q50ttD4oXVCWGCMzXKeTQPE
         H6cAlg8pLV5yMGkkS5y7Rq4Vgmvzp2dGL5VStoRmZ2VTPx0Q6SB8oLIhhyFlWkUh8EK6
         XR+tTsQ+w5JsVaBjALR+scT1EpBqTIKYqNFDFlNv7r/6nfiMU6QIZpsgezkTJNom1hAq
         nZnZcN+i0Rf7IMynAIXjGprTE0vscxpntCk+kREwnXAPYNm2aDrztk6e1YKUJGwCQ3qd
         w0gA==
X-Gm-Message-State: AOAM530vVc/orC6LqfS+t1sPC0UYo5IG/sPDpFe5UT1FxKhSt5GkmUa4
        f7tC51meN4HNdO7Hs+D++0k=
X-Google-Smtp-Source: ABdhPJyo/ySaDfPMHw1Y6BoXmVf2l7HeB3Tg4s6lJNlf/dOl5nBYvAlwf3jd7tMh1uE2wlwMylALPA==
X-Received: by 2002:a19:41d7:: with SMTP id o206mr11782942lfa.115.1595884414503;
        Mon, 27 Jul 2020 14:13:34 -0700 (PDT)
Received: from mobilestation ([95.79.139.207])
        by smtp.gmail.com with ESMTPSA id a17sm2580922lji.5.2020.07.27.14.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 14:13:33 -0700 (PDT)
Date:   Tue, 28 Jul 2020 00:13:31 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
Subject: Re: [PATCH] gpio: stmpe: Use irqchip template
Message-ID: <20200727211331.npttctrjmkfhezhn@mobilestation>
References: <20200716100638.112451-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716100638.112451-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 12:06:38PM +0200, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Alexandre TORGUE <alexandre.torgue@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-stmpe.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index 542706a852e6..395ee51445ea 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -507,6 +507,8 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
>  	}
>  
>  	if (irq > 0) {
> +		struct gpio_irq_chip *girq;
> +
>  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  				stmpe_gpio_irq, IRQF_ONESHOT,
>  				"stmpe-gpio", stmpe_gpio);
> @@ -514,20 +516,16 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
>  			goto out_disable;
>  		}
> -		ret =  gpiochip_irqchip_add_nested(&stmpe_gpio->chip,
> -						   &stmpe_gpio_irq_chip,
> -						   0,
> -						   handle_simple_irq,
> -						   IRQ_TYPE_NONE);
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"could not connect irqchip to gpiochip\n");
> -			goto out_disable;
> -		}
>  
> -		gpiochip_set_nested_irqchip(&stmpe_gpio->chip,
> -					    &stmpe_gpio_irq_chip,
> -					    irq);

> +		girq = &stmpe_gpio->chip.irq;
> +		girq->chip = &stmpe_gpio_irq_chip;
> +		/* This will let us handle the parent IRQ in the driver */
> +		girq->parent_handler = NULL;
> +		girq->num_parents = 0;
> +		girq->parents = NULL;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_simple_irq;
> +		girq->threaded = true;

Hmm, the GPIO-irq-chip setting are initialized after the GPIO-chip has been
registered by calling the gpiochip_add_data() method earlier in this method.
That means the IRQ-chip won't be created by the GPIOlib, which will introduce a
bug. In order to fix the problem it's better to move the whole "if (irq > 0)
{...}" clause to be executed before the gpiochip_add_data() function invocation.

Though I could misunderstood something...

-Sergey

>  	}
>  
>  	platform_set_drvdata(pdev, stmpe_gpio);
> -- 
> 2.26.2
> 
