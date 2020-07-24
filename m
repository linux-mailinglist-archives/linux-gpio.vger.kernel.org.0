Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4522722C3AD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 12:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGXKuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 06:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgGXKuS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 06:50:18 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA21C0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 03:50:17 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id m6so4639557vsl.12
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQU/lPzGwmqxJWjLiiaA2ZtS7d0dFJRLifebRqaZDxw=;
        b=AvHJycejFPc3A0BK6AbxF2HivO+45rKsHz/BBeg1JQGx09hmnLAMB6dHob93h/l3B5
         WC6l/mOpKRUgWF0lOoxggxoFNyVa7mW1U4FVU+3uuSCWvDANy3FjsBfy+Q/5prvJ/agJ
         5YkiGoGD/DO9eGDQWsFgEgEhpAx7RJKh44xGpUghNIF3ZQ4KU3sQqSMmg8LCuduimDW9
         5HzDluIUR4jmlwZVkhBJbhxLYAE7a2Mi0Vsof9fT4zOZc59AZjaq5ubXhSi0UDCnjnTa
         01phQ3bRoAAPELT8i5RDcO/BPYSnnbaanwcziFyuAE7ocsWU0QELcSleRnfEMQbF4ykE
         escg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQU/lPzGwmqxJWjLiiaA2ZtS7d0dFJRLifebRqaZDxw=;
        b=jSw/R/JLrJwoTrVj90eM2bgK7cNKNCf1ejzRODR2iB2n7ptzDpvgjUyxesLwJILXXr
         0T+Q/LzRi4Ub0SUEUPjLeaZPAlA4YuM1ESi8oBgtAOLNztytE7Ry+Us7aJk2IW87VAJC
         CKFm5Cv6tWyhepUJS4kdX6jifgtW2ZcJUn2UbWh7bhSNnU7RUDIR8UXrhjGRQVjWj9OB
         7QWj0LHIIjUK9GJVaDttWUMMzKMwB1U0VeEaKGfgX7LwCA3BkYB1PzCQagP8oyEcZtZ/
         gnJZVeNzcz6f5LHZKOWkC8kEUX4gm7zVASUNKBIz/ry+Lkp9OhQBKoN4MtkNlPzVHCDp
         RZDA==
X-Gm-Message-State: AOAM530Xsz0w4fuHF8vnyiUAQJvg4UMROqOIqTSsZ+Hh4aQLz0Icao49
        L41X6do993xc2N3prOzR7JjW0NDA85EKSRi9e6KPGgJ8JY5z3A==
X-Google-Smtp-Source: ABdhPJxgbymK+VYNYxlF37FdJcyHQVfjke1siUlLQqKzPaalBpQHPkQ/WDT/vyS+RXgyxiLgvtBNlo+9XRovxfcj9JM=
X-Received: by 2002:a67:338b:: with SMTP id z133mr7384839vsz.138.1595587817009;
 Fri, 24 Jul 2020 03:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200717141924.57887-1-linus.walleij@linaro.org>
 <CAPLW+4kX_1YNDNNeqzQGHZmnr0PYKHsrN++jw9-jOYv6Da3UuQ@mail.gmail.com> <CACRpkdYxhOQnXUaW-MdT4NX+NEES91NOoMPR6wEcaCrUR253Cw@mail.gmail.com>
In-Reply-To: <CACRpkdYxhOQnXUaW-MdT4NX+NEES91NOoMPR6wEcaCrUR253Cw@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 24 Jul 2020 13:50:05 +0300
Message-ID: <CAPLW+4mWw12ZsyK3-LiwcpQtiNMkbgUnGUHBbjtk-7vVZQQaxA@mail.gmail.com>
Subject: Re: [PATCH] gpio: max732x: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, 21 Jul 2020 at 12:54, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jul 19, 2020 at 6:34 PM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
> > On Fri, 17 Jul 2020 at 17:19, Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > This makes the driver use the irqchip template to assign
> > > properties to the gpio_irq_chip instead of using the
> > > explicit calls to gpiochip_irqchip_add_nested() and
> > > gpiochip_set_nested_irqchip(). The irqchip is instead
> > > added while adding the gpiochip.
> > >
> > > Cc: Sam Protsenko <semen.protsenko@linaro.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> > I can test it on my MAX7325 board with BeagleBone Black in a day or
> > two.
>
> Thanks! No hurry.
>
> > Do you want me to verify your patch on top of linux-mainline or
> > linux-next?
>
> Either should work.
>
> > Also, is there any specific stuff you want me to look at,
> > or making sure there are no regressions w.r.t. IRQ from the chip is
> > enough?
>
> Just that really, that the IRQs happen as before.
>

Just tested it on my MAX7325 board [1], by adding gpio-keys and
gpio-leds to BBB dts [2]. Alas, the patch seems to be breaking IRQs.
Before the patch, I can see gpio-buttons appear in /proc/interrupts
and dmesg is clear of errors. After applying the patch, no gpio-keys
appear in /proc/interrupts and dmesg is reporting errors like this:

    irq: no irq domain found for max7325@68 !

This is probably because the patch is setting gpio_chip structure
fields after devm_gpiochip_add_data() was executed. Next hacky change
fixes it:

<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>
@@ -695,11 +695,11 @@ static int max732x_probe(struct i2c_client *client,
                        return ret;
        }

-       ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
+       ret = max732x_irq_setup(chip, id);
        if (ret)
                return ret;

-       ret = max732x_irq_setup(chip, id);
+       ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
        if (ret)
                return ret;
 <<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>

I didn't check if it's a correct fix, so the diff above is only to
check the idea. Anyway, if you send v2 I can retest it, as my setup is
ready.

Thanks!

[1] https://github.com/joe-skb7/max7325-pcb
[2] https://github.com/joe-skb7/linux-mainline-bbb-max732x/commits/max732_bbb_test

> Yours,
> Linus Walleij
