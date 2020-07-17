Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E98223D8A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgGQOAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:00:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43509 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726974AbgGQOAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 10:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594994401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MIcSGma96SMTVgLnMC6YwvUeXYyvbLgwFFAU5hkmgJ4=;
        b=WTfCqsB44B0lge8xttZd+LTY/TWd541QPEF+UJNGICNtrK657FRDvIsxpBzTjQUSWls/JS
        CUsFIJ2FGoYmpqhNY9wuRZuAEgZ5XV+0r5h7zJLyAaJqyFekJkKFTpySq9Q30tcCX/wXWw
        MIVbrFrRNtasntCP9T5Ee+EKRdiqspw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-V82aFqN9PiCA7e-mtO4MDg-1; Fri, 17 Jul 2020 10:00:00 -0400
X-MC-Unique: V82aFqN9PiCA7e-mtO4MDg-1
Received: by mail-wm1-f70.google.com with SMTP id c124so8492712wme.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MIcSGma96SMTVgLnMC6YwvUeXYyvbLgwFFAU5hkmgJ4=;
        b=Eu1kGvxmvR+VFtkTOp+1oBV+Z4dNF4lyJzqFU4Q4uxh7/xpsEFNxZ8mw/nXCpZz52z
         nSP+1wjentfzdPK8pFCODG+EcI4oeJmH4yw3p6BjT9PP13QNArJm+lLrI6IjE/aGHdYi
         B2qAZj38ukMRL/fBtrxykRHlfyPVEo+6kqnyRICzYZYq+fPqXRTZSR2kPcpjyFBiSfbM
         X8TzObTwJlro1vwELNmo32MyMYXWm5Ahnzi/xOQL+XtH61PgHHG3G8zSzcyA1WvzB3tE
         5Q7PxMtffN+wwCuHC0wB8SnQJo5HxdziZVb1ztQ4NfKGMvkkVZIzEDkL/TA6SpGNB8Df
         VtPA==
X-Gm-Message-State: AOAM531UMiifKc6PdTVQLlh7N8sHf01vLWsIZOjPuvEhoh9TKopvwtcN
        VctCgg7EVvzcvt6D7miO5GhRRUn6nAKJzo6NLdGXfFMtX9Kfb6ihLoDfQnZKX5MXmrG5AM351dr
        jWz3Fh80eVnaTfoB0rkMPTQ==
X-Received: by 2002:a1c:9a02:: with SMTP id c2mr10420640wme.16.1594994399183;
        Fri, 17 Jul 2020 06:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn/tkpIXfaNsVdSGkdLbO6p+gfowccIB6sOhFikweNVr0gPOITqJEklXKSNcMvHBlz0gG4GA==
X-Received: by 2002:a1c:9a02:: with SMTP id c2mr10420622wme.16.1594994398977;
        Fri, 17 Jul 2020 06:59:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n16sm15973811wra.19.2020.07.17.06.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 06:59:58 -0700 (PDT)
Subject: Re: [PATCH] gpio: crystalcove: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20200717112558.15960-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d97d8c70-528e-f06b-3bf6-4faf51857a9c@redhat.com>
Date:   Fri, 17 Jul 2020 15:59:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717112558.15960-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/17/20 1:25 PM, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Intel folks and Hans: I hope someone can test this, I'm
> a bit uncertain if IRQs could fire before registering
> the chip and if we need a hw_init() in this driver to cope.

I've added this to my personal tree for testing. I will get back
to you when I've either hit an issue, or used it for a while without
issues :)

Hmm, testing this might be tricky, I don't think any boards
actually use any GPIOs on the PMIC (which this driver is for)
as interrupts...

So the best I can do is boot a machine and test there are no
regressions I guess.


Regards,

Hans



> ---
>   drivers/gpio/gpio-crystalcove.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
> index 14d1f4c933b6..424a00ba1c97 100644
> --- a/drivers/gpio/gpio-crystalcove.c
> +++ b/drivers/gpio/gpio-crystalcove.c
> @@ -330,6 +330,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>   	int retval;
>   	struct device *dev = pdev->dev.parent;
>   	struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
> +	struct gpio_irq_chip *girq;
>   
>   	if (irq < 0)
>   		return irq;
> @@ -353,14 +354,15 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>   	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
>   	cg->regmap = pmic->regmap;
>   
> -	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> -	if (retval) {
> -		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> -		return retval;
> -	}
> -
> -	gpiochip_irqchip_add_nested(&cg->chip, &crystalcove_irqchip, 0,
> -				    handle_simple_irq, IRQ_TYPE_NONE);
> +	girq = &ch->chip.irq;
> +	girq->chip = &crystalcove_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_simple_irq;
> +	girq->threaded = true;
>   
>   	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
>   				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
> @@ -370,7 +372,11 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>   		return retval;
>   	}
>   
> -	gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
> +	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> +	if (retval) {
> +		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> +		return retval;
> +	}
>   
>   	return 0;
>   }
> 

