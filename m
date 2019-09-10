Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F354DAE62D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 11:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfIJJAE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 10 Sep 2019 05:00:04 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33270 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIJJAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 05:00:04 -0400
Received: by mail-ot1-f65.google.com with SMTP id g25so16094045otl.0;
        Tue, 10 Sep 2019 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tDTK3OLpchCjCRU8TOfjhGkxmXXLcL73wfiJk/3qy3k=;
        b=rG4hCQ4KSKKUbjmtgEOyUvwZommEuCu2CTjo/TtvMcTdfiJT9A2Iq6JPNDK1IHKmDR
         svoqw71zy5N1Zx1QFQ7OZQWfHL9xD+oUi0F5u7GFor1rd/E9edZlNWrUgX+yv5col899
         XF/dv7DSTTc52cP96tJGvONAiGcV6SBL+4AsA2HGtEvj7QS7wtpcEKWnbQ4SP2RKZOb4
         5ZJvdUYE6GTrp0DcIualJvV0ByeIsW9HADnX/tSj8+wjmSz0EREHRL26FUsgzCwmO0ks
         G0vJgAWgWVdEcPrYLoOhIyOS4djBHsSAGMypouJefqnkBNaJR5Peupci6jO0NZl/TWT/
         zGpA==
X-Gm-Message-State: APjAAAVD6l9QjS2sETo3/63uPgGYii9X1W1U7jNRYqSalc6mqi93fJtm
        uSrffj6J6EMsLscOA9QElgbDEcC997VmhdGjUXn8Sw==
X-Google-Smtp-Source: APXvYqw1/V7JJZY7iU4ASdisuWl7yMwdrDM7D32UeSrm/lIre9DoD2PTYCLldEyJ3F30z/x0IGm9trL79jz0Nifw45k=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr24743844otl.145.1568106003005;
 Tue, 10 Sep 2019 02:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be> <CAMpxmJVrQ92+ULRrzyN52LwEcdPTuK7OZssZjUcRPRSTBQ=fwg@mail.gmail.com>
In-Reply-To: <CAMpxmJVrQ92+ULRrzyN52LwEcdPTuK7OZssZjUcRPRSTBQ=fwg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Sep 2019 10:59:51 +0200
Message-ID: <CAMuHMdWpDOSpz3Mak7Vd=CY7r_kxPUx3A0CMqC-VY6TXtD9cqg@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: API boundary cleanups
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Sep 10, 2019 at 10:51 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pt., 6 wrz 2019 o 10:45 Geert Uytterhoeven <geert+renesas@glider.be> napisał(a):
> > This patch series contains various API boundary cleanups for gpiolib:
> >   - The first two patches make two functions private,
> >   - The last two patches switch the remaining gpiolib exported functions
> >     from EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL().
> >
> > After this there is only a single GPIO driver function exported with
> > EXPORT_SYMBOL();
> >
> >     drivers/gpio/gpio-htc-egpio.c:EXPORT_SYMBOL(htc_egpio_get_wakeup_irq);
> >
> > I believe this symbol was never used upstream, and may be a relic of the
> > original out-of-tree code the htc-egpio was based on.  I don't know if
> > there (still) exist out-of-tree users of the symbol.
> >
> > Thanks for your comments!
>
> All looks good to me. Are you fine with this being picked up after the
> v5.4 merge window?

Sure, whatever suits you best.

Thanks!

> > Geert Uytterhoeven (4):
> >   gpio: of: Make of_get_named_gpiod_flags() private
> >   gpio: of: Make of_gpio_simple_xlate() private
> >   gpio: of: Switch to EXPORT_SYMBOL_GPL()
> >   gpio: devres: Switch to EXPORT_SYMBOL_GPL()

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
