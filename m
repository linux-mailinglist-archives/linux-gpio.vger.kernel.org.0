Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE0327F9D6
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 09:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbgJAHAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 03:00:50 -0400
Received: from muru.com ([72.249.23.125]:45806 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAHAu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Oct 2020 03:00:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 314B98057;
        Thu,  1 Oct 2020 07:00:49 +0000 (UTC)
Date:   Thu, 1 Oct 2020 10:00:43 +0300
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
Message-ID: <20201001070043.GS9471@atomide.com>
References: <20200924060645.GD9471@atomide.com>
 <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com>
 <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
 <20200930051521.GN9471@atomide.com>
 <CA+7tXig=3hbFXfmYMC5Hd1Zc2n-6uGXbMePPw_Cr4bOsyt7QQA@mail.gmail.com>
 <20200930091526.GQ9471@atomide.com>
 <CA+7tXihYb6AHrQLpO9UDHV7YFbzo_Pm8EdXNJXX+tJXX-L6UYA@mail.gmail.com>
 <20200930094714.GR9471@atomide.com>
 <CA+7tXijZJnJ-=erFq+XQCrwwV7tv+6PsmO5T8XSR3p1Jb6qjkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+7tXijZJnJ-=erFq+XQCrwwV7tv+6PsmO5T8XSR3p1Jb6qjkg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Trent Piepho <tpiepho@gmail.com> [200930 18:50]:
> On Wed, Sep 30, 2020 at 2:47 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Trent Piepho <tpiepho@gmail.com> [200930 09:34]:
> 
> > >
> > > Where do these flags go?  In pinctrl-single,pins?  Like:
> > >
> > > pinctrl-single,pins = <AM335X_PIN_MDC MUX_MODE7 PIN_INPUT_PULLUP>;
> > >
> > > But PIN_INPUT_PULLUP is a generic flag?  Which is translated into the
> > > proper value by??
> >
> > Yes that's what I was thinking, something like this with generic flags:
> >
> > pinctrl-single,pins = <AM335X_PIN_MDC (PIN_INPUT | PIN_PULLUP) MUX_MODE7>;
> 
> It doesn't seem like these patches help achieve that, since they
> create device tree binaries with a property that has the same name and
> number of cells, but the cells have a different meaning than above,
> and must be handled differently by the driver.  So you either drop
> compatibility or need to forever deal with supporting an interim
> format that is being created by these patches.
> 
> The conf and max are already split in (all but one) of the device tree
> SOURCE files via the macro with multiple fields.  That does seem like
> a good step if you wanted to transition into something like the above.
> But splitting it in the binary too doesn't help.  Is there a way the
> dtb now being created can turn into the above via a driver change?
> Absolutely not.  So what's the point of an interim binary format?  All
> that matters is what the source looks like, and since that doesn't
> change, nothing is accomplished.

We do get the conf and mux data separated though. This fixes the long
term complaint that the pinctrl single binding mixes conf and mux data.
And the driver can take the dtb conf values and convert them into
something generic and use more generic pinctrl functions. So I would
not call it interim binary format, it's something we'll be using in
the long term. I would also like to get to the next step that we've
been discussing, but who knows if we ever get there. Feel free to
get the ball rolling on the new generic binding, we'll be discussing
it for years as has happened with the earlier attempts :)

BTW, for more complicated use cases, we can already quite easily
create hardware specific drivers with the use of GENERIC_PINCTRL_GROUPS
and GENERIC_PINMUX_FUNCTIONS, see for example the iodelay driver at
drivers/pinctrl/ti/pinctrl-ti-iodelay.c. It uses #pinctrl-cells = 2 and
passes the timing values in two cells.

> I'll also point out that the current generic pinconf, done not via
> flags but with multiple properties for each configurable parameter,
> has a drive strength properties with strength in mA or µA as a
> parameter.  How would you do that with generic bit flags?  I don't
> think you can fit everything in pinconf-generic.h into one 32 bit
> cell.

Good point. The values could be passed by increasing the value for
#pinctrl-cells and then the generic format would need to look like:

pinctrl-single,pins = <AM335X_PIN_MDC (PIN_INPUT | PIN_PULLUP)
                       1234 MUX_MODE7>;

> > > Or are you talking about replacing the existing pinctrl-0,
> > > pinctrl-names properties with a totally different system that looks
> > > more like gpio and interrupt handles?
> >
> > That would be even better :) Might be just too much to deal with..
> >
> > In any case the parser code could already be generic if we had generic
> > flags based on #pinctrl-cells.
> 
> But the pinctrl-single,pins isn't parsed.  It just uses the values as
> they are.  You'd have to write something to parse the cells and add
> more data to the dts that told the parser how to turn them into device
> specific values.  It seems like that could eventually achieve
> basically what is happening already with the dts preprocessor
> converting symbolic constants into device specific values.

Except we'd be setting the conf in a generic way and would avoid
potentially lots of pin specific properties.

Regards,

Tony
