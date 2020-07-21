Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D866228160
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgGUNxx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgGUNxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:53:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B1EC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:53:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y3so3946097wrl.4
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uZG1ZJthYjOYjsQVsJ13EyVoFjre2AI4IW8Iaoa2gYY=;
        b=C1mL0Bpl2iGLyctTzk/P61N8Rf2NJQcucZpCAxRmE8U2AaLHGyqnDkQVuxP676DLMH
         6XA+JKOuE/YzUQoxnV9YeUt8gzFW/ERWhs/uXOvEAGzQ9TpuDIO70DtMEMpAfNB5IEvK
         nu4P8JvE2vPV1OEPHLn6vc/SjiauNOXRiKX2XfZ/wf95gN7XgbPbSlDX1rnlr9/74p8I
         AZDpqxUrc4ALvHfa+2vTeObsL3gyDKWXMAxWTWldn2PTZW5QGdDcoBr5gs+Q7khyeXkv
         qd4PWVoYxcBCP+FlogZqgVftWCY5BgvJ3HXNK0iwQ7JFD/WnWH4SxNiZ+tERbj616trT
         WubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uZG1ZJthYjOYjsQVsJ13EyVoFjre2AI4IW8Iaoa2gYY=;
        b=YLrxjQXsIRzOqhaTpDk40PRt6VX46++unVEa6rYq98YCN9cGF4fZ+JtUK4Thz6atNF
         E6IsvMYSD/IOwwVmidKPPDoOFoSx5WmWngg9pOGI2XNWXDn/Z0Mh7SAMkOOqm1BE0ZQs
         4njEaB6xsThBMhk2qL5RxP91foG00FV3402e1GpCgF3xtrx5C8NrL37lmDOXWaI0z/Zk
         ZiHL239NuhMN2AA+8o9l5GTt0BjGM0O4Te0ktw/ih5E30qiwbJyS+2oQ4JHzOxZotP6Q
         2zvicj+gfhZAe6mNiV993oYGZfaDdI6N/3MvdFldcK9/P8n5OghvUkuZSQ6C0k10BSyQ
         pJ4A==
X-Gm-Message-State: AOAM533tSr7H8gKdse718ratEzpq77xfGxb82ZJIv/wjTWnvuxeYtiPc
        Skl4UQ4+6kLpr8uExqvmoPSERw==
X-Google-Smtp-Source: ABdhPJxng1Di05yQV/y5lmdW9RmsIR9pY3kl93P0zmtbjXG0lcf6u6IC83BAUAms3XhsYX6/WDt+NQ==
X-Received: by 2002:adf:e7c8:: with SMTP id e8mr26326017wrn.20.1595339630943;
        Tue, 21 Jul 2020 06:53:50 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id i67sm3627324wma.12.2020.07.21.06.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 06:53:50 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sx150x: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20200721132537.362160-1-linus.walleij@linaro.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <6e7b5583-d5c8-cd9f-daec-ead51901732b@baylibre.com>
Date:   Tue, 21 Jul 2020 15:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721132537.362160-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/07/2020 15:25, Linus Walleij wrote:
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-sx150x.c | 44 ++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 708bc91862fe..b325a136ac48 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -1187,17 +1187,10 @@ static int sx150x_probe(struct i2c_client *client,
>  	if (pctl->data->model != SX150X_789)
>  		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
>  
> -	ret = devm_gpiochip_add_data(dev, &pctl->gpio, pctl);
> -	if (ret)
> -		return ret;
> -
> -	ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
> -				     0, 0, pctl->data->npins);
> -	if (ret)
> -		return ret;
> -
>  	/* Add Interrupt support if an irq is specified */
>  	if (client->irq > 0) {
> +		struct gpio_irq_chip *girq;
> +
>  		pctl->irq_chip.irq_mask = sx150x_irq_mask;
>  		pctl->irq_chip.irq_unmask = sx150x_irq_unmask;
>  		pctl->irq_chip.irq_set_type = sx150x_irq_set_type;
> @@ -1213,8 +1206,8 @@ static int sx150x_probe(struct i2c_client *client,
>  
>  		/*
>  		 * Because sx150x_irq_threaded_fn invokes all of the
> -		 * nested interrrupt handlers via handle_nested_irq,
> -		 * any "handler" passed to gpiochip_irqchip_add()
> +		 * nested interrupt handlers via handle_nested_irq,
> +		 * any "handler" assigned to struct gpio_irq_chip
>  		 * below is going to be ignored, so the choice of the
>  		 * function does not matter that much.
>  		 *
> @@ -1222,13 +1215,15 @@ static int sx150x_probe(struct i2c_client *client,
>  		 * plus it will be instantly noticeable if it is ever
>  		 * called (should not happen)
>  		 */
> -		ret = gpiochip_irqchip_add_nested(&pctl->gpio,
> -					&pctl->irq_chip, 0,
> -					handle_bad_irq, IRQ_TYPE_NONE);
> -		if (ret) {
> -			dev_err(dev, "could not connect irqchip to gpiochip\n");
> -			return ret;
> -		}
> +		girq = &pctl->gpio.irq;
> +		girq->chip = &pctl->irq_chip;
> +		/* This will let us handle the parent IRQ in the driver */
> +		girq->parent_handler = NULL;
> +		girq->num_parents = 0;
> +		girq->parents = NULL;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_bad_irq;
> +		girq->threaded = true;
>  
>  		ret = devm_request_threaded_irq(dev, client->irq, NULL,
>  						sx150x_irq_thread_fn,
> @@ -1237,12 +1232,17 @@ static int sx150x_probe(struct i2c_client *client,
>  						pctl->irq_chip.name, pctl);
>  		if (ret < 0)
>  			return ret;
> -
> -		gpiochip_set_nested_irqchip(&pctl->gpio,
> -					    &pctl->irq_chip,
> -					    client->irq);
>  	}
>  
> +	ret = devm_gpiochip_add_data(dev, &pctl->gpio, pctl);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
> +				     0, 0, pctl->data->npins);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
