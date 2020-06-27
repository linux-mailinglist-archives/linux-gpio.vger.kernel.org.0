Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC2920BFEC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 09:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgF0H6L convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sat, 27 Jun 2020 03:58:11 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34756 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgF0H6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 03:58:10 -0400
Received: by mail-oi1-f195.google.com with SMTP id e4so1958940oib.1;
        Sat, 27 Jun 2020 00:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FEOix1PkmJ3Xu++XOiz630IHPluOaNyyv6Gt5QqasRA=;
        b=fqgYEG+zOrFBXq/UTt23d5o6YuURSPJts55aFRwNpZyVS+bC4CWPgJPs356PfC85EG
         n+KJWYdOxwzL8uAv9JWfbZn9cAilqGkm20qLpgR8hlOJdbl/ASf7hUXDJ/OJ2NBVnzxi
         k/rGsFD3lNHWMcI/1ErZxSufIZ3fO2nxlpsj5SuQCY9vFsUFcNfZBqubPIj6W/72ye6E
         wAsKHpc5BhD1yL5nJkvNGK2Ex7sBUesUfCLI6XOHBB4T0aV5cMhsKCy9eIRjkqMxTTck
         MEtFvhF0LIpiylN+PIJ9ju6BLmB2oRZ46i3snjWSZrF/kT/Mqpaxt5YZRt/YInlEsZXI
         +kLw==
X-Gm-Message-State: AOAM531DKQ48YblDJW9WtIPgFbf4oFAcrfZyro2yWeD0PzIA7bvBjSob
        WGzvN3VWqg+5vVN/DxysL5EDvVrIDb3FRGnhD2c=
X-Google-Smtp-Source: ABdhPJywEEVQosCF11WlTPVdrjY75D4bMbsAOBshW+Sp17UOS0su3peMoxbY3LhIAorZswc0ivDvi+jHTLtoNnSxZlI=
X-Received: by 2002:aca:1801:: with SMTP id h1mr928201oih.148.1593244690056;
 Sat, 27 Jun 2020 00:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200623145748.28877-1-geert+renesas@glider.be>
 <20200623145748.28877-3-geert+renesas@glider.be> <CAMpxmJWGckzicz6FddXybcJh-hb+-hoGbV29Z3BA61RVQ1nQDQ@mail.gmail.com>
 <CAHp75VenuB=up5wHm+BtkQPy_N6GuE7xvHJWq-e4Fricg1M7Vw@mail.gmail.com>
In-Reply-To: <CAHp75VenuB=up5wHm+BtkQPy_N6GuE7xvHJWq-e4Fricg1M7Vw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 27 Jun 2020 09:57:58 +0200
Message-ID: <CAMuHMdWR5=3UZuWx5hRe8YmxX6Xj2mCxJsT2kKjVceqVYY3SZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: aggregator: Use bitmap_parselist() for parsing
 GPIO offsets
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Wed, Jun 24, 2020 at 3:41 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 24, 2020 at 3:16 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > wt., 23 cze 2020 o 16:57 Geert Uytterhoeven <geert+renesas@glider.be>
> > napisał(a):
> > >
> > > Replace the custom code to parse GPIO offsets and/or GPIO offset ranges
> > > by a call to bitmap_parselist(), and an iteration over the returned bit
> > > mask.
> > >
> > > This should have no impact on the format of the configuration parameters
> > > written to the "new_device" virtual file in sysfs.
> > >
> > > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > I'm not super happy with the mask[] array, which is on the stack.
> > > But there is no real limit on the number of GPIO lines provided by a
> > > single gpiochip, except for the global ARCH_NR_GPIOS.
> >
> > Why not allocate it with bitmap_zalloc() then?

Bartosz: Thanks, good idea!

> I haven't got the original messages yet, so my thought is to actually
> extract a helper from
> gpiod_get_array_value_complex() or gpiod_set_array_value_complex() for
> bitmap allocation.
> But I didn't check if it's suitable here. So, bitmap_zalloc() would be helpful.

/me confused

This function is not about getting/setting multiple GPIO lines in a gpiochip,
but about parsing a list of numbers and ranges. No gpiochip is involved.

original message:
https://lore.kernel.org/r/20200623145748.28877-3-geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
