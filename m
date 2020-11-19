Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDC22B9AE7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 19:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbgKSSuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 13:50:54 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43505 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgKSSux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 13:50:53 -0500
Received: by mail-oi1-f194.google.com with SMTP id t143so7458318oif.10
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 10:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NhQtPqOjXZvjezlyKttHeTEBkfaotmujXeTW6aM7Ww4=;
        b=NvI4p2lG2tI5QS66bJDqHAahL8LR3wTAKqTG73RTX8gMGdOXQdu30pGCEITTfCUo3a
         tlpIJKyFlTtdD9QXr1nmsFW6D6y4UltOh91iqKIALJwaz8Y/UNebvwtE9iWVKJ1jcZy9
         RixmVfr4j5rKu2HDko2+lViZOWLH7Dzw9zQL3mW5NY3q27BOtBD3oT8gFODHQRGebXZn
         6uN1LNLWI+dg9z8VRRQUG+6TQGzd1Yi9P6sXBvcnEncNrxlKltDwsy5IT42yPPgW8ldT
         FDVNH74ZmkgX8LZjAegA3eFJodHYH68+5oB1cuj69HUQ2mNCn+ZNGGbZ0tgWH0JEnrnb
         rSfQ==
X-Gm-Message-State: AOAM530OuYgjiLnNsxTEjuMsm0DWIOC8ZYmQb0JxEpTzyliDEifwEZT3
        CfI4/5fO9plHhCNZZoEVHFCcXDJD3ganzVdM7v4=
X-Google-Smtp-Source: ABdhPJygkJjtx4XbgJviflROkknqMXVbV4KD4ak05TVslSnWF9i3uTB4oIS2paxMCNlUFVd32Er4PNKvnLAb4s9pU9w=
X-Received: by 2002:aca:52c9:: with SMTP id g192mr3983000oib.54.1605811852870;
 Thu, 19 Nov 2020 10:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20201104115348.51930-1-damien.lemoal@wdc.com> <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
 <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com> <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
 <b551cfa97c1ee0aa892d80454a47ed859b9a420c.camel@wdc.com> <CACRpkda_4JrF=akOO+Y8=xcDqQ3710ztbcj+Z2PPk65nz37Vag@mail.gmail.com>
In-Reply-To: <CACRpkda_4JrF=akOO+Y8=xcDqQ3710ztbcj+Z2PPk65nz37Vag@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Nov 2020 19:50:41 +0100
Message-ID: <CAMuHMdXuz-cvpE7LD=4Bd+pm4qSJVGDzaT1e9M-bgO-bZ7NpPw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Nov 11, 2020 at 4:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Nov 11, 2020 at 7:54 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> > > We need to think about a similar facility for users which is less
> > > damaging but fulfils the same needs. I think I saw something a while
> > > back that looked promising and added some funky files in debugfs
> > > in a hierarchical manner per-gpiochip instead. That is how debugfs
> > > should be used.
> >
> > I like this idea too. The point is (my opinion only), anything that allows
> > quick testing using only a shell without any extra tooling needed is fine.
> > Extra tooling is not really an issue when using a full distro, but it can be a
> > problem when working with things like buildroot (or busybox directly). And
> > indeed, as its name implies, debugfs seems like a good alternative to sysfs.
>
> I would say the problem is something like, I want to test some simple
> GPIO access like turning a LED on/off and recompiling the rootfs
> is a pain, so some simple debugfs facility would be nice to have to test
> it and get on with development.
>
> OK I'll think of some TODO item.

I'm fully aware of the existence of libgpiod, and I'm still using sysfs
GPIO for testing (and board farm control ;-)

One reason is that sysfs GPIO just needs echo and cat, which are
available on all my file systems (some predating even sysfs GPIO itself),
while libgpiod is one extra barrier^Wstep to take...

Something simple in debugfs (in/high/low) would be great!

> I am slightly worried that people will start abusing debugfs to do products
> "because it is so simple" if we add this but wel...

Yeah, a while ago, there was some fuzz about distros enabling debugfs,
and this being a security issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
