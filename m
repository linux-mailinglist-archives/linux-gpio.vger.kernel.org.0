Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F053C229425
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGVI5P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:57:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37208 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726555AbgGVI5O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595408233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6hbLPGoKjnqUwZnCE9wpFaysg0TdwXgLwE1YOZpxgU0=;
        b=gi6e6LxT2b8EZt/IYYoWnsOTNg0tdmsNM4ZE6zqPE1dW0V5/NBZjvr5n5K6CD9ewGFYfRi
        5J9CyV1S7pXV66UulK8gTktYsrR3iE1HvsTq8Bab/g3eKGUxwQFIVIht1XvYvgxsg5qCp4
        Os74r/tC7otlLLrDt+MG25Qz9xc9gfo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-mFZaQLijMkalr24uaGIKJQ-1; Wed, 22 Jul 2020 04:57:11 -0400
X-MC-Unique: mFZaQLijMkalr24uaGIKJQ-1
Received: by mail-ej1-f72.google.com with SMTP id yh3so735032ejb.16
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 01:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6hbLPGoKjnqUwZnCE9wpFaysg0TdwXgLwE1YOZpxgU0=;
        b=FohFLUaRrGS5v5hh1VUIkkkm3sUP3aHEr6QZN78Fst9vd6h+9wVB+OynGEQTAPwNxy
         aWvViKBwzeaHfPZf/1U4+DjkquDEPM6tGZ7Dn5OjS8egL5F67P1rMmQFGkAnwMuzxiKU
         Eylxwm8njKyBB6D1lZx+MVIRsoOql3Oe+KSDTAVfSFfxw9MvGaD6HOBcRS0M8MoQZpKT
         RMXp2k+HE0m09B8/5CMEotn2bk/ZUUovAMepgjOANGtTR+eGKWmxezbQutHyFpTGPF6C
         4RGC0hQ8SO+g/FgIYiJf8hhcZHDp3oA8XrMKTrfonnp0giUjFGMMxhEHzuiH1ZdC3oQ+
         +yPA==
X-Gm-Message-State: AOAM532qjpMaxv1MSUzvyhlkRvMqkLw+XwH0odeLO3TwGYINkkjq9fq6
        j0lJR1ILgyNt32ApetqLPbUQcZgEpO/DfiX7CZ7Uh1DOVMfA6J+jEuSn2GF40s26Orbymn5/owz
        9E7CceavOnZdsohccA5Twyg==
X-Received: by 2002:a17:906:2851:: with SMTP id s17mr30031149ejc.347.1595408230172;
        Wed, 22 Jul 2020 01:57:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaULHg6pSaNH8znxXC0hb40dQMQLrZ1rbYQnkG2jRsO+rvX2L8H1sD2L+IfS4Og80cqmq85A==
X-Received: by 2002:a17:906:2851:: with SMTP id s17mr30031143ejc.347.1595408230001;
        Wed, 22 Jul 2020 01:57:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f10sm18822519edr.69.2020.07.22.01.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 01:57:09 -0700 (PDT)
Subject: Re: [PATCH] gpio: wcove: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bin Gao <bin.gao@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200717151955.159819-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <840db56f-d041-6bac-fdca-3dd26152e313@redhat.com>
Date:   Wed, 22 Jul 2020 10:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717151955.159819-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/17/20 5:19 PM, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
> 
> Cc: Bin Gao <bin.gao@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Same notices as on the Crystalcove: this one I actually
> managed to compiletest properly.

I've given this patch a test-run on a machine with the
Whiskey Cove PMIC and with the caveat that I've not
actually tested the GPIO IRQ functionality, since that
does not seem to be used on any machines, I see no adverse
side effects from this patch, so it is:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   drivers/gpio/gpio-wcove.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index 8b481b3c1ebe..135645096575 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -400,6 +400,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
>   	struct wcove_gpio *wg;
>   	int virq, ret, irq;
>   	struct device *dev;
> +	struct gpio_irq_chip *girq;
>   
>   	/*
>   	 * This gpio platform device is created by a mfd device (see
> @@ -442,19 +443,6 @@ static int wcove_gpio_probe(struct platform_device *pdev)
>   	wg->dev = dev;
>   	wg->regmap = pmic->regmap;
>   
> -	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
> -	if (ret) {
> -		dev_err(dev, "Failed to add gpiochip: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = gpiochip_irqchip_add_nested(&wg->chip, &wcove_irqchip, 0,
> -					  handle_simple_irq, IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(dev, "Failed to add irqchip: %d\n", ret);
> -		return ret;
> -	}
> -
>   	virq = regmap_irq_get_virq(wg->regmap_irq_chip, irq);
>   	if (virq < 0) {
>   		dev_err(dev, "Failed to get virq by irq %d\n", irq);
> @@ -468,7 +456,21 @@ static int wcove_gpio_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	gpiochip_set_nested_irqchip(&wg->chip, &wcove_irqchip, virq);
> +	girq = &wg->chip.irq;
> +	girq->chip = &wcove_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_simple_irq;
> +	girq->threaded = true;
> +
> +	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
> +	if (ret) {
> +		dev_err(dev, "Failed to add gpiochip: %d\n", ret);
> +		return ret;
> +	}
>   
>   	/* Enable GPIO0 interrupts */
>   	ret = regmap_update_bits(wg->regmap, IRQ_MASK_BASE, GPIO_IRQ0_MASK,
> 

