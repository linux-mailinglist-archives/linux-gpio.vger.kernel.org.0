Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E74305D1E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 14:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhA0N1f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 08:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238347AbhA0NZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 08:25:30 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A73FC06178C;
        Wed, 27 Jan 2021 05:24:34 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m2so1538937wmm.1;
        Wed, 27 Jan 2021 05:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HC4Gq2abgCDBqIfE+fwfbNScOwZfNUwNwfHhheHL28A=;
        b=WwGDA8YZbWA/RUq2dLi8ivy7p9Ge6Im3TeuI8aNgoHKFerZtzLaKd0K60ItYl9YNpr
         OUZyntbThZzatAcpCEEvWIEbxWDITmYItFnJ6gRCrThzBcMXEF3CPxSHtw1ZECcR/ULo
         eH+TCjxz9ylUJD0SCobXtRC+DLhsZdPpwqurhwOdQ2mvU8zl4KSkcgerKhhNgUDWOSzy
         FTN858ejq2cM/HIxs4wLd5r5CLbZ/rDm7tqve2eAFlgJxO/NhDYRwMki80CUMA7Zghev
         kTJb2oumGzSXLytxvXjEu1RsCF3cBGwquDX2IV2wx1bgD/dujm/2fIJX3zAXTCjIiOuU
         RORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HC4Gq2abgCDBqIfE+fwfbNScOwZfNUwNwfHhheHL28A=;
        b=sPJl62XwLlIpqxswIS83B4tN3V8STRG6Ui4nQAgrHjJagszR2byGQzGUrm/9SLsTmL
         M16NMCx43Q83H0ucO2uCsiVFUJ+mg4VmrYlVhObXppQB6es6hGD+ZcOxL/7qe5SNH69H
         nCWv8sCd7VMSZ4YPiLHzqf1+fTMgpkpDG8TtlydT5EjjXyUQ9BAoTqYwyNAtTXCHRfR/
         /urqRdI+Q2qCD100E6H4tO9dDYGuRkHy1FgZKbpT1UI0rKB40Yvf7zgf7CAzNFe1m4Bj
         0pMqMxt0JRXsvx14f90DyHlyarhcl0P7SzcO1dRx5xeMq33sqmNQXHxp6mT7lPTqvvCb
         dkSg==
X-Gm-Message-State: AOAM533EA91XJptSHsQGiJ/nnYlSyGRwZCU/b/KVpsE2U4VELox6irpx
        bVxciaxIUHHnlEBPuPtW7Po=
X-Google-Smtp-Source: ABdhPJxtH6OvL+joklK9i3rxjW+EdUD8o9vfnKEDirG0iadNdTjbCtYRL3220eYfYWnMSRNiRtFLdA==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr4243981wmj.1.1611753873407;
        Wed, 27 Jan 2021 05:24:33 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id f17sm3129760wrv.0.2021.01.27.05.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:24:32 -0800 (PST)
Message-ID: <9db3f6a50fdfca87998fb38b4a9a01e23f40c209.camel@gmail.com>
Subject: Re: [PATCH v2 6/9] gpio: ep93xx: refactor ep93xx_gpio_add_bank
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 14:24:31 +0100
In-Reply-To: <20210127104617.1173-7-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-7-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita,

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> - replace plain numbers with girq->num_parents in devm_kcalloc
> - replace plain numbers with ARRAY_SIZE(girq->parents) for port F
> - refactor i - 1 to i + 1 to make loop more readable
> - combine getting IRQ's loop and setting handler's into single loop
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 8f66e3ca0cfb..e4270b4e5f26 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -384,7 +384,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>  
>                 girq->parent_handler = ep93xx_gpio_ab_irq_handler;
>                 girq->num_parents = 1;
> -               girq->parents = devm_kcalloc(dev, 1,
> +               girq->parents = devm_kcalloc(dev, girq->num_parents,
>                                              sizeof(*girq->parents),
>                                              GFP_KERNEL);
>                 if (!girq->parents)
> @@ -406,15 +406,14 @@ static int ep93xx_gpio_add_bank(struct
> gpio_chip *gc,
>                  */
>                 girq->parent_handler = ep93xx_gpio_f_irq_handler;
>                 girq->num_parents = 8;
> -               girq->parents = devm_kcalloc(dev, 8,
> +               girq->parents = devm_kcalloc(dev, girq->num_parents,
>                                              sizeof(*girq->parents),
>                                              GFP_KERNEL);
>                 if (!girq->parents)
>                         return -ENOMEM;
>                 /* Pick resources 1..8 for these IRQs */
> -               for (i = 1; i <= 8; i++)
> -                       girq->parents[i - 1] = platform_get_irq(pdev,
> i);
> -               for (i = 0; i < 8; i++) {
> +               for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {

Why do you use ARRAY_SIZE() here instead of ->num_parents like above?

> +                       girq->parents[i] = platform_get_irq(pdev, i +
> 1);
>                         gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
>                         irq_set_chip_data(gpio_irq, &epg->gc[5]);
>                         irq_set_chip_and_handler(gpio_irq,

-- 
Alexander Sverdlin.


