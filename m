Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED61D58074
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 12:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfF0Kca (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 06:32:30 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46863 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfF0Kca (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 06:32:30 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so1042517pls.13
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7CfDImsHWdSfarpswjBeYfNryh7pwnkPkPKfzdmDP7g=;
        b=Y3t1aVfj4GWkiJ3PErECHoktnl7LBtTuFK+KbOcsBxFJUZJJ8i2LZku4UD4TTyTOx1
         YaQ21LslHKkD7S1iNrnOtFDEWASE6CHLy1jkiRExIle2jexIXKnZ6OjrL6K+ZylANAuS
         8jL+yaMSWZ8NwsllNzqbEDY8S80uzT2mAVCCAv5DfWAGwHlM4PX7P/7bLsTI8SeajZ7c
         MuuujWJbQm18xh9eT0F+C90yZKPr4E5utDjpB1Hv80zQpHE39shMTDgJH/9lEQiQ+6Gd
         fijVX11YBhLei9UQ316rkeotZS29iEyKJ7ry/0jK6v6lqydW1aYasuJAoDxVHd5d8Z1u
         BH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7CfDImsHWdSfarpswjBeYfNryh7pwnkPkPKfzdmDP7g=;
        b=XMo1+4HMUF46qSuWOe5a1UeDJakijB4wDCTK3+vxBLM6GpTm1b5fdt2u1MVk/VY2vn
         nu3gqVy10jsXPLhIss6G+eoK8aXosz+LdJ7hCYHp2CB98ybzhJ0abPeTieTeC0PKfsRN
         22h5YcFyJK5STlpE4hGzh968ZmHCUQREvKKIkoFdbxLOZHqJ1JyDYyPxpjBqBB70vcUj
         folI7+cTuDeHDYu7Bq8mDL0nlDn6Fg8vqnu021Z4xOrjhGIaR083LpqaCXo3m+hssRZy
         q3MC0ulKGQSUV1S+F0DCXIl24CiVfxhS//mZqsitcQg34IbH8on0KI9FBmFQsfLj1z+P
         xplQ==
X-Gm-Message-State: APjAAAUQ84z67HAG08A7spJqpz5WsnZmbeMWZI5KCl0b3I3NPW9ekjzQ
        W+SeIK+duCZEgYjngAizA5OLsNSgNyYZ
X-Google-Smtp-Source: APXvYqyGOPsqv673eY5ixjimtIo++iiGF99LZ4Tr9muap7vike1O6Zrtg6rV3NhrT7XZRuKPfo3dkg==
X-Received: by 2002:a17:902:549:: with SMTP id 67mr3823639plf.86.1561631549090;
        Thu, 27 Jun 2019 03:32:29 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id 125sm3368423pfg.23.2019.06.27.03.32.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2019 03:32:28 -0700 (PDT)
Date:   Thu, 27 Jun 2019 16:02:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] gpio: pl061: Pass irqchip when adding gpiochip
Message-ID: <20190627103221.GA15811@mani>
References: <20190625111824.28482-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625111824.28482-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 01:18:24PM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks good to me!

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/gpio/gpio-pl061.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index dc42571e6fdc..84af248f5172 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -286,6 +286,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct device *dev = &adev->dev;
>  	struct pl061 *pl061;
> +	struct gpio_irq_chip *girq;
>  	int ret, irq;
>  
>  	pl061 = devm_kzalloc(dev, sizeof(*pl061), GFP_KERNEL);
> @@ -313,10 +314,6 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  	pl061->gc.parent = dev;
>  	pl061->gc.owner = THIS_MODULE;
>  
> -	ret = gpiochip_add_data(&pl061->gc, pl061);
> -	if (ret)
> -		return ret;
> -
>  	/*
>  	 * irq_chip support
>  	 */
> @@ -335,19 +332,24 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  	}
>  	pl061->parent_irq = irq;
>  
> -	ret = gpiochip_irqchip_add(&pl061->gc, &pl061->irq_chip,
> -				   0, handle_bad_irq,
> -				   IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_info(&adev->dev, "could not add irqchip\n");
> +	girq = &pl061->gc.irq;
> +	girq->chip = &pl061->irq_chip;
> +	girq->parent_handler = pl061_irq_handler;
> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +				     GFP_KERNEL);
> +	if (!girq->parents)
> +		return -ENOMEM;
> +	girq->parents[0] = irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_bad_irq;
> +
> +	ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
> +	if (ret)
>  		return ret;
> -	}
> -	gpiochip_set_chained_irqchip(&pl061->gc, &pl061->irq_chip,
> -				     irq, pl061_irq_handler);
>  
>  	amba_set_drvdata(adev, pl061);
> -	dev_info(&adev->dev, "PL061 GPIO chip @%pa registered\n",
> -		 &adev->res.start);
> +	dev_info(dev, "PL061 GPIO chip %s registered\n", dev_name(dev));
>  
>  	return 0;
>  }
> -- 
> 2.20.1
> 
