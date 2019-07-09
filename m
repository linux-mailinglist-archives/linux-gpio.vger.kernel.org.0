Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4925638FB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 18:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfGIP77 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 9 Jul 2019 11:59:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36426 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbfGIP77 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 11:59:59 -0400
Received: by mail-ot1-f68.google.com with SMTP id r6so20465645oti.3;
        Tue, 09 Jul 2019 08:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z1mIOFo8Yb9qP+Xw6RYXcy8nIe448VjUC8u9ee+We+c=;
        b=DN1Yz6XZQGdg8wm3bC6Y92cUilI9MVDcNvrseB4ITW5Ruf3tKPRdPtW5RtoR81X9UN
         F1Jwu6UGTz1vE3Hq4YoChLudvzcAZanEMH2yoSJlKMEQDT555mQ1x/nHe+xCMB8MY3T7
         M6eLcZkBq65RRRnkERz3rvsEgDexkCgv5EBUayxUMV97iL5opDZfuKso4rzbWmxmhrte
         XGyT3hx6y8QQW9XVquNHCvIhyNU7+H1skmWgdzzpyF413X/cGwmKaqaHkSZayAYQsuFD
         m4hrgqMbk+hTA8rgwZrza9S/pvIceiGSlURqk3PKWZx1VPhcPhJepO2xHpx6Mz1wqPIa
         IfLQ==
X-Gm-Message-State: APjAAAWFEv/IpSy2+wLVPRWGNPnxGal1qow6TIgr73dk5M2++aZHs0es
        b/K1k5UwPSUEldbo+d2W8bMZme7umzPann+quRA=
X-Google-Smtp-Source: APXvYqwKIGFzgXhLsG7x1Ibj/zqO9Ml43UWKnLOrH2GD2U0KJFvJPE3d3t4YQY0+Ry5zNqEpFNq7esdkQCqbfLmXXoM=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr2448511otc.250.1562687998070;
 Tue, 09 Jul 2019 08:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
 <CAMuHMdWdb0dcS8Nvk-Poz2dT7nuHjFhqpsRPZZnSKsc3VffcRA@mail.gmail.com> <CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com>
In-Reply-To: <CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 17:59:47 +0200
Message-ID: <CAMuHMdUkF32+wOLkfd2BL4h-=0nZjPDMtVOpOcyDYzBbhWXteQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Jul 9, 2019 at 4:59 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 8 lip 2019 o 12:24 Geert Uytterhoeven <geert@linux-m68k.org> napisał(a):
> > On Mon, Jul 8, 2019 at 11:45 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > pt., 5 lip 2019 o 18:05 Geert Uytterhoeven <geert+renesas@glider.be> napisał(a):
> > > > GPIO controllers are exported to userspace using /dev/gpiochip*
> > > > character devices.  Access control to these devices is provided by
> > > > standard UNIX file system permissions, on an all-or-nothing basis:
> > > > either a GPIO controller is accessible for a user, or it is not.
> > > > Currently no mechanism exists to control access to individual GPIOs.
> > > >
> > > > Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> > > > and expose them as a new gpiochip.  This is useful for implementing
> > > > access control, and assigning a set of GPIOs to a specific user.
> > > > Furthermore, it would simplify and harden exporting GPIOs to a virtual
> > > > machine, as the VM can just grab the full virtual GPIO controller, and
> > > > no longer needs to care about which GPIOs to grab and which not,
> > > > reducing the attack surface.
> > > >
> > > > Virtual GPIO controllers are instantiated by writing to the "new_device"
> > > > attribute file in sysfs:
> > > >
> > > >     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> > > >            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> > > >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> > > >
> > > > Likewise, virtual GPIO controllers can be destroyed after use:
> > > >
> > > >     $ echo gpio-virt-agg.<N> \
> > > >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device

> Am I doing it right? I'm trying to create a device and am only getting this:
>
> # echo gpiochip2 23 > new_device
> [  707.507039] gpio-virt-agg gpio-virt-agg.0: Cannot find gpiochip gpiochip2
>
> gpiochip2 *does* exist in the system.

Please try the name of the platform device instead.
I.e. for my koelsch (R-Car M2-W), it needs "e6052000.gpio" instead
of "gpiochip2".

Probably the driver should match on both.

> I see. I'll try to review it more thoroughly once I get to play with
> it. So far I'm stuck on creating the virtual chip.

Thanks, good luck!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
