Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC91392BFA
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 12:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbhE0Kkc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 06:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbhE0Kkb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 06:40:31 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154FCC061574;
        Thu, 27 May 2021 03:38:58 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso2286555wmm.3;
        Thu, 27 May 2021 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOG/dQolVie+X4rF35mKiaI4LXthsjMOE2VWxF6s74k=;
        b=AsXF0PSG72s/GKmhHU0djBLDMN1xwfmlwj5+X4xQZAXpXcN8/ap9hRBNLzVKelvxxz
         zy/h+X7s11gjgFxzQe83jJBV0mvALA0lgSe75wt952jr/moxoBzo4PUR+YJw/OkQkAK/
         5NVei8i4iLFibuy2Xwym9dg+BsY2/JCPEX326R79i34xzJX5lo4uUZnAiu4GoN7lYTTi
         9+uyQdY++31YymZpLyp8rQHRB3mIUwFRCHTGMVezSiRSpTw8DmGGagKmooX8p/45wpfp
         fgLJoBVJRFXUdnbkCcOX+PoMfCtoqthwlNvySM4zHRwWzfOSV+IKh44gRpUheENEvkuA
         rmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOG/dQolVie+X4rF35mKiaI4LXthsjMOE2VWxF6s74k=;
        b=ESJzli+zitV7sPUDUc89fd9Zy11CXfS/66mTjlOA+4deHRexHOoaCCurx0E8YEO5D8
         b4ScPoJoWXgKXexEteYAoxPOnUddfSip7kscx03MbLUUOO551axqwwECMysiwJyNDwLH
         HxHwQk1C6iG5eSm4DBNmcTD1AwrZbTBDmsj0YkfMbMGzJhgO+310x02pwTw0IZ3o0MSV
         6jzFjA+cicvtmS5S0J4cmXGcSR9lYt9ViTjqwl0RGMWbaBGU4NTSNCIsLvNbiSH9pXXl
         eSfC5aoVzVATtC+kFn6H1tTvCqQ7jqWcxVFLs0dt/l34oBoiaViYakNNuiKDfCm8gOpy
         kEIA==
X-Gm-Message-State: AOAM531jQFt/OdAgftUr1wASEpsn6Bt/AFSRU42Eveb/aUJ/BFlo1Zup
        O+xLyrDUVSsO5hEi/Abo9inzTo7UvPm018aSyJc=
X-Google-Smtp-Source: ABdhPJzAy0QzKZEN6e8Q6dSEkMVuFTWjlcHeYaAguQVTvXqSUF8Sqh28zHF022wFIxWq5JGg8UOCJDppit0N5/WFtDU=
X-Received: by 2002:a05:600c:2219:: with SMTP id z25mr2777435wml.78.1622111936301;
 Thu, 27 May 2021 03:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
 <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net>
 <CAHp75VfzEwVGR7ttdcKzirPDN8oUFw1uTDXPFE=P=9+S3CAFYQ@mail.gmail.com>
 <CAHp75VfCBtcQX4rvmQnRMquM0k7ZBqOgZN15Z7TFNSO60SB9TA@mail.gmail.com> <cbfba24a6206ec73ccc844da5d1331959e3f3520.camel@svanheule.net>
In-Reply-To: <cbfba24a6206ec73ccc844da5d1331959e3f3520.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 May 2021 13:38:15 +0300
Message-ID: <CAHp75VdhAqFG1WpyMqpvL_W6mFchNd9AyRSV2Zgc1Vk5M6LnCg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Sander Vanheule <sander@svanheule.net>,
        Hans de Goede <hdegoede@redhat.com>
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

+Cc: Hans

Hans, sorry for disturbing you later too much. Here we have "nice"
hardware which can't be used in a glitch-free mode (somehow it reminds
me lynxpoint, baytrail, cherryview designs). If you have any ideas to
share (no need to dive deep or look at it if you have no time), you're
welcome.

On Thu, May 27, 2021 at 12:02 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> On Tue, 2021-05-25 at 20:11 +0300, Andy Shevchenko wrote:
> > On Mon, May 24, 2021 at 7:30 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, May 24, 2021 at 6:03 PM Sander Vanheule <sander@svanheule.net>
> > > wrote:
> > > > On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > Sadly, I don't. Most of the info we have comes from code archives of
> > > > switch
> > > > vendors (Zyxel, Cisco etc). Boards need to be reverse engineered, and the
> > > > few
> > > > leaked datasheets that can be found on the internet aren't exactly thick
> > > > in
> > > > information.
> > > >
> > > > The RTL8231 datasheet is actually quite useful, but makes no mention of
> > > > the
> > > > output value isse. Since this isn't an official resource, I don't think it
> > > > would
> > > > be appropriate to link it via a Datasheet: tag.
> > > > https://github.com/libc0607/Realtek_switch_hacking/blob/files/RTL8231_Datasheet_
> > > > 1.2.pdf
> > > >
> > > > Looking at the datasheet again, I came up with a... terrible hack to work
> > > > around
> > > > the output value issue.
> > > >
> > > > The chip also has GPIO_INVERT registers that I hadn't used until now,
> > > > because
> > > > the logical inversion is handled in the kernel. However, these inversion
> > > > registers only apply to the output values. So, I could implement glitch-
> > > > free
> > > > output behaviour in the following way:
> > > >  * After chip reset, and before enabling the output driver (MFD
> > > > initialisation):
> > > >     - Mux all pins as GPIO
> > > >     - Change all pins to outputs,
> > >
> > > No. no, no. This is much worse than the glitches. You never know what
> > > the hardware is connected there and it's potential breakage (on hw
> > > level) possible.
> > >
> > > >  so the data registers (0x1c-0x1e) become writable
> > > >     - Write value 0 to all pins
> > > >     - Change all pins to GPI to change them into high-Z
> > > >  * In the pinctrl/gpio driver:
> > > >     - Use data registers as input-only
> > > >     - Use inversion register to determine output value (can be written any
> > > > time)
> > > >
> > > > The above gives glitch-free outputs, but the values that are read back
> > > > (when
> > > > configured as output), come from the data registers. They should now be
> > > > coming
> > > > from the inversion (reg_set_base) registers, but the code prefers to use
> > > > the
> > > > data registers (reg_dat_base).
> > >
> > > Lemme read the datasheet and see if I find any clue for the hw behaviour.
> >
> > Thank you for your patience!
> >
> > Have you explored the possibility of using En_Sync_GPIO?
>
> Got around to testing things.
>
> If En_Sync_GPIO is enabled, it's still possible to change the pin direction
> without also writing the Sync_GPIO bit. So even with the latching, glitches are
> still produced.
>
> As long as Sync_GPIO is not set to latch the new values, it also appears that
> reads of the data registers result in the current output value, not the new one.
>
> As a different test, I've added a pull-down, to make the input level low. Now I
> see the opposite behaviour as before (with set-value-before-direction):
>  * OUT-HIGH > IN (low) > OUT-LOW: results in a high level (i.e. old value)
>  * OUT-HIGH > IN (low) > OUT-HIGH: results in a high level (new/old value)
>  * OUT-LOW > IN (low) > OUT-HIGH: results in a high level (new value, or toggled
>    old value?)
>  * OUT-LOW > IN (low) > OUT-LOW: results in a low level (new/old value)
>
> For reference, with a pull-up:
>  * OUT-HIGH > IN (high) > OUT-HIGH: high result
>  * OUT-HIGH > IN (high) > OUT-LOW: low result
>  * OUT-LOW > IN (high) > OUT-HIGH: low result
>  * OUT-LOW > IN (high) > OUT-LOW: low result
>
> I've only tested this with the sysfs interface, so I don't know what the result
> would be on multiple writes to the data register (during input, but probably not
> very relevant). Nor have I tested direction changes if the input has changed
> between two output values.
>
> I may have some time tomorrow for more testing, but otherwise it'll have to wait
> until the weekend. Any other ideas in the meantime?

No ideas so far. In x86 we used to have something similar (baytrail,
cherryview, lynxpoint), but it's firmware assisted. I think that this
hardware (realtek) is supposed either
- to be firmware / bootloader assisted, so in a way that platform is
preconfigured when Linux starts and any GPIO request won't be harmful
as long as it doesn't change direction on the pins (which is usually
guaranteed by DT and corresponding drivers to do the correct things)
- be used for glitch-tolerant hardware (LEDs, for example, where
nobody usually will noticed 1ms blink)

That said, I have not been convinced we have to quirk gpio-regmap for
this one. Just describe the issues with hardware in the accompanying
documentation.

But if maintainers or somebody comes with a better / different
approach I am all ears.

-- 
With Best Regards,
Andy Shevchenko
