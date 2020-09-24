Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F32276A00
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 09:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgIXHEu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 03:04:50 -0400
Received: from muru.com ([72.249.23.125]:45356 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727001AbgIXHEt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Sep 2020 03:04:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8E4708027;
        Thu, 24 Sep 2020 07:04:49 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:04:43 +0300
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
Message-ID: <20200924070443.GF9471@atomide.com>
References: <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1>
 <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1>
 <20200923065755.GR7101@atomide.com>
 <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
 <20200924054324.GB9471@atomide.com>
 <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
 <20200924060645.GD9471@atomide.com>
 <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7tXijkS8UMFk4t=DuKjZZNnThbRarPQvxwxjg-uJFTKJRsXA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Trent Piepho <tpiepho@gmail.com> [200924 06:31]:
> On Wed, Sep 23, 2020 at 11:06 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Trent Piepho <tpiepho@gmail.com> [200924 05:49]:
> > > On Wed, Sep 23, 2020 at 10:43 PM Tony Lindgren <tony@atomide.com> wrote:
> > > >
> > > > * Trent Piepho <tpiepho@gmail.com> [200924 01:34]:
> > > > > On Tue, Sep 22, 2020 at 11:57 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > > >
> > > > > > Also FYI, folks have also complained for a long time that the pinctrl-single
> > > > > > binding mixes mux and conf values while they should be handled separately.
> > > > > >
> > > > >
> > > > > Instead of combining two fields when the dts is generated they are now
> > > > > combined when the pinctrl-single driver reads the dts.  Other than
> > > > > this detail, the result is the same.  The board dts source is the
> > > > > same.  The value programmed into the pinctrl register is the same.
> > > > > There is no mechanism currently that can alter that value in any way.
> > > > >
> > > > > What does combining them later allow that is not possible now?
> > > >
> > > > It now allows further driver changes to manage conf and mux separately :)
> > >
> > > The pinctrl-single driver?  How will that work with boards that are
> > > not am335x and don't use conf and mux fields in the same manner as
> > > am335x?
> >
> > For those cases we still have #pinctrl-cells = <1>.
> 
> If pincntrl-single is going to be am335x specific, then shouldn't it
> be a different compatible string?

Certainly different compatible strings can be used as needed.
But pinctrl-single is not going to be am335x specific though :)
We have quite a few SoCs using it:

$ git grep pinctrl-single,function-mask arch/*/boot/dts/ | wc -l
41

> Are the driver changes something that can be not be done with the
> pinconf-single properties?  They all include a mask.

Sure but in the long term we're better off with using #pinctrl-cells
along the lines what we have for example for #interrupt-cells and
#gpio-cells.

Regards,

Tony
