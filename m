Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D143921BA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 23:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbhEZVES (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 17:04:18 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:36802 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233717AbhEZVER (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 17:04:17 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:608b:3ab3:a907:c9a7] (unknown [IPv6:2a02:a03f:eafb:ee01:608b:3ab3:a907:c9a7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id D3479204254;
        Wed, 26 May 2021 23:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622062964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uOTg4YEJb6HOQk7WXdWXZ4uS3WO6WiebttDA/kSK6CA=;
        b=QiK5sWIjaeFZy09t2fpzzQHRxWcuyhRkFtlvVQKiAfcCufS6cdTCXR0ry0DM3ER04qC63v
        BXZIHM73vqSX+55uKHoN3wJLoswmvioTC/8xyU3iSb1YXrDUWGAdmPwyUDLYSySweQ/GgV
        pFjPpFKp/R9Cc+lp1ADte9EtD5zvbC+/PFA3uCaPss/FJe9xYbCj9h+5ixbRAlQfFM9o8Z
        zJtNTuoL5cSuJ4uG76NsfyFAybNVB6C1Bqc/bxw8hWneFiXrWlVnw+dMjIgApMdJAWooPJ
        +bf5LKbCeUaZ7JNRXczFqqsyLE4SwCGHRoJk1VjHc8GLuKeRHSHVWTx+dCEF9A==
Message-ID: <cbfba24a6206ec73ccc844da5d1331959e3f3520.camel@svanheule.net>
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
Date:   Wed, 26 May 2021 23:02:40 +0200
In-Reply-To: <CAHp75VfCBtcQX4rvmQnRMquM0k7ZBqOgZN15Z7TFNSO60SB9TA@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
         <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
         <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
         <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
         <8f96b24d782e5bdeabf5370ccf3475794d0c2818.camel@svanheule.net>
         <CAHp75VfzEwVGR7ttdcKzirPDN8oUFw1uTDXPFE=P=9+S3CAFYQ@mail.gmail.com>
         <CAHp75VfCBtcQX4rvmQnRMquM0k7ZBqOgZN15Z7TFNSO60SB9TA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2021-05-25 at 20:11 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 7:30 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, May 24, 2021 at 6:03 PM Sander Vanheule <sander@svanheule.net>
> > wrote:
> > > On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > Sadly, I don't. Most of the info we have comes from code archives of
> > > switch
> > > vendors (Zyxel, Cisco etc). Boards need to be reverse engineered, and the
> > > few
> > > leaked datasheets that can be found on the internet aren't exactly thick
> > > in
> > > information.
> > > 
> > > The RTL8231 datasheet is actually quite useful, but makes no mention of
> > > the
> > > output value isse. Since this isn't an official resource, I don't think it
> > > would
> > > be appropriate to link it via a Datasheet: tag.
> > > https://github.com/libc0607/Realtek_switch_hacking/blob/files/RTL8231_Datasheet_
> > > 1.2.pdf
> > > 
> > > Looking at the datasheet again, I came up with a... terrible hack to work
> > > around
> > > the output value issue.
> > > 
> > > The chip also has GPIO_INVERT registers that I hadn't used until now,
> > > because
> > > the logical inversion is handled in the kernel. However, these inversion
> > > registers only apply to the output values. So, I could implement glitch-
> > > free
> > > output behaviour in the following way:
> > >  * After chip reset, and before enabling the output driver (MFD
> > > initialisation):
> > >     - Mux all pins as GPIO
> > >     - Change all pins to outputs,
> > 
> > No. no, no. This is much worse than the glitches. You never know what
> > the hardware is connected there and it's potential breakage (on hw
> > level) possible.
> > 
> > >  so the data registers (0x1c-0x1e) become writable
> > >     - Write value 0 to all pins
> > >     - Change all pins to GPI to change them into high-Z
> > >  * In the pinctrl/gpio driver:
> > >     - Use data registers as input-only
> > >     - Use inversion register to determine output value (can be written any
> > > time)
> > > 
> > > The above gives glitch-free outputs, but the values that are read back
> > > (when
> > > configured as output), come from the data registers. They should now be
> > > coming
> > > from the inversion (reg_set_base) registers, but the code prefers to use
> > > the
> > > data registers (reg_dat_base).
> > 
> > Lemme read the datasheet and see if I find any clue for the hw behaviour.
> 
> Thank you for your patience!
> 
> Have you explored the possibility of using En_Sync_GPIO?

Got around to testing things.

If En_Sync_GPIO is enabled, it's still possible to change the pin direction
without also writing the Sync_GPIO bit. So even with the latching, glitches are
still produced.

As long as Sync_GPIO is not set to latch the new values, it also appears that
reads of the data registers result in the current output value, not the new one.

As a different test, I've added a pull-down, to make the input level low. Now I
see the opposite behaviour as before (with set-value-before-direction):
 * OUT-HIGH > IN (low) > OUT-LOW: results in a high level (i.e. old value)
 * OUT-HIGH > IN (low) > OUT-HIGH: results in a high level (new/old value)
 * OUT-LOW > IN (low) > OUT-HIGH: results in a high level (new value, or toggled
   old value?)
 * OUT-LOW > IN (low) > OUT-LOW: results in a low level (new/old value)

For reference, with a pull-up:
 * OUT-HIGH > IN (high) > OUT-HIGH: high result
 * OUT-HIGH > IN (high) > OUT-LOW: low result
 * OUT-LOW > IN (high) > OUT-HIGH: low result
 * OUT-LOW > IN (high) > OUT-LOW: low result

I've only tested this with the sysfs interface, so I don't know what the result
would be on multiple writes to the data register (during input, but probably not
very relevant). Nor have I tested direction changes if the input has changed
between two output values.

I may have some time tomorrow for more testing, but otherwise it'll have to wait
until the weekend. Any other ideas in the meantime?


Best,
Sander

