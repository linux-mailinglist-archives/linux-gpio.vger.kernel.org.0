Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B24398AD7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 15:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFBNiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 09:38:11 -0400
Received: from mail-yb1-f175.google.com ([209.85.219.175]:46734 "EHLO
        mail-yb1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhFBNiK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 09:38:10 -0400
Received: by mail-yb1-f175.google.com with SMTP id y2so3799448ybq.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Ynq65zJgZaJ1DDQH8/nTM0vWUXwNaeZbZ+ylCWa8X4=;
        b=bHQKf0Bh5u0VD3pcErRT5BFCXmr1vhAfyd/N7RgSFfHsIDSOW1+NhT//pqINBbEvFf
         pZ59VaqBdBv/tHRYe4h8KroNvFmeugk/ZZ4/8nlfezVjERWRKysrr3KF5cYhgu/uePjT
         6XM2SnqrTbF79YM2u+1sU9U+IUbzjxu1xZbdjFkYJv3bCkPRNQDMBs3V4aeaDYlQQTlT
         OYoSMOHUd4BKnZC3b3JxZ9shC4I9qy5OgEVLLlYscDqYXX1gJhME2vcyYe8HRhsEVzGT
         w/nhYuKrW5K8iPtjFdayZyjGLE10hFAl/rKlDM0b4FD73/eg+buvVvy/5rECrt1N80Dp
         +h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Ynq65zJgZaJ1DDQH8/nTM0vWUXwNaeZbZ+ylCWa8X4=;
        b=IgCtxg1MP7xeX9o8fDUSdgNC68l4BhOViDBkb6KAJXkI+IXdaGQ9/jhs8H9o1hEQP4
         kpMK6JTiuSzIVtGRzrzUYS/2OUhFfUoYPtvf7PlZqSBreIWT30yezKcyarbmWTVbqkjZ
         aCNC2c3M5WwBQHqZNs3rv0+66zdW3a8pNQZmZfbaiHauL1OKP/xIkPCk9dCiG8KEmAAL
         F+ZI6IoB1vGMNnUQwO5z6mB4CQMem8OVrL0+8ELT0ULKJ9bFqXcHJWOGl0KNKgkh6fVx
         tk3m0Tdc4vUg+K0HpmxYc4Xgr+xgpoDrVDk7wYaPLYLO52mCy+sde5BsiErEISIHdkMj
         +x2w==
X-Gm-Message-State: AOAM533L0cy9zJwxu0qwtTlVQJrPyk8GjCFhqgM7+rad4gG6+LM4+xsN
        HWaKvrtwzlz2bWCROfxXrRPugy6W3uJGwMNy0ThSBA==
X-Google-Smtp-Source: ABdhPJyAhzTHc9jQwL9FaayiMoEIa880PB9NTfpy+vq5aOjqITc5fFPNQ2xLnDexqmBArWXs3eakTJ9F5iYrDyksFKU=
X-Received: by 2002:a25:8804:: with SMTP id c4mr47285623ybl.469.1622640912641;
 Wed, 02 Jun 2021 06:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com> <20210601162128.35663-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210601162128.35663-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 2 Jun 2021 15:35:02 +0200
Message-ID: <CAMpxmJWHH7-40Gc5RCyRMq5v-_Ew8-B_CgrJmZQgtq2N6F5JEA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: dwapb: Switch to use fwnode_irq_get()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 6:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We have open coded variant of fwnode_irq_get() in dwapb_get_irq().
> Replace it with a simple call.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 939701c1465e..7d61f5821e32 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -528,17 +528,13 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
>                           struct dwapb_port_property *pp)
>  {
> -       struct device_node *np = NULL;
> -       int irq = -ENXIO, j;
> -
> -       if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
> -               np = to_of_node(fwnode);
> +       int irq, j;
>
>         for (j = 0; j < pp->ngpio; j++) {
> -               if (np)
> -                       irq = of_irq_get(np, j);
> -               else if (has_acpi_companion(dev))
> +               if (has_acpi_companion(dev))
>                         irq = platform_get_irq_optional(to_platform_device(dev), j);
> +               else
> +                       irq = fwnode_irq_get(fwnode, j);
>                 if (irq > 0)
>                         pp->irq[j] = irq;
>         }
> --
> 2.30.2
>

Applied, thanks!

Bart
