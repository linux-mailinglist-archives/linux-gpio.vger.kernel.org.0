Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635DF30A3F3
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 10:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbhBAJFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 04:05:14 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:39703 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbhBAJE7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 04:04:59 -0500
Received: by mail-oi1-f182.google.com with SMTP id w124so18051534oia.6;
        Mon, 01 Feb 2021 01:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a9pUZbXQ7As7rRxVPqaNasnPjRFzcKWXstZyAsnJ2/s=;
        b=ubEoBnQWJ/q+55icKZbHxb3HTf98UhL/T6+0qg5+10ZTclX4PLshxWv+KKCoMP1Km+
         ZvgE2MaRrYY7+gMFcnjYJtl+NybR2pUD2r/TpxaQY9nSek7nGM5mQgCAs+lAqbiwuLGN
         j4PwP7O2psBm2p/+hMKwdCks1gNqL7Co2xYm+tY2LHBUranxy/6hi9NxIDoSmhKOoJEH
         BKDyg/nexw1iGEcxw/TZYcKW8y1WViyk0Y+qMnLU52RqNCDCv/TEl3WzUNRscK+f9nk4
         R8NI0qKZnq7JDSVc0z3HcYqFMRWnI08/xLAd/1CtuaW7cpFUZyUGgx8Y5pj/RO2SNnUT
         6itA==
X-Gm-Message-State: AOAM5302tG8ZwdcB70OtCynLKxBjl4ZfhnjHsqshtWZLSHYDvKeHF01k
        QS7/2lwdLCdIDWEJuJW6419tkDDsJ3W73Izat2I=
X-Google-Smtp-Source: ABdhPJzW6rGUgKUW5qLFq4OqvfnAY0sJ0Df8rO5EhFCEr9ssED6Uu/HizUfEVdHm5K86aGvSIiFaFynTFJxyF6+FG+E=
X-Received: by 2002:aca:1219:: with SMTP id 25mr10393455ois.54.1612170252088;
 Mon, 01 Feb 2021 01:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com>
 <20210127103919.GC928@ninjato> <CAMpxmJWKEHsdHAnQt-ozVPHDcjSPrTo3c7D8gGFiPvwrA8TzwQ@mail.gmail.com>
In-Reply-To: <CAMpxmJWKEHsdHAnQt-ozVPHDcjSPrTo3c7D8gGFiPvwrA8TzwQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Feb 2021 10:04:00 +0100
Message-ID: <CAMuHMdVYjrs4R+s=ojBegn1PczZ8fiD+95od5Nj9wG02+6TBcA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: remove shadowed variable
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Mon, Feb 1, 2021 at 9:59 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Jan 27, 2021 at 11:39 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > On Tue, Jan 05, 2021 at 12:14:34PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Jan 5, 2021 at 12:00 PM Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > > After refactoring, we had two variables for the same thing. Remove the
> > > > second declaration, one is enough here. Found by cppcheck.
> > > >
> > > > drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows outer variable [shadowVariable]
> > > >
> > > > Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable name")
> > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Ccing Linus & Bartosz
> >
>
> For some reason this is not on patchwork and I also don't have it in
> my inbox, can you resend, please?

https://lore.kernel.org/linux-gpio/20210105105914.13172-1-wsa+renesas@sang-engineering.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
