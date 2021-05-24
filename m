Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461E838F19A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 18:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbhEXQby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 12:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbhEXQbw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 12:31:52 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7ACC061574;
        Mon, 24 May 2021 09:30:22 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id kr9so7066550pjb.5;
        Mon, 24 May 2021 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FOfi++6TnvoaqMGGwhVf9cmmyje1fP8IF2NY5OH3cQk=;
        b=JEegrqbUNTQJJQlDJyY9uhtx/JURfxKbPtlcZehPgGWATTPZrhhfXUawG+47RSbMcF
         xctS0oqpQLnjzm4pwx1K1n5MJqDdJbD3coK6WqapQl8e7/GzxJW1wN8qy/t+p3fG2Ga2
         z0CEaAmAGx9htKy/5GbxDLxibvwn6nvxPneG0DEif/AWf3R7JIGVMH/e+KVX6F2k0Ooj
         aeJdBUbWP3LbEznlfE2q+uwh9ALlkZISsMyMD/qCE3bTeviRUIRvdtB03hADBkvfogTQ
         G0zskAGYA0lB3zFwMEfHLLLZv8l7/LIGkFXOIMs+JSxwfxXWOs6UrmDmI7kjxq2sa0ZM
         LQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOfi++6TnvoaqMGGwhVf9cmmyje1fP8IF2NY5OH3cQk=;
        b=H2ecCaJfGXB1O8C5a4vtKydpBu9eYOIQsfzsQIO2AHjxqcrS3mggR6YKV80KRgzo8i
         MU9MwbMAP1hLKOzRlVMR9olWwouRtpBw/9x5E8ihFs9L7LYFDPG1Jc77lOJXtG8WqX0c
         V6oTcRQPp4MEYbIHcHOg8YqKLKU1uqy8FyX8v/fgBVVMLPt1Y40e4orazjRdGFeQevSc
         wARFX75oddSB9rTcyola/DFWbBfJ+T9T8HY/Gf1rzKOoASGOEZ0vGHks9yMg2ms04Z4N
         qqHPCj1SFe9WFSr49I8aVGA6L42qdmLHhkGeXsxrMxSb34NIKlhqg44zDwyB7v+RA2E1
         IPNQ==
X-Gm-Message-State: AOAM530dB1usONLdbrA+MBqzW4cCmtYLJAwU0nKFL6GRyTvrpHgAk/rg
        FXjIRiSi7LiXLNjoYqd7r4jej17FYkR7FrKt63k=
X-Google-Smtp-Source: ABdhPJyrm7vDPzulj9i9GjYh+nm3lp0w4ezuDqIg9K0sKL96s/AgLynmy3EWpRKFP1H6date2/RpptkeDUNZTwtdvG8=
X-Received: by 2002:a17:902:b18c:b029:f4:67e6:67af with SMTP id
 s12-20020a170902b18cb02900f467e667afmr26270301plr.17.1621873822351; Mon, 24
 May 2021 09:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com> <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net>
In-Reply-To: <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 19:30:06 +0300
Message-ID: <CAHp75VfzEwVGR7ttdcKzirPDN8oUFw1uTDXPFE=P=9+S3CAFYQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 6:03 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:
> > On Mon, May 24, 2021 at 2:41 PM Sander Vanheule <sander@svanheule.net> wrote:
> > > On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
> > > > On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:

...

> Ok, I will add the link to the cover letter for the next version. Does it need
> to be in a Link-tag, or can just be a reference?

Some kind of reference, no need to have a special tag in the cover letter.


...

> > > > > >   - Introduce GPIO regmap quirks to set output direction first
> > > > >
> > > > > I thought you had determined it was possible to set output before
> > > > > direction?
> > > >
> > > > Same thoughts when I saw an updated version of that patch. My
> > > > anticipation was to not see it at all.
> > >
> > > The two devices I've been trying to test the behaviour on are:
> > >  * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a pin
> > >    configured as (active-low) GPIO. The LEDs are easy for a quick visual
> > > check.
> > >  * Zyxel GS1900-8: RTL8231 used for the front panel button, and an active-
> > > low
> > >    GPIO used to hard reset the main SoC (an RTL8380). I've modified this
> > > board
> > >    to change some of the strapping pin values, but testing with the jumpers
> > > and
> > >    pull-up/down resistors is a bit more tedious.
> > >
> > > On the Netgear, I tested the following with and without the quirk:
> > >
> > >    # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
> > >    gpioset 1 32=0; gpioset 1 32=0
> > >    # Get value to change to input, turns the LED off (high impedance)
> > >    # Will return 1 due to (weak) internal pull-up
> > >    gpioget 1 32
> > >    # Set as OUT-HIGH, should result in LED off
> > >    # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW value)
> > >    # When the quirk is enabled, the LED remains off (i.e. correct OUT-HIGH
> > > value)
> > >    gpioset 1 32=1
> > >
> > > Now, what's confusing (to me) is that the inverse doesn't depend on the
> > > quirk:
> > >
> > >    # Set as OUT-HIGH twice
> > >    gpioset 1 32=1; gpioset 1 32=1
> > >    # Change to high-Z
> > >    gpioget 1 32
> > >    # Set to OUT-LOW, always results in LED on, with or without quirk
> > >    gpioset 1 32=0
> > >
> > > Any idea why this would be (or appear) broken on the former case, but not on
> > > the
> > > latter?
> >
> > GPIO tools for the shell are context-less. Can you reproduce this with
> > the legacy sysfs interface?
> >
> > > I was trying to reproduce this behaviour on the Zyxel, but using the
> > > strapping
> > > pins that are also used to configure the device's address. So perhaps the
> > > pull-
> > > ups/-downs were confusing the results. Using a separate pin on the Zyxel's
> > > RTL8231, I've now been able to confirm the same behaviour as on the Netgear,
> > > including capturing the resulting glitch (with my simple logic analyser)
> > > when
> > > enabling the quirk in the first test case.
> > >
> > > I hope this explains why I've still included the quirk in this revision. If
> > > not,
> > > please let me know what isn't clear.
> >
> > Do you possess a schematic of either of the devices and a link to the
> > RTL datasheet (Btw, if it's publicly available, or you have a link
> > that will ask for necessary sign-in it would be nice to include the
> > link to it as a Datasheet: tag)?
>
> Sadly, I don't. Most of the info we have comes from code archives of switch
> vendors (Zyxel, Cisco etc). Boards need to be reverse engineered, and the few
> leaked datasheets that can be found on the internet aren't exactly thick in
> information.
>
> The RTL8231 datasheet is actually quite useful, but makes no mention of the
> output value isse. Since this isn't an official resource, I don't think it would
> be appropriate to link it via a Datasheet: tag.
> https://github.com/libc0607/Realtek_switch_hacking/blob/files/RTL8231_Datasheet_
> 1.2.pdf
>
> Looking at the datasheet again, I came up with a... terrible hack to work around
> the output value issue.
>
> The chip also has GPIO_INVERT registers that I hadn't used until now, because
> the logical inversion is handled in the kernel. However, these inversion
> registers only apply to the output values. So, I could implement glitch-free
> output behaviour in the following way:
>  * After chip reset, and before enabling the output driver (MFD initialisation):
>     - Mux all pins as GPIO
>     - Change all pins to outputs,

No. no, no. This is much worse than the glitches. You never know what
the hardware is connected there and it's potential breakage (on hw
level) possible.

>  so the data registers (0x1c-0x1e) become writable
>     - Write value 0 to all pins
>     - Change all pins to GPI to change them into high-Z
>  * In the pinctrl/gpio driver:
>     - Use data registers as input-only
>     - Use inversion register to determine output value (can be written any time)
>
> The above gives glitch-free outputs, but the values that are read back (when
> configured as output), come from the data registers. They should now be coming
> from the inversion (reg_set_base) registers, but the code prefers to use the
> data registers (reg_dat_base).

Lemme read the datasheet and see if I find any clue for the hw behaviour.

--
With Best Regards,
Andy Shevchenko
