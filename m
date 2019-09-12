Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C66B0AC0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 10:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfILI7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 04:59:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33688 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbfILI7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 04:59:14 -0400
Received: by mail-oi1-f195.google.com with SMTP id e12so16227035oie.0;
        Thu, 12 Sep 2019 01:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07+QEZTfn9RypDDP0lnGrecYssAORdm1hEOMhmeJ4sQ=;
        b=qB29lOZJwO2tvSVVpPI8hVkGV53UZRntu+VETEohIp9cgwQ0GOgisfHFTxRfPdNgcm
         9Ms8gmKQb8a8y2dghFQVV+Q5LVR+OVqU4YuHf1kMhTzHBKZTkNa6+Vrrrs1fOiAbyTLC
         TP8J4g5ZorKV8H4n1lrGFcuBqjihNXySK1Ou288MTZkBL7SvbAaW0Kr8DAaGuN8XIBxG
         /v7bodccIGoU/bImy7Bat7F8iBaUAadk94kTXpDUMUIX86oOmY225uGkuaDW3C0aeJxr
         Zcvwfh9fEBAYswRpowHBCQAGFcKch1ekWf/k53SdIvvscq+dAa5FM9S9b6Jw+FgnouHk
         B3sg==
X-Gm-Message-State: APjAAAUrL3d8WZD7jpFr0ZE9Z+KtcoGqXw2vpK0VSn99MrZXTNYY/Rua
        0MJsvru99UyvZvSMuIamMGkX4KWU7ATOjMQgMMc=
X-Google-Smtp-Source: APXvYqwaLUUcAadCv0DqnSsH8fSMIu/3zsuqD2+TF8HGL+/gSXVIvL0eI/76KPAWOFUO1FnvkEwE9GdgkicOmpaXifE=
X-Received: by 2002:a05:6808:8e3:: with SMTP id d3mr7305993oic.153.1568278753086;
 Thu, 12 Sep 2019 01:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be> <CACRpkdZstL3PMtLN3VCDmHq7vSNdO0Q8Wf1sYb5VnwCMs=0uJQ@mail.gmail.com>
In-Reply-To: <CACRpkdZstL3PMtLN3VCDmHq7vSNdO0Q8Wf1sYb5VnwCMs=0uJQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Sep 2019 10:59:01 +0200
Message-ID: <CAMuHMdWcxgXfBb9sBNunOwxftO0+pEB3oAHgufyiGUn3B8uv2Q@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>, adelva@google.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

Hi Linus,

On Thu, Sep 12, 2019 at 10:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jul 5, 2019 at 5:05 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > GPIO controllers are exported to userspace using /dev/gpiochip*
> > character devices.  Access control to these devices is provided by
> > standard UNIX file system permissions, on an all-or-nothing basis:
> > either a GPIO controller is accessible for a user, or it is not.
> > Currently no mechanism exists to control access to individual GPIOs.
> >
> > Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> > and expose them as a new gpiochip.  This is useful for implementing
> > access control, and assigning a set of GPIOs to a specific user.
> > Furthermore, it would simplify and harden exporting GPIOs to a virtual
> > machine, as the VM can just grab the full virtual GPIO controller, and
> > no longer needs to care about which GPIOs to grab and which not,
> > reducing the attack surface.
> >
> > Virtual GPIO controllers are instantiated by writing to the "new_device"
> > attribute file in sysfs:
> >
> >     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> >            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >
> > Likewise, virtual GPIO controllers can be destroyed after use:
> >
> >     $ echo gpio-virt-agg.<N> \
> >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Aggregating GPIOs and exposing them as a new gpiochip was suggested in
> > response to my proof-of-concept for GPIO virtualization with QEMU[1][2].
> >
> > Sample session on r8a7791/koelsch:
> >
> >   - Disable the leds node in arch/arm/boot/dts/r8a7791-koelsch.dts
> >
> >   - Create virtual aggregators:
> >
> >     $ echo "e6052000.gpio 19 20" \
> >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >
> >     gpio-virt-agg gpio-virt-agg.0: GPIO 0 => e6052000.gpio/19
> >     gpio-virt-agg gpio-virt-agg.0: GPIO 1 => e6052000.gpio/20
> >     gpiochip_find_base: found new base at 778
> >     gpio gpiochip8: (gpio-virt-agg.0): added GPIO chardev (254:8)
> >     gpiochip_setup_dev: registered GPIOs 778 to 779 on device: gpiochip8 (gpio-virt-agg.0)
> >
> >     $ echo "e6052000.gpio 21, e6050000.gpio 20 21 22" \
> >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >
> >     gpio-virt-agg gpio-virt-agg.1: GPIO 0 => e6052000.gpio/21
> >     gpio-virt-agg gpio-virt-agg.1: GPIO 1 => e6050000.gpio/20
> >     gpio-virt-agg gpio-virt-agg.1: GPIO 2 => e6050000.gpio/21
> >     gpio-virt-agg gpio-virt-agg.1: GPIO 3 => e6050000.gpio/22
> >     gpiochip_find_base: found new base at 774
> >     gpio gpiochip9: (gpio-virt-agg.1): added GPIO chardev (254:9)
> >     gpiochip_setup_dev: registered GPIOs 774 to 777 on device: gpiochip9 (gpio-virt-agg.1)
> >
> >   - Adjust permissions on /dev/gpiochip[89] (optional)
> >
> >   - Control LEDs:
> >
> >     $ gpioset gpiochip8 0=0 1=1 # LED6 OFF, LED7 ON
> >     $ gpioset gpiochip8 0=1 1=0 # LED6 ON, LED7 OFF
> >     $ gpioset gpiochip9 0=0     # LED8 OFF
> >     $ gpioset gpiochip9 0=1     # LED8 ON
> >
> >   - Destroy virtual aggregators:
> >
> >     $ echo gpio-virt-agg.0 \
> >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >     $ echo gpio-virt-agg.1 \
> >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >
> > Thanks for your comments!
> >
> > References:
> >   - [1] "[PATCH QEMU POC] Add a GPIO backend"
> >         (https://lore.kernel.org/linux-renesas-soc/20181003152521.23144-1-geert+renesas@glider.be/)
> >   - [2] "Getting To Blinky: Virt Edition / Making device pass-through
> >          work on embedded ARM"
> >         (https://fosdem.org/2019/schedule/event/vai_getting_to_blinky/)
>
> I'm looping in my friends at Google for this discussion.
>
> They need a virtualized gpio_chip for their Android emulator,
> and their current approach for other devices has been around
> using virtio in most cases and an emulated AC97 for the
> audio case as far as I remember.
>
> It would be great to have their input on this so we can create a
> virtualization/aggregate that works for all.
>
> Please include adelva@google.com on future postings of this!

I've sent v2 yesterday:
https://lore.kernel.org/lkml/20190911143858.13024-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
