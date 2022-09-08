Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B74B5B1F53
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 15:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiIHNgk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 09:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbiIHNgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 09:36:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A65C229E
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 06:36:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1041661D08
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 13:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2412C433C1;
        Thu,  8 Sep 2022 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662644192;
        bh=jNYWcMJTxd9I6mwuzcAiobhdY14ilM+Fu6mCeOacPks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wwi5zw+Td0dhT/rAp3NbqBmoiLPsF132s7eZ25qXpttdfakMm2iZAPzjt+tbDXlry
         0xypQmNisF/a5Ky1S7NVqX9xIGHTJnUfSrylXJ6HO0sl8oKin1XXRTFgVMbE3MqZwf
         FaIrw6oy0uBdDTtkwQnHj5Ikdvfv9ESzOPys3dTQ8zuSzE1hhN8itoLb4z/zN6aTk3
         OmfC1/mgqY/z8h9cqhxws2KIq/Qex4MhVi6dEeN5apuJk9BWkl2qStNzmuXMnHhwYz
         8bby+has6UFuxVYOFJ6KBMvhbqbjepknNg+fUju70QJDuaIpCN9PVZwGw/rbsXH7kD
         iP1imfkt7TTgg==
Date:   Thu, 8 Sep 2022 14:36:26 +0100
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
Message-ID: <Yxnv2mKkl1tW4PUp@google.com>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
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

> On 08/09/2022 21.31, Lee Jones wrote:
> > On Thu, 08 Sep 2022, Hector Martin wrote:
> >> But it's not exactly your
> >> typical MFD device (it's not even a separate chip, it's part of the main
> >> SoC), so I'm not sure if it really belongs in mfd/ from an
> >> organizational standpoint?
> > 
> > There is a strong argument for all SoCs to be classed as (massive)
> > MFDs.  However seeing as they represent more of a whole platform,
> > rather than an add-on chip, we have had the sense to represent them
> > differently.  Some such submissions I have made explicit requests to be
> > moved form drivers/mfd *into* drivers/platform in the past.
> > 
> > Most SoCs are solely represented in DT, omitting the requirement for
> > subsequent device registration.  Have you considered this?  If so, why
> > does this not suit your use-case?
> 
> This driver and a subset of its sub-drivers are intended to generalize
> (via different backends, but no changes to sub-drivers) to legacy and T2
> Mac platforms, eventually superseding applesmc (which is in hwmon/
> because it started out as that, but has now grown random features and is
> quite a mess). Those are are Intel/UEFI machines and not DT platforms,
> and on those the SMC is actually a separate chip in some form (much like
> an EC).

Understood.  Fair point.

> > The long and the short of it is; if you wish to treat this device, or
> > at least a section of it, as a type of MFD, then please draft that
> > part of it as an MFD driver, residing in drivers/mfd.  If it's "not
> > really an MFD", then find another way to represent the conglomeration
> > please.
> > 
> > If the MFD route is the best, then you can register each of the
> > devices, including the *-core from drivers/mfd.  Grep for "cross-ec"
> > as a relatively recently good example.
> 
> I think cros-ec is similar enough, yeah. As long as you don't mind
> having the core codebase in mfd/ (4 files: core, rtkit backend, and
> future T2 and legacy backends) we can do that.

That's actually not what I'm suggesting.

You *only* need to move the subsequent-device-registration handling
into drivers/mfd.  The remainder really should be treated as Platform
(not to be confused with Arch Platform) code and should reside in
drivers/platform.  Just as we do with cros-ec.

-- 
Lee Jones [李琼斯]
