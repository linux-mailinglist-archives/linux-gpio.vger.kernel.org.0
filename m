Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88FB3AB6F2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 13:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfIFLOX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 6 Sep 2019 07:14:23 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39014 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfIFLOX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 07:14:23 -0400
Received: by mail-ot1-f65.google.com with SMTP id n7so5348745otk.6;
        Fri, 06 Sep 2019 04:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A+M249Y2yXTR5pLBFzUNH1SBf+7zmy/nNt6gvl0in+8=;
        b=ay3oHVCvhkOP4NCTsypUY8oM+oDGeXKR8DMt3kZaxiOGKxKu3ocvmz9GawMYIQG0xV
         dxypLYOYFoIJag0hImEircHpTUDwE5tEedcSuX5+aU2eWGuurARp3DTbjlmIdPvOX0xE
         JShBsh4+SM4CROCBLTiFvAkeLKURYbZp0HncVEwVYhTSay0WjYVv9a9PH7qyJ+SuHwz1
         8QB+kezx1lSi5UxyDJbxcv1dbWmmJtOv8EobOCMfCyMUfY+Aw6LdSdyUiG709F6CBEcy
         YcTHWNL0zTeAWf52sdAQRCQGgllGQMfvo6VNzRXkjaGrKlJ8DMYUWuY1eFYoxOzsXAGN
         EQ8A==
X-Gm-Message-State: APjAAAVouXrwZq1gD4s6qlAs+H8cuHLbtdbaShdMeIx7c0emn2EunT3D
        AHBkB7bM5/+cX2dVDqgoEkZrtAGZPu4RGQuJkTw=
X-Google-Smtp-Source: APXvYqzUNQXMQuLstdGXR8mRJrmMCqQfnRb/uNRT1dACYw9FvhrBJuzXdIAg5nMAqX8cUVjMPZH+gtG74Cj8EpGzPcc=
X-Received: by 2002:a05:6830:1196:: with SMTP id u22mr6812488otq.39.1567768461501;
 Fri, 06 Sep 2019 04:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
 <CAMuHMdWdb0dcS8Nvk-Poz2dT7nuHjFhqpsRPZZnSKsc3VffcRA@mail.gmail.com>
 <CAMpxmJUF1s1zyXVtoUGfbV7Yk+heua4rNjY=DrX=jr-v8UfNxA@mail.gmail.com>
 <CAMuHMdUkF32+wOLkfd2BL4h-=0nZjPDMtVOpOcyDYzBbhWXteQ@mail.gmail.com> <CAMpxmJXCYeGjCu_PhCPffZQZ+ST9YCp27-PTHfL2SJ0Bh8SJFQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXCYeGjCu_PhCPffZQZ+ST9YCp27-PTHfL2SJ0Bh8SJFQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Sep 2019 13:14:10 +0200
Message-ID: <CAMuHMdV32_x5+CEqZM-mNjg5dAEK-D1JNTTGQYqR87u5X2dJqg@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Jul 12, 2019 at 11:27 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 9 lip 2019 o 17:59 Geert Uytterhoeven <geert@linux-m68k.org> napisał(a):
> > On Tue, Jul 9, 2019 at 4:59 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > pon., 8 lip 2019 o 12:24 Geert Uytterhoeven <geert@linux-m68k.org> napisał(a):
> > > > On Mon, Jul 8, 2019 at 11:45 AM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > > > pt., 5 lip 2019 o 18:05 Geert Uytterhoeven <geert+renesas@glider.be> napisał(a):
> > > > > > GPIO controllers are exported to userspace using /dev/gpiochip*
> > > > > > character devices.  Access control to these devices is provided by
> > > > > > standard UNIX file system permissions, on an all-or-nothing basis:
> > > > > > either a GPIO controller is accessible for a user, or it is not.
> > > > > > Currently no mechanism exists to control access to individual GPIOs.
> > > > > >
> > > > > > Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> > > > > > and expose them as a new gpiochip.  This is useful for implementing
> > > > > > access control, and assigning a set of GPIOs to a specific user.
> > > > > > Furthermore, it would simplify and harden exporting GPIOs to a virtual
> > > > > > machine, as the VM can just grab the full virtual GPIO controller, and
> > > > > > no longer needs to care about which GPIOs to grab and which not,
> > > > > > reducing the attack surface.
> > > > > >
> > > > > > Virtual GPIO controllers are instantiated by writing to the "new_device"
> > > > > > attribute file in sysfs:
> > > > > >
> > > > > >     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> > > > > >            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> > > > > >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> > > > > >
> > > > > > Likewise, virtual GPIO controllers can be destroyed after use:
> > > > > >
> > > > > >     $ echo gpio-virt-agg.<N> \
> > > > > >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >
> > > Am I doing it right? I'm trying to create a device and am only getting this:
> > >
> > > # echo gpiochip2 23 > new_device
> > > [  707.507039] gpio-virt-agg gpio-virt-agg.0: Cannot find gpiochip gpiochip2
> > >
> > > gpiochip2 *does* exist in the system.
> >
> > Please try the name of the platform device instead.
> > I.e. for my koelsch (R-Car M2-W), it needs "e6052000.gpio" instead
> > of "gpiochip2".
> >
> > Probably the driver should match on both.
> >
> > > I see. I'll try to review it more thoroughly once I get to play with
> > > it. So far I'm stuck on creating the virtual chip.
>
> This is not a show-stopper but one thing that's bothering me in this
> is that lines used by the aggregator are considered 'used' in regard
> to the original chip. I'm wondering how much effort would it take to
> have them be 'muxed' into two (real and virtual) chips at once.

Is that really what you want?
If a GPIO is aggregated with othrs, it's intended to be used only through
the aggregator, isn't it?

> Other than that - seems to works pretty nice other than the matching
> by chip name and by line names.

Thanks, working on that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
