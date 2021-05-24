Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A7838EE64
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 17:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbhEXPui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 11:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234332AbhEXPtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 11:49:01 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F1EC0611E9
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 08:03:05 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 01655202FCC;
        Mon, 24 May 2021 17:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621868583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8MATKxCuMn4nkMdLEuLNhFbcf7uVicrwkqafbfBr9eg=;
        b=1h53zmIIMaFpLm4CSRKhMGwEBDMHczUNgRi0S+mgn2cg4jIRuqHA9E11lLejd8xVPw3y0r
        BdsHMs+YEKMrTqNfFIzLlo79yq+1hPDmgCFABw9f3MbWd/dVY4tnDPRzeemS9QlUStFCM7
        rywfeCIxAKl67kegIngCVN9nsd7oJWwuTzjMyet9NAKK9takN6OR/pq/XT+rIYyccekHDI
        auY7viemnNLEK2mM3KLw9r53Pn5BPe5Bh/31yAAx4wOkNYsIkMjv14OPMh1+YBzZcBZCM2
        oFqoaW+PtFNM5/52cp7sGAybshVAGUa8QZIWEdYUe870KAjmF2TqBZoT3Q8jkQ==
Message-ID: <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Date:   Mon, 24 May 2021 17:03:01 +0200
In-Reply-To: <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
         <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
         <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
         <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 2:41 PM Sander Vanheule <sander@svanheule.net> wrote:
> > On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
> > > On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:
> 
> ...
> 
> > > > > Changes since v2:
> > > > >   - MDIO regmap support was merged, so patch is dropped here
> > > > 
> > > > Do you have any idea how this will get merged. It sounds like one of
> > > > the Maintainers will need a stable branch of regmap.
> > > 
> > > This is not a problem if Mark provides an immutable branch to pull from.
> > 
> > Mark has a tag (regmap-mdio) for this patch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio
> 
> Also works but you have to provide this information in the cover letter.
> 

Ok, I will add the link to the cover letter for the next version. Does it need
to be in a Link-tag, or can just be a reference?


> ...
> 
> > > > >   - Introduce GPIO regmap quirks to set output direction first
> > > > 
> > > > I thought you had determined it was possible to set output before
> > > > direction?
> > > 
> > > Same thoughts when I saw an updated version of that patch. My
> > > anticipation was to not see it at all.
> > 
> > The two devices I've been trying to test the behaviour on are:
> >  * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a pin
> >    configured as (active-low) GPIO. The LEDs are easy for a quick visual
> > check.
> >  * Zyxel GS1900-8: RTL8231 used for the front panel button, and an active-
> > low
> >    GPIO used to hard reset the main SoC (an RTL8380). I've modified this
> > board
> >    to change some of the strapping pin values, but testing with the jumpers
> > and
> >    pull-up/down resistors is a bit more tedious.
> > 
> > On the Netgear, I tested the following with and without the quirk:
> > 
> >    # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
> >    gpioset 1 32=0; gpioset 1 32=0
> >    # Get value to change to input, turns the LED off (high impedance)
> >    # Will return 1 due to (weak) internal pull-up
> >    gpioget 1 32
> >    # Set as OUT-HIGH, should result in LED off
> >    # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW value)
> >    # When the quirk is enabled, the LED remains off (i.e. correct OUT-HIGH
> > value)
> >    gpioset 1 32=1
> > 
> > Now, what's confusing (to me) is that the inverse doesn't depend on the
> > quirk:
> > 
> >    # Set as OUT-HIGH twice
> >    gpioset 1 32=1; gpioset 1 32=1
> >    # Change to high-Z
> >    gpioget 1 32
> >    # Set to OUT-LOW, always results in LED on, with or without quirk
> >    gpioset 1 32=0
> > 
> > Any idea why this would be (or appear) broken on the former case, but not on
> > the
> > latter?
> 
> GPIO tools for the shell are context-less. Can you reproduce this with
> the legacy sysfs interface?
> 
> > I was trying to reproduce this behaviour on the Zyxel, but using the
> > strapping
> > pins that are also used to configure the device's address. So perhaps the
> > pull-
> > ups/-downs were confusing the results. Using a separate pin on the Zyxel's
> > RTL8231, I've now been able to confirm the same behaviour as on the Netgear,
> > including capturing the resulting glitch (with my simple logic analyser)
> > when
> > enabling the quirk in the first test case.
> > 
> > I hope this explains why I've still included the quirk in this revision. If
> > not,
> > please let me know what isn't clear.
> 
> Do you possess a schematic of either of the devices and a link to the
> RTL datasheet (Btw, if it's publicly available, or you have a link
> that will ask for necessary sign-in it would be nice to include the
> link to it as a Datasheet: tag)?

Sadly, I don't. Most of the info we have comes from code archives of switch
vendors (Zyxel, Cisco etc). Boards need to be reverse engineered, and the few
leaked datasheets that can be found on the internet aren't exactly thick in
information.

The RTL8231 datasheet is actually quite useful, but makes no mention of the
output value isse. Since this isn't an official resource, I don't think it would
be appropriate to link it via a Datasheet: tag.
https://github.com/libc0607/Realtek_switch_hacking/blob/files/RTL8231_Datasheet_
1.2.pdf

Looking at the datasheet again, I came up with a... terrible hack to work around
the output value issue.

The chip also has GPIO_INVERT registers that I hadn't used until now, because
the logical inversion is handled in the kernel. However, these inversion
registers only apply to the output values. So, I could implement glitch-free
output behaviour in the following way:
 * After chip reset, and before enabling the output driver (MFD initialisation):
    - Mux all pins as GPIO
    - Change all pins to outputs, so the data registers (0x1c-0x1e) become writable
    - Write value 0 to all pins
    - Change all pins to GPI to change them into high-Z
 * In the pinctrl/gpio driver:
    - Use data registers as input-only
    - Use inversion register to determine output value (can be written any time)

The above gives glitch-free outputs, but the values that are read back (when
configured as output), come from the data registers. They should now be coming
from the inversion (reg_set_base) registers, but the code prefers to use the
data registers (reg_dat_base).


Best,
Sander

