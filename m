Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CD8313329
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 14:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhBHNXQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 08:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhBHNVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 08:21:14 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BBAC061786;
        Mon,  8 Feb 2021 05:20:34 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id d2so8772940pjs.4;
        Mon, 08 Feb 2021 05:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=43IC4vJISybrKqjEwmCAdbs+nuXdxdgaNeFuc9odOHw=;
        b=HrhJa4+qz9MBnqkl1dpwWAfUy+D87NtUpL3vJjyQVg56K7HxBm8/282D8m7DtaeV0j
         TmfbY1dyHkOmOGDwArzox/sQNRyXY7+YfCTYeBCTRk/jlUNMptkxC+8BNQHHr76PVAg/
         nzjYlF5ayvSiSkdHwNOYyJ3QT5QKA4jqDovcUJI7KNAdgjhHyZ6OjSuhM4wXBonMUdQQ
         MClxHKA29stTSp0vPcbd9jr36OzKgXCeud1Q8wLurzw3poJIWZJGBXpQqOd1tffHBTF3
         px5QA8cn7C2onVPWK5vrpKWL7NOUwJhIfJRlQkhqSOCJ0KDRA1/GJ64pwdaSsnUebSpA
         fsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=43IC4vJISybrKqjEwmCAdbs+nuXdxdgaNeFuc9odOHw=;
        b=QnSLgcVNjiR/0HGUQ+ZPDEimo19PCVeRlzuoAJl+kRrq+xkV/PDX3CtGYHKbHNkSvx
         3y5IRQzJdb88mMbzdKVuXQOhonVxr6pAs41en9jrThS4JAYSCefelsO6UCHSXsfQ8KcN
         v8i8n3wG2dCh+ON1rOBgNnl9yn2MFwbfoiQcYlRRNguoJKHHhIRQsgOGHorZwRwPg/2N
         wsY32JCmqUR2FK7lr/dAT/zV7MfxVubajZI+F2HXNayR5fHatccPEkYtCNPo9gf2wC+m
         RmLsaSJSzMWG/Ro618g6zu+M1dUhwLanuraLJfdHQP7/PJtESy8u2pVaBpaszmnxS2VW
         9f3Q==
X-Gm-Message-State: AOAM531e+vGEU4QWXKl/NegM9oydMOhkU3ErccyG9kKl+9ivNsKg1ISV
        nEWVJ7NtPv68peGs3BZAknSkQFxp8WMcyQS23qGFJmvWomQm2A==
X-Google-Smtp-Source: ABdhPJyHtZ7soyYy7EdDvIyxrmBRYkKl4b+hem5pSs0LcdUmBKde5nRqlFJD9H7jPaCD1LPiFBozXl13n8n9L9AjQbc=
X-Received: by 2002:a17:902:be14:b029:e1:bec9:f4a7 with SMTP id
 r20-20020a170902be14b02900e1bec9f4a7mr16632466pls.21.1612790433573; Mon, 08
 Feb 2021 05:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20210208085954.30050-1-nikita.shubin@maquefel.me> <20210208085954.30050-3-nikita.shubin@maquefel.me>
In-Reply-To: <20210208085954.30050-3-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Feb 2021 15:20:17 +0200
Message-ID: <CAHp75VdV72fkpYgGqgebHfnN+VcVv04YvPxazpu1ZYsjMFP6Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 11:00 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> Fixes the following warnings which results in interrupts disabled on
> port B/F:
>
> gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.
>
> - added separate irqchip for each interrupt capable gpiochip
> - provided unique names for each irqchip

...

> +static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic, const char *label)
> +{

> +       ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s", label);

Is the label being NULL okay?

> +       ic->irq_ack = ep93xx_gpio_irq_ack;
> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
> +       ic->irq_mask = ep93xx_gpio_irq_mask;
> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
> +       ic->irq_set_type = ep93xx_gpio_irq_type;
> +}

...

> -               girq->chip = &ep93xx_gpio_irq_chip;

I don't see where you remove that static structure.

-- 
With Best Regards,
Andy Shevchenko
