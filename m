Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F412D23EF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 07:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgLHGx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 01:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbgLHGx5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 01:53:57 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB78C061749;
        Mon,  7 Dec 2020 22:53:17 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id 15so7217766oix.8;
        Mon, 07 Dec 2020 22:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w8Ytad3VuLBGnRL8FnISbJTqrw/aOetIiRAo11y3tYk=;
        b=k6fhVB1PRaoqPDAK0H73+nQgv4+gbvxI/9TjZyGX78xL6M7SXRwcCrOYSHwkZpYtAe
         qtoo5/NdWZS+LWDQGShMbypYGI6bEQ64vfnkvZpVekpjHVu2cdWCnfjX4xoxQ7N7e9Hn
         ePdagRrW+RNjCBb1t5vOkzMObGcP6aiUEm41qwrfxtcx9ga1UqJb7LMjrWyfFzQCVDFq
         2SMolyaZdJkNU2ZPseVSj6pgGTL+YbXmHezgGLxdNZ/TKUEO0pS3j7zbUbykhzlSSWa8
         GDduV+4M4BFWG+RrFvT/mrnRsyyPT4FwM8PfUHTeqm1MZ0Hfm/UXNzVJs/Vl2QQiyctn
         vgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w8Ytad3VuLBGnRL8FnISbJTqrw/aOetIiRAo11y3tYk=;
        b=nkszluBf1odZT1ejt1FD1yhhAYzmUpSs+eZ2wq4ZWLeW308svJXNePWFiNWit1U4ZO
         CosZFaPODRGAvuk2pAWblz6WMV5wwOT7X01fdqv4v6kUTaiFqanADhRNXqSNnxZoMjEr
         wQ1z7viPEpJ1Fy0uOy1/J6piyWFSy9hfV7bvTyJahwiJSSxQ2CpPTx4BIH/J4UMLD1Gb
         /GuGnNaYCMisoLHaqfBc2f3TXgHwTyYzsnhuUTAvx3K2vqe1qDkW8wVdTAG3a0r+fMZN
         3iziH2yDrE7nj93zL5SGYzuyKZOpovS/fxm2O7NHaOpeUgjK1taL2AtcO/sJepJNkGHD
         AOcQ==
X-Gm-Message-State: AOAM530hHy+spvUPQ7RIx7zYOL2DKbiTuNymMjCdv8iYspEmR2z2HKhs
        3dYHcPPGaU4KV8ECpjhw6W83OaHBDw/Da2W7Pwk=
X-Google-Smtp-Source: ABdhPJyUFcAD7BvLYxlbEegaPyHTpi4N5EZAJwwAncq+TWlN8EWXzX4C1AAZQvVI+HL+kOzBgiGF2tGubr+gzGPtIa8=
X-Received: by 2002:aca:5a86:: with SMTP id o128mr1679369oib.23.1607410396528;
 Mon, 07 Dec 2020 22:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
 <20201207192104.6046-3-sergio.paracuellos@gmail.com> <CACRpkdagTdkMbg=nw-N9KQhsWXqLxofzpD_9YLgpKPBxo0vyhQ@mail.gmail.com>
In-Reply-To: <CACRpkdagTdkMbg=nw-N9KQhsWXqLxofzpD_9YLgpKPBxo0vyhQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 8 Dec 2020 07:53:05 +0100
Message-ID: <CAMhs-H_LWSU1dGTHqKCtyfvaaRh3CYnEXeAWW4R=gZrU61y0+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ralink: add a pinctrl driver for the rt2880 family
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Dec 8, 2020 at 12:00 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Serigio,
>
> I dug around some to try to understand the patch I think I get
> it now :)
>
> Squash this with the third patch so it becomes a
> "move" of this file, preserving history. With that:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Ok, will squash those two if you prefer that way with your 'Acked-by'.

>
> I have ideas, but it is better to move the driver out
> of staging and improve it in pinctrl.
>
> Since there might be many sub-SoCs for this pin
> controller, what about creating
> drivers/pinctrl/ralink/* for this at the same time?

Ok, I will put this inside a ralink subdirectory in pinctrl.

>
> On Mon, Dec 7, 2020 at 8:21 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > These Socs have 1-3 banks of 8-32 gpios. Rather then setting the muxing of each
> > pin individually, these socs have mux groups that when set will effect 1-N pins.
> > Pin groups have a 2, 4 or 8 different muxes.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> (...)
> > +#include <asm/mach-ralink/ralink_regs.h>
> > +#include <asm/mach-ralink/pinmux.h>
> > +#include <asm/mach-ralink/mt7620.h>
>
> I think in the next step we should move the contents of
> rt2880_pinmux_data into this driver, then we can drop these
> mach-headers and show the way for the rest of the ralink
> chips to push their data down into this driver (or subdrivers)
> and depopulate mach-ralink a bit.

Agree. Doing that no arch dependencies are included and we can cleanly
enable the driver also for COMPILE_TEST without adding special flags
in pinctrl Makefile.

>
> > +       p->groups = rt2880_pinmux_data;
>
> So this is where the driver actually gets a pointer to all
> groups and functions, and these groups and functions all
> come from arch/mips/ralink/mt7621.c right?

Yes, all of that is defined there.

>
> I think after this first step we should move mt7621.c
> to pinctrl and become a subdriver for this pin controller
> and then we can hopefully move the rest as well once
> you set the pattern for how we do this.

I see. Thanks for advices.

>
> Yours,
> Linus Walleij

Best regards,
    Sergio Paracuellos
