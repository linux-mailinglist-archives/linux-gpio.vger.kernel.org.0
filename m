Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B87067C88C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 11:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjAZK1z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 05:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjAZK1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 05:27:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FE755B1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 02:27:49 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pKzTu-0007OF-Nq; Thu, 26 Jan 2023 11:27:46 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pKzTu-0004u2-1v; Thu, 26 Jan 2023 11:27:46 +0100
Date:   Thu, 26 Jan 2023 11:27:46 +0100
From:   Sascha Hauer <sha@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <20230126102746.GD23347@pengutronix.de>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CAMRc=Mfrqy5GGpS3co3Div+EsFJO7e2reJTn7BDCf+pD+mB8Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfrqy5GGpS3co3Div+EsFJO7e2reJTn7BDCf+pD+mB8Ew@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 02:56:12PM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 25, 2023 at 10:35 AM Sascha Hauer <sha@pengutronix.de> wrote:
> >
> > On Mon, Jan 23, 2023 at 03:55:18PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > I stumbled over the following warning while testing the new v6.2-rc4 on
> > > > a imx8mm-evk:
> > > >
> > > > [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > > [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > >
> > > > The warning was introduced by commit [1] but at least the following
> > > > drivers are parsing the alias for a gpiochip to use it as base:
> > > >  - drivers/gpio/gpio-mxs.c
> > > >  - drivers/gpio/gpio-mxc.c
> > > >  - drivers/gpio/gpio-clps711x.c
> > > >  - drivers/gpio/gpio-mvebu.c
> > > >  - drivers/gpio/gpio-rockchip.c
> > > >  - drivers/gpio/gpio-vf610.c
> > > >  - drivers/gpio/gpio-zynq.c
> > > >
> > > > According commit [2] it seems valid and correct to me to use the alias
> > > > and the user-space may rely on this.
> > > >
> > > > Now my question is how we can get rid of the warning without breaking
> > > > the user-space?
> > > >
> > > > [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> > > > [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
> > > >
> > >
> > > The warning is there to remind you that static GPIO base numbers have
> > > been long deprecated and only user-space programs using sysfs will
> > > break if you remove it, everyone else - including user-space programs
> > > using libgpiod or scripts using gpio-tools that are part of the
> > > project - will be fine.
> > >
> > > Any chance you can port your user-space programs to libgpiod?
> > >
> > > The warning doesn't break compatibility so I'm not eager to remove it.
> >
> > Well it's a warning and sooner or later somebody will come along and
> > removes this warning by removing the GPIO controller bases from the dts
> > files which in turn will then break things at least for us, but I
> > suspect for many other people as well.
> >
> > You are trying to remove the GPIO sysfs API for many years now without
> > success so far, and I doubt that you will succeed in future because the
> > Kernel comes with the promise that userspace won't be broke.
> >
> 
> History knows interfaces that were long deprecated, triggered warnings
> and were eventually removed (sysctl?). We have not yet broken
> user-space. IMO a warning is in order if an interface was deprecated.
> 
> > I can understand that you want to get rid of the global GPIO number
> > space. Currently you can't, because there are still hundreds of
> > in-Kernel users of the legacy API. When all these are fixed and the GPIO
> > sysfs API is the only remaining user of the global GPIO number space
> > then we could move the numbering to gpiolib-sysfs.c and no longer bother
> > the core with it. At this point the sysfs API would be a GPIO consumer
> > just like every other consumer and we could leave it there until only
> > the oldest of us remember what it's good for.
> >
> > Instead of trying to remove the sysfs API I really think it would be a
> > better strategy to push it into a corner where it can stay without
> > being a maintenance burden.
> >
> 
> We're also doing it step-by-step.

My suggestion is to keep the sysfs API, not to remove it. Since the
Kernel now issues a warning when a GPIO driver is trying to provide
fixed GPIO numbers and that motivates people to get rid of the warning.

And I just found out this is already happening:

https://lore.kernel.org/lkml/Y8WF2gXbrGnDLQ+S@atomide.com/T/

I can understand that you are trying to push people to use the new API,
but please do this by making the new API superior to the old API, not by
actively breaking the old API. And adding a warning like this *is* actively
breaking the old API for users.

> 
> > Regarding the usage of libgpiod for our projects: I think one of the
> > major shortcomings is that the character interface doesn't allow to
> > just set a GPIO to a value and leave it in that state without having
> > to keep the process alive. While you may argument that it's cleaner
> > to go to a "safe state" (or "idle state") when the process finishes
> > that's simply not the way how many projects out there work. Virtually
> > everyone has scripts poking GPIO states into sysfs and currently you
> > can't do this with the character device API. If you want to get rid
> > of the sysfs API then you should work on making the character device
> > API more attractive for users and I think this is one point could use
> > some improvement.
> >
> > Sascha
> 
> On that note: as libgpiod v2.0 is almost ready for release, I started
> working on the idea I've long had in mind - DBus interface for GPIOs.
> I've started writing the code over Christmas and some very limited
> functionality is available on my github[1]. For now it only allows to
> read chip properties but my goal is to have a complete DBus API for
> libgpiod v2.1. Is this something you could work with? It addresses
> your main concern (having a central authority and persistent state of
> GPIOs) while using the character device behind the scenes.

I do not understand why we should have such a complexity just to
maintain the status of a GPIO when the Kernel could simply do this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
