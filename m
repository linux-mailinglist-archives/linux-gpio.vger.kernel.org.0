Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD28CBAC1
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 14:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfJDMqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 08:46:34 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41418 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfJDMqe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 08:46:34 -0400
Received: by mail-io1-f67.google.com with SMTP id n26so13149542ioj.8
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VRB8GutwyLNTRWBkBTWQCwuVFFwoYD3LPNpancjbpJE=;
        b=PPg8pyidKI0q1HO6KGLAR1Qn2a3F3in52MooutrZSL9FTeZneDDsC8IWSX3MibNUgl
         8m5S96/ta4NJ4CfOQTtplZ3fn45mh8BNHu3kSHgyp/BwzwPSxWUAaW/eujxa1wdXYNTa
         lIylF1mN92qj/e5A/eydWcx1uX+TdgoRDRPzndJb1p5EtcUbjFcs07d085xGsVdNY123
         He4sc5hxWNRDXU0cKScJDROqqRGCBAXmVkLelCQ5obemBtz7YD1ITkYNtTZpx6qjUvi6
         Oe/9HWJyFGUP5ZF+WZOHrCTbcb65OY9Rx4mgmUAPn96tU8ZfJNtcBvvQZV1VW69+8s+4
         yN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VRB8GutwyLNTRWBkBTWQCwuVFFwoYD3LPNpancjbpJE=;
        b=a3IG++rzQtvqJ0fydZDnGLQ0LzxrzxOG2K6CVnK2UaE4qQOGW/ICfeu3WFdWebcrPo
         7Ly7tbxqPbKPbv7BBGTBRrKgbfAltEpZ+MQ9DD+nF8G1olUBT7f3PjAtFRx2aq7c7R/m
         wCIFah8xe4FW//FZ7TdT1vrTLv/Nu0agmgee9H5S085rk/XQlrlE5pLls+iHaRtNVQg+
         kMlZX+UwH1MWugacT5okO9pBIGzOm5cl8+NXlu3fwxS0J+C3jwem16gYQvq8ZdonuP1N
         2VD/lsxIDIBcrZf/2rZ6dTjQ9qLid1kR0vJCMXGvcLrznbvkegGreODYU3ZvnxSpC451
         bJnw==
X-Gm-Message-State: APjAAAWM4to8aH2ugfcpo57x18dUNljayFzyKS/J4Nmh+6EgYemTgBz/
        iiy9xEZ5Ngpt7zkBhOcem/Ne7uUkxe/jYH8FXPDwmA==
X-Google-Smtp-Source: APXvYqxM1ZMcaccEUpb91Q55zYyNfUia6QMTnDYWhYCG6K5LtXTOrJZzNN2hy3bz+abaD95pQUqMDXBgAGVuZsctXLI=
X-Received: by 2002:a5d:8911:: with SMTP id b17mr76627ion.287.1570193191679;
 Fri, 04 Oct 2019 05:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
 <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com> <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
In-Reply-To: <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 4 Oct 2019 14:46:20 +0200
Message-ID: <CAMRc=MfY19A6btCZFHfz+Bp5SoppVos3c6gq589osfVWdShpeA@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 4 pa=C5=BA 2019 o 09:22 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> czw., 3 pa=C5=BA 2019 o 14:47 Linus Walleij <linus.walleij@linaro.org> na=
pisa=C5=82(a):
> >
> > On Mon, Sep 23, 2019 at 10:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> >
> > > I remember discussing it with Linus some time ago. This may not be as
> > > straightforward as simply adding new flags. Since PULL-UP/DOWN
> > > resistors can - among other parameters - also have configurable
> > > resistance, we'll probably need some kind of a structure for this
> > > ioctl() to pass any additional information to the kernel. Since we
> > > can't change ABI this may require adding a whole new ioctl() for
> > > extended configuration. This in turn has to be as future-proof as
> > > possible - if someone asks for user-space-configurable drive-strength=
,
> > > the new ioctl() should be ready for it.
> > >
> > > I should have some bandwidth in the coming days, so I'll try to give =
it a try.
> >
> > What we did for the in-kernel API and the Device Tree ABI
> > was to simply say that if you need such elaborate control over
> > the line, it needs to be done with a proper pin control driver.
> >
> > So for lines that just have the GPIO_PULL_UP or
> > GPIO_PULL_DOWN set as a (one-bit) flag, what you will
> > get is "typical" pull down/up (whatever the hardware default
> > is, or what the driver thinks is default, which should be safe
> > so the highest possible pull resistance I suppose).
> >
> > So one option is to just go with these flags and explicitly
> > say that it will give a "system default (high resistance)
> > pull up/down".
> >
> > That said, the pin controller back-end is fully capable of
> > accepting more elaborate configuration, so if we prefer then
> > we can make the more complex userspace ABI that can
> > set it to a desired-or-default resistance.
> >
> > I lean toward simplicity here. I haven't seen that these
> > userspace consumers need very elaborate control of this
> > resistance, they are for one-off hacks and as such should
> > be fine with just default pull up/down I think?
> >
> > I  think that specifying "this line will use pull up/down"
> > at request time and having the driver set a safe default
> > pull-up/down as response, (and pretty much what this
> > patch does) and then add another explicit
> > ioctl to refine it the day we need it is a viable way forward.
> >
> >  in the future something like:
> > #define GPIOHANDLE_SET_LINE_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct
> > gpiohandle_config)
> >
> > And then, when we need it, try to come up with some
> > really flexible ABI for the config, based on
> > include/linux/pinctrl/pinconf-generic.h
> >
>
> Thanks for your input Linus. I'm good with that. The config ioctl (or
> something similar) you're mentioning may appear sooner actually -
> users of libgpiod have been requesting a way of changing the direction
> of a line without releasing it - something that's possible in the
> kernel, but not from user-space at the moment. I'll submit something
> that allows to change the configuration of a requested line soon.
>
> Bart

Cc'ing Kent, as he might be interested in this.

I'll be travelling tomorrow and will have a couple hours on the plane,
so I'll try to cook up an additional ioctl for configuration changes
of requested lines with additional padding for future extension.

Bart

>
> > But no upfront code for that right now as it is not needed.
> > A practical usecase must come first.
> >
> > Yours,
> > Linus Walleij
