Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1D142A4F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 13:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgATMOz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 07:14:55 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53928 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMOy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 07:14:54 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id C7E013C00C5;
        Mon, 20 Jan 2020 13:14:50 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Bta2hz3l_WGv; Mon, 20 Jan 2020 13:14:42 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AC1BB3C04C1;
        Mon, 20 Jan 2020 13:14:42 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 20 Jan
 2020 13:14:42 +0100
Date:   Mon, 20 Jan 2020 13:14:39 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [PATCH v3 0/7] gpio: Add GPIO Aggregator/Repeater
Message-ID: <20200120121439.GA24951@lxhi-065.adit-jv.com>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20200118014632.GA14644@lxhi-065.adit-jv.com>
 <CAMuHMdUUc17n0TxOrtQNby+ZiHDpz-aEh-ncnkz50vcwQe6z6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUc17n0TxOrtQNby+ZiHDpz-aEh-ncnkz50vcwQe6z6w@mail.gmail.com>
X-Originating-IP: [10.72.93.66]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Mon, Jan 20, 2020 at 10:33:53AM +0100, Geert Uytterhoeven wrote:
> On Sat, Jan 18, 2020 at 2:46 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > The only unexpected thing is seeing below messages (where gpiochip99 and
> > gpiochip22 are inexisting gpiochip names, mistakenly provided on command
> > line prior to passing the correct name):
> >
> > root@rcar-gen3:~# echo gpiochip6 12-13 > /sys/bus/platform/drivers/gpio-aggregator/new_device
> > [  915.572905] gpio-aggregator gpio-aggregator.0: cannot find GPIO chip gpiochip99, deferring
> > [  915.584224] gpio-aggregator gpio-aggregator.2: cannot find GPIO chip gpiochip99, deferring
> > [  915.865281] gpio-aggregator gpio-aggregator.29: cannot find GPIO chip gpiochip22, deferring
> >
> > Obviously, in the above case, due to a typo in the names, the gpio
> > chips will never be found, no matter how long gpio-aggregator defers
> 
> Indeed, that is expected behavior: you have created platform devices
> referring to resources that are not available.

Got it. Sounds reasonable to me.

> 
> > their probing. Unfortunately, the driver will continuously emit those
> > messages, upon each successfully created/aggregated gpiochip. I built
> 
> That is expected behavior, too: every time the driver core manages to
> bind a device to a driver, it will retry all previously deferred probes,
> in the hope they can be satisfied by the just bound device.
> 
> Note that you can destroy these bogus devices, using e.g.
> 
>     # echo gpio-aggregator.0 > \
>     /sys/bus/platform/drivers/gpio-aggregator/delete_device

Yep, I can get rid of the bogus devices this way. Thanks!

> 
> > gpio-aggregator as a loadable module, if that's relevant.
> 
> Modular or non-modular shouldn't matter w.r.t. this behavior.
> Although unloading the module should get rid of the cruft.

Yes, indeed!

> 
> > Another comment is that, while the series _does_ allow specifying
> > gpio lines in the DTS (this would require a common compatible string
> > in gpio_aggregator_dt_ids[] and in the DTS node) and while those lines
> > are indeed exposed to userspace, based on my testing, these same gpio
> > lines are marked as "used/reserved" by the kernel. This means that
> > operating on those gpio pins from userspace will not be possible.
> > For instance, gpioget/gpioset return "Device or resource busy":
> >
> > gpioget: error reading GPIO values: Device or resource busy
> > gpioset: error setting the GPIO line values: Device or resource busy
> >
> > I guess Harish will be unhappy about that, as his expectation was that
> > upon merging gpio-aggregator with gpio-inverter, he will be able to
> > describe GPIO polarity and names in DTS without "hogging" the pins.
> > Perhaps this can be supplemented via an add-on patch later on?
> 
> When aggregating GPIO lines, the original GPIO lines are indeed marked
> used/reserved, so you cannot use them from userspace.
> However, you are expected to use them through the newly created virtual
> gpiochip representing the aggregated GPIO lines.
> 
> You can try this using the "door" example in
> Documentation/admin-guide/gpio/gpio-aggregator.rst, after replacing
> gpio2 {19,20} by gpio6 {12,13} to suit your H3ULCB.

Confirmed. The example works like a charm. One difference between
the runtime-created and DTS-created gpiochips is the name:
 - gpio-aggregator.<number>, for the ones created via sysfs
 - <name-of-DTS-node>, for the ones created via DTS

Seeing this behavior on my target, I believe the expectations of
Harish should be met w/o any major limitations.

> 
> > For the whole series (leaving the above findings to your discretion):
> >
> > Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

The recent [v3] discussion actually applies to [v4], for which I did
review and testing. Will relay the signatures to the latest version.

Thank you very much.

-- 
Best Regards,
Eugeniu
