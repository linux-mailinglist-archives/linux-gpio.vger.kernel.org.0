Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C77027E000
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 07:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgI3FP1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 01:15:27 -0400
Received: from muru.com ([72.249.23.125]:45674 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgI3FP1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 01:15:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D6B1580BF;
        Wed, 30 Sep 2020 05:15:27 +0000 (UTC)
Date:   Wed, 30 Sep 2020 08:15:21 +0300
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
Message-ID: <20200930051521.GN9471@atomide.com>
References: <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1>
 <20200923065755.GR7101@atomide.com>
 <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
 <20200924054324.GB9471@atomide.com>
 <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com>
 <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
 <20200924070443.GF9471@atomide.com>
 <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7tXihBdw9AOGL7Hp2cH9+ii8fUXaaZZDUP3icyeOkMuGm4qA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Trent Piepho <tpiepho@gmail.com> [200929 20:16]:
> On Thu, Sep 24, 2020 at 12:04 AM Tony Lindgren <tony@atomide.com> wrote:
> > Certainly different compatible strings can be used as needed.
> > But pinctrl-single is not going to be am335x specific though :)
> > We have quite a few SoCs using it:
> 
> So what doesn't make sense to me, is to put something am335x specific
> like two cells for conf and mux, into a generic driver like pinctrl
> single.

Treating conf and mux separately is not am335x specific. Linux treats
them separately because the conf options typically can be described
in a generic way while the mux is just signal routing.

Sure the conf values are currently not generic, but that could be
done if wanted to and added some property to specify that the
controller uses generic conf values.

> This series adds two cells ORed into one.  Ok, that's generic, other
> platforms could use it.  But it also accomplishes nothing, so what's
> the point?  You've hinted there is more to come, which will accomplish
> something, but what is it?  That can be:
> Used by platforms other than am335x
> Can't already be done with the pinctrl single pinconf features
> Needs more than one data cell per pin

For SoCs using #pinctrl-cells = <2> we now have conf and mux values
separated in the dtb. Certainly that's a better place to be compared
to earlier for any further pinconf changes.

> Interrupt controllers have different numbers of cells, but they are
> all platform specific, and the cells have defined platform specific
> meanings.  pci-host-cam-generic is a somewhat generic interrupt
> controller and it uses 1 cell, since it lacks device specific fields
> to put into additional cells.

With interrupts the IRQ_TYPE flags are generic and separate from the
hardware specific cells. If we wanted to, we could have something
similar for pinctrl framework.

> Consider also that any future changes to the pinctrl-single bindings
> would need to be backward compatible with a device tree binary where
> two cells get combined.  So if the bindings being added here aren't
> done, then adding them now creates an unnecessary additional version
> to deal with for backward compatibility.

I don't see issues with backward compabilty. If we specify that the
controller uses #pinctrl-cells = <2>, and some additional property
for specifying generic conf flags, we'd have a similar generic binding
to the interrupt binding.

Regards,

Tony
