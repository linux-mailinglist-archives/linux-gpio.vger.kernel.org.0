Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DB25B30FC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 09:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiIIHxu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 03:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbiIIHwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 03:52:53 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C66A9264
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 00:50:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1A2BCCE216F
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 07:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16542C433D6;
        Fri,  9 Sep 2022 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662709812;
        bh=UDnbEwzulMssJ3lao9cmXQluHxSgc+Mdz3SMmAGC94o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nGMDup9/by5HBu7emjRkrfKV2YERfKP2sb6C8tsGKEoYU8EON8PK7TZ6kPJNmRg3b
         miPDC/ZLNdUVG/Ffl1idu0EmfpW24cJ97X2P3srf2P9IR6Rd9+9iB9xl1o5fnAq2SH
         FnaWQgqIvMgBBeG4UNjcM/gbgQqnj0rBhxORskISNOV5638i7/ltM3XPrbGTnXBD1s
         fpCcRYxuS2kDgKBM1aH+kL/9BoYY8nzZ2uwa+YYc5zkPT5E8B3tHfwILb0UQNvK1Nk
         iNE5LdJzDMHtLaK1WjFK0DsAtHQo/KhyAzBOwwR9SC3IFSFz8sJu4Nh+P8U7A8TR08
         d9/c5rJK9RMLg==
Date:   Fri, 9 Sep 2022 08:50:07 +0100
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
Message-ID: <YxrwLwVihe/s9wxN@google.com>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 08 Sep 2022, Hector Martin wrote:

> On 08/09/2022 22.36, Lee Jones wrote:
> > On Thu, 08 Sep 2022, Hector Martin wrote:
> > 
> >> On 08/09/2022 21.31, Lee Jones wrote:
> >>> The long and the short of it is; if you wish to treat this device, or
> >>> at least a section of it, as a type of MFD, then please draft that
> >>> part of it as an MFD driver, residing in drivers/mfd.  If it's "not
> >>> really an MFD", then find another way to represent the conglomeration
> >>> please.
> >>>
> >>> If the MFD route is the best, then you can register each of the
> >>> devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> >>> as a relatively recently good example.
> >>
> >> I think cros-ec is similar enough, yeah. As long as you don't mind
> >> having the core codebase in mfd/ (4 files: core, rtkit backend, and
> >> future T2 and legacy backends) we can do that.
> > 
> > That's actually not what I'm suggesting.
> > 
> > You *only* need to move the subsequent-device-registration handling
> > into drivers/mfd.  The remainder really should be treated as Platform
> > (not to be confused with Arch Platform) code and should reside in
> > drivers/platform.  Just as we do with cros-ec.
> 
> That's... an interesting approach.

How you decide to initially architect it would be your choice.

We can then discuss any potential improvements / suggestions.

> Is the code in drivers/mfd supposed
> to be a subdevice itself? That seems to be what's going on with
> cros_ec_dev.c, but do we really need that layer of indirection?

Ideally not.  The evolution of cros-ec happened over many iterations
and much time.  Initially it was almost entirely implemented in
drivers/mfd until I requested for a lot of the truly platform code to
be moved out, as it grew beyond the bounds of, and was therefore no
longer relevant to MFD.

If we were to design and build it up again from scratch, I'd suggest
that the MFD part would be the core-driver / entry-point.  That driver
should request and initialise shared resources and register the other
devices, which is essentially the MFD's mantra.

> What's the point of just having effectively an array of mfd_cell and
> wrappers to call into the mfd core in the drivers/mfd/ tree and the
> rest of the driver elsewhere?

They should be separate drivers, with MFD registering the Platform.

-- 
Lee Jones [李琼斯]
