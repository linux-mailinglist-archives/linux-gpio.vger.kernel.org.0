Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64CF3970FA
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhFAKLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbhFAKLG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:11:06 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F31C061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 03:09:24 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id b25so14639706iot.5
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DLBEbUNXUeLvCZwFV4exIHsYyNPtftd/N147joyMJKc=;
        b=K1kOVFBaSiDKTJxudPss/sqXKK8z8upccHvruXZqXXb44gAkhseuHLHsmOKU4lCt8P
         2Jll90i7+F3k9bVbwjn8kumj1LduMINyUqfvz7XBCx8v4oHOdn9Hgde3GG/bpfYGXNAK
         fbfEleyiOk1ZnNqjjkBfkuVrcpG+BLlc9eiiIWNIUfMWSka5diKugyEMQu77Gvaw3CBC
         hq3A2t1yUYWmZ+ZFJ5eVpQYzXhz8dmFOCs0pJmqj02krtbOp60Md6INd0fErxAtj7rt+
         lon2ZwvC2x43QRNPEVJaAJB6lEUYR5lkNjXv1Lq/QYvS2Sa5qBAichuHdZDxIX+ImvJx
         PBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DLBEbUNXUeLvCZwFV4exIHsYyNPtftd/N147joyMJKc=;
        b=ayqAt/InVJcDR1FZiehXqEXmbj0ZWoXIJO9UnbNJjBQzgQnI2NgzH4yzONS2sZB4Hb
         J7canb7RIWbuP4w7MWHsDyycFvfrA3SuYPRGItxh9EFdhlM+qp4zsWizhMzvdj8FWkAN
         bixXlMpVtN1PpWmyUOu73clIDJ0iFKx20gTeSJPqv6+rGMaNgk+Tiod01IQdRZO3xlXx
         p3hDL/Txg+jyUxL+vVPlhytkeSXtLI+mYzWi/pGf5rkrfGyVphdBqvdxz8KZMiX06Hnw
         iKSNt+9+OkJJXCd4jJ6IWlDJDAXdLZuOvGSBTrHKAKKg7+fyVWPDnQgQ4gN7bgWvcSJg
         I7Cw==
X-Gm-Message-State: AOAM533xFcniDvkV5u8jt7DMbxN1sGm4SSPNQmnxu8kAlZkJhYITWgTx
        G6ry7WE5smGnO6lgvDj6BFeH2DtuWf9WAxzJP2JUxA==
X-Google-Smtp-Source: ABdhPJxzQQtP0OzkqZs7a5hDfasWwF5GPgvG66W6P8oW0WitaBhboQFv7Vb33Ervk+ESo1r722E0Y9JK161dKsxO9tU=
X-Received: by 2002:a05:6638:634:: with SMTP id h20mr6057368jar.14.1622542164126;
 Tue, 01 Jun 2021 03:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell> <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell> <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell> <20210601082226.GV543307@dell>
 <CA+HBbNEHgUxE-F4iiAbCyt3ffypUJf2nePUsOmCjpFoJNkpCJw@mail.gmail.com> <20210601093104.GE543307@dell>
In-Reply-To: <20210601093104.GE543307@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 1 Jun 2021 12:09:13 +0200
Message-ID: <CA+HBbNH1D-1Jfv0NRT0FLPDf1r_Uy4EVCAVCx6x64pMAQkVjZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 11:31 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 01 Jun 2021, Robert Marko wrote:
>
> > On Tue, Jun 1, 2021 at 10:22 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Tue, 01 Jun 2021, Lee Jones wrote:
> > >
> > > > On Mon, 31 May 2021, Robert Marko wrote:
> > > >
> > > > > On Wed, May 26, 2021 at 9:52 AM Lee Jones <lee.jones@linaro.org> =
wrote:
> > > > > >
> > > > > > On Tue, 25 May 2021, Robert Marko wrote:
> > > > > >
> > > > > > > On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.o=
rg> wrote:
> > > > > > > >
> > > > > > > > On Mon, 24 May 2021, Rob Herring wrote:
> > > > > > > >
> > > > > > > > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wr=
ote:
> > > > > > > > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > > > > > > ---
> > > > > > > > > > Changes in v2:
> > > > > > > > > > * Implement MFD as a simple I2C MFD
> > > > > > > > > > * Add GPIO bindings as separate
> > > > > > > > >
> > > > > > > > > I don't understand why this changed. This doesn't look li=
ke an MFD to
> > > > > > > > > me. Make your binding complete if there are missing funct=
ions.
> > > > > > > > > Otherwise, stick with what I already ok'ed.
> > > > > > > >
> > > > > > > > Right.  What else, besides GPIO, does this do?
> > > > > > >
> > > > > > > It currently does not do anything else as hwmon driver was es=
sentially
> > > > > > > NACK-ed for not exposing standard attributes.
> > > > > >
> > > > > > Once this provides more than GPIO capabilities i.e. becomes a p=
roper
> > > > > > Multi-Function Device, then it can use the MFD framework.  Unti=
l then,
> > > > > > it's a GPIO device I'm afraid.
> > > > > >
> > > > > > Are you going to re-author the HWMON driver to conform?
> > > > > hwmon cannot be reathored as it has no standard hwmon attributes.
> > > > >
> > > > > >
> > > > > > > The CPLD itself has PSU status-related information, bootstrap=
 related
> > > > > > > information,
> > > > > > > various resets for the CPU-s, OOB ethernet PHY, information o=
n the exact board
> > > > > > > model it's running etc.
> > > > > > >
> > > > > > > PSU and model-related info stuff is gonna be exposed via a mi=
sc driver
> > > > > > > in debugfs as
> > > > > > > we have user-space SW depending on that.
> > > > > > > I thought we agreed on that as v1 MFD driver was exposing tho=
se directly and
> > > > > > > not doing anything else.
> > > > > >
> > > > > > Yes, we agreed that creating an MFD driver just to expose chip
> > > > > > attributes was not an acceptable solution.
> > > > > >
> > > > > > > So I moved to use the simple I2C MFD driver, this is all mode=
led on the sl28cpld
> > > > > > > which currently uses the same driver and then GPIO regmap as =
I do.
> > > > > > >
> > > > > > > Other stuff like the resets is probably gonna get exposed lat=
er when
> > > > > > > it's required
> > > > > > > to control it directly.
> > > > > >
> > > > > > In order for this driver to tick the MFD box, it's going to nee=
d more
> > > > > > than one function.
> > > > >
> > > > > Understood, would a debug driver count or I can expose the resets=
 via
> > > > > a reset driver
> > > > > as we have a future use for them?
> > > >
> > > > CPLDs and FPGAs are funny ones and are often difficult to support i=
n
> > > > Linux.  Especially if they can change their behaviour.
> > > >
> > > > It's hard to make a solid suggestion as to how your device is handl=
ed
> > > > without knowing the intricacies of the device.
> > > >
> > > > Why do you require one single Regmap anyway?  Are they register ban=
ks
> > > > not neatly separated on a per-function basis?
> > >
> > > Also, if this is really just a GPIO expander, can't the GPIO driver
> > > output something to /sysfs that identifies it to userspace instead?
> >
> > I replied to your previous reply instead of this one directly.
> > It's not just a GPIO expander, it also provides resets to all of the HW
> > and a lot of debugging information.
> > Note that other switches use the same CPLD but with more features
> > so I want to just extend these drivers and add for example hwmon.
> >
> > It's not just about it identifying itself, it offers a lot of various
> > debug info,
> > quite literally down to what CPU has access to the serial console on th=
e
> > front and their bootstrap pins.
> >
> > So, I want to expose the CPLD version, code version, switch model,
> > PSU status pins and a lot more using a separate driver as they
> > don't really belong to any other subsystem than misc using debugfs.
>
> drivers/soc is also an option for devices like these.

I have completely forgotten about that, it's a potential place.

Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
