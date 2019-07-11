Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251F065432
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 11:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbfGKJyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 05:54:38 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40028 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbfGKJyh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jul 2019 05:54:37 -0400
Received: by mail-ot1-f65.google.com with SMTP id e8so5213061otl.7;
        Thu, 11 Jul 2019 02:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/5PBzbOSkarM0fR7QZKIT7PJomPF+Mz3qw+l6PgF5Y=;
        b=Hu51tSBYMtiyFmL7P/YCNrY6FxEQxrb9+bwKpBBN4mpWZqIpzliLeAIOuAakMiGEHL
         o46CGg8HxLDn2wJRpUAXGLd1WR8i67ZCDfTuDwT2wKIW9ImEOngFuERJY0b9AkiOTQpS
         VDkl5Awan0ModEZaq/I3e+R1+9j/UTEJNvI9FAAtMkzOohkS5+dQjMC6Ka5Atu1IzC70
         6o3vndBPaZduPosJCiYj9dIK8yfk6ETBEITaNGBY/92F8IqwTiJjRDE6+cFiwSD7/7bI
         xTy9uaYO0DzrmnWqeV4Vz6k2xKb1K0vnbRtt+gPtOFLpkI11t/9w/dBOFH4LjpktS+Ku
         SlPA==
X-Gm-Message-State: APjAAAUK/PgKKy/P3d6KyCJbludQsRlPeErcfT+zzix2T6HimGj2f1nQ
        Sq/OK+JPgU+2MwN9obFWX1pa+LZxmXUVrBd3h0g=
X-Google-Smtp-Source: APXvYqyK0DKq3ZkjRdl7YQmWxsya6hifOg7+4DokzYCRW2KnOdJBEZwbn4B17kuLWtHJCatZb6xcjHbBhlJ8ZYeniDE=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr2691084otn.297.1562838876685;
 Thu, 11 Jul 2019 02:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <8500a069-9e29-d6ad-e5e4-22d5a3eead59@electromag.com.au> <CAMuHMdWLcr0pf-ZM3+iWQGwDLB2xoHAZaeCKAjtEVEaiNed63Q@mail.gmail.com>
 <1fc3a5ad-6eb6-3356-5fd4-93ce0482bb7e@electromag.com.au>
In-Reply-To: <1fc3a5ad-6eb6-3356-5fd4-93ce0482bb7e@electromag.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Jul 2019 11:54:25 +0200
Message-ID: <CAMuHMdXTyN0wHJyZJavER7b5h5j=7j8MADhZvFwBLpH60x39sA@mail.gmail.com>
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

On Thu, Jul 11, 2019 at 11:24 AM Phil Reid <preid@electromag.com.au> wrote:
> On 10/07/2019 18:21, Geert Uytterhoeven wrote:
> > On Wed, Jul 10, 2019 at 4:00 AM Phil Reid <preid@electromag.com.au> wrote:
> >> On 6/07/2019 00:05, Geert Uytterhoeven wrote:
> >>> GPIO controllers are exported to userspace using /dev/gpiochip*
> >>> character devices.  Access control to these devices is provided by
> >>> standard UNIX file system permissions, on an all-or-nothing basis:
> >>> either a GPIO controller is accessible for a user, or it is not.
> >>> Currently no mechanism exists to control access to individual GPIOs.
> >>>
> >>> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> >>> and expose them as a new gpiochip.  This is useful for implementing
> >>> access control, and assigning a set of GPIOs to a specific user.
> >>> Furthermore, it would simplify and harden exporting GPIOs to a virtual
> >>> machine, as the VM can just grab the full virtual GPIO controller, and
> >>> no longer needs to care about which GPIOs to grab and which not,
> >>> reducing the attack surface.
> >>>
> >>> Virtual GPIO controllers are instantiated by writing to the "new_device"
> >>> attribute file in sysfs:
> >>>
> >>>       $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> >>>              "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> >>>               > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >>>
> >>> Likewise, virtual GPIO controllers can be destroyed after use:
> >>>
> >>>       $ echo gpio-virt-agg.<N> \
> >>>               > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >>>

> >> Would it be possible to do the lookup via line names?
> >
> > Doesn't the fact that a GPIO has a line name means that it is in use, and
> > thus cannot be aggregated and exported to another user?
>
> They can be given line names via the dt property gpio-line-names.
> Which can be used by user space to find a gpio. Not sure if there's an equivalent api inkerenl.
> But it looks like we can find the info via struct gpiochip_info / gpioline_info linfo and work
> out the chip name and line offsets. So probably not required.
>
> Find the right gpio always seems tricky.
> We have systems with multiple i2c gpio behind muxes that may or may not be present.
> So i2c bus numbers are never consistent. And then different board revisions move the
> same gpio line to a different pin (or cahnge the gpio chip type completely) to make routing easier etc.

OK, so extending lookup to line names makes sense.
This requires making gpio_name_to_desc() public.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
