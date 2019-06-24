Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E50D5109E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 17:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfFXPfj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 11:35:39 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36009 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfFXPfj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 11:35:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id r6so13956799oti.3;
        Mon, 24 Jun 2019 08:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDs8l0EqS99acnWR7VOY7oZc27cA1C7UyoMqytNjurQ=;
        b=JR3hBzXMaRo6CTAjNnpok4EDPJgfGl8o1GfVDUn2zxDojA6vxPpWSOQj3l1NLs1LKY
         FjiAg6fTKAl/3ojfNA6Nt6vyUHNS71uAatvGrhbfELc3FdtaFlmqy6CMBASKPt9+koPm
         OnbiqBJOyLpf1zRlQ8l6+6LZPfr6/AL9SJ3BcbLFNPAymMGJ69HDPq6vZyMC3zCIiG4L
         by1jf9gQRBRpUNUxB2pf5ab/2p1HnuotWAQXdtDZlg92yOhMVGRyCMfnELVdhO4h++ZS
         lbB+G/MMpWl8Nz1g1BDh19Xm2Kt+XCk1Mr+2VoXaFlJljevdaIktSL2WE7aK9DjzBJgn
         RfRg==
X-Gm-Message-State: APjAAAUvPe6kPWcapGPbsolKagjln++q/zshAu7hqLU6uzqtkrOSlDdt
        v+lf+QBV10wV+qMKe+HXXxGi8CJf5C3i0roYnB2RJB4c
X-Google-Smtp-Source: APXvYqyCfTccALRL7UUQdCywFtvUJdVbHF8z4IjuBjMFvn94y0cAWWP2IP8qtQBBYVSaFzJ0isSgfKa/yy7C3VUHaN4=
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr17440403oto.39.1561390538697;
 Mon, 24 Jun 2019 08:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190620062420.11650-1-sr@denx.de> <CAMuHMdXMpS_pg9N0qSW=Li0QavAMRG79RJcS4s0w6NTCxv_zzg@mail.gmail.com>
 <24bfb52c-6f77-b7cd-7421-9e6e4b0aa7d3@denx.de>
In-Reply-To: <24bfb52c-6f77-b7cd-7421-9e6e4b0aa7d3@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jun 2019 17:35:26 +0200
Message-ID: <CAMuHMdWeX6=SuSPVUB=WaYMsUbrmg5sraM=APeXsqr_Yv6u4AA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v9] serial: mctrl_gpio: Check if GPIO property exisits
 before requesting it
To:     Stefan Roese <sr@denx.de>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Giulio Benetti <giulio.benetti@micronovasrl.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stefan,

On Mon, Jun 24, 2019 at 5:29 PM Stefan Roese <sr@denx.de> wrote:
> On 24.06.19 10:42, Geert Uytterhoeven wrote:
> > On Thu, Jun 20, 2019 at 8:24 AM Stefan Roese <sr@denx.de> wrote:
> >> This patch adds a check for the GPIOs property existence, before the
> >> GPIO is requested. This fixes an issue seen when the 8250 mctrl_gpio
> >> support is added (2nd patch in this patch series) on x86 platforms using
> >> ACPI.
> >>
> >> Here Mika's comments from 2016-08-09:
> >>
> >> "
> >> I noticed that with v4.8-rc1 serial console of some of our Broxton
> >> systems does not work properly anymore. I'm able to see output but input
> >> does not work.
> >>
> >> I bisected it down to commit 4ef03d328769eddbfeca1f1c958fdb181a69c341
> >> ("tty/serial/8250: use mctrl_gpio helpers").
> >>
> >> The reason why it fails is that in ACPI we do not have names for GPIOs
> >> (except when _DSD is used) so we use the "idx" to index into _CRS GPIO
> >> resources. Now mctrl_gpio_init_noauto() goes through a list of GPIOs
> >> calling devm_gpiod_get_index_optional() passing "idx" of 0 for each. The
> >> UART device in Broxton has following (simplified) ACPI description:
> >>
> >>      Device (URT4)
> >>      {
> >>          ...
> >>          Name (_CRS, ResourceTemplate () {
> >>              GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> >>                      "\\_SB.GPO0", 0x00, ResourceConsumer)
> >>              {
> >>                  0x003A
> >>              }
> >>              GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> >>                      "\\_SB.GPO0", 0x00, ResourceConsumer)
> >>              {
> >>                  0x003D
> >>              }
> >>          })
> >>
> >> In this case it finds the first GPIO (0x003A which happens to be RX pin
> >> for that UART), turns it into GPIO which then breaks input for the UART
> >> device. This also breaks systems with bluetooth connected to UART (those
> >> typically have some GPIOs in their _CRS).
> >>
> >> Any ideas how to fix this?
> >>
> >> We cannot just drop the _CRS index lookup fallback because that would
> >> break many existing machines out there so maybe we can limit this to
> >> only DT enabled machines. Or alternatively probe if the property first
> >> exists before trying to acquire the GPIOs (using
> >> device_property_present()).
> >> "
> >>
> >> This patch implements the fix suggested by Mika in his statement above.
> >>
> >> Signed-off-by: Stefan Roese <sr@denx.de>

> >> --- a/drivers/tty/serial/serial_mctrl_gpio.c
> >> +++ b/drivers/tty/serial/serial_mctrl_gpio.c

> >> @@ -116,6 +117,19 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
> >>
> >>          for (i = 0; i < UART_GPIO_MAX; i++) {
> >>                  enum gpiod_flags flags;
> >> +               char *gpio_str;
> >> +               bool present;
> >> +
> >> +               /* Check if GPIO property exists and continue if not */
> >> +               gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
> >> +                                    mctrl_gpios_desc[i].name);
> >
> > This will silently break DTBs using "(cts|dsr|dcd|rng|rts|dtr)-gpio" instead
> > of "(cts|dsr|dcd|rng|rts|dtr)-gpios".
>
> Should both options be supported ("cts-gpio" vs "cts-gpios")?
> Documentation/devicetree/bindings/serial/serial.txt only mentions
> the "-gpios" variant.

Well, the "-gpio" variant is deprecated, but still supported by
devm_gpiod_get_index_optional(), and there are active users in upstream
DTS files.

My main objection is (trying to) replicate the matching logic inside
gpiolib.c, causing subtle semantic differences. And keeping it consistent,
of course.

It would be nice if this could be fixed inside acpi_find_gpio(), so
users don't need to be updated.  There may be other subsystems where
the difference between DT and ACPI may cause issues, unbeknownst.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
