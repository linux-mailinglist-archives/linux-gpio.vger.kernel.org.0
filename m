Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35EF5B57C0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 12:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiILKDq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 06:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiILKDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 06:03:39 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6B32AE18
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2022 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+91oUc1RS/b9V7qFF8dVDgZBRc4n7cWRgZfEVNUz3QA=; b=KyoHktdAx0ozSOFIxnWShFi9Np
        k2uPAJGA8AtYymoxT8KSkPQcbvEOi5KdCxIx9f+2cPRPJZELDghgbUOPdiYZhyMdG8f02vnADlceU
        2IuhaqG1E7ydXF297xlSlKZL4ttUpbd6jff2utUlFTB7be9aHILXYVlZ2VgKsE7WBMg65uMaL4len
        lBrw7Qa6ou2HoTDKiCOEXYrXdIa+egLTkThqS4ip2DOCvsABAAqi/ae/IcVoAgXsHhJ4fgYPbP9XO
        ebTKYWif+jP8byoMS8omNY9pagUb2+Ys+qBF7YYPY+nXoBlsKYlDP3AwflLTSZHhlqIwi7M5RJA44
        Dd0sy0EA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34254)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oXgHr-0001XV-OY; Mon, 12 Sep 2022 11:03:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oXgHq-000812-A4; Mon, 12 Sep 2022 11:03:30 +0100
Date:   Mon, 12 Sep 2022 11:03:30 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Lee Jones <lee@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Yx8D8mGCO+1sEaKG@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxrwLwVihe/s9wxN@google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 09, 2022 at 08:50:07AM +0100, Lee Jones wrote:
> On Thu, 08 Sep 2022, Hector Martin wrote:
> 
> > On 08/09/2022 22.36, Lee Jones wrote:
> > > On Thu, 08 Sep 2022, Hector Martin wrote:
> > > 
> > >> On 08/09/2022 21.31, Lee Jones wrote:
> > >>> The long and the short of it is; if you wish to treat this device, or
> > >>> at least a section of it, as a type of MFD, then please draft that
> > >>> part of it as an MFD driver, residing in drivers/mfd.  If it's "not
> > >>> really an MFD", then find another way to represent the conglomeration
> > >>> please.
> > >>>
> > >>> If the MFD route is the best, then you can register each of the
> > >>> devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> > >>> as a relatively recently good example.
> > >>
> > >> I think cros-ec is similar enough, yeah. As long as you don't mind
> > >> having the core codebase in mfd/ (4 files: core, rtkit backend, and
> > >> future T2 and legacy backends) we can do that.
> > > 
> > > That's actually not what I'm suggesting.
> > > 
> > > You *only* need to move the subsequent-device-registration handling
> > > into drivers/mfd.  The remainder really should be treated as Platform
> > > (not to be confused with Arch Platform) code and should reside in
> > > drivers/platform.  Just as we do with cros-ec.
> > 
> > That's... an interesting approach.
> 
> How you decide to initially architect it would be your choice.
> 
> We can then discuss any potential improvements / suggestions.
> 
> > Is the code in drivers/mfd supposed
> > to be a subdevice itself? That seems to be what's going on with
> > cros_ec_dev.c, but do we really need that layer of indirection?
> 
> Ideally not.  The evolution of cros-ec happened over many iterations
> and much time.  Initially it was almost entirely implemented in
> drivers/mfd until I requested for a lot of the truly platform code to
> be moved out, as it grew beyond the bounds of, and was therefore no
> longer relevant to MFD.
> 
> If we were to design and build it up again from scratch, I'd suggest
> that the MFD part would be the core-driver / entry-point.  That driver
> should request and initialise shared resources and register the other
> devices, which is essentially the MFD's mantra.
> 
> > What's the point of just having effectively an array of mfd_cell and
> > wrappers to call into the mfd core in the drivers/mfd/ tree and the
> > rest of the driver elsewhere?
> 
> They should be separate drivers, with MFD registering the Platform.

I'm guessing this series is now dead, and Hector needs to re-spin the
patch set according to your views. I'm guessing this is going to take
a major re-work of the patch series.

I suspect my attempt and trying to get this upstream has made things
more complicated, because I doubt Hector has updated his patch set
with the review comments that have been made so far... so this is
now quite a mess. I think, once this is sorted, the entire series
will need to be re-reviewed entirely afresh.

I've also completely lost where I was in updating the patches with
all the discussion on this posting of the patch set (which is why I
posted v2, because I couldn't keep track of all the emails on this
version.) When I posted v2, I had already lost track, which is why
it got posted.

Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
