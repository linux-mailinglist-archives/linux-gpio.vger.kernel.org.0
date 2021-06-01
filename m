Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE6C396FE7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 11:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhFAJH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 05:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhFAJH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 05:07:57 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE027C061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 02:06:16 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id a6so14514721ioe.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ekE+dxAB6Ci5Gjbh4XABVLj4ahXXOJ1oOcI27j00W5Q=;
        b=z5Nrkir5ExF/hl688SIDMC0pJRBvAxGQooLpvjx8EytfaG3IJIfemRIn/LGFySLJh+
         GucpPpBvnd/Z3piK4Es7/7JCQsG9K0hBP17n93QyDMXoBPmCEC3J4Yl/XgWoy5wW4N2N
         0ML7hQxFSnbovbYEEJ0HAELR2jl4jYoF76d26qW8Pym2coBehm7EywIQfM5f6r0J5w9l
         bX1logSgwWDRanVY2aveeP86+/bw7dynWZ1iI3qy8bf/Dj8FBr1rm/h/JiyO5jTkuLqN
         ymC7zeo+rt4/lSj+0O6HKXayLPmr8ccYgesg2cJRTnTH+iWen3F8sRjkuW7FQ410Rd05
         u8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ekE+dxAB6Ci5Gjbh4XABVLj4ahXXOJ1oOcI27j00W5Q=;
        b=gxoaBQ8TiR0ohGgt4rMu7Co+QAX5mHkiORxsHmAx+UoZ28NqyQvbNmBgMS8rtQHF2M
         1LHRm0WaQGxd2POVlF3qRNYO5NpVPiMZ5rUYAhogNybE8bDCWX79evFI669IHw6qA0DA
         BTle9TP7D+BKGm2pVG61z4brtCukH/3DE+7l1Tmzh8Fjp8mEoVxb/selP13U/DLa8Mnm
         zeRfO82FAohlGM1JFYUuzkHYSbBtH+7jq2HGoXIyL3tTlj7LO6MXYHeWYg6saMlwg3NY
         UIU/bg4UsJtgKTn/d46IwK/9y1Qeu0ascuGNf/dGFV+wy2R0Nie0WXBybseribG8GrsC
         gAoQ==
X-Gm-Message-State: AOAM531uV3UagvwY22RdIC09qFSWBeFMtscR5xcKmt+DcjGMaSzVT6Ff
        HCoHg9yI4GyjvS86noRStEGpgNZ+LJVIvD2DWpufUg==
X-Google-Smtp-Source: ABdhPJwowsxD4CemN7T8T8uw9fjBd0RXx+HffJMHz/C59XDzdvA/aLQPpx2U5VWqSjLf7bRLeaw4z9qWsuit/ebXOXU=
X-Received: by 2002:a05:6638:2728:: with SMTP id m40mr24525083jav.55.1622538376071;
 Tue, 01 Jun 2021 02:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell> <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell> <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
In-Reply-To: <20210601081933.GU543307@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 1 Jun 2021 11:06:05 +0200
Message-ID: <CA+HBbNFW4NHpcEt7Xa+qC2HVvhuKu1O+PUo_rSE03qtSsBCehg@mail.gmail.com>
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

On Tue, Jun 1, 2021 at 10:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 31 May 2021, Robert Marko wrote:
>
> > On Wed, May 26, 2021 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Tue, 25 May 2021, Robert Marko wrote:
> > >
> > > > On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> wr=
ote:
> > > > >
> > > > > On Mon, 24 May 2021, Rob Herring wrote:
> > > > >
> > > > > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > > > > >
> > > > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > > > ---
> > > > > > > Changes in v2:
> > > > > > > * Implement MFD as a simple I2C MFD
> > > > > > > * Add GPIO bindings as separate
> > > > > >
> > > > > > I don't understand why this changed. This doesn't look like an =
MFD to
> > > > > > me. Make your binding complete if there are missing functions.
> > > > > > Otherwise, stick with what I already ok'ed.
> > > > >
> > > > > Right.  What else, besides GPIO, does this do?
> > > >
> > > > It currently does not do anything else as hwmon driver was essentia=
lly
> > > > NACK-ed for not exposing standard attributes.
> > >
> > > Once this provides more than GPIO capabilities i.e. becomes a proper
> > > Multi-Function Device, then it can use the MFD framework.  Until then=
,
> > > it's a GPIO device I'm afraid.
> > >
> > > Are you going to re-author the HWMON driver to conform?
> > hwmon cannot be reathored as it has no standard hwmon attributes.
> >
> > >
> > > > The CPLD itself has PSU status-related information, bootstrap relat=
ed
> > > > information,
> > > > various resets for the CPU-s, OOB ethernet PHY, information on the =
exact board
> > > > model it's running etc.
> > > >
> > > > PSU and model-related info stuff is gonna be exposed via a misc dri=
ver
> > > > in debugfs as
> > > > we have user-space SW depending on that.
> > > > I thought we agreed on that as v1 MFD driver was exposing those dir=
ectly and
> > > > not doing anything else.
> > >
> > > Yes, we agreed that creating an MFD driver just to expose chip
> > > attributes was not an acceptable solution.
> > >
> > > > So I moved to use the simple I2C MFD driver, this is all modeled on=
 the sl28cpld
> > > > which currently uses the same driver and then GPIO regmap as I do.
> > > >
> > > > Other stuff like the resets is probably gonna get exposed later whe=
n
> > > > it's required
> > > > to control it directly.
> > >
> > > In order for this driver to tick the MFD box, it's going to need more
> > > than one function.
> >
> > Understood, would a debug driver count or I can expose the resets via
> > a reset driver
> > as we have a future use for them?
>
> CPLDs and FPGAs are funny ones and are often difficult to support in
> Linux.  Especially if they can change their behaviour.
>
> It's hard to make a solid suggestion as to how your device is handled
> without knowing the intricacies of the device.

Yeah, I understand.
This one is a generic CPLD used in multiple switch models, however in this
switch model, it has the smallest set of features.
Things that are usable for the kernel and userspace it provides are SFP pin=
s,
resets and debug information.
Debug information is quite detailed actually.

I have added the reset driver in v3 as that is something that was gonna get
added later as well as it exposes resets for the ethernet PHY-s and U-boot
messes with the OOB PHY configuration.

>
> Why do you require one single Regmap anyway?  Are they register banks
> not neatly separated on a per-function basis?

For GPIO and reset drivers, I could get away with each of them
registering a regmap
but the debug driver will require accessing certain registers from their sp=
ace.
Also, I see using a single regmap that is provided by a generic driver
much simpler
and cleaner than doing that in each of the child drivers.

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
