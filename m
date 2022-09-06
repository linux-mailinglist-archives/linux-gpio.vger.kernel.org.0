Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB075AE447
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 11:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiIFJbY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 05:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiIFJbY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 05:31:24 -0400
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CDE2AE3A;
        Tue,  6 Sep 2022 02:31:21 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id f3fee70a;
        Tue, 6 Sep 2022 11:31:17 +0200 (CEST)
Date:   Tue, 6 Sep 2022 11:31:17 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     robh@kernel.org, krzysztof.kozlowski@linaro.org, arnd@arndb.de,
        lee@kernel.org, linus.walleij@linaro.org, alyssa@rosenzweig.io,
        asahi@lists.linux.dev, brgl@bgdev.pl, marcan@marcan.st,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
In-Reply-To: <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org> <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
Message-ID: <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Date: Tue, 6 Sep 2022 10:04:45 +0100
> From: "Russell King (Oracle)" <linux@armlinux.org.uk>
> 
> On Fri, Sep 02, 2022 at 12:28:08PM -0500, Rob Herring wrote:
> > This one is actually pretty odd in that the child nodes don't have a 
> > compatible string which breaks the automagical probing.
> 
> I don't think that is necessarily true, and I don't think it's true in
> this case.
> 
> The SMC core driver instructs the MFD core to create devices for the
> individual functional items:
> 
> static const struct mfd_cell apple_smc_devs[] = {
>         {
>                 .name = "macsmc-gpio",
>         },
>         {
>                 .name = "macsmc-hid",
>         },
>         {
>                 .name = "macsmc-power",
>         },
>         {
>                 .name = "macsmc-reboot",
>         },
>         {
>                 .name = "macsmc-rtc",
>         },
> };
> 
> Since MFD uses platform devices for these, they get all the normal
> functionality that these devices have, which include matching by
> device name ot the driver name, and udev events being appropriately
> triggered. As long as the platform drivers for these devices have the
> correct modalias lines, autoloading of the modules will work and the
> drivers will be correctly matched and probed.
> 
> The Asahi kernel builds most of the platform support as modules,
> including these, so we know it works (if it didn't, then lots of
> module autoloading would be broken on non-DT platforms.)
> 
> > > Again the separate nodes are there because the RTC and the reboot
> > > functionality are logically separate and handled by different MFD
> > > sub-drivers in Linux.
> > 
> > It's really a question of whether the subset of functionality is going 
> > to get reused on its own or has its own resources in DT. MFD bindings 
> > are done both ways.
> 
> I think the current position on what to do about these is that everyone
> is looking for someone else to make a decision, and no one wants to!
> 
> Firstly, I don't think that the number of properties in a node should
> have a bearing on the design of the DT binding - what should have a
> bearing is the logical partitioning of functionality.
> 
> Mark suggests that it would take six months for OpenBSD to transition to
> some other description - for example, if we merged the nodes.

Note that we're totally willing to do that if there is a good
technical reason for changes to the binding.  We just have to find a
way to upgrade existing installations of OpenBSD 7.1 which is a bit of
a challenge as the SMC GPIOs are essential for wifi which on the
laptops is the only network connection available.

> Hector says that MacOS's firmware description has the nodes merged, but
> their description is a mess.

To elaborate on that a bit more, the use of sub-nodes provides a nice
separation between the SMC hardware interface (the main node) and the
functionality offered by the firmware running on the SMC (the sub-nodes).

Another argument for having sub-nodes is that the firmware actually
exposes *two* GPIO controllers.  For now we only support the "master"
PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
separate set of SMC "keys".  We currently don't need any of the pins
on the "slave", so we don't expose it in the DT yet.

> The overall preference seems to be to keep the sub-nodes unless there
> is a strong technical reason not to.
> 
> The feeling I am getting from the review is that there doesn't seem to
> be a strong technical reason to merge the nodes - there are desires and
> preferences, but nothing concrete.
> 
> So at this point, I think it would make sense if I post a v2 with all
> the updates so far (sorry, given the long drawn out discussions on
> this, I've lost track of what changes have been made to the code, so
> I won't include a detailed change log.)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
> 
> 
