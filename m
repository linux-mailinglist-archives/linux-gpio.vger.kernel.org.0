Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65C1223C5C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgGQNXN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:23:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbgGQNXM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 09:23:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 292DD2064B;
        Fri, 17 Jul 2020 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594992191;
        bh=YXmOefMvlOs7G1IJ3/xGseJf7pS/JY+GgUOoWYCRdsw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iHGfSp04sqXJQGRHKlCZEVORFrAeFfBcvjwv355yCV8T6VUkl3GdsRlSeMV4e25Sz
         NrGX9IhzqSeUa/5SSfAylaRUiv28hLSgYvwA/tiAiqobuA2T+Zdes/mMzw30FEFnkR
         yKxrtUYcsWx1fcspFFMyM94qyDRRJRU9dONpKnNs=
Date:   Fri, 17 Jul 2020 15:23:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Fabio Estevam <festevam@gmail.com>,
        Anson Huang <anson.huang@nxp.com>, Jon Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Adam Ford <aford173@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
Message-ID: <20200717132303.GB2984939@kroah.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
 <20200717121436.GA2953399@kroah.com>
 <CAK8P3a3Ds4O5yRtGSMbNN8R5dPcdb1HJTY=W5eyToFQ-UhzkBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Ds4O5yRtGSMbNN8R5dPcdb1HJTY=W5eyToFQ-UhzkBw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 03:02:54PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 17, 2020 at 2:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Fri, Jul 17, 2020 at 02:01:16PM +0200, Linus Walleij wrote:
> > > While I am a big fan of the Android GKI initiative this needs to be aligned
> > > with the Linux core maintainers, so let's ask Greg. I am also paging
> > > John Stultz on this: he is close to this action.
> > >
> > > They both know the Android people very well.
> > >
> > > So there is a rationale like this going on: in order to achieve GKI goals
> > > and have as much as possible of the Linux kernel stashed into loadable
> > > kernel modules, it has been elevated to modus operandi amongst
> > > the developers pushing this change that it is OK to pile up a load of
> > > modules that cannot ever be unloaded.
> >
> > Why can't the module be unloaded?  Is it just because they never
> > implement the proper "remove all resources allocated" logic in a remove
> > function, or something else?
> 
> For the core kernel parts, it's usually for the lack of tracking of who
> is using the resource provided by the driver, as the subsystems tend
> to be written around x86's "everything is built-in" model.
> 
> For instance, a PCIe host bridge might rely on the IOMMU, a
> clock controller, an interrupt controller, a pin controller and a reset
> controller. The host bridge can still be probed at reduced functionality
> if some of these are missing, or it can use deferred probing when
> some others are missing at probe time.
> 
> If we want all of drivers to be unloaded again, we need to do one
> of two things:
> 
> a) track dependencies, so that removing one of the devices
>     underneath leads to everything depending on it to get removed
>     as well or will be notified about it going away and can stop using
>     it. This is the model used in the network subsystem, where
>     any ethernet driver can be unloaded and everything using the
>     device gets torn down.
> 
> b) use reference counting on the device or (at the minimum)
>     try_module_get()/module_put() calls for all such resources
>     so as long as the pci host bridge is there, so none of the devices
>     it uses will go away when they are still used.
> 
> Traditionally, we would have considered the PCIe host bridge to
> be a fundamental part of the system, implying that everything it
> uses is also fundamental, and there was no need to track
> usage at all, just to ensure the probing is done in the right order.

Yeah, ick, for IOMMU and stuff like this, no, load it once and never
unload it makes much more sense.

Just know how to dynamically load the specific driver out of a
collection of them, and all should be fine.

> > > As a minimum requirement I would expect this to be marked by
> > >
> > > struct device_driver {
> > >    (...)
> > >     /* This module absolutely cannot be unbound */
> > >    .suppress_bind_attrs = true;
> > > };
> >
> > No, that's not what bind/unbind is really for.  That's a per-subsystem
> > choice as to if you want to allow devices to be added/removed from
> > drivers at runtime.  It has nothing to do with module load/unload.
> 
> It's a one-way dependency: If we can't allow the device to be
> unbound, then we also should not allow module unloading because
> that forces an unbind.

Ok, then turn that off for the subsystems this does not support, no
objection from me.  It's just a fun hack that people use for testing out
drivers on new devices, and for virtual devices.

thanks,

greg k-h
