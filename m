Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA34744E585
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 12:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhKLLZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 06:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbhKLLZC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 06:25:02 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8F8C061766;
        Fri, 12 Nov 2021 03:22:11 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g14so36360650edz.2;
        Fri, 12 Nov 2021 03:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9V5Di8a8qyE+6jAAu0K6/l3AcCOwFjxWjFK/ohjqHvM=;
        b=ZruTDvmwL9J3DhYB0V0NebSG2YNkc2mEybtAJg1zCWCe5N5tbzkxPgIEfyTYH7lDT0
         EKkx6RcH8148+XKgBROyI4XxxUfLtKKbrH5b753u2q1MK2zj1+1d4/S+MJInhIG2ivd/
         rhi6K1TYKO81ndafBfgeqRj75hdy3aHToS4OkEdVLvk9PwIUqCzIiIbJTCOA40wJISZQ
         w+C7+vOuBcR18T2UFE1DLmXtu5I2TsjzXXAJZN8InrBF5vCxpsUJjRxZZXmfBsnjrhe/
         UJmPBDghtGVD0Ri/jx3PiQkksk/lTq7USQ/160hE/IYq87dnXMM8MR/behE7saOo/5Gp
         wIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9V5Di8a8qyE+6jAAu0K6/l3AcCOwFjxWjFK/ohjqHvM=;
        b=3dj1nUPdEvxcZ683UtAZYF8E8oe7Vg8KUrBUTg8nqNTbRnPaR3K6qwcyV1OLGVtO8m
         kAEpm1ytst0EhADQ/qzL6fBJq0kJ3v7tVXvd70nehR62bb8YdLehY5QExlaI4yOaAFRx
         jTIZNByBwliHQIYvC1DGqbWRrFvH9IB+j3rFsj+a52Wbmu9bLQ3uCzg1v1aBOAQDrrRP
         oS4VpkKPhQR/tGcaU1grHXH47tSMj2l7fZ/Kzh8P5UEAQUnqLzCBbP8+OlnR0jmQq8uD
         eicH+fJX58H339UYqIywc/bS0ziKgHvsQigV82+iz9Wn+AWfPvpv/VfkMkQvFfCYRwxf
         mSTA==
X-Gm-Message-State: AOAM531qqbBUiDakdTOpJrlL+xF1fjTEDaZjYzhv4D62uAXg0fdC5L7x
        PUASFQyeLw0Q6GKviRfWVpo9BUj3M4dz2J7EdOfKhJ/rbBvmbg==
X-Google-Smtp-Source: ABdhPJynT0/Ydf2hVmCsiNCZ25jcRpNCeBcKZGpTrxDUkkmvTP0NtWl9e2cBnHMISg5oLEKwA+LaVPf5kHVfTuL8iiY=
X-Received: by 2002:a50:9ec9:: with SMTP id a67mr8043060edf.238.1636716130294;
 Fri, 12 Nov 2021 03:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20211110231436.8866-1-zajec5@gmail.com> <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
 <YY4+4Wb/H2ogKnQg@atomide.com>
In-Reply-To: <YY4+4Wb/H2ogKnQg@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Nov 2021 13:21:26 +0200
Message-ID: <CAHp75VeO4yr9fAx_-MHDnRGQn1paWF=59+o-9ZyP5PGSCPU8og@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 12, 2021 at 12:16 PM Tony Lindgren <tony@atomide.com> wrote:
> * Linus Walleij <linus.walleij@linaro.org> [211111 15:32]:
> > At the time (2011?) it was unclear what kind of data should go into
> > e.g. header and data files in the kernel (modules) and what should
> > go into the DT. So the approach to put pin information into the DT
> > was allowed for pinctrl-single.
> >
> > The way I have understood it, DT maintainers have since gotten
> > a bit wary about (ab)using the DT as a container for "anything data"
> > and prefer that drivers contain details and derive these from
> > compatible strings.
> >
> > As of today, IIUC the DT maintainers are against this scheme.
>
> We have some newish tools now compared 2011 though with #pinctrl-cells.
> And we now have also GENERIC_PINCTRL_GROUPS, GENERIC_PINMUX_FUNCTIONS
> and GENERIC_PINCONF :)
>
> The problem with the pinctrl-single binding is that it uses the hardware
> specific mux values in addition to the mux register offsets. IMO the
> values should use Linux generic pinctrl defines instead. Just like we
> do for the gpio and interrupt bindings. And then the generic pinctrl
> binding would be very similar to the interrupts-extended binding for
> example.
>
> And with a generic pinctrl binding pinctrl-single could be updated to
> parse the generic binding naturally too in addition to the legacy
> binding.
>
> > That said, the topic is open in a way. Some people are also annoyed
> > that some graphics drivers just ask Torvalds to pull 100.000+ lines
> > of register defnes in some merge windows. The data has to go
> > somewhere.
>
> Yes and the amount of SoC specific LOC under drivers/pinctrl is pretty
> staggering already.
>
> With all that SoC specific data built into the kernel, it's like going
> camping with all your pants stuffed into your car instead of just the
> pants you need :)
>
> We only need the SoC specific data for the booted SoC, so devicetree
> and loadable modules makes more sense there compared to the current
> built-in setup.

I'm against putting that into DT and here is why.

DT is the thing that describes the _platform_. While it's fine to put
GPIO expander thingy (and we actually do this with labeling schema for
GPIOs, right?), the SoC level of things is a _hardware_ and with all
flexibility the DT gives us we will definitely have a deviations on
_different_ platforms with _the same_ SoC! To work around this we must
have a validation of the pin names and their functions in many places.

And last but not least the copying it in tons of DT feels like a
duplication effort.,

AFAIU the topic, the pin control lacks labeling schema that will
provide the view from the platform perspective, while driver provides
from HW perspective.

-- 
With Best Regards,
Andy Shevchenko
