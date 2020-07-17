Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0B6223B2B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQMOq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:14:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726113AbgGQMOq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 08:14:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9674D20717;
        Fri, 17 Jul 2020 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594988085;
        bh=kQgaBPzZfXga09Lqrx8wezDWPrDUuin2mS2Z1Z+whfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p6FRGlORHXpKEYBn0ItKKmJUsOqQE8Fxy+n52tof+J8hS401jHCZT/83Fls1fGYR/
         FwNotv56Ks6M/2+FbxgGQ+zglvR2J4DqQhefMFE8ndjLGYz8xEy4KZA+dKNbcwMX7q
         9hsVCffpc26VXWSO9GcSTe9kGWK3rgsLr6D94p1A=
Date:   Fri, 17 Jul 2020 14:14:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Anson Huang <anson.huang@nxp.com>,
        John Stultz <john.stultz@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jon Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
Message-ID: <20200717121436.GA2953399@kroah.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 02:01:16PM +0200, Linus Walleij wrote:
> Greg, John,
> 
> we need some guidance here. See below.
> 
> On Thu, Jul 16, 2020 at 4:38 PM Anson Huang <anson.huang@nxp.com> wrote:
> > [Me]
> > > On Wed, Jul 15, 2020 at 4:44 AM Anson Huang <anson.huang@nxp.com>
> 
> > > > I tried to replace the subsys_initcall() with
> > > > module_platform_driver(), but met issue about "
> > > > register_syscore_ops(&mxc_gpio_syscore_ops);" which is called in
> > > > gpio_mxc_init() function, this function should be called ONLY once,
> > > > moving it to .probe function is NOT working, so we may need to keep the
> > > > gpio_mxc_init(), that is another reason that we may need to keep
> > > > subsys_initcall()?
> > >
> > > This looks a bit dangerous to keep like this while allowing this code to be used
> > > from a module.
> > >
> > > What happens if you insmod and rmmod this a few times, really?
> > > How is this tested?
> > >
> > > This is not really modularized if that isn't working, just that modprobing once
> > > works isn't real modularization IMO, it seems more like a quick and dirty way
> > > to get Androids GKI somewhat working with the module while not properly
> > > making the module a module.
> > >
> > > You need input from the driver maintainers on how to handle this.
> >
> > As far as I know, some general/critical modules are NOT supporting rmmod, like
> > clk, pinctrl, gpio etc., and I am NOT sure whether Android GKI need to support
> > rmmod for these system-wide-used module, I will ask them for more detail about
> > this.
> >
> > The requirement I received is to support loadable module, but so far no hard requirement
> > to support module remove for gpio driver, so, is it OK to add it step by step, and this patch
> > series ONLY to support module build and one time modprobe?
> 
> While I am a big fan of the Android GKI initiative this needs to be aligned
> with the Linux core maintainers, so let's ask Greg. I am also paging
> John Stultz on this: he is close to this action.
> 
> They both know the Android people very well.
> 
> So there is a rationale like this going on: in order to achieve GKI goals
> and have as much as possible of the Linux kernel stashed into loadable
> kernel modules, it has been elevated to modus operandi amongst
> the developers pushing this change that it is OK to pile up a load of
> modules that cannot ever be unloaded.

Why can't the module be unloaded?  Is it just because they never
implement the proper "remove all resources allocated" logic in a remove
function, or something else?

> This is IIUC regardless of whether all consumers of the module are
> actually gone: it would be OK to say make it impossible to rmmod
> a clk driver even of zero clocks from that driver is in use. So it is not
> dependency-graph problem, it is a "load once, never remove" approach.

Sounds like a "lazy" approach :)

> This rationale puts me as subsystem maintainer in an unpleasant spot:
> it is really hard to tell case-to-case whether that change really is a
> technical advantage for the kernel per se or whether it is done for the
> greater ecosystem of Android.
> 
> Often I would say it makes it possible to build a smaller kernel vmlinux
> so OK that is an advantage. On the other hand I have an inkling that I
> should be pushing developers to make sure that rmmod works.

I can see where a number of modules just can not ever be removed because
of resources and not being able to properly tear down, but that doesn't
mean that a driver author shouldn't at least try, right?

> As a minimum requirement I would expect this to be marked by
> 
> struct device_driver {
>    (...)
>     /* This module absolutely cannot be unbound */
>    .suppress_bind_attrs = true;
> };

No, that's not what bind/unbind is really for.  That's a per-subsystem
choice as to if you want to allow devices to be added/removed from
drivers at runtime.  It has nothing to do with module load/unload.

> So that noone would be able to try to unbind this (could even be an
> attack vector!)
> 
> What is our broader reasoning when it comes to this? (I might have
> missed some mail thread here.)

Android is just finally pushing vendors to get their code upstream,
which is a good thing to see.  And building things as a module is an
even better thing as now it is finally allowing arm64 systems to be
built to support more than one specific hardware platform at runtime.

So moving drivers to modules is good.  If a module can be removed, even
better, but developers should not be lazy and just flat out not try at
all to make their code unloadable if at all possible.

Does that help?

thanks,

greg k-h
