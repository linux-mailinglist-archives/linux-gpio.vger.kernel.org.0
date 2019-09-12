Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7818AB0AB7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 10:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730452AbfILI46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 04:56:58 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45053 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730440AbfILI46 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 04:56:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id q11so3736760lfc.11
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O4rNsBBKosmEKuM20N1o+kTVCcH97Bng0NbBw9yNr8E=;
        b=D3DKMYG24yUN1RDiYO9JGi5OzLJnsDAX1mduveT541WYCPUsRVLNeQV1gqCXQgLQnA
         hSiysE5eP/ctTfnppUzrQP2sahmP2yiTiw5cgHoArQeUEzOcvqySc7NEkB3mq2JOPbqb
         juhTRCK1xJvKgjLJjOaw9fyowdFgeNSXBHqzOVPQ3FI71LSnFKfrkfliHRc1JpIqWAv3
         Iwkq20k06kaGR2jt1/Jec+6iT2dpYsmvt5MP2pWkVLAmxhvqyE+X931w6bdf2z831BDg
         sDW1oCFvbn/+Q3/cq/Gj6AoYXkHffK4vgwEIVqhmEtZhQTeG31pOB+Je8xQdKsVuPJ7W
         TUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O4rNsBBKosmEKuM20N1o+kTVCcH97Bng0NbBw9yNr8E=;
        b=a1Qy3mXsfSiwF0PjGuAt1HSAwdGfB8Eu8rUjXH645UDDzrIPs57yHri9OnhjztqhYf
         Xx42YnhmV4gn2g2prEC+ZSjpoIp+VynihV5EQ+VztTjoHToM5pa5pObiBW2TQIjXecY+
         WLR2myqmas7ZbdT1Pzy8kjWx0TEwqD4nJaROgQ+y4BAavJlb2zfrvp2okIXWwsnHLAnb
         1xduS40Qz7u5qT1PjzccWUu5HGIcGvnp18TztgaxZITWaD0Zd1Og1mIvJZ86jPqJq6xY
         hUv4pQ/GJS30crG8+gDETvbqFiwMvQDEEe8IHuFa24RFZcvWSjLExVUIThJrBzrgWi2o
         OVfg==
X-Gm-Message-State: APjAAAXFrWhZ1LTsqzWfetwZ7IgVJaIhJ2ThUMJUgmUYveqv8R1uCI5F
        gC/AFwdrgD+IBKRuNhysYAoBKz7iQPPoadi+rdkAiiLI/j0JSZ1W
X-Google-Smtp-Source: APXvYqxylrMcLmkUlXrbh6djdas3oUwzeZqQnSvt9y91CIt5cYSOJplKhnz1LXiShn8fiV4G7ad4/5yw3Umgt3fgxhU=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr27114921lfa.141.1568278614888;
 Thu, 12 Sep 2019 01:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
In-Reply-To: <20190705160536.12047-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 09:56:43 +0100
Message-ID: <CACRpkdZstL3PMtLN3VCDmHq7vSNdO0Q8Wf1sYb5VnwCMs=0uJQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>, adelva@google.com
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 5, 2019 at 5:05 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
>
> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> and expose them as a new gpiochip.  This is useful for implementing
> access control, and assigning a set of GPIOs to a specific user.
> Furthermore, it would simplify and harden exporting GPIOs to a virtual
> machine, as the VM can just grab the full virtual GPIO controller, and
> no longer needs to care about which GPIOs to grab and which not,
> reducing the attack surface.
>
> Virtual GPIO controllers are instantiated by writing to the "new_device"
> attribute file in sysfs:
>
>     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
>            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
> Likewise, virtual GPIO controllers can be destroyed after use:
>
>     $ echo gpio-virt-agg.<N> \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Aggregating GPIOs and exposing them as a new gpiochip was suggested in
> response to my proof-of-concept for GPIO virtualization with QEMU[1][2].
>
> Sample session on r8a7791/koelsch:
>
>   - Disable the leds node in arch/arm/boot/dts/r8a7791-koelsch.dts
>
>   - Create virtual aggregators:
>
>     $ echo "e6052000.gpio 19 20" \
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
>     gpio-virt-agg gpio-virt-agg.0: GPIO 0 => e6052000.gpio/19
>     gpio-virt-agg gpio-virt-agg.0: GPIO 1 => e6052000.gpio/20
>     gpiochip_find_base: found new base at 778
>     gpio gpiochip8: (gpio-virt-agg.0): added GPIO chardev (254:8)
>     gpiochip_setup_dev: registered GPIOs 778 to 779 on device: gpiochip8 (gpio-virt-agg.0)
>
>     $ echo "e6052000.gpio 21, e6050000.gpio 20 21 22" \
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
>     gpio-virt-agg gpio-virt-agg.1: GPIO 0 => e6052000.gpio/21
>     gpio-virt-agg gpio-virt-agg.1: GPIO 1 => e6050000.gpio/20
>     gpio-virt-agg gpio-virt-agg.1: GPIO 2 => e6050000.gpio/21
>     gpio-virt-agg gpio-virt-agg.1: GPIO 3 => e6050000.gpio/22
>     gpiochip_find_base: found new base at 774
>     gpio gpiochip9: (gpio-virt-agg.1): added GPIO chardev (254:9)
>     gpiochip_setup_dev: registered GPIOs 774 to 777 on device: gpiochip9 (gpio-virt-agg.1)
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
>   - Destroy virtual aggregators:
>
>     $ echo gpio-virt-agg.0 \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>     $ echo gpio-virt-agg.1 \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>
> Thanks for your comments!
>
> References:
>   - [1] "[PATCH QEMU POC] Add a GPIO backend"
>         (https://lore.kernel.org/linux-renesas-soc/20181003152521.23144-1-geert+renesas@glider.be/)
>   - [2] "Getting To Blinky: Virt Edition / Making device pass-through
>          work on embedded ARM"
>         (https://fosdem.org/2019/schedule/event/vai_getting_to_blinky/)

I'm looping in my friends at Google for this discussion.

They need a virtualized gpio_chip for their Android emulator,
and their current approach for other devices has been around
using virtio in most cases and an emulated AC97 for the
audio case as far as I remember.

It would be great to have their input on this so we can create a
virtualization/aggregate that works for all.

Please include adelva@google.com on future postings of this!

Yours,
Linus Walleij
