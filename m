Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2285C313879
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 16:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhBHPtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 10:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbhBHPtC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 10:49:02 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF63C061788;
        Mon,  8 Feb 2021 07:48:19 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m13so17671372wro.12;
        Mon, 08 Feb 2021 07:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wZrQti5YeMsa4slDaHx1zyDy3YoPvCDo0D+weFkrbUo=;
        b=Dl/B+lIxr2aCLnNQFsWqau2kDOqSbMjKZGeDjVVwguQZng6ygWvaOYFjAKqeO7j+kI
         F78V3YDJuZj1RhVOa/goOatBCh5k7coNpVhNh2mIzveBxKljTW3ImK1onFffr0yce1PE
         I1Iiqxjyo+1qKsQYF4LlGe0jzLFo2R3JsYycx+xPcEKREAmPdye+asyVuVD8WlMv5HfG
         eir37mLGhIf9fVLrH7TD/VfSj+/cJEVT7SOWAAjwX66T28dVkUDc5xx22Cxuza+jSL0a
         4vRrCUkm6iD8vrPp3qe+RjoKB5mqjaAk8hOJ1+2gpOaelwAvoI/EDhgPZX4iqFzVjuFd
         WhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wZrQti5YeMsa4slDaHx1zyDy3YoPvCDo0D+weFkrbUo=;
        b=PwcoHM9gITo468g+V79jQlsthtw4ZIfyHE45HC5lGThh1NlTQSP3aoN8wQS7qJoK7g
         1pqyrazW6Y7cV3W8eDOq66FewlYjENN7tdlGIn949H4HzsyCyd3jTLCQa5h1PqqoJWHX
         PgTiJRe1Cz9lWHUtIZxCbiF8/9+aQxqswLbuKKC/d2xiPOFb4lxurRMq34FIUbcwJIvv
         I9BUIy28W2d5WnLrdbcToQPBmB3Wrxyl9aIaGGYSqZlv+3VE9wdNaidgEVsnFJ+aAw9C
         diii8emVpeDizYumcqDZ4ThPXTLY+dY20AapngXMeL87z6cx254O2FQcJvqHPTf9McrW
         OUAw==
X-Gm-Message-State: AOAM530wkPAQMAx5xDwb3ljKeQuC1njZSC43ptl6m9/rcQjFpZeX+Ifz
        w8TjDT07IoIYPKR0m8CpW3U=
X-Google-Smtp-Source: ABdhPJwxvKKXuCMS0ahEG2Pf5OV9bE+YGR5oL2rCJTaeOo6DlpeH0EmFI2Vpc94POMat1C/U5gQCJQ==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr7810623wrm.355.1612799298377;
        Mon, 08 Feb 2021 07:48:18 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id 9sm32151240wra.80.2021.02.08.07.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 07:48:17 -0800 (PST)
Message-ID: <423724a1de34c22327a17b0919bf2f1398c27706.camel@gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi
 gpiochips
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 08 Feb 2021 16:48:17 +0100
In-Reply-To: <20210208085954.30050-3-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
         <20210208085954.30050-3-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita,

On Mon, 2021-02-08 at 11:59 +0300, Nikita Shubin wrote:
> Fixes the following warnings which results in interrupts disabled on
> port B/F:
> 
> gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> 
> - added separate irqchip for each interrupt capable gpiochip
> - provided unique names for each irqchip
> 
> Fixes: d2b091961510 ("gpio: ep93xx: Pass irqchip when adding gpiochip")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

I performed a bootup with the whole patch-series and
confirm that the warning is gone. Thank you for looking into this!

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> v4->v5:
> - generate IRQ chip's names dynamicaly from label
> ---
>  drivers/gpio/gpio-ep93xx.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 64d6c2b4282e..3d8eb8769470 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -38,6 +38,7 @@
>  #define EP93XX_GPIO_F_IRQ_BASE 80
>  
>  struct ep93xx_gpio_irq_chip {
> +       struct irq_chip ic;
>         u8 irq_offset;
>         u8 int_unmasked;
>         u8 int_enabled;
> @@ -331,6 +332,16 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
>         return EP93XX_GPIO_F_IRQ_BASE + offset;
>  }
>  
> +static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic, const char *label)
> +{
> +       ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s", label);
> +       ic->irq_ack = ep93xx_gpio_irq_ack;
> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
> +       ic->irq_mask = ep93xx_gpio_irq_mask;
> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
> +       ic->irq_set_type = ep93xx_gpio_irq_type;
> +}
> +
>  static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>                                 struct platform_device *pdev,
>                                 struct ep93xx_gpio *epg,
> @@ -352,6 +363,8 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>  
>         girq = &gc->irq;
>         if (bank->has_irq || bank->has_hierarchical_irq) {
> +               struct irq_chip *ic;
> +
>                 gc->set_config = ep93xx_gpio_set_config;
>                 egc->eic = devm_kcalloc(dev, 1,
>                                         sizeof(*egc->eic),
> @@ -359,7 +372,9 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>                 if (!egc->eic)
>                         return -ENOMEM;
>                 egc->eic->irq_offset = bank->irq;
> -               girq->chip = &ep93xx_gpio_irq_chip;
> +               ic = &egc->eic->ic;
> +               ep93xx_init_irq_chip(dev, ic, bank->label);
> +               girq->chip = ic;
>         }
>  
>         if (bank->has_irq) {

-- 
Alexander Sverdlin.


