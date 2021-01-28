Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1972A307EB9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 20:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhA1SmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 13:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhA1SjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 13:39:07 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD86C061573;
        Thu, 28 Jan 2021 10:38:27 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 190so5108789wmz.0;
        Thu, 28 Jan 2021 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hLVGTP0Ha6enebkkKVnGDfTs/eGyRm5kEtWtYGrOVgU=;
        b=suWx9loP2k55VGqeGwl8kEMnzzdz/rnHne43tBi5fQcd8XNFvfbL6lvn+S2r330AGe
         YvBW1WsZ8vvpSJ0g7ivlUGSBQ7JiLikvIrWlFq3Bn+OI/iMRWQD0fzwYmK24hfeO/1e9
         miCl94fx6hfzUy7WXtcceJNGcJcxp8CWyJDP9JBVyoUW+kcA1caos/YUVxl4hjCYMOW5
         DzEwibhzr21u1l5lQ+0NCCBBHDCQdueTFgQsQOqNkihhmyP2W2mzTv0IaI7aiRR93ZXy
         NkSY67Yt4ATSrx7nTuhyggH/++kh8uAXduCVZM3q4erUUiL8DabCJEOX+or02QYv4R5V
         2zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hLVGTP0Ha6enebkkKVnGDfTs/eGyRm5kEtWtYGrOVgU=;
        b=UUtqoTvj/bTG2krJ10dm1jAg3dgGncjlMzoIIgVy1R/Yc6brxIcFV/GkZpOUhDUOv2
         OcqbjFhKHXvtlVsZkebS7oSKKuXHb+xqYflQlw47RMspGFNERHWCp3kAmu4U32Io50Ta
         /PYDbJIlkwiZAXNtAwQQmYD9igO10wJz8W3d4szkWhpIl5HQspZDQEFT2KdtX9+8GHNC
         4TnfAz6zN4KdK3/fRSsZaLaIcz+KVKkPmF7u5LfBIwStANvzt7obWeTUqCFVjXT2cLEY
         1B7DJksOt0+t1dhCRAoL++hb2RaW8YXUbrt7DF5LIhFh5OKpXYpK0hfgkphCau2e/izs
         C9hQ==
X-Gm-Message-State: AOAM530P0/bIfkYi7rpF0YHmREquQ2RC2Dg0pwFhurONhXo0JL/0xfKr
        xUCdQnMon88HsR9qdSlNrZQ=
X-Google-Smtp-Source: ABdhPJyJbc8lHj6O+0R6jguv+MUQilJb4PRS6Ch3Eo1uyQvpbCnGnJy20Mc1tpDyqFWQhxQqLSIqKw==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr522694wmb.155.1611859106332;
        Thu, 28 Jan 2021 10:38:26 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id w4sm6662101wmc.13.2021.01.28.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:38:25 -0800 (PST)
Message-ID: <c97f80669dc7188d134498c367a4ee34810ba29d.camel@gmail.com>
Subject: Re: [PATCH v3 6/7] gpio: ep93xx: refactor ep93xx_gpio_add_bank
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 28 Jan 2021 19:38:24 +0100
In-Reply-To: <20210128122123.25341-7-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-7-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-01-28 at 15:21 +0300, Nikita Shubin wrote:
> - replace plain numbers with girq->num_parents in devm_kcalloc
> - replace plain numbers with girq->num_parents for port F
> - refactor i - 1 to i + 1 to make loop more readable
> - combine getting IRQ's loop and setting handler's into single loop
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> v2->v3
> - use ->num_parents instead of ARRAY_SIZE()
> ---
>  drivers/gpio/gpio-ep93xx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index d69ec09cd618..df55aa13bd9a 100644
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
> +               for (i = 0; i < girq->num_parents; i++) {
> +                       girq->parents[i] = platform_get_irq(pdev, i +
> 1);
>                         gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
>                         irq_set_chip_data(gpio_irq, &epg->gc[5]);
>                         irq_set_chip_and_handler(gpio_irq,

-- 
Alexander Sverdlin.


