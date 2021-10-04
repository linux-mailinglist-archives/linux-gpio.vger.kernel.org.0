Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD4C421269
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 17:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbhJDPP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 11:15:56 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:42848 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbhJDPPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 11:15:55 -0400
Received: by mail-ua1-f47.google.com with SMTP id c33so12558027uae.9;
        Mon, 04 Oct 2021 08:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04u9HrHvopK+Qx0rr9TojIrIzwVyQ9P12bAyng4Dcac=;
        b=1GT2qdf7bHz2ruStg2oLTcDHUm4H0P2waKGMzG09eY1CCv+1Wt1ssqXmd6GIrbleS0
         uZFEsinRMVUSWNonJXUKA/kXXIMMVnbqpjR0ttL5Ndlti+3QfrqlGxB3BVKZbylV3TSp
         uNgFtcPEJ0/Fbh0vGuGe1xhIF4ivRHiSFMXZnyhh3Pnvnu6kaH8FBUrou7VhibGH8Rln
         GDQ7825UoiDteVOYag3mTSTF2FBUTXp0CwFC+wFpNTv9xEqgseuBTCCav/x4X7uPD6kt
         8X4qapRz+ZU3/onDBwZl+SzRRhUoYrwr4k4ET6Oxx2q/bJU1oXmK4Flb+8sHbhBkqXwv
         LjjQ==
X-Gm-Message-State: AOAM531bT2itk3hPHivt16vbXybCcgfe80oa3XbIG/lLTBWZAMClSkRp
        Q+ShsMsyShZlf1HfwrJnT1v6ljfbWgxnrRGAypA=
X-Google-Smtp-Source: ABdhPJyV7757NDGwKZMKgvNplAl+Z/hrqly7udXrzzrg4UvhsbNv5XCDntVWXukH0mEfWvrMrHX+meN/Yb93gpCse5g=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr7168725uac.89.1633360446142;
 Mon, 04 Oct 2021 08:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <c987d0bf744150ca05bd952f5f9e5fb3244d27b0.1633350340.git.geert+renesas@glider.be>
 <CAHp75VcBVGLbNxnZ4FwvdoyxQjA_V8MVHdrSYOQdxTm5bFDc5g@mail.gmail.com>
In-Reply-To: <CAHp75VcBVGLbNxnZ4FwvdoyxQjA_V8MVHdrSYOQdxTm5bFDc5g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Oct 2021 17:13:54 +0200
Message-ID: <CAMuHMdWctqTZRzrHfTsxnK0JNDa1k0o8SNcGMCG1DejoZM70yw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: Add interrupt support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        metux IT consult <lkml@metux.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Oct 4, 2021 at 3:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 4, 2021 at 3:45 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently the GPIO Aggregator does not support interrupts.  This means
> > that kernel drivers going from a GPIO to an IRQ using gpiod_to_irq(),
> > and userspace applications using line events do not work.
> >
> > Add interrupt support by providing a gpio_chip.to_irq() callback, which
> > just calls into the parent GPIO controller.
> >
> > Note that this does not implement full interrupt controller (irq_chip)
> > support, so using e.g. gpio-keys with "interrupts" instead of "gpios"
> > still does not work.
>
> ...
>
> > @@ -414,7 +421,8 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
> >         for (i = 0; i < ngpios; i++) {
> >                 struct gpio_chip *parent = gpiod_to_chip(descs[i]);
> >
> > -               dev_dbg(dev, "%u => gpio-%d\n", i, desc_to_gpio(descs[i]));
> > +               dev_dbg(dev, "%u => gpio %d irq %d\n", i,
> > +                       desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));
>
> This is an unconditional call that will allocate the IRQ descriptor

If DEBUG and CONFIG_DYNAMIC_DEBUG* are not enabled, it's a no-op
(protected by if (0) { ... }).
If CONFIG_DYNAMIC_DEBUG is enabled, the operation is a no-op if not
enabled dynamically (if (dynamic_checl) { ... }).
If DEBUG (CONFIG_DEBUG_GPIO) is enabled, the output is wanted.

(yes, I've just checked the preprocessor and assembler output ;-).

> even if we don't use it. Correct?

It calls .to_irq() of the parent GPIO controller, which is usually
just doing some offset addition.  But that's driver-dependent.

> If so, I don't like this.

No worries, desc_to_gpio() and gpiod_to_irq() are only evaluated when
the debug output is wanted.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
