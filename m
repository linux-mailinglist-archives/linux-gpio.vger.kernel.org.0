Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466F7142752
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgATJeF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 04:34:05 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41769 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgATJeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 04:34:05 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so27950956oie.8;
        Mon, 20 Jan 2020 01:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4UGZULGX+YbThMmtUsP+6rz+ppDz5uP2ldQfl/P5Icg=;
        b=r9BsWJI3/T3ZajffuGYjSoUFTwBkinpE6cXRPJHgDYA9/V+s95oNwuxSMPkQ/4cWRj
         ZaO1SmpOmS3irAImPnfWNoPnAvu+Rowsz/IfJmN/ZmJ2BhOYckAckM4YIRTPmFDO0uGp
         EU5jhrVSxHGkBAGYOnbK1WxS3RANycKdJex8Ezu+w7bGXf8G0OmXRp8KiQBpQ/KtgPlT
         uXP6z8GZhTZOFtZQ698I5XmxKeYh3vQkn2ExZYvB8By/iq6oVezMqNWAXL51HDdCD/QX
         AMxtTqoUDTIVRBXkFyOKnbPk7rN8QXKlqjSHJZ2ByGxrg+Xn91wVGS5WoYc+2bnY3QwS
         u0SQ==
X-Gm-Message-State: APjAAAXpFc9fimVSH61Kcc6KZFG+NkCsZ4PaHNdcQH3O6dAAoU8e46Qr
        Xv5RMuH+KdUh5QESUmpq0WKAqYtag6xEkDlPQ7k=
X-Google-Smtp-Source: APXvYqzKSRFvw6ji0gpORenZnjRNgTgsQRPZg2pYUM0CIPBoLJXTQJmTGSvG1PbarmgxudUhQ+JfoPFk+YrYJBaAPTE=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr11682717oia.148.1579512844618;
 Mon, 20 Jan 2020 01:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be> <20200118014632.GA14644@lxhi-065.adit-jv.com>
In-Reply-To: <20200118014632.GA14644@lxhi-065.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jan 2020 10:33:53 +0100
Message-ID: <CAMuHMdUUc17n0TxOrtQNby+ZiHDpz-aEh-ncnkz50vcwQe6z6w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] gpio: Add GPIO Aggregator/Repeater
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

On Sat, Jan 18, 2020 at 2:46 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Wed, Nov 27, 2019 at 09:42:46AM +0100, Geert Uytterhoeven wrote:
> >   - Create aggregators:
> >
> >     $ echo e6052000.gpio 19,20 \
> >         > /sys/bus/platform/drivers/gpio-aggregator/new_device

> The only unexpected thing is seeing below messages (where gpiochip99 and
> gpiochip22 are inexisting gpiochip names, mistakenly provided on command
> line prior to passing the correct name):
>
> root@rcar-gen3:~# echo gpiochip6 12-13 > /sys/bus/platform/drivers/gpio-aggregator/new_device
> [  915.572905] gpio-aggregator gpio-aggregator.0: cannot find GPIO chip gpiochip99, deferring
> [  915.584224] gpio-aggregator gpio-aggregator.2: cannot find GPIO chip gpiochip99, deferring
> [  915.865281] gpio-aggregator gpio-aggregator.29: cannot find GPIO chip gpiochip22, deferring
>
> Obviously, in the above case, due to a typo in the names, the gpio
> chips will never be found, no matter how long gpio-aggregator defers

Indeed, that is expected behavior: you have created platform devices
referring to resources that are not available.

> their probing. Unfortunately, the driver will continuously emit those
> messages, upon each successfully created/aggregated gpiochip. I built

That is expected behavior, too: every time the driver core manages to
bind a device to a driver, it will retry all previously deferred probes,
in the hope they can be satisfied by the just bound device.

Note that you can destroy these bogus devices, using e.g.

    # echo gpio-aggregator.0 > \
    /sys/bus/platform/drivers/gpio-aggregator/delete_device

> gpio-aggregator as a loadable module, if that's relevant.

Modular or non-modular shouldn't matter w.r.t. this behavior.
Although unloading the module should get rid of the cruft.

> Another comment is that, while the series _does_ allow specifying
> gpio lines in the DTS (this would require a common compatible string
> in gpio_aggregator_dt_ids[] and in the DTS node) and while those lines
> are indeed exposed to userspace, based on my testing, these same gpio
> lines are marked as "used/reserved" by the kernel. This means that
> operating on those gpio pins from userspace will not be possible.
> For instance, gpioget/gpioset return "Device or resource busy":
>
> gpioget: error reading GPIO values: Device or resource busy
> gpioset: error setting the GPIO line values: Device or resource busy
>
> I guess Harish will be unhappy about that, as his expectation was that
> upon merging gpio-aggregator with gpio-inverter, he will be able to
> describe GPIO polarity and names in DTS without "hogging" the pins.
> Perhaps this can be supplemented via an add-on patch later on?

When aggregating GPIO lines, the original GPIO lines are indeed marked
used/reserved, so you cannot use them from userspace.
However, you are expected to use them through the newly created virtual
gpiochip representing the aggregated GPIO lines.

You can try this using the "door" example in
Documentation/admin-guide/gpio/gpio-aggregator.rst, after replacing
gpio2 {19,20} by gpio6 {12,13} to suit your H3ULCB.

> For the whole series (leaving the above findings to your discretion):
>
> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
