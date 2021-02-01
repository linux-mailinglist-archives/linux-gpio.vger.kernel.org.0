Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B09830A791
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 13:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhBAM0B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 07:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhBAMZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 07:25:59 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB82C0613D6
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 04:25:18 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hs11so24059697ejc.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 04:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zhy4Op1/p4AlSoWo1Lo7zf/4vrfdU7vbu5J/FaBoZE8=;
        b=1+gNJGjq6sDPgSxw4rmtHgQNqXmsTR9Mfn9eebSVKozIDA8RCo2DdADtJk73y/hfOa
         uDD5zX4ZsjzcEsLcd4BxMllQiHwlRSyTunTWsZ1Cm1BFB9yb3/kw9nyKEiJMdxVbbOP/
         dkYlf2J4M86xsMgTPoIb00tcEJ7MVW20rSclHRvV4kVf7XSP7aY9EC2wMjffOtzJN8Vy
         Xu3KCu43BBkrqf+UEeBDKlG4HwkSuRacAiLF1jVW/ZTgmO39Y+lghhM1JAenv+QY73o4
         JB50i+AvmHsAhnlJwYomg3bkDTVCF0HLNQF8xUc6rUwoCnP+b2dY7mRzUZLifMkBmznG
         4f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zhy4Op1/p4AlSoWo1Lo7zf/4vrfdU7vbu5J/FaBoZE8=;
        b=W8TyigT+Yf0m6zkm3Nw1cJ6qEqBKqjPBL019LWGWCMi4YaHSbFj+klSNZzwFfDB3M3
         7OS7Ryf8MCfnTBmFZX2rcDUfRbK4P8p38SXUkG1ikPKz4tSNosKecHaVXM/pD/LbvQ/s
         fzzXWoQoNK1LuNpz9Jk/QeUy3lIhK/VtgrZSF5nOzqJhoCOWFus4KwS+nnfjX/Wl1vBp
         zH18/KN1YlkkoW6NrF4DA6EzRKqI3rxZmX7qSqtFAjA/gp8/OLKIu6chebE8nMyvQjpc
         +9mNMvHSiPK1Hx7CJ4wo8kH7KE6t+qjz9AjM/Zei6nxfS3PJj56/q67IslEN9ztDTShw
         iREA==
X-Gm-Message-State: AOAM5301QCQixf1p7FAb5C067DxRAlaAkk2IVc9YJ+aEyRi/5kiIS3ub
        P3Nh/+oZ0l7DE71l4WKidkuYu37rWyhQWccFxPoytA==
X-Google-Smtp-Source: ABdhPJysY05qsDlFhtpemuVXjo58cMxwIvOZ+BdS+FscJCQRHU0qaqoKDOIAPE8NUmxcL/kk7Ps86KjfeEL3UtWJGok=
X-Received: by 2002:a17:906:1c4b:: with SMTP id l11mr17642991ejg.155.1612182316845;
 Mon, 01 Feb 2021 04:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com>
 <20210127103919.GC928@ninjato> <CAMpxmJWKEHsdHAnQt-ozVPHDcjSPrTo3c7D8gGFiPvwrA8TzwQ@mail.gmail.com>
 <CAMuHMdVYjrs4R+s=ojBegn1PczZ8fiD+95od5Nj9wG02+6TBcA@mail.gmail.com>
In-Reply-To: <CAMuHMdVYjrs4R+s=ojBegn1PczZ8fiD+95od5Nj9wG02+6TBcA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Feb 2021 13:25:06 +0100
Message-ID: <CAMpxmJXY-GE70RLUrpD6PwRHgqV=udfu6R6VSNKUPyb-ZXgoHw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: remove shadowed variable
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 1, 2021 at 10:04 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, Feb 1, 2021 at 9:59 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Wed, Jan 27, 2021 at 11:39 AM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > On Tue, Jan 05, 2021 at 12:14:34PM +0100, Geert Uytterhoeven wrote:
> > > > On Tue, Jan 5, 2021 at 12:00 PM Wolfram Sang
> > > > <wsa+renesas@sang-engineering.com> wrote:
> > > > > After refactoring, we had two variables for the same thing. Remove the
> > > > > second declaration, one is enough here. Found by cppcheck.
> > > > >
> > > > > drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows outer variable [shadowVariable]
> > > > >
> > > > > Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable name")
> > > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Ccing Linus & Bartosz
> > >
> >
> > For some reason this is not on patchwork and I also don't have it in
> > my inbox, can you resend, please?
>
> https://lore.kernel.org/linux-gpio/20210105105914.13172-1-wsa+renesas@sang-engineering.com/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Thanks, now applied. Please make sure to Cc Linus and I next time.

Bartosz
