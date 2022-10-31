Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47936131E4
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 09:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiJaIsY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 04:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJaIsX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 04:48:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A254236
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 01:48:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9914B81189
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 08:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11608C433C1;
        Mon, 31 Oct 2022 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667206100;
        bh=3sKNWrJtlv5Pv8TRWNcsqYGUIoMFYE9I28mzkxgKNbw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E0BLJDW/T3aNynGs9jZNKrWtGNmF5NiA1+2dEz4lulEzuMbkaTsZjixFoLAOm8M4d
         FykC8WGdxComPke1VPN25OQYLnTCca1+4u5JmjlFROyFnESsBzfweH5GVCpqLw3eQ2
         WKwLPcVq6n1rGrNh6uVoIjpk8/9XAOYrL1lteCFa8gEFm/CMri8wLi0N7rfIaRbCDF
         jmSoOHA05G8icxJPQJgGQoKMxlSuC31+5JfCxZzhAefUIQaDhlqL6+jnH0eCGwwIID
         5Klcy6p6NCzp75W2jHAjoAHM5dcACPe4DQQcsgkKUnKCQ0UXR98BMAdn8ws0mVd0Ws
         2cZPPeyDwAdgQ==
Date:   Mon, 31 Oct 2022 08:48:14 +0000
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
Message-ID: <Y1+LzpEvVj7xswqb@google.com>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 29 Oct 2022, Hector Martin wrote:

> On 09/09/2022 16.50, Lee Jones wrote:
> >> What's the point of just having effectively an array of mfd_cell and
> >> wrappers to call into the mfd core in the drivers/mfd/ tree and the
> >> rest of the driver elsewhere?
> > 
> > They should be separate drivers, with MFD registering the Platform.
> 
> Why? What purpose does this serve? I'm still confused. There's one
> parent device, which provides services to the child devices. There isn't
> one parent device which wraps a platform service which is used by
> children. This makes no sense. The platform device is the root, if it
> exposes MFD services, then it has to be in that direction, not the other
> way around.
> 
> Look at how this patch series is architected. There is smc_core.c, which
> implements SMC helpers and wrappers on top of a generic backend, and
> registers with the MFD subsystem. And then there is smc_rtkit.c which is
> the actual platform implementation on top of the RTKit framework, and is
> the actual platform device entry point.
> 
> A priori, the only thing that makes sense to me right now would be to
> move smc_core.c into drivers/mfd, and leave smc_rtkit.c in platform.
> That way the mfd registration would be in drivers/mfd (as would be the
> services offered to sub-drivers), but the actual backend implementation
> would be in platform/ (and there would eventually be others, e.g. at
> least two more for x86 systems). That does mean that the driver entry
> point will be in platform/, with mfd/smc_core.c serving as effectively
> library code to plumb in the mfd stuff into one of several possible
> platform devices. Would that work for you?

Yes, sounds sensible.  However, keep all of the abstraction craziness
somewhere else and fetch and share all of your shared resources from
the MFD (SMC) driver.

-- 
Lee Jones [李琼斯]
