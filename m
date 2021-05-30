Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4F39526F
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 20:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhE3SSU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 14:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhE3SSU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 May 2021 14:18:20 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C32AC061574;
        Sun, 30 May 2021 11:16:42 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id e22so6634273pgv.10;
        Sun, 30 May 2021 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkUj3zMmHOdVNuTHNI8kn298pUVHjZoc++S5+3I/00Q=;
        b=ubiWREhVEWrggHFu74IuBBX9P5k0XHbA7pNKYK3/B4Z4M1mCLwYoSDMml1kA5TC9Kw
         uX6yeJA67KKv+VdRNbDgkzqxMeERFq9+bfhOGxLWFbwn5kKdwOROW6+AcS/5MulvxgSr
         IKEudMFuimGFOYRiTKdV2lzw/E5B6r/e+a76wIfuxuK3Lo7VFYh90+KT58H/+jy0yU7M
         +sXtU1i4v0hzakPFSbASDC/SX1UfDuItppyvJb3gThNdj+knpX6fJxEGyGI14Rh62hO+
         VCqS0EGKjW0ha5SlGsvUZrbrv6oeylUXmyVeMjeXDPeV7jf1NI2S7Ob4ChlhSBQJcBFO
         wD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkUj3zMmHOdVNuTHNI8kn298pUVHjZoc++S5+3I/00Q=;
        b=l7VnVuHo2uui6V2qSyS9Zm+wS1QAFoqFOH7dqk3IByYKG17s627Jl+650IvPCaHHxK
         RE+9jSQuYXXHTEzhzKZJ+gdE8vYKAL7pEbK5HqN+fA0SFFpxhuVgnG+UPtYrK7PfCh5J
         z90XO13BI8zhrAPFVTojK5tLv/9MYqPkHyei+cpq0u/g1MbnMbJxY7Uh0D+aEb1pBhhe
         djb+saYKMzZmHumzMesGIiKTruOzxD4eRUnawROV/uxdR+CXUz5VpA1LKrrdVLIJEaXR
         1/W6YCgO+DAuEEyy4Od5S56IZlNCKeAkvjXJrALg6IsEeUBBU18otDi0PxgtNo4xEOeP
         LH9w==
X-Gm-Message-State: AOAM530hBQrlkO+zHioU2lCizu2egaUJhf1B6NgSKj0m/99jJEeuQGau
        H6L61YXkg1VydTY72885NO8PDnhPxIbjsyPtP+o=
X-Google-Smtp-Source: ABdhPJyOUPWjXJ/oYKp8W04hWiA9Gwj/2oAT6Q8yTLxO+CVmGKHo/gdytZ+Z9OJnX1iAMl2bwQ4EuucGS4j7k4Ag9P4=
X-Received: by 2002:a63:b507:: with SMTP id y7mr19116473pge.74.1622398601427;
 Sun, 30 May 2021 11:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc> <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
In-Reply-To: <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 30 May 2021 21:16:24 +0300
Message-ID: <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 7:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/30/21 6:19 PM, Sander Vanheule wrote:
> > On Fri, 2021-05-28 at 08:37 +0200, Michael Walle wrote:

...

> > I think I found a solution!
> >
> > As Michael suggested, I tried raw register reads and writes, to eliminate any
> > side effects of the intermediate code. I didn't use the ioctls (this isn't a
> > netdev), but I found regmap's debugfs write functionality, which allowed me to
> > do the same.
> >
> > I was trying to reproduce the behaviour I reported earlier, but couldn't. The
> > output levels were always the intended ones. At some point I realised that the
> > regmap_update_bits function does a read-modify-write, which might shadow the
> > actual current output value.
> > For example:
> >  * Set output low: current out is low
> >  * Change to input with pull-up: current out is still low, but DATAx reads high
> >  * Set output high: RMW reads a high value (the input), so assumes a write is
> >    not necessary, leaving the old output value (low).
> >
> > Currently, I see two options:
> >  * Use regmap_update_bits_base to avoid the lazy RMW behaviour
> >  * Add a cache for the output data values to the driver, and only use these
> >    values to write to the output registers. This would allow keeping lazy RMW
> >    behaviour, which may be a benefit on slow busses.
> >
> > With either of these implemented, if I set the output value before the
> > direction, everything works! :-)
> >
> > Would you like this to be added to regmap-gpio, or should I revert back to a
> > device-specific implementation?
>
> Regmap allows you to mark certain ranges as volatile, so that they will not
> be cached, these GPIO registers containing the current pin value seems like
> a good candidate for this. This is also necessary to make reading the GPIO
> work without getting back a stale, cached value.

After all it seems a simple missed proper register configuration in
the driver for regmap.
Oh, as usual something easy-to-solve requires tons of time to find it. :-)

Sander, I think you may look at gpio-pca953x.c to understand how it
works (volatility of registers).

-- 
With Best Regards,
Andy Shevchenko
