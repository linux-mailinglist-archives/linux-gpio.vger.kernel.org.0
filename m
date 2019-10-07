Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD70CDD0E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 10:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfJGISy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 04:18:54 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40050 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfJGISy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 04:18:54 -0400
Received: by mail-ot1-f67.google.com with SMTP id y39so10215157ota.7;
        Mon, 07 Oct 2019 01:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1ge6S2/sDk/acD/D1FFy5VOy4auDMP0HxecaIBGRbM=;
        b=oJfhEVPCoNakDQavTWGdBsQ/1cTkp9afQCLCb+ketATASqd3s0W7ZUflprXOkYWI0k
         VkMzC6jh0IE6ilvMedZqeAlzEcjJkPgZhlOhIC7LqoQXRHaubVtpaqGcHVzTzNujHKEg
         fTWb3DYvy8PotFZHRHOfyVTl1gHDBWh63FoT1cMNraI/tOvC8NsQVzUmb07UrMpLBypp
         EBSNwcAXPqKl8oO/2xH+Y9Tdg9X+OpuUyuIw/SS42JJNi16iTZpWROla4LwyvJhIXx7F
         jhxUj4YjRmwhhkN3ujkHtOcPZYdJ/SXWBXoGJO+vNryLZMzp76mjYn2cLtVDJpsoRcjA
         aPmQ==
X-Gm-Message-State: APjAAAViZeHfvW4Ds3ubMaI9YBQQnym8ZLTema/a2BdKLHaZt35S8Dp4
        jGWk7V4xiKM6ZDEB2SelwLei5dQ860JdQxT43zx+ED7t
X-Google-Smtp-Source: APXvYqwaJHUYye+JWAVM8IQM/zd2KOt5hIlHb6bB7MjwLCluYCGJczOFobszV+f1rz4AwsNjXl1y+qnUXB4NGq6DbDw=
X-Received: by 2002:a9d:7311:: with SMTP id e17mr18969568otk.107.1570436332628;
 Mon, 07 Oct 2019 01:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com> <CAMuHMdVt3yDiJzkbUGMdkKKd4+CJ0btWuO-J=YZL+pAo99_WXg@mail.gmail.com>
 <20191005130740.GA22620@x230>
In-Reply-To: <20191005130740.GA22620@x230>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 10:18:40 +0200
Message-ID: <CAMuHMdViwrqg48t2Pc2JtZKLGzLPy0cVfzcnqctGo9oaDpC9Wg@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

On Sat, Oct 5, 2019 at 3:08 PM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> On Fri, Sep 27, 2019 at 11:07:20AM +0200, Geert Uytterhoeven wrote:
> > My standard reply would be: describe the device connected to the GPIO(s)
> > in DT.  The GPIO line polarities are specified in the device's "gpios"
> > properties.

> > Next step would be to use the device from Linux.  For that to work, you
> > need a dedicated driver (for the complex case), or something generic
> > (for the simple case).
> > The latter is not unlike e.g. spidev.  Once you have a generic driver,
> > you can use "driver_override" in sysfs to bind the generic driver to
> > your device.  See e.g. commit 5039563e7c25eccd ("spi: Add
> > driver_override SPI device attribute").
>
> We have passed your suggestions along. Many thanks.
>
> > Currently we don't have a "generic" driver for GPIOs. We do have the
> > GPIO chardev interface, which exports a full gpio_chip.
> > It indeed looks like this "gpio-inverter" could be used as a generic
> > driver.  But it is limited to GPIOs that are inverted, which rules out
> > some use cases.
> >
> > So what about making it more generic, and dropping the "inverter" from
> > its name, and the "inverted" from the "inverted-gpios" property? After
> > all the inversion can be specified by the polarity of the GPIO cells in
> > the "gpios" property, and the GPIO core will take care of it[*]?
> > Which boils down to adding a simple DT interface to my gpio-aggregator
> > ("[PATCH/RFC v2 0/5] gpio: Add GPIO Aggregator Driver",
> >  https://lore.kernel.org/lkml/20190911143858.13024-1-geert+renesas@glider.be/).
> > And now I have realized[*], we probably no longer need the GPIO
> > Forwarder Helper, as there is no need to add inversion on top.
>
> After having a look at the gpio aggregator (and giving it a try on
> R-Car3 H3ULCB), here is how I interpret the above comment:
>
> If there is still a compelling reason for having gpio-inverter, then it
> probably makes sense to strip it from its "inverter" function (hence,
> transforming it into some kind of "repeater") on the basis that the
> inverting function is more of a collateral/secondary feature, rather
> than its primary one. Just like in the case of gpio aggregator, the
> primary function of gpio inverter is to accept a bunch of GPIO lines and
> to expose those via a dedicated gpiochip. I hope this is a proper
> summary of the first point in your comment. In any case, this is the
> understanding I get based on my experiments with both drivers.

Yes, the inverter is basically a "repeater" (or "aggregator", when it has
multiple GPIOs connected), hardcoded to invert.

> What I also infer is that, assuming gpio-inverter will stay (potentially
> renamed and stripped of its non-essential inverting function), the gpio
> aggregator will need to keep its Forwarder Helper (supposed to act as a
> common foundation for both drivers).

What I meant is that if the inverter and aggregator would be combinoed
into a single driver, there would no longer be a need[*] for a separate
helper, and it could be incorporated into the single driver.

[*] The individual helper functions may still be useful for some other
     driver, though.

> The second point which I extract from your comment is that the "gpio
> aggregator" could alternatively acquire the role of "gpio-inverter"
> (hence superseding it) by adding a "simple DT interface". I actually
> tend to like this proposal, since (as said above) both drivers are
> essentially doing the same thing, i.e. they cluster a number of gpio
> lines and expose this cluster as a new gpiochip (keeping the
> reserved/used gpio lines on hold). That looks like a huge overlap in
> the functionalities of the two drivers.

Yes, both drivers are very similar.  The difference lies in how they
acquire the list of GPIO descriptors.

> The only difference which I see is that "gpio-inverter" is getting its
> input from DT and generates the gpiochips at probe time, while
> "gpio aggregator" is getting its input from sysfs and generates the
> gpiochips at runtime, post-probe.

Exactly.

For my virtualization use case, I need to create the list of GPIO
descriptors at run-time, hence the sysfs interface. This is
polarity-agnostic (i.e. the end user needs to care about polarity).

For Harish use case, he needs to describe the list from DT, with
polarity inverted, which can be done by specifying the GPIO_ACTIVE_LOW
flag in the node's"gpios" property.

For your use case, you want to describe the list in DT, with line-names,
and polarity specified.

> So, assuming no objections from Harish and other reviewers, I would be
> very happy to review and test the DT-based gpio inversion functionality
> as part of gpio aggregator. Thanks!

Thanks, adding to my list ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
