Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99353613C14
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 18:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiJaRXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 13:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbiJaRXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 13:23:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598B813CD0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 10:23:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E93BD61341
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 17:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E816C433C1;
        Mon, 31 Oct 2022 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667236998;
        bh=R5DVql+ggtn4spylZiV/KEob6XtjcloHdtXG617w3S8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LY2n3DiLmp5FpjF/ZWTuAay1igYQyimZp4RSW7KX4LHXCBX+bE3gyaJ93hIiAUugZ
         yyj7LfXFy7ucXXelA1iqMZTumMfgPKvSlzmLqREirYlMPNFa3TDxXQxRbXGV5cydX+
         Nrt21BHpWwjGSwkiRGQdy1qtwBQ6pGeY0tu//ma7KdH98UbEzu0qrB0w+ERszWZXaO
         8AlacUyb8Vfe90EfVnMwVbT40CFVGmbfcZr1NhQgOkbnprlhRLVxJuG+ggv1U4uFBk
         H8IQCfwyIgRSo42Q698k24cyvoOOffEe86JWyOjpW/sTHBQhsI0XgFyNj5u+Mjq0gp
         TRhupDMkiJXYw==
Date:   Mon, 31 Oct 2022 17:23:12 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Y2AEgIfURNhCgimr@google.com>
References: <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
 <Y1+LzpEvVj7xswqb@google.com>
 <dcd692aa-1525-4fc5-5198-37f803725c4f@marcan.st>
 <Y1+VdnmMUfIKTwWF@google.com>
 <4faa5e4c-b43b-12e4-2259-c2595bd55b97@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4faa5e4c-b43b-12e4-2259-c2595bd55b97@marcan.st>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 Oct 2022, Hector Martin wrote:

> On 31/10/2022 18.29, Lee Jones wrote:
> > On Mon, 31 Oct 2022, Hector Martin wrote:
> > 
> >> On 31/10/2022 17.48, Lee Jones wrote:
> >>> On Sat, 29 Oct 2022, Hector Martin wrote:
> >>>
> >>>> On 09/09/2022 16.50, Lee Jones wrote:
> >>>>>> What's the point of just having effectively an array of mfd_cell and
> >>>>>> wrappers to call into the mfd core in the drivers/mfd/ tree and the
> >>>>>> rest of the driver elsewhere?
> >>>>>
> >>>>> They should be separate drivers, with MFD registering the Platform.
> >>>>
> >>>> Why? What purpose does this serve? I'm still confused. There's one
> >>>> parent device, which provides services to the child devices. There isn't
> >>>> one parent device which wraps a platform service which is used by
> >>>> children. This makes no sense. The platform device is the root, if it
> >>>> exposes MFD services, then it has to be in that direction, not the other
> >>>> way around.
> >>>>
> >>>> Look at how this patch series is architected. There is smc_core.c, which
> >>>> implements SMC helpers and wrappers on top of a generic backend, and
> >>>> registers with the MFD subsystem. And then there is smc_rtkit.c which is
> >>>> the actual platform implementation on top of the RTKit framework, and is
> >>>> the actual platform device entry point.
> >>>>
> >>>> A priori, the only thing that makes sense to me right now would be to
> >>>> move smc_core.c into drivers/mfd, and leave smc_rtkit.c in platform.
> >>>> That way the mfd registration would be in drivers/mfd (as would be the
> >>>> services offered to sub-drivers), but the actual backend implementation
> >>>> would be in platform/ (and there would eventually be others, e.g. at
> >>>> least two more for x86 systems). That does mean that the driver entry
> >>>> point will be in platform/, with mfd/smc_core.c serving as effectively
> >>>> library code to plumb in the mfd stuff into one of several possible
> >>>> platform devices. Would that work for you?
> >>>
> >>> Yes, sounds sensible.  However, keep all of the abstraction craziness
> >>> somewhere else and fetch and share all of your shared resources from
> >>> the MFD (SMC) driver.
> >>
> >> I'm not sure what you mean by that. The abstraction (smc_core.c) *is*
> >> the shared resource. All it does is wrap ops callbacks with a mutex and
> >> add a couple helpers for finding keys. Do you literally want us to just
> >> have this in drivers/mfd?
> >>
> >> // SPDX-License-Identifier: GPL-2.0-only OR MIT
> >> /*
> >>  * Apple SMC MFD wrapper
> >>  * Copyright The Asahi Linux Contributors
> >>  */
> >>
> >> #include <linux/device.h>
> >> #include "smc.h"
> >>
> >> static const struct mfd_cell apple_smc_devs[] = {
> >> 	{
> >> 		.name = "macsmc-gpio",
> >> 	},
> >> 	{
> >> 		.name = "macsmc-hid",
> >> 	},
> >> 	{
> >> 		.name = "macsmc-power",
> >> 	},
> >> 	{
> >> 		.name = "macsmc-reboot",
> >> 	},
> >> 	{
> >> 		.name = "macsmc-rtc",
> >> 	},
> >> };
> >>
> >> int apple_smc_add_mfd_devices(struct device *dev)
> >> {
> >> 	ret = mfd_add_devices(dev, -1, apple_smc_devs,
> >> ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
> >> 	if (ret)
> >> 		return dev_err_probe(dev, ret, "Subdevice initialization failed");
> >>
> >> 	return 0;
> >> }
> >> EXPORT_SYMBOL(apple_smc_add_mfd_devices);
> >>
> >> int apple_smc_remove_mfd_devices(struct device *dev)
> >> {
> >> 	mfd_remove_devices(smc->dev);
> >>
> >> 	return 0;
> >> }
> >> EXPORT_SYMBOL(apple_smc_add_mfd_devices);
> >>
> >> MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> >> MODULE_LICENSE("Dual MIT/GPL");
> >> MODULE_DESCRIPTION("Apple SMC MFD wrapper");
> >>
> >> Because this feels *immensely* silly and pointless.
> > 
> > ... and hacky.  I agree.
> > 
> > [BTW: if this is all you want to do, have you considered simple-mfd?]
> > 
> > No, I want you to author a proper MFD device.
> 
> You don't seem to understand how MFD devices actually map to the
> hardware we're working with here.

Via an abstracted message passing API and a little shared memory?

The former eventually ending up in the MBOX API?

> > The hardware you're describing in this submission *is* an MFD.  So use
> > the subsystem properly, instead of abusing it as a shim API to simply
> > register platform devices.
> 
> *sigh* the hardware I'm describing is a *class* of MFD devices. They all
> work the same way as far as the sub-devices see, but operate on
> completely different hardware backends.

That's common.  Usually we're using talking; SPI, I2C, USB and MMIO,
but a bespoke message passing API is not out of the realms of normal.

> If you do not want "gooey
> platform stuff" in drivers/mfd, then it *has* to be a dumb shim.
> 
> You have 3 options:
> 
> - We move everything into drivers/mfd, which means there will
> (eventually) be 3 backend modules binding to real hardware devices and
> one shared core which actually does the MFD registration and provides
> common services.

Moving everything isn't an option.  A split would be the most
reasonable approach.  We just need to decide on which parts should
reside on which side of the MFD / Platform boundary.

> - We move just the core into drivers/mfd, which means the device binding
> will happen elsewhere, and the only code in the MFD subsystem will be
> common code and will be called as a library (via module exports, not via
> device binding).

What are you describing as 'the core' here?  And which device binding
are you alluding to?  Sub-device registration or something else?

> - We give up and just have a dumb shim in drivers/mfd as above, because
> you don't want to work with us.

If I wasn't willing to work with you, who are you conversing with?

Side-note: Tweeting derogatory comments about the people who have
           volunteered to take valuable time out of their day to help
	   you, is no good way to encourage people to "work with you"!

	   Most, if not all of us do this willingly and with no
	   additional benefit, purely to help others.  Seeing such
	   horrid things spread widely, is a guaranteed way to spoil
	   someone's day.

> Either you work with how our hardware works or we go with this dumb shim
> workaround.

It sounds like you have this the wrong way around.  Linux and its
associated subsystems aren't going to bend and flex around your design
decisions.  You need to apply a little flexibility and work with us to
find something that'll work for everyone.

> You seem to want us to simultaneously "author a proper MFD
> device" and "not put platform stuff in MFD". We can't do both at the
> same time. Either the code is here or it is elsewhere.

Of course you can.  Just like everyone else does.

After taking quite a bit of time out of my day to look at this today,
I can see that your RTKit initialisation implementation is actually
much more suited to MFD than the SMC wrappers.

One thing that I'm still a little unsure about is future the hierarchy
and layering of all these drivers.  Which is it you say can / will be
swapped out for different methods of initialisation?

I see that you pass a bunch of function pointers from the RTKit
implementation into the SMC.  Which in turn offers an exported
(apple_smc_*) API.  In most of the frameworks I have knowledge of, the
core provides the Ops structure and it's populated by the client
device.

I'm sure having that clear in my head will go some ways to put me in a
position to advise you further.

> > Request the device-wide memory (and other shared resources) here.
> 
> That's what smc_rtkit.c does, but you seem not to want that code in mfd.

I'm not sure I explicitly said that.

> > Conduct core operations and initialisation here
> 
> The RTKit library is in charge of core RTKit initialization, smc_rtkit
> is in charge of SMC-specific initialization, and smc_core.c is in charge
> of core SMC operations and initialization. What, exactly, do you want to
> move into drivers/mfd? (hint: not the RTKit library, that is shared by
> many other drivers).
> 
> > then call into your Platform and other child devices to initiate the real work.
> 
> There is nothing to call into, the child devices will bind and call
> *back* into the SMC core to do their job.

"call into" was not a good choice of words here.  Simply, let the
child devices go about their business and do whatever they were
designed to do.

-- 
Lee Jones [李琼斯]
