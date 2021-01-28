Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C5B307A7D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 17:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbhA1QQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 11:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbhA1QPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 11:15:09 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08669C061574;
        Thu, 28 Jan 2021 08:14:29 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id 31so3579214plb.10;
        Thu, 28 Jan 2021 08:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ebmoIuF3Uj9Dga3CXxlH/hPzyMKtg/WMNHqvabp/Ti4=;
        b=AxdzqfrIbxcmKZFyQjZJ3+WGqUHBwTOM6sjuiAwkB4WqLNIkDRs9lAbUiuw+2xqH82
         2hDuPZuOD8656SQOww9s3MqZ1tZGdzPT9UuFo+FrYL29YWe4d5SDQoEVnzpLkupfVl4o
         /qDGzUCLLTAK0934Vr426N0pveRJ6tRuo90jSpnrT8ylyrKW61Avmewb4P6ZpkIbJ1lu
         CBDBqDHdcKfE+FqaTocipkBjJ/JAyY6z5GceYK+IJav0mfY28Hll4kgTYB9YjBrOG4iv
         RirtC0velWCKqZfdZ3YjqwxrUpA4QiTLLcrgU5gbLYLN+B+WyW/HgAc2AjzrDQ/dF/aq
         wrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ebmoIuF3Uj9Dga3CXxlH/hPzyMKtg/WMNHqvabp/Ti4=;
        b=fIZujtnpt4bfpyu9MvjYT2qEasEArGWV7DtYt5qPSUwXOLLt771ImWWoUpj1m5zDGL
         RvF/Et9dGCMhEkVb4Ws57cRV+hV1sCh2NBJm5H4VN70Dqnm60dH1jzHpOn7qT0jECx9M
         KmsN8ZGYmPdEHHG3C2yjzz3upsZGX6UOEBOLzNn0nYPNT4lkZytiP8jb5C0hgWQhc7ed
         2/dHhwbtc2Kj66K6Y5pXAVs9MehCq6OJnByesCkrkzAHblYHyEHYW2QN7RhJg3y+PaIW
         Ig5AyMDEDsdwFQh+axaeNZtv0ZFUCenM4auqgBC+0n9rJFQRo6RzhY5TP1/T6JUzmA5y
         Rtvg==
X-Gm-Message-State: AOAM530o4GAj5SsK2GkgXT7c856ZAI+SKruRUoEEVKqwSrSTUCl7iUsG
        8m/np5rqt4/xSdXrShHQNR8GxmDHoim8fsqigzo=
X-Google-Smtp-Source: ABdhPJyZq6kVNUSeUf2yzdXfA9ybotJ7FzYElXwK6i7SYrYjQxxnsF1okmFz94xBB2sQCvkK8i9plQUsU6IUM7d2qXY=
X-Received: by 2002:a17:90a:644a:: with SMTP id y10mr108794pjm.129.1611850468557;
 Thu, 28 Jan 2021 08:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20210128122123.25341-1-nikita.shubin@maquefel.me> <20210128122123.25341-3-nikita.shubin@maquefel.me>
In-Reply-To: <20210128122123.25341-3-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Jan 2021 18:14:12 +0200
Message-ID: <CAHp75VeQ55yZ9cFo0i6ep9tL-yW15coDnmXS6QJSccBdvk=+0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: gpio-ep93xx: Fix single irqchip with multi gpiochips
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

On Thu, Jan 28, 2021 at 2:21 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> Fixes the following warnings which results in interrupts disabled on
> port B/F:
>
> gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.
>
> - added separate irqchip for each interrupt capable gpiochip
> - provided unique names for each irqchip
> - reworked ep93xx_gpio_port to make it usable before chip_add_data
>   in ep93xx_init_irq_chips
>
> Fixes: d2b091961510 ("gpio: ep93xx: Pass irqchip when adding gpiochip")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

...

> +#define EP93XX_GPIO_IRQ_CHIPS_NUM 3
> +
>  struct ep93xx_gpio {
>         void __iomem            *base;
>         struct gpio_chip        gc[8];
> +       struct irq_chip         ic[EP93XX_GPIO_IRQ_CHIPS_NUM];
>  };

>  /* Port ordering is: A B F */
> +static const char * const irq_chip_names[] = {
> +       "gpio-irq-a",
> +       "gpio-irq-b",
> +       "gpio-irq-f",
> +};

Depending on the solution from the previous patch I would also go here
rather with holes, than messing up with mapping between port index and
index in this array.

-- 
With Best Regards,
Andy Shevchenko
