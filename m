Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C79F616386
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 14:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbiKBNNP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 09:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiKBNND (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 09:13:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968E52A712
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 06:13:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 45419B822A7
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 13:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869CDC433C1;
        Wed,  2 Nov 2022 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667394778;
        bh=JuzdzoZQv7vx3g4XLThOhs8ysZfBBda2DUoWLO5jrQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ShqS8vce3zJSYQHz986Lcb8b1A4C+a5Cfdtrqa+Cfg+H4aDm6iqVp2CEkhLwtUCgZ
         EsvnoxPMYkzOb5qIUHwG8gPu5V5lLa09QbqoRpNZsZ+svDiuWeAfAfSjf9/CARFGFA
         NZ38eYXCEhAh/IZPoS8araweWXwQK2I9jsFdFSXlFhgoLD8yAU7E53f91e0yyZ+yNN
         Cl08KmvPM2SkQIxLcVV6GHWgyOK/nEfLbImosWEHC6gASiZZ25pldDlA1MahVgU8DS
         d43veR4iZCA2UAhhztusfvzh4he2WZnYNnHIaJHBY9mdS6u3Zn3xH9+q+eaif9+sYb
         q2cLLYL3knpGA==
Date:   Wed, 2 Nov 2022 13:12:53 +0000
From:   Lee Jones <lee@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Y2Js1ZhIlr9dimHw@google.com>
References: <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
 <Y1+LzpEvVj7xswqb@google.com>
 <dcd692aa-1525-4fc5-5198-37f803725c4f@marcan.st>
 <Y1+VdnmMUfIKTwWF@google.com>
 <4faa5e4c-b43b-12e4-2259-c2595bd55b97@marcan.st>
 <Y2AEgIfURNhCgimr@google.com>
 <Y2AjUz9eGa/GLY5s@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2AjUz9eGa/GLY5s@shell.armlinux.org.uk>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 Oct 2022, Russell King (Oracle) wrote:

> On Mon, Oct 31, 2022 at 05:23:12PM +0000, Lee Jones wrote:
> > I see that you pass a bunch of function pointers from the RTKit
> > implementation into the SMC.  Which in turn offers an exported
> > (apple_smc_*) API.  In most of the frameworks I have knowledge of, the
> > core provides the Ops structure and it's populated by the client
> > device.
> 
> Sorry Lee, I don't get this point. From what I can see, the
> apple_smc_backend_ops struct is owned by the core System Management
> Controller code, and RTKit backend fills in an instance of these ops
> and provides that to the core SMC code. The RTKit backend is just
> how we walk to the System Management Controller. It is not a client.
> 
> I don't see this being any different to struct file_operations,
> seq_operations, vm_operations_struct, block_Device_operations,
> and so on and so forth.
> 
> Having read your response, I wonder if you're confused about what the
> smc_core and smc_rtkit code actually are - because you seem to think
> that smc_rtkit is a _client_ of the smc_core code. It isn't, as I
> explain above, it's how we talk to the System Management Controller,
> and smc_core provides a uniform interface to the client drivers such
> as GPIO, RTC etc.
> 
> Essentially, we have:
> 
> Hardware   Backend    Core             Clients
>                                  .---- RTC
>                                 / .--- GPIO
> Mailbox -- RTKit -- SMC Core -- MFD -- HID
>                                 \ `--- Power
>                                  `---- Reboot

The issue I see with the current implementation is that, what you are
calling the SMC Core here, is being viewed as the parent to all of
these client (child / sub) devices.  However, in reality, the SMC Core
is little more than a function pointer shim / pass-through without
it's own Device.  In order for it to register the child-devices, it's
effectively borrowing and branching off of the RTKit's Device, which
from a Device Driver hierarchy stand-point feels odd.

> RTKit is just _one_ possible backend, there are other backends that
> can be used to interface to the underlying platform implementation to
> talk to the SMC.

Right, this is the tricky part.  The way I see it, the best route
would be to make the RTKit, which is the real Linux Device (with real
resources), the direct parent (no sharing) and move it to MFD.

However, the looming question then becomes, "what happens when the
RTKit is removed and swapped out for something else?", does that mean
anything you swap it out with will need to become an MFD also?  How
would the children get registered otherwise?

The TL;DR is, I can see why it's been architected this way, but it
doesn't really fit in with the Device Driver norms, which makes it
quite difficult to shoehorn in without the issues (using MFD API
outside of MFD and borrowing Devices) we're encountering here.

> > I'm sure having that clear in my head will go some ways to put me in a
> > position to advise you further.
> > 
> > > > Request the device-wide memory (and other shared resources) here.
> > > 
> > > That's what smc_rtkit.c does, but you seem not to want that code in mfd.
> > 
> > I'm not sure I explicitly said that.
> 
> On Fri, Sep 09, 2022 at 08:50:07AM +0100, Lee Jones wrote:
> | If we were to design and build it up again from scratch, I'd suggest
> | that the MFD part would be the core-driver / entry-point.  That driver
> | should request and initialise shared resources and register the other
> | devices, which is essentially the MFD's mantra.
> 
> This is exactly what smc_rtkit is doing, which as I've mentioned above
> is the backend provider of access to the System Management Controller.
> Backend-independent access to the System Management Controller is done
> via smc_core which - at least to me - seems to be entirely correct,
> and it seems entirely appropriate that this should be responsible for
> creating the individual clients that make use of the System Management
> Controller's facilities such as GPIO, RTC etc.

Making a shim-layer without a real Device become a parent to
sub-devices is the part I'm finding most difficult to swallow.

> > "call into" was not a good choice of words here.  Simply, let the
> > child devices go about their business and do whatever they were
> > designed to do.
> 
> ... by calling into the code which provides them with access to the
> System Management Controller - that being through smc_core and
> ultimately which ever backend is used to finally communicate with the
> System Management Controller.

Right.  No problem with that part.

Mailbox, I2C, SPI, MMIO, USB, makes no difference to me.

> At this point, I'm wondering whether you're somehow expecting client
> devices to map memory and read/write some registers. This is not that
> kind of setup. The address space is entirely virtual, through a set
> of four byte keys that indicate to the System Management Controller
> which fine-grained resource one wants to access. That being an
> individual GPIO line or some other parameter of the system.

No, not at all.  A public API mapping to whatever the H/W communication
strategy (I2C, SPI, ...) is a perfectly viable implementation.

> The memory that you see smc_rtkit claim is for passing messages, none
> of the clients have a right to directly access that memory - indeed,
> doing so would be a total layering violation and really bad bit of
> design.

This is not a concept I have an issue understanding.

> So, I hope my response helps fill in some of the detail about what
> this code is doing, how it works and how it's been designed.

I have a strong grasp of the concept presented. :)

If we can find an acceptable way to create a proper and correct device
hierarchy, I think we're in a good place.  My present suggestion is to
make the RTKit the MFD and spawn the child devices directly from it.

-- 
Lee Jones [李琼斯]
