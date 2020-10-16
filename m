Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0CD2908AF
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 17:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408615AbgJPPmf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 11:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408608AbgJPPmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 11:42:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD2BC061755;
        Fri, 16 Oct 2020 08:42:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p11so1488249pld.5;
        Fri, 16 Oct 2020 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAbghpaYZHbkqxI5bowqjpAtc3NHNID3auCHmv5xSqY=;
        b=YBw/HrTYRU7xNRlN50SRo3xTSr6CvOaTWR11dIoj758OomuykXmZQrt4O2via32RfP
         kBgXsXcB2oy0bA8vsJ1U5rSchWi+zYSGO8p9Nl7yBgrrs9FWs5fulA4oLkTu5TUh1rnD
         N8fsS7ByF1Fecx4UBgfCyVrswLTa5crXvo/Tz/SsTtaTmCoNLAE09U8XLYh+7f5x7xaW
         1pBiAECVkIRNjlYyYGHUqvt1XlyZVJPmk4PRPt89I6Y0H6pzsC0xtiXUl6LdaDy3+16M
         XTNwLBfNuup8F6JmsgZ9z9eXpRGyqaHkZEaf6J5HggwhYzevRtQiUT8nAopsQK5pZ44j
         /qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAbghpaYZHbkqxI5bowqjpAtc3NHNID3auCHmv5xSqY=;
        b=i0bmYJ3VqZG9h4k4G96YXQVv645gnK/GIDb/w7goyKSqjkRvO+WWq3yTsrmA6qk93c
         zbM/2O4bygpoYcuRp6zIL0rxR+0OmMxqf64OEovFFKqSODB/HqQ8D5XlMde2l1dQ99fz
         bhJGQ0DeR2pDel9zneykEs66Qw8gjAoOOjcj0bgfHYsDY4iKyGK1H2BV30LHVZFZqarF
         z8GowV0qqexwZMY3WQwWojJXnbAPx+//rVZwFidA2I7QqCxLbfB1dA9Gjvk0MKxJWzbD
         JMnjoqWSZgX+BEKYVpJS11ZjTxo3WLXiNtKxK5wBmcVVn48PSV4YFBuKjupod43/h78s
         xkRg==
X-Gm-Message-State: AOAM530iRoh/xNnrkJT0BKF0MrLYe27CFvEWzSSWmcA37RBgk06G7QLT
        yyUUU5yw5FdiCci4tEe9bBKVq+MuTXxLcBigUtU=
X-Google-Smtp-Source: ABdhPJxAX6hiE7Ts8mpORicINnf0zOKVYKb8a3OLR81zMNfEeORtZGXKk2cYZpL4TX4PT7tdEMseGRQIX5sXuDY/OI4=
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id
 x12-20020a170902ea8cb02900d28abdc8demr4620759plb.21.1602862954641; Fri, 16
 Oct 2020 08:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201016153544.162611-1-justin.he@arm.com>
In-Reply-To: <20201016153544.162611-1-justin.he@arm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Oct 2020 18:43:23 +0300
Message-ID: <CAHp75Vexk_He78uHN-o4Cev4aUYM_doK6g-bvwfqgKwHm3mTvA@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Fix missing conversion to GPIO-lib-based IRQ-chip
To:     Jia He <justin.he@arm.com>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 6:36 PM Jia He <justin.he@arm.com> wrote:
>
> Commit 0ea683931adb ("gpio: dwapb: Convert driver to using the
> GPIO-lib-based IRQ-chip") missed the case in dwapb_irq_set_wake().
>
> Without this fix, probing the dwapb gpio driver will hit a error:
> "address between user and kernel address ranges" on a Ampere armv8a
> server and cause a panic.

Thank you for a fix!

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> Fixes: 0ea683931adb ("gpio: dwapb: Convert driver to using the
> GPIO-lib-based IRQ-chip")

Should be one line. But I think Bart or Linus may fix this problem if
Serge is okay with a change in general.

> Signed-off-by: Jia He <justin.he@arm.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index a5b326754124..2a9046c0fb16 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -343,8 +343,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  #ifdef CONFIG_PM_SLEEP
>  static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  {
> -       struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> -       struct dwapb_gpio *gpio = igc->private;
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
>         struct dwapb_context *ctx = gpio->ports[0].ctx;
>         irq_hw_number_t bit = irqd_to_hwirq(d);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
