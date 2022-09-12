Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146685B58CC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 12:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiILKzY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 06:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiILKzX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 06:55:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196D2167F0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2022 03:55:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0C2BB80C67
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2022 10:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB69C433C1;
        Mon, 12 Sep 2022 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662980119;
        bh=olNDbRIfnOmwdlTBZ0eKtcS1vbz03Ge0f8j7QrmV77s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RYhl21IGWWiCUHKT976Kew9cqRUne3cH8yMq04dFsqDaCI2OTKNdEX2Xc1n1tavJX
         sUO5B6S3Vhi3xsCmyIER0PrZKHsy2+Ys82V7D4hkTR3bBJR/SczGgwtEoIx3mIz0s0
         36Whv9/X8xhTiOqI95oZG8jCi5zZAOt6uyBEitTS9wwoJrl77SV9fsq6lgAXrr+J/o
         5n1xEOxMOoyW9YI+xgJ12yVx0TTxHQHcDVG4E1rdJ3y3UIn40MoGQPrP1J2hftbXCn
         JN9XPP0o6FyoJH332fhUycwEb2un+kmLK+iewWsdrCj78v9dChLrDf7eY1pG1JCI8C
         ssuuF19p0odvA==
Date:   Mon, 12 Sep 2022 11:55:14 +0100
From:   Lee Jones <lee@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Yx8QEkZcnL59qSUM@google.com>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <Yx8D8mGCO+1sEaKG@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yx8D8mGCO+1sEaKG@shell.armlinux.org.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Sep 2022, Russell King (Oracle) wrote:

> On Fri, Sep 09, 2022 at 08:50:07AM +0100, Lee Jones wrote:
> > On Thu, 08 Sep 2022, Hector Martin wrote:
> > 
> > > On 08/09/2022 22.36, Lee Jones wrote:
> > > > On Thu, 08 Sep 2022, Hector Martin wrote:
> > > > 
> > > >> On 08/09/2022 21.31, Lee Jones wrote:
> > > >>> The long and the short of it is; if you wish to treat this device, or
> > > >>> at least a section of it, as a type of MFD, then please draft that
> > > >>> part of it as an MFD driver, residing in drivers/mfd.  If it's "not
> > > >>> really an MFD", then find another way to represent the conglomeration
> > > >>> please.
> > > >>>
> > > >>> If the MFD route is the best, then you can register each of the
> > > >>> devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> > > >>> as a relatively recently good example.
> > > >>
> > > >> I think cros-ec is similar enough, yeah. As long as you don't mind
> > > >> having the core codebase in mfd/ (4 files: core, rtkit backend, and
> > > >> future T2 and legacy backends) we can do that.
> > > > 
> > > > That's actually not what I'm suggesting.
> > > > 
> > > > You *only* need to move the subsequent-device-registration handling
> > > > into drivers/mfd.  The remainder really should be treated as Platform
> > > > (not to be confused with Arch Platform) code and should reside in
> > > > drivers/platform.  Just as we do with cros-ec.
> > > 
> > > That's... an interesting approach.
> > 
> > How you decide to initially architect it would be your choice.
> > 
> > We can then discuss any potential improvements / suggestions.
> > 
> > > Is the code in drivers/mfd supposed
> > > to be a subdevice itself? That seems to be what's going on with
> > > cros_ec_dev.c, but do we really need that layer of indirection?
> > 
> > Ideally not.  The evolution of cros-ec happened over many iterations
> > and much time.  Initially it was almost entirely implemented in
> > drivers/mfd until I requested for a lot of the truly platform code to
> > be moved out, as it grew beyond the bounds of, and was therefore no
> > longer relevant to MFD.
> > 
> > If we were to design and build it up again from scratch, I'd suggest
> > that the MFD part would be the core-driver / entry-point.  That driver
> > should request and initialise shared resources and register the other
> > devices, which is essentially the MFD's mantra.
> > 
> > > What's the point of just having effectively an array of mfd_cell and
> > > wrappers to call into the mfd core in the drivers/mfd/ tree and the
> > > rest of the driver elsewhere?
> > 
> > They should be separate drivers, with MFD registering the Platform.
> 
> I'm guessing this series is now dead, and Hector needs to re-spin the
> patch set according to your views. I'm guessing this is going to take
> a major re-work of the patch series.
> 
> I suspect my attempt and trying to get this upstream has made things
> more complicated, because I doubt Hector has updated his patch set
> with the review comments that have been made so far... so this is
> now quite a mess. I think, once this is sorted, the entire series
> will need to be re-reviewed entirely afresh.

I have no insight into what Hector is doing, or plans to do.

> I've also completely lost where I was in updating the patches with
> all the discussion on this posting of the patch set (which is why I
> posted v2, because I couldn't keep track of all the emails on this
> version.) When I posted v2, I had already lost track, which is why
> it got posted.

Apologies if this has hindered your good work.

-- 
Lee Jones [李琼斯]
