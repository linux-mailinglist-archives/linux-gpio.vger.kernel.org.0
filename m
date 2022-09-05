Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD285AD02E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 12:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbiIEKZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 06:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236567AbiIEKZB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 06:25:01 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB54814D2F;
        Mon,  5 Sep 2022 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Fx28UOsSvH4MjK0P6e/lkru9jES4iAyQYx/abCtTww0=; b=TgExdecxMkIapzTP3KS526IqbL
        9/tTNyvAYE8mdw/94pFs5NdiUw+GmIaoAA3IzVIa1/ApB/wJPOrzy6Ye/44uPjUPgla5HUKMhY7Ia
        CRsJ7MdcKKegAdqjSb8bLRkCG+sQKJerQKpqBTt38mW0zUyUNaOnxP85Sqy0oMpN99B6yl1g8d0Ag
        gM/yghzFwL+S/Psku9onJEwnlPz/iLeSVduKWrIW+r4OOXCjqslhqDkkqhj0E4zzKm99p4UjfNqYu
        XV94Mo1Mud52zRXEYbv1QTkr+96jtQKrA4dZEWzAnnkGIiH6ZwrdpsxHb9ySo70vezjIryMS5MM4o
        bW/3WHGg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34100)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oV9He-0002Bw-A1; Mon, 05 Sep 2022 11:24:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oV9Hd-0007Cc-Eb; Mon, 05 Sep 2022 11:24:49 +0100
Date:   Mon, 5 Sep 2022 11:24:49 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        linus.walleij@linaro.org, alyssa@rosenzweig.io,
        asahi@lists.linux.dev, brgl@bgdev.pl, marcan@marcan.st,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <YxXOcYwH6PT1T9V5@shell.armlinux.org.uk>
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902172808.GB52527-robh@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 12:28:08PM -0500, Rob Herring wrote:
> On Fri, Sep 02, 2022 at 05:06:43PM +0200, Mark Kettenis wrote:
> > > From: Rob Herring <robh+dt@kernel.org>
> > > Date: Thu, 1 Sep 2022 17:33:31 -0500
> > > 
> > > On Thu, Sep 1, 2022 at 11:47 AM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Thu, Sep 01, 2022 at 07:25:03PM +0300, Krzysztof Kozlowski wrote:
> > > > > On 01/09/2022 18:56, Russell King (Oracle) wrote:
> > > > > >
> > > > > > 8<===
> > > > > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > > > > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> > > > > >  Controller
> > > > > >
> > > > > > Add a DT binding for the Apple Mac System Management Controller.
> > > > > >
> > > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > >
> > > > > Yes, looks good.
> > > > >
> > > > > I won't add Reviewed-by tag, because I think it would confuse Patchwork,
> > > > > so please send a v2 at some point.
> > > >
> > > > Thanks. Do you have any suggestions for patch 2? Should I merge the
> > > > description in patch 2 into this file?
> > > >
> > > > The full dts for this series looks like this:
> > > >
> > > >                 smc: smc@23e400000 {
> > > >                         compatible = "apple,t8103-smc", "apple,smc";
> > > >                         reg = <0x2 0x3e400000 0x0 0x4000>,
> > > >                                 <0x2 0x3fe00000 0x0 0x100000>;
> > > >                         reg-names = "smc", "sram";
> > > >                         mboxes = <&smc_mbox>;
> > > >
> > > >                         smc_gpio: gpio {
> > > >                                 gpio-controller;
> > > >                                 #gpio-cells = <2>;
> > > >                         };
> > > >                 };
> > > >
> > > > but the fuller version in the asahi linux tree looks like:
> > > >
> > > >                 smc: smc@23e400000 {
> > > >                         compatible = "apple,t8103-smc", "apple,smc";
> > > >                         reg = <0x2 0x3e400000 0x0 0x4000>,
> > > >                                 <0x2 0x3fe00000 0x0 0x100000>;
> > > >                         reg-names = "smc", "sram";
> > > >                         mboxes = <&smc_mbox>;
> > > >
> > > >                         smc_gpio: gpio {
> > > >                                 gpio-controller;
> > > >                                 #gpio-cells = <2>;
> > > 
> > > Only 2 properties doesn't really need its own schema doc. However, I
> > > would just move these to the parent node.
> > 
> > When we designed the bindings, it was our understanding that having
> > separate nodes better matches Linux's MFD driver model.
> 
> Well, it is convenient to have subnodes with compatibles so that your 
> drivers automagically probe. So yes, a 1:1 relationship of nodes to 
> drivers is nice and tidy. But h/w is not always packaged up neatly and 
> it's not DT's job to try to abstract it such that it is. Also, we 
> shouldn't design bindings around the *current* driver partitioning of 
> some OS.
> 
> This one is actually pretty odd in that the child nodes don't have a 
> compatible string which breaks the automagical probing.
> 
> > Please be aware that OpenBSD is already using these bindings.  If
> > there are good reasons for moving things, we can probably deal with
> > that.  But this sounds a bit like a toss up.
> 
> Sigh. If there are other bindings in use, please submit them even if the 
> Linux driver isn't ready. If a Linux subsystem maintainer doesn't want 
> to take it, then I will. 
> 
> It is a toss up though...
> 
> > > >                         };
> > > >
> > > >                         smc_rtc: rtc {
> > > >                                 nvmem-cells = <&rtc_offset>;
> > > >                                 nvmem-cell-names = "rtc_offset";
> > > >                         };
> > > >
> > > >                         smc_reboot: reboot {
> > > >                                 nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> > > >                                         <&boot_error_count>, <&panic_count>, <&pm_setting>;
> > > >                                 nvmem-cell-names = "shutdown_flag", "boot_stage",
> > > >                                         "boot_error_count", "panic_count", "pm_setting";
> > > 
> > > Not really much reason to split these up either because you can just
> > > fetch the entry you want by name.
> > 
> > Again the separate nodes are there because the RTC and the reboot
> > functionality are logically separate and handled by different MFD
> > sub-drivers in Linux.
> 
> It's really a question of whether the subset of functionality is going 
> to get reused on its own or has its own resources in DT. MFD bindings 
> are done both ways.

I'm guessing this series is blocked until a resolution is found for the
DT binding description.

Please can the Asahi folk and the DT maintainers sort this out and let
me know when I can proceed with this patch set. I'm just the man in
the middle here.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
