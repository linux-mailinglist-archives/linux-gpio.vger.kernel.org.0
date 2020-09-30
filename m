Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9B127E584
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgI3JrV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:47:21 -0400
Received: from muru.com ([72.249.23.125]:45762 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728999AbgI3JrU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 05:47:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7435E810D;
        Wed, 30 Sep 2020 09:47:20 +0000 (UTC)
Date:   Wed, 30 Sep 2020 12:47:14 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Trent Piepho <tpiepho@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
Message-ID: <20200930094714.GR9471@atomide.com>
References: <20200924054324.GB9471@atomide.com>
 <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com>
 <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com>
 <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
 <20200930051521.GN9471@atomide.com>
 <CA+7tXig=3hbFXfmYMC5Hd1Zc2n-6uGXbMePPw_Cr4bOsyt7QQA@mail.gmail.com>
 <20200930091526.GQ9471@atomide.com>
 <CA+7tXihYb6AHrQLpO9UDHV7YFbzo_Pm8EdXNJXX+tJXX-L6UYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7tXihYb6AHrQLpO9UDHV7YFbzo_Pm8EdXNJXX+tJXX-L6UYA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Trent Piepho <tpiepho@gmail.com> [200930 09:34]:
> On Wed, Sep 30, 2020 at 2:15 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Trent Piepho <tpiepho@gmail.com> [200930 08:35]:
> > > The closest thing would be the generic pin config type bindings, which
> > > go in the pinctrl driver's nodes, and look like this:
> > > &am335x_pinmux {
> > >     pinctrl_yoyo_reset: yoyogrp {
> > >         pins = "foo";
> > >         function = "gpio";
> > >         bias-pull-up;
> > >     };
> > > };
> >
> > There's a bit of a dtb size and boot time issue for adding properties
> > for each pin where that needs to be done for several hundred pins :)
> 
> pins is list, multiple pins can be specified at once.  Otherwise the
> property name would be "pin" and not "pins"  There's also a groups
> property to refer to multiple pins at once, e.g.
> 
> arch/mips/boot/dts/ingenic/ci20.dts-    pins_mmc1: mmc1 {
> arch/mips/boot/dts/ingenic/ci20.dts-            function = "mmc1";
> arch/mips/boot/dts/ingenic/ci20.dts:            groups =
> "mmc1-1bit-d", "mmc1-4bit-d";
> arch/mips/boot/dts/ingenic/ci20.dts-            bias-disable;
> arch/mips/boot/dts/ingenic/ci20.dts-    };
> 
> arch/mips/boot/dts/pic32/pic32mzda_sk.dts-      user_leds_s0: user_leds_s0 {
> arch/mips/boot/dts/pic32/pic32mzda_sk.dts:              pins = "H0", "H1", "H2";
> arch/mips/boot/dts/pic32/pic32mzda_sk.dts-              output-low;
> arch/mips/boot/dts/pic32/pic32mzda_sk.dts-              microchip,digital;
> arch/mips/boot/dts/pic32/pic32mzda_sk.dts-      };

Right.

> > > Is "some additional property for specifying generic conf flags"
> > > different from the existing pinctrl-single,bias-pullup, etc.
> > > properties?  Because splitting the data cell into two parts doesn't
> > > make any difference to those.
> >
> > So with an interrupt style binding with generic pinconf flags we can
> > leave out the parsing of multiple properties for each pin. Sure the
> > pin is only referenced by the controller like you pointed out but the
> > pinconf flags could be generic.
> 
> Where do these flags go?  In pinctrl-single,pins?  Like:
> 
> pinctrl-single,pins = <AM335X_PIN_MDC MUX_MODE7 PIN_INPUT_PULLUP>;
> 
> But PIN_INPUT_PULLUP is a generic flag?  Which is translated into the
> proper value by??

Yes that's what I was thinking, something like this with generic flags:

pinctrl-single,pins = <AM335X_PIN_MDC (PIN_INPUT | PIN_PULLUP) MUX_MODE7>;

> Or are you talking about replacing the existing pinctrl-0,
> pinctrl-names properties with a totally different system that looks
> more like gpio and interrupt handles?

That would be even better :) Might be just too much to deal with..

In any case the parser code could already be generic if we had generic
flags based on #pinctrl-cells.

Regards,

Tony
