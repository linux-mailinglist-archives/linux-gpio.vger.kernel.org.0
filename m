Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354306451E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 12:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfGJKVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 06:21:47 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39521 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfGJKVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 06:21:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id r21so1601749otq.6;
        Wed, 10 Jul 2019 03:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hi6thLRzPp31ZNlrsqTMD+L4AfM17N+VHGvoPv6ISh0=;
        b=mG3WrhEm1WewCc0k8zoXM1AJO86kElwVpPAzClGT3S0fu+gHLa2J8uuoAKrqacox8f
         JNVgx9wyGc9hoW7CEbrGe2ArHRZnibWn9hEjzqHtdyL7RJjQx8Ovcm5Sr9NHbQmstcl+
         kd3EtgwXetqY+nEQ+64J5Ny3Hki34zcsTS4grJXmoalBIrWWKakQVEbdagqkrofrVOpM
         T0JTPlXoQYRAXDE/Ur+FkWcea9Fa2h0wU41FKDd+xRoO7Th/NXRTLi3GOkzSgUOyQQe/
         4vyCPhVMWDkGE6l1o9CExiZcVfQwIFqIN5M3ExSz9tz/DmHzdWxk09xaHriaGn28RNZd
         MZcg==
X-Gm-Message-State: APjAAAUtc/RICAlC8V4mAuh+Sn+sbhUpPqwHmGqu7AwAA+O3RoNssPtP
        QPY09w6CelMfp0IjAmbofo0HeoHtOmmlAatiFyI=
X-Google-Smtp-Source: APXvYqzIrZRSgRuX2Gq/mfmOXQ1oI1Q7/uvrG+ybtkgYq5mYPQ7do0oaeBVqu00kbw6aDN/dGT0IC7t5vSteaZXtVsY=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr8348445otk.107.1562754106044;
 Wed, 10 Jul 2019 03:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be> <8500a069-9e29-d6ad-e5e4-22d5a3eead59@electromag.com.au>
In-Reply-To: <8500a069-9e29-d6ad-e5e4-22d5a3eead59@electromag.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Jul 2019 12:21:35 +0200
Message-ID: <CAMuHMdWLcr0pf-ZM3+iWQGwDLB2xoHAZaeCKAjtEVEaiNed63Q@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Phil Reid <preid@electromag.com.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

On Wed, Jul 10, 2019 at 4:00 AM Phil Reid <preid@electromag.com.au> wrote:
> On 6/07/2019 00:05, Geert Uytterhoeven wrote:
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
> >      $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> >             "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> >              > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >
> > Likewise, virtual GPIO controllers can be destroyed after use:
> >
> >      $ echo gpio-virt-agg.<N> \
> >              > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >
>
> Nice.
> This provides similar functionality to the "gpio inverter" driver currently on the list.
> Other than being just a buffer.

Indeed, both drivers forward GPIO calls, but the gpio inverter modifies
some parameters passed.

The way the drivers obtain references to GPIOs is different, though: the
inverter driver obtains a fixed description from DT, while the virtual
aggregator receives the description at runtime, from sysfs.

But perhaps both drivers could share some code?

> Would it be possible to do the lookup via line names?

Doesn't the fact that a GPIO has a line name means that it is in use, and
thus cannot be aggregated and exported to another user?

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
