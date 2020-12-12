Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01742D8332
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 01:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394803AbgLLAEn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 19:04:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391639AbgLLAEZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 19:04:25 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE38C061794
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:03:45 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id a9so15731914lfh.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SfxY10PKBlgSw6/Fq87LV1LDFIW7NSQj7nViKjsG+no=;
        b=Wv11Q6mHv1gO+UaNIbL3zUo9qxZ+sUkHbR3bPMfJXBP7hbTgQJTAEuD7NrSlyu5iSs
         GZY1MvMu2QY+1vgHEbL861U/AW0MFtcrwrOHtO4nQCZsil9oq4+HwCAMi/NszMkxMXcs
         ds5ydgWlDwUByKmBJHOLU77zHHsuw/a7lcOdiMC2bVLJETcemZlkqkrQWC2BWBZupm5O
         Ue+0Yhb6R/g69gA0RI1FZdiQU9o4+4dZ9aLzJLwqSUtMbO2GDNouFSMO1ZXgWm0a7wqg
         w8WCrN9NuJEg+zwXtoHzuXzhY2Q/8zobMukCOIfDB1fFkLkQvxoFPsZCgnjNzr+tEXJU
         VaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SfxY10PKBlgSw6/Fq87LV1LDFIW7NSQj7nViKjsG+no=;
        b=NITdmjfKjoh2MYd5a2V3ehvzItFgmxGlT8L/7W2W7SdGjLP/6BIalkD3KheN0ZD37m
         DAQ9Hoo0ftZx4vsFlU6gXBTcJw5kQOsGwzYlwNYJhG0kQG1so0BinEswKDfcxqBkz3kZ
         TYIL6lRvFzkRa2aZ4WExw1NKow3j9c/z//hJCgv8cozuiVXMdWOB+0B8vyv9IunFS2dF
         +KRoOS3nyHzqDC7mmiN4LzwAL2H8yE/J0jwoyJYpMOYhn2CV0sPgm5Z86gZhxRzGOJQC
         X2iA5Cx/70mR1kmC1E+vIawZGj68f4Zbgr6vhMOUcVs9gXmmau0hiqP6B+iHhR+cSCgb
         VAgg==
X-Gm-Message-State: AOAM533B9gJhc1iyba5aqkS1S6VmB7vJyMgWvWxnhwSqPBTH687QBODB
        3FSiecv7NpKBgrze4sh6ek80GGz+qu1mBeGzoR+tng==
X-Google-Smtp-Source: ABdhPJx3IAmrcEpXXMHnifRqVgVvTeCANVyRGmMptZidgvCOnkz50UFCvqUVtOhvhNSlPjj6hHub2Zi1irgcEhjEmys=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr5506252ljz.74.1607731423405;
 Fri, 11 Dec 2020 16:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-1-mani@kernel.org> <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost> <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost> <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost> <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
 <X9HiGaIzk4UaZG7i@localhost>
In-Reply-To: <X9HiGaIzk4UaZG7i@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 01:03:32 +0100
Message-ID: <CACRpkdZ6MUzRe9m=NrqA_5orhZXDtWj+qoFMHX7v6Zjsx-rVGg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Johan Hovold <johan@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 9:53 AM Johan Hovold <johan@kernel.org> wrote:
> On Wed, Dec 09, 2020 at 05:25:32PM +0100, Linus Walleij wrote:

> I just replied to that thread, but to summarize, you can't rely on
> having the sysfs code detect collisions since that will trigger a bunch
> of nasty warnings and backtraces. We also don't want the sysfs interface
> for a specific USB device to depend on probe order (only the first one
> plugged in gets to use the line names). And adding line names now could
> in fact be what breaks currently working scripts.

Yes the sysfs ABI is very volatile and easy to break.

As pointed out in the other reply, sysfs base GPIO number is all
wibbly-wobbly on anything hot-pluggable so in a way I feel it
is the right thing to disallow sysfs altogether on hotpluggable
devices.

> > I am strongly encouraging any developer with a few spare cycles
> > on their hands to go and implement the debugfs facility because
> > we can make it so much better than the sysfs, easier and
> > more convenient for testing etc.
>
> Don't you run the risk of having people enable debugfs in production
> systems now just so they can use the old-style interface?

That risk always exist of course. For this and many other reasons.
I just have to trust developers to understand that debugfs is named
debugfs for a reason.

> Side note: if you skip the "export" part of the interface, how would you
> indicate that a line is already in use or not available (e.g.
> gpio-range-reserved)?

The idea is that if you poke around there you know what you're
doing or ready to face the consequences.

I am thinking if people want to toggle LEDs and switches from
debugfs for testing and hacking they'd be alright with corrupting
the SPI interface if they make mistakes.

The chardev ABI is the only thing which we really designed with
some users, multiple users, compatibility and security in mind,
yet we had to revamp it once from scratch...

> Just did a super quick check and it seems libgpiod still assumes a flat
> name space. For example, gpiod_chip_find_line() returns only the first
> line found that matches a name. Shouldn't be impossible to extend, but
> just want to make sure this flat namespace assumption hasn't been to
> heavily relied upon.

The unique way to identify a GPIO is gpiochip instance (with
topology from sysfs) and then a line number on that chip.
This is done e.g. in the example tool
tools/gpio/gpio-hammer.c

As you can see the tool doesn't use these line names.

The line names are really like symbolic links or something.
But they are indeed in a flat namespace so we should try to
at least make them unique if it turns out people love to use
these.

As it is now system designers mostly use device tree to assign
line names and they try to make these unique because they don't
like the nasty warnings from gpiolib.

If I google for the phrase "Detected name collision for GPIO name"
I just find the code, our discussions and some USB serial devices
warning about this so far.

Maybe we should just make a patch to disallow it?

Yours,
Linus Walleij
