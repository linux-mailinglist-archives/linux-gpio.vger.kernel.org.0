Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D2F38E6FB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 14:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhEXM4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 08:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbhEXM4X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 08:56:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CD0C061574;
        Mon, 24 May 2021 05:54:54 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so11091976pjb.2;
        Mon, 24 May 2021 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lL4mdK3OlVo5HtMpo/i3Kg+WlLytBJ9Ge9Zv4SxQ7gU=;
        b=pGzM1IG9n01ZBmiUZlf9M9pq0HgR7inLpdsP1O6LCFKm/yy1B51ksOICc0+JwsQEBO
         l8XnLPjK8XRcH5FpMghH4Fpsx2uTzljsuyi+qmnzoB5aQkzQaEf/POib4QJOACpkiXUq
         xorxU/NVTqGsUGwmq/zES+XiIpQRWbaof/LyukPfzpbhExCZHQK/zgvYKdrg39pOuUZB
         /+nXstxymUoQjhmiAdqKy+clSlVcPomamiWtmVqQVMQc/G4iFXrc/8JDNsKQryqLoIdp
         WYs+zqYpU95pjBC8WVjrXkA36NBjfSka6KzK/u27UeFpkYTpEzQ1jqxiZCSL5Rl0gdpW
         LaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lL4mdK3OlVo5HtMpo/i3Kg+WlLytBJ9Ge9Zv4SxQ7gU=;
        b=EM+6NYuJtEwcpZ5RIfhe9fzYsmNUNo8G02psvaHdjdYUrTczDIuOYlFOP/lqhjo2Mo
         IFdfuXCoIIPYs4WYCh8BfEn+WbFTyyI991SAqVdV4UnXzLJ2hOWIfjfQkp+kPI4EgFbG
         1Uz4wYs7JG3+5dpanHp2ABpDSzDK3VZiXNAB5sZ4OVEemBtD7cDRCpgrB/tUNVmXlqo0
         NZP3wkX4Fer51bD9WVbM1cL0V680MVj3GDdl1dZYLwEMhI8TOaNwAZ4CXFtANOOqDBHE
         tV2JSYTcnImGeb+K2MMSQTgJIE2gDJDxY5//YCrFPDhwpL13ED3k42v/xwapWqRpk6V6
         4Tag==
X-Gm-Message-State: AOAM5310uZDhmGT8JXQIdqVA4k9E5++50/KRjH7+fvJiFlyME4xLMzJX
        PYplDy2uEAtbecoWHUEGlw5NuY61GnTPb6h+1Uc=
X-Google-Smtp-Source: ABdhPJw+E3SSq/owwQFmphF7BgBwbkNmSsHWajF0qirgf9BcugvUZVhl7rsgwOsXxlWpzrkkfpBrtwDY1AxQ7XUkM7E=
X-Received: by 2002:a17:902:bf48:b029:fa:9401:cda8 with SMTP id
 u8-20020a170902bf48b02900fa9401cda8mr3853689pls.0.1621860893478; Mon, 24 May
 2021 05:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
In-Reply-To: <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 15:54:37 +0300
Message-ID: <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
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

On Mon, May 24, 2021 at 2:41 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
> > On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:

...

> > > > Changes since v2:
> > > >   - MDIO regmap support was merged, so patch is dropped here
> > >
> > > Do you have any idea how this will get merged. It sounds like one of
> > > the Maintainers will need a stable branch of regmap.
> >
> > This is not a problem if Mark provides an immutable branch to pull from.
>
> Mark has a tag (regmap-mdio) for this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio

Also works but you have to provide this information in the cover letter.

...

> > > >   - Introduce GPIO regmap quirks to set output direction first
> > >
> > > I thought you had determined it was possible to set output before
> > > direction?
> >
> > Same thoughts when I saw an updated version of that patch. My
> > anticipation was to not see it at all.
>
> The two devices I've been trying to test the behaviour on are:
>  * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a pin
>    configured as (active-low) GPIO. The LEDs are easy for a quick visual check.
>  * Zyxel GS1900-8: RTL8231 used for the front panel button, and an active-low
>    GPIO used to hard reset the main SoC (an RTL8380). I've modified this board
>    to change some of the strapping pin values, but testing with the jumpers and
>    pull-up/down resistors is a bit more tedious.
>
> On the Netgear, I tested the following with and without the quirk:
>
>    # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
>    gpioset 1 32=0; gpioset 1 32=0
>    # Get value to change to input, turns the LED off (high impedance)
>    # Will return 1 due to (weak) internal pull-up
>    gpioget 1 32
>    # Set as OUT-HIGH, should result in LED off
>    # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW value)
>    # When the quirk is enabled, the LED remains off (i.e. correct OUT-HIGH value)
>    gpioset 1 32=1
>
> Now, what's confusing (to me) is that the inverse doesn't depend on the quirk:
>
>    # Set as OUT-HIGH twice
>    gpioset 1 32=1; gpioset 1 32=1
>    # Change to high-Z
>    gpioget 1 32
>    # Set to OUT-LOW, always results in LED on, with or without quirk
>    gpioset 1 32=0
>
> Any idea why this would be (or appear) broken on the former case, but not on the
> latter?

GPIO tools for the shell are context-less. Can you reproduce this with
the legacy sysfs interface?

> I was trying to reproduce this behaviour on the Zyxel, but using the strapping
> pins that are also used to configure the device's address. So perhaps the pull-
> ups/-downs were confusing the results. Using a separate pin on the Zyxel's
> RTL8231, I've now been able to confirm the same behaviour as on the Netgear,
> including capturing the resulting glitch (with my simple logic analyser) when
> enabling the quirk in the first test case.
>
> I hope this explains why I've still included the quirk in this revision. If not,
> please let me know what isn't clear.

Do you possess a schematic of either of the devices and a link to the
RTL datasheet (Btw, if it's publicly available, or you have a link
that will ask for necessary sign-in it would be nice to include the
link to it as a Datasheet: tag)?

-- 
With Best Regards,
Andy Shevchenko
