Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0B4141579
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 02:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbgARBqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 20:46:47 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:48487 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729930AbgARBqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 20:46:47 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id DF0793C04C1;
        Sat, 18 Jan 2020 02:46:43 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pzu7defiLZdF; Sat, 18 Jan 2020 02:46:37 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id B524B3C04C0;
        Sat, 18 Jan 2020 02:46:37 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Sat, 18 Jan
 2020 02:46:37 +0100
Date:   Sat, 18 Jan 2020 02:46:32 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v3 0/7] gpio: Add GPIO Aggregator/Repeater
Message-ID: <20200118014632.GA14644@lxhi-065.adit-jv.com>
References: <20191127084253.16356-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Wed, Nov 27, 2019 at 09:42:46AM +0100, Geert Uytterhoeven wrote:
>   - Create aggregators:
> 
>     $ echo e6052000.gpio 19,20 \
>         > /sys/bus/platform/drivers/gpio-aggregator/new_device
> 
>     gpio-aggregator gpio-aggregator.0: gpio 0 => gpio-953 (gpio-aggregator.0)
>     gpio-aggregator gpio-aggregator.0: gpio 1 => gpio-954 (gpio-aggregator.0)
>     gpiochip_find_base: found new base at 778
>     gpio gpiochip8: (gpio-aggregator.0): added GPIO chardev (254:8)
>     gpiochip_setup_dev: registered GPIOs 778 to 779 on device: gpiochip8 (gpio-aggregator.0)
> 
>     $ echo e6052000.gpio 21 e6050000.gpio 20-22 \
>         > /sys/bus/platform/drivers/gpio-aggregator/new_device
> 
>     gpio-aggregator gpio-aggregator.1: gpio 0 => gpio-955 (gpio-aggregator.1)
>     gpio-aggregator gpio-aggregator.1: gpio 1 => gpio-1012 (gpio-aggregator.1)
>     gpio-aggregator gpio-aggregator.1: gpio 2 => gpio-1013 (gpio-aggregator.1)
>     gpio-aggregator gpio-aggregator.1: gpio 3 => gpio-1014 (gpio-aggregator.1)
>     gpiochip_find_base: found new base at 774
>     gpio gpiochip9: (gpio-aggregator.1): added GPIO chardev (254:9)
>     gpiochip_setup_dev: registered GPIOs 774 to 777 on device: gpiochip9 (gpio-aggregator.1)
> 
>   - Adjust permissions on /dev/gpiochip[89] (optional)
> 
>   - Control LEDs:
> 
>     $ gpioset gpiochip8 0=0 1=1 # LED6 OFF, LED7 ON
>     $ gpioset gpiochip8 0=1 1=0 # LED6 ON, LED7 OFF
>     $ gpioset gpiochip9 0=0     # LED8 OFF
>     $ gpioset gpiochip9 0=1     # LED8 ON
> 
>   - Destroy aggregators:
> 
>     $ echo gpio-aggregator.0 \
>             > /sys/bus/platform/drivers/gpio-aggregator/delete_device
>     $ echo gpio-aggregator.1 \
>             > /sys/bus/platform/drivers/gpio-aggregator/delete_device

Thanks for describing the test procedure in detail. It helps a lot.

Using similar commands on H3ULCB, I could successfully trigger the
gpiochip6-{12,13} leds on and off. 

The only unexpected thing is seeing below messages (where gpiochip99 and
gpiochip22 are inexisting gpiochip names, mistakenly provided on command
line prior to passing the correct name):

root@rcar-gen3:~# echo gpiochip6 12-13 > /sys/bus/platform/drivers/gpio-aggregator/new_device                                                                                                                                                                                                                                                                 
[  915.572905] gpio-aggregator gpio-aggregator.0: cannot find GPIO chip gpiochip99, deferring
[  915.584224] gpio-aggregator gpio-aggregator.2: cannot find GPIO chip gpiochip99, deferring
[  915.865281] gpio-aggregator gpio-aggregator.29: cannot find GPIO chip gpiochip22, deferring

Obviously, in the above case, due to a typo in the names, the gpio
chips will never be found, no matter how long gpio-aggregator defers
their probing. Unfortunately, the driver will continuously emit those
messages, upon each successfully created/aggregated gpiochip. I built
gpio-aggregator as a loadable module, if that's relevant.

Another comment is that, while the series _does_ allow specifying
gpio lines in the DTS (this would require a common compatible string
in gpio_aggregator_dt_ids[] and in the DTS node) and while those lines
are indeed exposed to userspace, based on my testing, these same gpio
lines are marked as "used/reserved" by the kernel. This means that
operating on those gpio pins from userspace will not be possible.
For instance, gpioget/gpioset return "Device or resource busy":

gpioget: error reading GPIO values: Device or resource busy
gpioset: error setting the GPIO line values: Device or resource busy

I guess Harish will be unhappy about that, as his expectation was that
upon merging gpio-aggregator with gpio-inverter, he will be able to
describe GPIO polarity and names in DTS without "hogging" the pins.
Perhaps this can be supplemented via an add-on patch later on?

For the whole series (leaving the above findings to your discretion):

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks!

-- 
Best Regards,
Eugeniu
