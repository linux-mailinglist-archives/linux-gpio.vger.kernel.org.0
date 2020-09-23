Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62D62751FA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 08:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIWG5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 02:57:02 -0400
Received: from muru.com ([72.249.23.125]:45148 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgIWG5B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 02:57:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A008580A0;
        Wed, 23 Sep 2020 06:57:01 +0000 (UTC)
Date:   Wed, 23 Sep 2020 09:57:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Trent Piepho <tpiepho@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
Message-ID: <20200923065755.GR7101@atomide.com>
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1>
 <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917103942.GA2477958@x1>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200917 10:39]:
> On Thu, Sep 17, 2020 at 03:00:36AM -0700, Trent Piepho wrote:
> > On Thu, Sep 17, 2020 at 2:20 AM Drew Fustini <drew@beagleboard.org> wrote:
> > >
> > > On Thu, Sep 17, 2020 at 02:03:46AM -0700, Trent Piepho wrote:
> > > > On Mon, Sep 14, 2020 at 3:44 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > > >
> > > > > +
> > > > > +When #pinctrl-cells = 2, then setting a pin for a device could be done with:
> > > > > +
> > > > > +       pinctrl-single,pins = <0xdc 0x30 0x07>;
> > > > > +
> > > > > +Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
> > > > > +See the device example and static board pins example below for more information.
> > > >
> > > > Pin configuration and mux mode don't mean anything in pinctrl-single.
> > > > On another machine, mux mode might not be programmed this way or even
> > > > exist.  Or the location of bits would probably be different, and this
> > > > would seem to imply the 0x07 would get shifted to the correct location
> > > > for where the pin mux setting was on that machine's pinctrl registers.
> > > >
> > > > It seems like it would be better to explain the values are ORed together.
> > >
> > > I descirbed it as seoerate values as I did not want to prescribe what
> > > the pcs driver would do with those values.  But, yes, it is a just an OR
> > > operation, so I could change the language to reflect tat.
> > 
> > If you don't say what the pinctrl-single driver does with the values,
> > how would anyone know how to use it?
> > 
> > > > What is the purpose of this change anyway?  It seems like in the end
> > > > it just does what it did before.  The data is now split into two cells
> > > > in the device tree, but why?
> > >
> > > These changes were a result of desire to seperate pinconf and pinmux.
> > > Tony raised the idea in a thread at the end of May [1].
> > >
> > > Tony wrote:
> > > > Only slightly related, but we should really eventually move omaps to use
> > > > #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> > > > from the mux mode. We already treat them separately with the new
> > > > AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> > > > use updated #pinctrl-cells. But I think pinctrl-single might need some
> > > > changes before we can do that.
> > 
> > I still don't see what the goal is here.  Support generic pinconf?
> 
> My interest is came out of my desire to turn on generic pinconf for AM3358
> and I had to fix a bug that was breaking compatible "pinconf,single":
> f46fe79ff1b6 ("pinctrl-single: fix pcs_parse_pinconf() return value")
> 
> > Also note that while AM33XX_PADCONF() is changed, there is an in tree
> > board that doesn't use it, so it's broken now.  I found this change
> > when it broke my out of tree board, due to the dtsi change not being
> > reflected in my board's pinctrl values.
> 
> Thanks, that is a good point that arch/arm/boot/dts/am335x-guardian.dts
> needs to be converted from AM33XX_IOPAD to AM33XX_PADCONF.  I'll submit
> a patch for that.
> 
> Regarding AM33XX_PADCONF() restructuring, the change to have seperate
> arguments for direction and mux in AM33XX_PADCONF() predates my
> invovlement, so I've CC'd Christina Quast.
> 
>     commit f1ff9be7652b716c7eea67c9ca795027d911f148
>     Author: Christina Quast <cquast@hanoverdisplays.com>
>     Date:   Mon Apr 8 10:01:51 2019 -0700
> 
>     ARM: dts: am33xx: Added AM33XX_PADCONF macro
>     
>     AM33XX_PADCONF takes three instead of two parameters, to make
>     future changes to #pinctrl-cells easier.
>     
>     For old boards which are not mainlined, we left the AM33XX_IOPAD
>     macro.
>     
>     Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
>     Reviewed-by: Rob Herring <robh@kernel.org>
>     Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Hopefully, Tony can also chime in.

Also FYI, folks have also complained for a long time that the pinctrl-single
binding mixes mux and conf values while they should be handled separately.

Regards,

Tony
