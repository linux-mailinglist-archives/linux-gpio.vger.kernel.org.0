Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD80222BBE
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 21:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgGPTR1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 15:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729387AbgGPTR0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 15:17:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E717C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 12:17:26 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r19so9489296ljn.12
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XfaMG96/acQHhwGqh2ZH/2ozOeVFIBOAcHWYv4wzORg=;
        b=nAc/WUi7MF2Jy0XK1HW82hqf59iSut7j7mANdXYbn3yVv5855bgoZaXAkcBfNj/nHl
         wuLMnVvcv/4MoglNhhuFf8l3oeRQycXBn2dNLtIHErFbQlYIF34KuES3gwqY00LTUlb+
         ihSdN2YuXXxN+QCSdyPE52CshuCmbmcG/AYn1dPbAfLzwtmPA+PC0YxQQ5mmTNf8ZjmY
         m//h7ymhy/dGRjNpnSU3R2p7GE6UP7Mc7bUTKSNGW77n8F3AGb/Ic9f2yUjEpPvupXvu
         jY3508AFKnRPCunCT7JshKWeeJkOqVS2b7TaqLT+71F/Pg0yuyABMOJZ+Fh2JscGRcGl
         19FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XfaMG96/acQHhwGqh2ZH/2ozOeVFIBOAcHWYv4wzORg=;
        b=CbNNNlh9Za/9t7Ja3//i6gZGImS/sky2ZArKIJXQtJmmXtN3AqRaECGfKurOB46n1z
         07QXSftY2/5y1r2wG0xGosPhCeUqxgCDIvLVFK4mM9KOnOFTH3Sa0iTliOog0v2uMDv6
         7lEpEV9/tZKxeGXxEw0Apq/8t3Hem3vxmD1gOUbUfBNIrgGD2DGWVVYihh4pcARQdR1r
         nXP8u6LyLIVeWrxSb2f7MDvdapfrrt09JKz7/0Qa7nIotLyRSUQF5zQh8egb47LtgY11
         nTyDC4q1BsPhw2p9/NHyU2Tvutac4AR9QjmNv0uyuFUu7yVEFwhJ7FJ1hLBmHR2zSND/
         l0xw==
X-Gm-Message-State: AOAM530MKgbzo8c6CyiS1tW/cxKc3CwMDdbN7aXt04dNcpdZKtJB/GAi
        Vs1q5B7XdWR82YNsGF4Y6/Norwao
X-Google-Smtp-Source: ABdhPJzGZewUmCaR4qMFPWYsLe9u8j6rTZS3b+8pSkj9dJdERsCvrLAyM+Ig4+z/pmxXOlPN661JLw==
X-Received: by 2002:a2e:9785:: with SMTP id y5mr2945526lji.383.1594927044673;
        Thu, 16 Jul 2020 12:17:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id x30sm1359938lfn.3.2020.07.16.12.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 12:17:24 -0700 (PDT)
Subject: Re: [PATCH] gpio: max77620: Use helper variable and clarify
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200716092835.69176-1-linus.walleij@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e758c01-2eef-67b7-7f4e-537b7dd85494@gmail.com>
Date:   Thu, 16 Jul 2020 22:17:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716092835.69176-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

16.07.2020 12:28, Linus Walleij пишет:
> Most other drivers fill out the gpio_irq_chip using a
> struct gpio_irq_chip *girq helper variable for ease of
> reading.
> 
> We also make a habit of explicitly assigning NULL and
> zero to the parent IRQs when using ordinary IRQ handlers
> in the driver, mostly for code readability and
> maintenance.
> 
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-max77620.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index e090979659eb..7c0a9ef0b500 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -288,6 +288,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
>  {
>  	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
>  	struct max77620_gpio *mgpio;
> +	struct gpio_irq_chip *girq;
>  	unsigned int gpio_irq;
>  	int ret;
>  
> @@ -316,11 +317,16 @@ static int max77620_gpio_probe(struct platform_device *pdev)
>  	mgpio->gpio_chip.can_sleep = 1;
>  	mgpio->gpio_chip.base = -1;
>  
> -	mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
> -	mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
> -	mgpio->gpio_chip.irq.handler = handle_edge_irq;
> -	mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
> -	mgpio->gpio_chip.irq.threaded = true;
> +	girq = &mgpio->gpio_chip.irq;
> +	girq->chip = &max77620_gpio_irqchip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_edge_irq;
> +	girq->init_hw = max77620_gpio_irq_init_hw,
> +	girq->threaded = true;
>  
>  	platform_set_drvdata(pdev, mgpio);
>  
> 

Thanks :)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
