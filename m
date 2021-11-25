Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175E345DAD4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 14:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352441AbhKYNVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 08:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354692AbhKYNTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 08:19:53 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81723C0613A1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 05:14:32 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z5so25626252edd.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 05:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBYSpPhQSJxBhoO91Om3TSZHfZXkClRcC6Qkriy10qI=;
        b=lktpFgCAKshjISGG6GZ3uRaSyPNiCxnasNkjovBrXXHU3TWe5vydxxgrFTevIGeztO
         hLKE9EiXmrq2vyvPMIjQQxoP4mZbi5qBu0z1ZxcLEflCF23HvtJa+9RjDKED9Onvl6Ru
         NXPhFYhN4n++KTZ3XU1Wq+fahnZoFe4Ti6nLCaPyzN1lVGYpfE+GZghsdfh4HwO7bU6e
         IGBACcYbCAQovqAZTdVcMimOwxH7JyzMhp/uGFW9z4Hs40PnGqBf5ujZSBltX9mq+81R
         lLrxHYyidyMCAtnTHGwzt94PEHKGdog+Jujt4JiAb2vjfwGM1vZ7d9vJg6D8P2aQXdDu
         /bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBYSpPhQSJxBhoO91Om3TSZHfZXkClRcC6Qkriy10qI=;
        b=7mJRFU1MrESWyb9wBpZ4aV4wNW5CHPdn+q0t11nWwigWvkEG75YoxNzydD07uNLw0O
         ik+ozTVxWvR4NubJ5h3G7WUcuEq34btDkO/d2T3jLgmTKGMTl2zsobKX4SC9j+FcBFay
         pIjf1BrROqfTXekc/yT5fDeHx1V0QS5pyL+KKqMCOcklKt+ybfqCVnxQ/OhRE7cE8rsU
         6QnbyoU2lhDf1Rj3VC6oPrX5elYdWSnbnw/r9kAO69/hEpheuqb+tma58vSlUbU87ENw
         fcO4eOoaOlGiqqKJO3FCHHIUlkNdq5dYW3+/NY1KqTMNg3pkbBBJiZcnZzHV/1QSGar1
         OsbA==
X-Gm-Message-State: AOAM5307kYyJdwjfjZ14iEtNQQkui8vxUeZp+eODCQTzI3rBCn06DFGh
        F/zmLUrTMHlKMrHbTxJNc2nZzUhMh66Ws+4aaQRAZA==
X-Google-Smtp-Source: ABdhPJwTVHuEoOcGJhq154P6oK/ip5o+IJ4/UsZHSzBPWZdWCtyh3T33HjLNmnlpDWzJiYnFDdYbGis28vUeXeS8fNQ=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr37560636eds.172.1637846071064;
 Thu, 25 Nov 2021 05:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20211124114257.19878-1-brgl@bgdev.pl> <20211124114257.19878-3-brgl@bgdev.pl>
In-Reply-To: <20211124114257.19878-3-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 25 Nov 2021 14:14:20 +0100
Message-ID: <CAMRc=MeR4ubyVWUmR_x99dLjovcFn3Bn9FwGKgX88-P0_PeStw@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] gpio: sim: new testing module
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 24, 2021 at 12:43 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Implement a new, modern GPIO testing module controlled by configfs
> attributes instead of module parameters. The goal of this driver is
> to provide a replacement for gpio-mockup that will be easily extensible
> with new features and doesn't require reloading the module to change
> the setup.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  Documentation/admin-guide/gpio/gpio-sim.rst |   80 ++
>  drivers/gpio/Kconfig                        |    8 +
>  drivers/gpio/Makefile                       |    1 +
>  drivers/gpio/gpio-sim.c                     | 1370 +++++++++++++++++++
>  4 files changed, 1459 insertions(+)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
>  create mode 100644 drivers/gpio/gpio-sim.c
>

Hi guys!

I'd like to get your opinion on some parts of the interface.

Should we allow creating multiple gpiochips per platform device like
some drivers do? And if so - should the sysfs groups be created for
each gpiochip device kobject and not the parent?

Currently we do this:

# Create the chip (platform device + single gpiochip):
mkdir /sys/kernel/config/gpio-sim/my-chip
# Configure it
echo 8 > /sys/kernel/config/gpio-sim/my-chip/num_lines
# Enable it
echo 1 > /sys/kernel/config/gpio-sim/my-chip/live

What I mean above would make it look like this:

# Create the platform device
mkdir /sys/kernel/config/gpio-sim/my-gpio-device

# what's inside?
ls /sys/kernel/config/gpio-sim/my-gpio-device
live

# Create GPIO chips
mkdir /sys/kernel/config/gpio-sim/my-gpio-device/chip0
mkdir /sys/kernel/config/gpio-sim/my-gpio-device/chip1

# Configure chips
echo 8 > /sys/kernel/config/gpio-sim/my-gpio-device/chip0/num_lines
echo 4 > /sys/kernel/config/gpio-sim/my-gpio-device/chip1/num_lines
echo foobar > /sys/kernel/config/gpio-sim/my-gpio-device/chip1/label

# Enable both chips
echo 1 > /sys/kernel/config/gpio-sim/my-gpio-device/live

And in sysfs instead of current:

echo pull-up > /sys/devices/platform/gpio-sim.0/sim_line0/pull

We'd have to do:

echo pull-up > /sys/devices/platform/gpio-sim.0/gpiochip1/sim_line0/pull

While I don't see any usefulness of that at this time, if we don't do
it now, then it'll be hard to extend this module later. What are your
thoughts?

Bart
