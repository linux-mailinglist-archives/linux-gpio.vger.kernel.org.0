Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8EC67AE0F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 10:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbjAYJfy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 04:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjAYJfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 04:35:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED91E93
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 01:35:51 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pKcC5-0008L7-0e; Wed, 25 Jan 2023 10:35:49 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pKcC4-00077p-2I; Wed, 25 Jan 2023 10:35:48 +0100
Date:   Wed, 25 Jan 2023 10:35:48 +0100
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <20230125093548.GB23347@pengutronix.de>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
From:   Sascha Hauer <sha@pengutronix.de>
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

On Mon, Jan 23, 2023 at 03:55:18PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi all,
> >
> > I stumbled over the following warning while testing the new v6.2-rc4 on
> > a imx8mm-evk:
> >
> > [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> >
> > The warning was introduced by commit [1] but at least the following
> > drivers are parsing the alias for a gpiochip to use it as base:
> >  - drivers/gpio/gpio-mxs.c
> >  - drivers/gpio/gpio-mxc.c
> >  - drivers/gpio/gpio-clps711x.c
> >  - drivers/gpio/gpio-mvebu.c
> >  - drivers/gpio/gpio-rockchip.c
> >  - drivers/gpio/gpio-vf610.c
> >  - drivers/gpio/gpio-zynq.c
> >
> > According commit [2] it seems valid and correct to me to use the alias
> > and the user-space may rely on this.
> >
> > Now my question is how we can get rid of the warning without breaking
> > the user-space?
> >
> > [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> > [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
> >
> 
> The warning is there to remind you that static GPIO base numbers have
> been long deprecated and only user-space programs using sysfs will
> break if you remove it, everyone else - including user-space programs
> using libgpiod or scripts using gpio-tools that are part of the
> project - will be fine.
> 
> Any chance you can port your user-space programs to libgpiod?
> 
> The warning doesn't break compatibility so I'm not eager to remove it.

Well it's a warning and sooner or later somebody will come along and
removes this warning by removing the GPIO controller bases from the dts
files which in turn will then break things at least for us, but I
suspect for many other people as well.

You are trying to remove the GPIO sysfs API for many years now without
success so far, and I doubt that you will succeed in future because the
Kernel comes with the promise that userspace won't be broke.

I can understand that you want to get rid of the global GPIO number
space. Currently you can't, because there are still hundreds of
in-Kernel users of the legacy API. When all these are fixed and the GPIO
sysfs API is the only remaining user of the global GPIO number space
then we could move the numbering to gpiolib-sysfs.c and no longer bother
the core with it. At this point the sysfs API would be a GPIO consumer
just like every other consumer and we could leave it there until only
the oldest of us remember what it's good for.

Instead of trying to remove the sysfs API I really think it would be a
better strategy to push it into a corner where it can stay without
being a maintenance burden.

Regarding the usage of libgpiod for our projects: I think one of the
major shortcomings is that the character interface doesn't allow to
just set a GPIO to a value and leave it in that state without having
to keep the process alive. While you may argument that it's cleaner
to go to a "safe state" (or "idle state") when the process finishes
that's simply not the way how many projects out there work. Virtually
everyone has scripts poking GPIO states into sysfs and currently you
can't do this with the character device API. If you want to get rid
of the sysfs API then you should work on making the character device
API more attractive for users and I think this is one point could use
some improvement.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
