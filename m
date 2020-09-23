Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC1B27519E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 08:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgIWGgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 02:36:32 -0400
Received: from muru.com ([72.249.23.125]:45088 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgIWGgc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 02:36:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0517D80C1;
        Wed, 23 Sep 2020 06:36:32 +0000 (UTC)
Date:   Wed, 23 Sep 2020 09:37:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x: guardian: switch to AM33XX_PADCONF
Message-ID: <20200923063726.GO7101@atomide.com>
References: <20200919195159.3126193-1-drew@beagleboard.org>
 <20200921064707.GN7101@atomide.com>
 <20200921095912.GA3752675@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921095912.GA3752675@x1>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200921 09:59]:
> On Mon, Sep 21, 2020 at 09:47:07AM +0300, Tony Lindgren wrote:
> > * Drew Fustini <drew@beagleboard.org> [200919 19:53]:
> > > Change the pin defintions from AM33XX_IOPAD to AM33XX_PADCONF macro so
> > > that it correctly handles changes to #pinctrl-cells.
> > 
> > Thanks for fixing this. I wonder if we should now also change the define
> > for the old AM33XX_IOPAD macro?
> > 
> > Or just remove it completely and mention that we've changed nr-pinctrl-cells
> > to use 3 now?
> > 
> > Otherwise the unknown number of out-of-tree boards will be hitting this
> > too.
> > 
> 
> Christina Quast commented in f1ff9be7652b ("ARM: dts: am33xx: Added 
> AM33XX_PADCONF macro") that AM33XX_IOPAD() was left in place to avoid
> breaking boards not in mainline.
> 
> If we follow that logic, then I think that fixing AM33XX_IOPAD() for
> #pinctrl-cells = <2> would be the correct solution.
> 
> Would this be acceptable?
> 
> #define AM33XX_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val) (0)

Makes sense to me yeah.

Tony
