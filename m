Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF3F2DA921
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 09:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgLOIZt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 03:25:49 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42447 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgLOIZj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 03:25:39 -0500
Received: by mail-ot1-f66.google.com with SMTP id 11so18557015oty.9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 00:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kmfGz0AeUWmSar/Ndhm4aNXLsVZ54KXJnm+EKBX/rtA=;
        b=Qim84vzs2Iucl7X+EPg0b/OJobc2vcwOQ/fRjhokWkU2sZ7SX8TgR6IJ2uu9qaWOTx
         1hSOiklM6AfXcUrExVi7x2mmQXXHNlkK+HbZvQamx+XAdFOShA1et+TE5Dm6W+toSOPx
         Em2L/X0GmFy68coZuPwHgMXiNf7FpVrRkk321l8cIRS11Lenfnb57Egt8gLdy7AvXAM8
         9awXcYbi6Q/AywklFoZIm1rPizVfo0nhn7G/UQoB0vhei5RkOlrLcQOONqvNl3H4+gf8
         drhCyt7CVsWNyvD0r8ZOGW1i3oy+mfpVsGzfe8ijmEhcEeK1Nt+/kYjZtRPN49PcBR6G
         jzXQ==
X-Gm-Message-State: AOAM533X2meX5Lhyg642559ORL9oZA8t4mmOLaGiEjyBiWyR1iz/8mWD
        tQ0RAloxBsRWTrNrcZ8NCm54W8Bcxqa5kZbICDczWGQG9oc=
X-Google-Smtp-Source: ABdhPJyPswrjwuSCgdagEHIPKgl0mk8HXX8/6sX1ebxCN0CWmm4Ry6T3Spvt94EkXTL6hnPlZbRbe14LRuFyv7MmyYE=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr22485760oth.250.1608020698076;
 Tue, 15 Dec 2020 00:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org>
 <X9cwahptmETQ5lkL@localhost> <CACRpkda5_JwCAB2TisyzdJgb395JmU1AfuDDX0gWTvEj7-Mamw@mail.gmail.com>
In-Reply-To: <CACRpkda5_JwCAB2TisyzdJgb395JmU1AfuDDX0gWTvEj7-Mamw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 09:24:46 +0100
Message-ID: <CAMuHMdXkjtyUsehpx42k+TSzQN2MARsKbrdooGc9JjOc5P-E4A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Dec 14, 2020 at 11:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Dec 14, 2020 at 10:29 AM Johan Hovold <johan@kernel.org> wrote:
> > As I mentioned earlier, the not-globally unique warning only makes sense
> > for cases where all names comes from something like devicetree, and we
> > shouldn't warn if we plug in two identical USB devices that provide
> > default line names.
> >
> > Not sure it's even warranted to warn even if those default names collide
> > with the names provided in devicetree. Perhaps best to just drop the
> > flat-namespace assumption entirely and make sure gpiolib and the
> > userspace library can handle that.
>
> You're right. (As usual.)
>
> I dropped the global collision warning when applying.

Commit 2cd64ae98f352873 ("gpiolib: Disallow identical line
names in the same chip") still mentions the global collision warning
in the comments:

    Allow names to not be globally unique but warn about it

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
