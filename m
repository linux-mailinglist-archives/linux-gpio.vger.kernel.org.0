Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFDE249BE8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 13:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgHSLfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 07:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgHSLfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 07:35:44 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742BEC061757;
        Wed, 19 Aug 2020 04:35:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id 88so21191998wrh.3;
        Wed, 19 Aug 2020 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=110aMJdO4FJWuQQUKPYb0A60VZ0r2GXGUT+vkrN3Zc0=;
        b=AarEY3oJiH3iiy0uogYt50kcIBPxB9OZkiCe4STZrwU5RAUcPvl4N6vPw1Co9bWFkp
         0cPmpQao7EOKfFBSPc/FhvQAZec1cBBo0eEXoJxU7RWXLuVNRO5DF5mqijGZPmvqQW5P
         GSxJdacQmuQOQY8IZ3qbF3OBYMCNJ7b/JmMnQ1GxNdvU3x2RH2X47HldAxUJdietiZSA
         KZIOWM1kpBPQPP3wTdc+J8uvQ74m9rbB3/b4dKBhRiYGOjt22RuwYA8ANN2Qn2p9YLtU
         4dNxpOAdu7WAV31S0ErWtiqgp4PP/1HmXrY5z8aRD/Js9IShcZB7ZUgmzR6MyklxTf7p
         lBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=110aMJdO4FJWuQQUKPYb0A60VZ0r2GXGUT+vkrN3Zc0=;
        b=nslH7inBjQ4C0IpbfW5sw3pj/XohP2230aZVHMam+xgPGFUx9BQc70yRLK7YU0KzNk
         H1QFLd6r97TmBeTJVlSddj4G03bCTkwUwtfUl8CviRstyQDF7CRWvmUHorsl7KJS4a1O
         O8LZADrXqT4nA33UeaTYL1cXRiwwvoV4HFQlfLAEstXQvBwdrM//TaILNQl4vgbPQJ9Y
         v5Cl/Ak90X40Vf0NKWPFP9ku6t4EnCLGWwvKjAJnfkUkQnydH8ypFGM+gWeynqDCJZJS
         Kj2dORWY89JgX6tiTxaK3fpLnKoZQJpqcXr1XTTqwlSyiR8Ru9S9CXenOMIzRfGW5tzx
         638A==
X-Gm-Message-State: AOAM533FDAzcthb0blkbwJuU96hn5dTIi5sjDBTf17QAv7z3OJ7kqz7I
        +tB+waqvUyTe97vk811XVfI9MNkPcC4KbQTIM84=
X-Google-Smtp-Source: ABdhPJxD4jtwJwas6XUTJqKh3M4I8uFgZSBWSM5cuRZig38CDncGHCJWEEKRDHkLN5VXed/CNqWemqYYp6i+jX2qAGU=
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr3759753wrr.370.1597836943101;
 Wed, 19 Aug 2020 04:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200729093450.28585-1-zhang.lyra@gmail.com> <CADBw62p=aB3EZYkMm44Zx4Krww21SS9vCsMnPOq0pn2DgA8VkQ@mail.gmail.com>
In-Reply-To: <CADBw62p=aB3EZYkMm44Zx4Krww21SS9vCsMnPOq0pn2DgA8VkQ@mail.gmail.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Wed, 19 Aug 2020 19:35:06 +0800
Message-ID: <CAAfSe-vEW5CDJnae3AHwciAsinvMvuUAdv8TiCkxEjNga8U=SQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sprd: Clear interrupt when setting the type as edge
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Taiping Lai <taiping.lai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[reply behalf on Taipin]

Hi Baolin,

On Sat, 1 Aug 2020 at 07:59, Baolin Wang <baolin.wang7@gmail.com> wrote:
>
> On Wed, Jul 29, 2020 at 5:35 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> >
> > From: Taiping Lai <taiping.lai@unisoc.com>
> >
> > The raw interrupt status of GPIO maybe set before the interrupt is enabled,
> > which would trigger the interrupt event once enabled it from user side.
> > This is the case for edge interrupts only. Adding a clear operation when
> > setting interrupt type can avoid that.
> >
> > Fixes: 9a3821c2bb47 ("gpio: Add GPIO driver for Spreadtrum SC9860 platform")
> > Signed-off-by: Taiping Lai <taiping.lai@unisoc.com>
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> >  drivers/gpio/gpio-sprd.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
> > index d7314d39ab65..36ea8a3bd451 100644
> > --- a/drivers/gpio/gpio-sprd.c
> > +++ b/drivers/gpio/gpio-sprd.c
> > @@ -149,17 +149,20 @@ static int sprd_gpio_irq_set_type(struct irq_data *data,
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 1);
> > +               sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
>
> I think you should move this abonormal interrupt clearing operation to
> sprd_gpio_request(), when users request a GPIO.

We have a few considerations:
1) Like described in the commit message, the problem this patch solves
is for edge interrupt only; The interrupt requested by user is
IRQ_TYPE_LEVEL_HIGH as default, so clearing interrupt when request is
useless.
2) We can set interrupt type to edge when request, and following up
with clearing it, but the problem is still there once users set the
interrupt type to level trggier.
3) We can add a clear operation after each time of setting interrupt
enable bit, but it is redundant for level trigger interrupt.

Therefore, adding a clear operation when setting interrupt type seems
the best solutions which I can think out so far.

>
> >                 irq_set_handler_locked(data, handle_edge_irq);
> >                 break;
> >         case IRQ_TYPE_EDGE_FALLING:
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 0);
> > +               sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
> >                 irq_set_handler_locked(data, handle_edge_irq);
> >                 break;
> >         case IRQ_TYPE_EDGE_BOTH:
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
> >                 sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 1);
> > +               sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
> >                 irq_set_handler_locked(data, handle_edge_irq);
> >                 break;
> >         case IRQ_TYPE_LEVEL_HIGH:
> > --
> > 2.20.1
> >
>
>
> --
> Baolin Wang
