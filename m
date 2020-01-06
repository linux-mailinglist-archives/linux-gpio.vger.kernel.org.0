Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464CC130E97
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 09:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAFIXV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 03:23:21 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46958 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFIXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 03:23:21 -0500
Received: by mail-ot1-f67.google.com with SMTP id q3so2128320otr.13;
        Mon, 06 Jan 2020 00:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nHzx9oIm8dg3P3nAkMNDZNXQcdUHwPZVhWt4WLorDDs=;
        b=phYeE/Wdm+GEGSJpXs8lIGU9xe2PFAgc/bp6jYq4tL24MIDALkO3x7PU7voblRy/wb
         1FkNODmqSZPxYMWA8qvi8lSFsLsbiBdYqh+mQgjPSmZwm2viBLF/51rWFp0nUM58KBgf
         UUK2JyckwPeGBbcURpBod2F30WY/X3iFvuVtMrCWAFwwm1wv13Jk+edsWhX4lo+V+PFT
         PJSL8BqlyXpn++7FMJ8ly60IZJFh20lUHcE5EvFbth6VEeGXoCz8OW1J7BCsmqkU7KbZ
         eeQhTCKtxpGui/kVsm+EyUG9HxhGGRyJfGlLTOK+beFe0H5Hnx4Y8SI6c6wOTYlyyffg
         Q8Qg==
X-Gm-Message-State: APjAAAX9x+PoW+5c5eYPyMAhIT2kjTJtKMnplH1Lj3URpWTDwDPTaq/L
        9AO1WK8m633VPh6/SzooWjbxcnz7OTvqkGpE+mY=
X-Google-Smtp-Source: APXvYqxZfWCvC2DArnr5YYOlNTu+kHHp6uV+60W8n8M+iR8ajrYCZBArT5eRAfUPNTXNYH8DRrkE60PZKONNJiX/Ig4=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr116835949otm.297.1578298999867;
 Mon, 06 Jan 2020 00:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <CACRpkdaW7nmpE99FAvBDBTmkTZOTQ5WdM=JbMzBTLk7cbLRXPw@mail.gmail.com>
 <CAMuHMdVbk5S__8OK-zNXmiW66=WVA8Jzyc=hUvf_hJSU=u9TFg@mail.gmail.com> <CACRpkda8QD_tDA=YVDRNVnHd8QHs-yHBTzZuJHsnocgMdxv9cA@mail.gmail.com>
In-Reply-To: <CACRpkda8QD_tDA=YVDRNVnHd8QHs-yHBTzZuJHsnocgMdxv9cA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jan 2020 09:23:08 +0100
Message-ID: <CAMuHMdUGGcjoX8TDDS5qGLtJZxizUK=BpasSQK3t1K-dhEgZCg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Sat, Jan 4, 2020 at 1:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> Sorry for slowness... christmas.

Np. Happy New Year!

> On Thu, Dec 12, 2019 at 4:24 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Dec 12, 2019 at 3:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > +         This can serve the following purposes:
> > > > +           1. Assign a collection of GPIOs to a user, or export them to a
> > > > +              virtual machine,
> > >
> > > This is ambiguous. What is a "user"? A process calling from
> > > userspace? A device tree node?
> >
> > A user is an entity with a UID, typically listed in /etc/passwd.
> > This is similar to letting some, not all, people on the machine access
> > the CD-ROM drive.
>
> Ah I get it. Maybe we can say "assign permissions for a collection
> of GPIOs to a user".

OK

> > > I would write "assign a collection of GPIO lines from any lines on
> > > existing physical GPIO chips to form a new virtual GPIO chip"
> > >
> > > That should be to the point, right?
> >
> > Yes, that's WHAT it does. The WHY is the granular access control.
>
> So I guess we can write both?

OK.

> > > > +           3. Provide a generic driver for a GPIO-operated device, to be
> > > > +               controlled from userspace using the GPIO chardev interface.
> > >
> > > I don't understand this, it needs to be elaborated. What is meant
> > > by a "GPIO-operated device" in this context? Example?
> >
> > E.g. a motor. Or a door opener.
> >
> >         door-opener {
> >                 compatible = "mydoor,opener";
> >
> >                 gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> >         };
> >
> > You don't need a full-featured kernel driver for that, so just bind the
> > gpio-aggregator to the door-opener, and control it through libgpiod.
>
> Yep it's a perfect industrial control example, I get it.
>
> Maybe we should blurb something about industrial control?

OK.

> The rest I think we cleared out else I will see it when I review again.

The remaining discussion point is "GPIO Repeater in Device Tree", i.e.
the GPIO inverter usecase, which might be solved better by adding a
GPIO_INVERTED flag.

Shall I rip that out, incorporate review comments, and report?

Thanks!



--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
