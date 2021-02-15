Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CAE31BCE3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 16:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhBOPhH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 10:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhBOPf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 10:35:58 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17271C0613D6;
        Mon, 15 Feb 2021 07:35:17 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id t2so4132024pjq.2;
        Mon, 15 Feb 2021 07:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vgat2FzIkQVSnFcM17kydwpw/z1O4+YD93joQuWGWpU=;
        b=NH4Xr+bTLLLsaVLP280gCcbJCb/NvXkTfmJU+kvJKMHl+mHdBltTV+d31c/3laQqvG
         LICEIVuxv0h7xiXz6Il9Xll+8PkmZtpw1ok0I2P5CNb/C1yjaoEJM0OtBnGIIqYeDSMa
         Hq78u9NftaZtsKyooQoKpG9DMKlYxae3rcuEMLcbyF703MRa8ww7VuMUvbRk45DOp9rC
         H0rOw4OX7O72vVfh0K8DMAK3K5RyRwet4Kph3taz7o0O6sch2E4+sIDYWsn2DOduudG8
         R6LLXhQXYuWTea4ad01v6xgcSxeGAVlrF9sCcENRDFY4/xgDEvWk2oxrLPOynaDijjjl
         pn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vgat2FzIkQVSnFcM17kydwpw/z1O4+YD93joQuWGWpU=;
        b=GXRu2gb47QWiGtZfd1BGFmGYiPJFYhC3vzFRLSXIIdrdfjTgkXg+zqA7qR+WxNZh+j
         vNtglH4P8amlGiPdjo6Lmv0IVLaJ7y4R8CGhvljvMny5216l2WoiTZWp+xFOh+BUBiJ9
         fp8fp1mAb9aw8CK5s8gGMLzBhSrDPFRhpUawf4IQ3DJ7IkQC9Q7MblgU+65rZrkgyDHu
         hnEIBGcB0Gu+vr6PWDcrfUwfy/TsJ75z0tqt0K3QOGVEPGCtV/N/2O1gAOkrCXD8S1P2
         brfSZqFUbgvtgNqPYk8jb1wTt/rKYCqGOJXLNfkXujVt5aJXkbbHI9Nbc1RbYqd+XpFT
         R2Bw==
X-Gm-Message-State: AOAM530oOBzje6J2MiRf+bwwSYSREfNhMt2ZWA1KLuiP+KlbFae4iSbu
        DXxOBIhAxCAfWgaYxbqBw14PHScFQJ6P9ewYpCo=
X-Google-Smtp-Source: ABdhPJy5o43ih8ZbRpcd8D0g+9QdmCn6JKk3jOcRDHfO1ncgZmibwb+voFSBKF4h8QrBSUBlDHZijMWFNaDesn5CDPY=
X-Received: by 2002:a17:902:eac1:b029:e3:4940:541d with SMTP id
 p1-20020a170902eac1b02900e34940541dmr8626506pld.21.1613403316538; Mon, 15 Feb
 2021 07:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
 <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
In-Reply-To: <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Feb 2021 17:35:00 +0200
Message-ID: <CAHp75VfcpS4TNhCG2bGRQzPtqyWZ8UotKs2DVRBE_gDLZRQLoA@mail.gmail.com>
Subject: Re: RFC: oftree based setup of composite board devices
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 3:15 AM Frank Rowand <frowand.list@gmail.com> wrote:
> On 2/8/21 5:48 PM, Rob Herring wrote:
> > On Mon, Feb 8, 2021 at 4:22 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >>
> >> Hello folks,
> >>
> >> here's an RFC for using compiled-in dtb's for initializing board devices
> >> that can't be probed via bus'es or firmware.
>
> I've just been monitoring this thread for several days, hoping that the
> discussion would make things more clear for me.

You beat me up to it. I support your comments.

I have to comment to Enrico and others that under overlays for
ACPI-based platforms I meant SSDT overlays, no DT.

Also I have to point out that we have swnode API for the cases where
we need quirks for either ACPI or DT or whatever (not yet present)
firmware quirks.

> Disclaimer: I know essentially nothing about ACPI, please excuse improper
> naming and misunderstandings on my part.
>
> Why not compile in ACPI data (tables?) instead of devicetree description?
>
> >
> > I'm not convinced compiled in is the mechanism we want.
> >
> >> Use cases are boards with non-oftree firmware (ACPI, etc) where certain
> >> platform devices can't be directly enumerated via firmware. Traditionally
> >> we had to write board specific drivers that check for board identification
> >> (DMI strings, etc), then initialize the actual devices and their links
> >> (eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.
> >
> > This is something I've wanted to see for a while. There's use cases
> > for DT based systems too. The example I'd like to see supported are
> > USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
> > plug more than one of those in.
>
> My understanding from the past is that the experts (those who understand both
> devicetree and ACPI) regard trying to mix devicetree and ACPI in a single
> running Linux kernel image is insanity, or at least likely to be confusing,
> difficult, and problematic.
>
> From the devicetree side, I expect nightmares for me if devicetree and ACPI
> are mixed in a single running kernel image.
>
> >
> >> This patch queue does a bunch of preparations in oftree code, so we can
> >> support multiple fully independent DT's (not using DT overlays). And then
> >> adds a generic driver parses compiled-in fdt blobs, checks for mathing
> >> DMI strings and initializes the devices. As an example, the last patch
> >> adds an alternative implementation for the PC engines APU2/3/4 boa> Disclaimer: I know essentially nothing about ACPI, please excuse improper
rd
> >> family based on device tree.
> >
> > I think there's a couple of approaches we could take. Either support
> > multiple root nodes as you have done or keep a single root and add
> > child nodes to them. I think the latter would be less invasive. In the
> > non-DT cases, we'd just always create an empty skeleton DT. A 3rd
> > variation on a DT system is we could want to create parent nodes if
> > they don't exist to attach this DT to so we have a full hierarchy.
> >
> > I'm not saying which one we should do, just laying out some of the options.
> >
>
> Multiple root nodes and disjoint trees both seem problematic.  Existing
> subsystems and drivers expect a single cohesive tree.  Changing that
> architecture looks to me to be a painful exercise.
>
> >> The approach can be easily be extended to other kinds of composite devices,
> >> eg. PCI cards or USB dongles.
> >>
> >>
> >> Yet some drawbacks of the current implementation:
> >>
> >>  * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
> >>    modprobing anyways)
> >
> > I think we need to use either firmware loading or udev mechanisms to
> > load the FDTs.
> >
> >>  * can't reconfigure or attach to devices outside the individual DT's
> >>    (eg. probed by PCI, etc)
> >
> > Not sure I follow.
> >
> > Rob
> >
>


-- 
With Best Regards,
Andy Shevchenko
