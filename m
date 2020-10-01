Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A753E27FB1E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 10:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgJAIMo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 04:12:44 -0400
Received: from muru.com ([72.249.23.125]:45862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730902AbgJAIMo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Oct 2020 04:12:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 284258057;
        Thu,  1 Oct 2020 08:12:44 +0000 (UTC)
Date:   Thu, 1 Oct 2020 11:12:38 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: am33xx: modify AM33XX_IOPAD for #pinctrl-cells
 = 2
Message-ID: <20201001081238.GV9471@atomide.com>
References: <20200921225053.4126745-1-drew@beagleboard.org>
 <CACRpkdb3J8y8jy9RVgY5J1ypEs15dDU7pcaEGdk5okrydTvmKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb3J8y8jy9RVgY5J1ypEs15dDU7pcaEGdk5okrydTvmKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [201001 08:08]:
> On Tue, Sep 22, 2020 at 12:57 AM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Modify the AM33XX_IOPAD macro so that it works now that #pinctrl-cells =
> > <2>. The third parameter is just a zero and the pinctrl-single driver
> > will just OR this with the second parameter so it has no actual effect.
> >
> > There are no longer any dts files using this macro (following my patch
> > to am335x-guardian.dts), but this will keep dts files not in mainline
> > from breaking.
> >
> > Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> > Suggested-by: Tony Lindgren <tony@atomide.com>
> > Reported-by: Trent Piepho <tpiepho@gmail.com>
> > Link: https://lore.kernel.org/linux-devicetree/20200921064707.GN7101@atomide.com/
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> I didn't get a review tag on this one, Tony is this something I
> should be applying?

Thanks for checking, looks like I already applied into my fixes branch:

b753e41d9999 ("ARM: dts: am33xx: modify AM33XX_IOPAD for #pinctrl-cells = 2")

Regards,

Tony
