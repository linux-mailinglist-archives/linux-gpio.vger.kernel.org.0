Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD4363C53E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 17:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbiK2QfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 11:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbiK2QfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 11:35:12 -0500
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726365DB94
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 08:35:11 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id j26so10148353qki.10
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 08:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f3MH+lMogUACYGlj31f9V1BiT8ZZFJNj/XqOwmMz0c=;
        b=FOGwUURtisL1C7Ei7ZFzmIQqmmNBveZ1p3kMSWiDIIuPKhJ/sN6w3h3kjvQT61gnvX
         IrTpk/JygwEfbstVN6PJg8G3zZw8RL6FLGRBsKv+Z+7QS5gHa9vneB6boKDrCNmCWyCt
         y32Nl36NxfzJMMF1+GZdJ14BPIbR9Y77UnnMBWkVgeDArbdiDqHWTv8uyb/ys1ifp1+A
         6F72qkLf1LLHKKpBWS+oTGWifDJnbVD13HIi9lEGB5E5rTVV7ckzLqnk5+OVn2miH3wr
         xMmavx86LDXUP5fgBwGRtwFo5Lmeeaz6bc2Mvw7JgD30xvtp3u6ccqF7Qq/i0CaKjsRE
         hBxw==
X-Gm-Message-State: ANoB5pmC6fjAKRUu0+6k/imPDfEzsN8TONWpQScPbMo8gLGSDTbYsb0g
        SUjJiktRZRlB8GNaPmDDX69GkSctsb2EQg==
X-Google-Smtp-Source: AA0mqf7hwJoSVdxb5q5ZahQTHnBejLd+xAJEkUb0xvo6zOImgrve8XA1X0zmt2/Bf+u/MLnamoESsw==
X-Received: by 2002:a05:620a:1218:b0:6fc:9738:e7b2 with SMTP id u24-20020a05620a121800b006fc9738e7b2mr1377449qkj.548.1669739710366;
        Tue, 29 Nov 2022 08:35:10 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id cx23-20020a05620a51d700b006fb9bbb071fsm10626795qkb.29.2022.11.29.08.35.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:35:09 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id o127so2678287yba.5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 08:35:08 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr36992059ybq.89.1669739708665; Tue, 29
 Nov 2022 08:35:08 -0800 (PST)
MIME-Version: 1.0
References: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
 <Y4Yzw4Oq8lUEHdcC@spud>
In-Reply-To: <Y4Yzw4Oq8lUEHdcC@spud>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Nov 2022 17:34:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyAv9xD0WGCMKYvBSAjJ0auXc-JGfcgu-xxc-P1PPg8A@mail.gmail.com>
Message-ID: <CAMuHMdXyAv9xD0WGCMKYvBSAjJ0auXc-JGfcgu-xxc-P1PPg8A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpfs: Make the irqchip immutable
To:     Conor Dooley <conor@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Conor,

CC Lewis

On Tue, Nov 29, 2022 at 5:31 PM Conor Dooley <conor@kernel.org> wrote:
> On Tue, Nov 29, 2022 at 05:23:22PM +0100, Geert Uytterhoeven wrote:
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.  Following this change the following warning is
> > now observed for the gpio-mpfs driver:
> >
> >     gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!
> >
> > Fix this by making the irqchip in the gpio-mpfs driver immutable.
> >
> > While at it, drop of the unneeded masking of the hwirq number, as it is
> > always smaller than the number of GPIOs/interrupts handled by the
> > controller.
>
> Huh, I didn't think this was upstream yet?
> Lewis should be working on an updated version of it at the moment, last
> I heard he was looking into using regmap stuff as pointed out in a
> review.

Oh right, this is still a local patch.
Sorry, I thought it was already upstream...

>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not tested with interrupts, as there are no inputs described in the
> > Icicle DTS yet.
> > ---
> >  drivers/gpio/gpio-mpfs.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> > index 168be0b90cf8c656..fd294b581ae77369 100644
> > --- a/drivers/gpio/gpio-mpfs.c
> > +++ b/drivers/gpio/gpio-mpfs.c
> > @@ -168,8 +168,9 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
> >  {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> >       struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > -     int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> > +     int gpio_index = irqd_to_hwirq(data);
> >
> > +     gpiochip_enable_irq(gc, gpio_index);
> >       mpfs_gpio_direction_input(gc, gpio_index);
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> > @@ -180,11 +181,12 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
> >  {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> >       struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > -     int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> > +     int gpio_index = irqd_to_hwirq(data);
> >
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> >                            MPFS_GPIO_EN_INT, 0);
> > +     gpiochip_disable_irq(gc, gpio_index);
> >  }
> >
> >  static const struct irq_chip mpfs_gpio_irqchip = {
> > @@ -192,7 +194,8 @@ static const struct irq_chip mpfs_gpio_irqchip = {
> >       .irq_set_type = mpfs_gpio_irq_set_type,
> >       .irq_mask       = mpfs_gpio_irq_mask,
> >       .irq_unmask     = mpfs_gpio_irq_unmask,
> > -     .flags = IRQCHIP_MASK_ON_SUSPEND,
> > +     .flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
> > +     GPIOCHIP_IRQ_RESOURCE_HELPERS,
> >  };
> >
> >  static void mpfs_gpio_irq_handler(struct irq_desc *desc)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
