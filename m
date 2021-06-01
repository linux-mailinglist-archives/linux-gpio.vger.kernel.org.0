Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017E3397003
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 11:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbhFAJMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 05:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbhFAJMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 05:12:13 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CBAC061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 02:10:30 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id z1so12285708ils.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cm1zKdzH5luYSV4zfueSOrqr8qzCXCW4+Xq8BpmqA7Q=;
        b=G1EOnFwzlUcOj+mQ2hVnmDrnG4jV6IaWiG/hy1cVgvwY8heUh+zr4yQb1GnsUe04e3
         Yd8Es1UscpvrVh9kjJNxCyFcjYubC1q36c4AyxYNOSfMSDhBQXl2hAf+lfLWueLJagxP
         Z+sxRrWtwqeXmuPc/d2weCwfIZ3MMzZ08Jva6zMZQFkMPW616M75TwdW4U43+z+S6AY5
         rcMlBzjafz6zHA1YfpJoF3zfEuYUAxrG4sEbPF5xCjSwNO2v/PewrNSXfSj2pzBiCVi7
         VBPyPGpNCOmwG3O4cw2BbXl/aEVC1M1VPuraUdmXOK+RTW9RmGcpCI505QKihdxCje60
         k7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cm1zKdzH5luYSV4zfueSOrqr8qzCXCW4+Xq8BpmqA7Q=;
        b=j8597mbiDA4n2tKLU3W3HT8akizZoe0jq8cTEXWeoWy5m+XQFGmJXkeJ5mwGOCrX85
         Rz/sQ9WEa1a+BK5hzlRERorHMEvQfZh6kseBJZ3BHoS5bjO/y4KSf3tYTMa9RIOUAzHS
         X7dQdCTRfczNiYZJoifr3fbiupbZ0N/bqgOm8+bUPQu6rGLXaIydJVmpBenpwInWLVRM
         o/WTo4tlimZbqs1NVh9Z4MNXtARsyf9vEYFpeYzJZ63GMIds5bXVPnr3OzozIgxwCwXl
         EgIRLt1V6cLK92osVy8rZ+jhbnfFj0ZAP66SpbZaqAtbhbdqGgIucjdkSE+2h2XlhLhC
         LGsQ==
X-Gm-Message-State: AOAM532+LQ5j/wVait1wTHsyN8boqABK17pb3OysuX5StZrI5edSckCi
        lxCl27FO60+a4UgDx9TMEy6xrTiVu3+69DuWwszlsQ==
X-Google-Smtp-Source: ABdhPJx4Nd1+PVFLw0K7RiEnDfXvuR5hb0Eor8DBxwJ9aKS6tRpKO5WzBcuIXJE63Zw4MQi4lvk0qhEH/abkgwD+WBY=
X-Received: by 2002:a05:6e02:1393:: with SMTP id d19mr20354035ilo.90.1622538630053;
 Tue, 01 Jun 2021 02:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell> <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell> <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell> <20210601082226.GV543307@dell>
In-Reply-To: <20210601082226.GV543307@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 1 Jun 2021 11:10:19 +0200
Message-ID: <CA+HBbNEHgUxE-F4iiAbCyt3ffypUJf2nePUsOmCjpFoJNkpCJw@mail.gmail.com>
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

On Tue, Jun 1, 2021 at 10:22 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 01 Jun 2021, Lee Jones wrote:
>
> > On Mon, 31 May 2021, Robert Marko wrote:
> >
> > > On Wed, May 26, 2021 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrot=
e:
> > > >
> > > > On Tue, 25 May 2021, Robert Marko wrote:
> > > >
> > > > > On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> =
wrote:
> > > > > >
> > > > > > On Mon, 24 May 2021, Rob Herring wrote:
> > > > > >
> > > > > > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > > > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > > > > > >
> > > > > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > > > > ---
> > > > > > > > Changes in v2:
> > > > > > > > * Implement MFD as a simple I2C MFD
> > > > > > > > * Add GPIO bindings as separate
> > > > > > >
> > > > > > > I don't understand why this changed. This doesn't look like a=
n MFD to
> > > > > > > me. Make your binding complete if there are missing functions=
.
> > > > > > > Otherwise, stick with what I already ok'ed.
> > > > > >
> > > > > > Right.  What else, besides GPIO, does this do?
> > > > >
> > > > > It currently does not do anything else as hwmon driver was essent=
ially
> > > > > NACK-ed for not exposing standard attributes.
> > > >
> > > > Once this provides more than GPIO capabilities i.e. becomes a prope=
r
> > > > Multi-Function Device, then it can use the MFD framework.  Until th=
en,
> > > > it's a GPIO device I'm afraid.
> > > >
> > > > Are you going to re-author the HWMON driver to conform?
> > > hwmon cannot be reathored as it has no standard hwmon attributes.
> > >
> > > >
> > > > > The CPLD itself has PSU status-related information, bootstrap rel=
ated
> > > > > information,
> > > > > various resets for the CPU-s, OOB ethernet PHY, information on th=
e exact board
> > > > > model it's running etc.
> > > > >
> > > > > PSU and model-related info stuff is gonna be exposed via a misc d=
river
> > > > > in debugfs as
> > > > > we have user-space SW depending on that.
> > > > > I thought we agreed on that as v1 MFD driver was exposing those d=
irectly and
> > > > > not doing anything else.
> > > >
> > > > Yes, we agreed that creating an MFD driver just to expose chip
> > > > attributes was not an acceptable solution.
> > > >
> > > > > So I moved to use the simple I2C MFD driver, this is all modeled =
on the sl28cpld
> > > > > which currently uses the same driver and then GPIO regmap as I do=
.
> > > > >
> > > > > Other stuff like the resets is probably gonna get exposed later w=
hen
> > > > > it's required
> > > > > to control it directly.
> > > >
> > > > In order for this driver to tick the MFD box, it's going to need mo=
re
> > > > than one function.
> > >
> > > Understood, would a debug driver count or I can expose the resets via
> > > a reset driver
> > > as we have a future use for them?
> >
> > CPLDs and FPGAs are funny ones and are often difficult to support in
> > Linux.  Especially if they can change their behaviour.
> >
> > It's hard to make a solid suggestion as to how your device is handled
> > without knowing the intricacies of the device.
> >
> > Why do you require one single Regmap anyway?  Are they register banks
> > not neatly separated on a per-function basis?
>
> Also, if this is really just a GPIO expander, can't the GPIO driver
> output something to /sysfs that identifies it to userspace instead?

I replied to your previous reply instead of this one directly.
It's not just a GPIO expander, it also provides resets to all of the HW
and a lot of debugging information.
Note that other switches use the same CPLD but with more features
so I want to just extend these drivers and add for example hwmon.

It's not just about it identifying itself, it offers a lot of various
debug info,
quite literally down to what CPU has access to the serial console on the
front and their bootstrap pins.

So, I want to expose the CPLD version, code version, switch model,
PSU status pins and a lot more using a separate driver as they
don't really belong to any other subsystem than misc using debugfs.

I hope this clears things up,
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
