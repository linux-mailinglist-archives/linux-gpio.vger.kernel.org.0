Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946D75AB620
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237729AbiIBQAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 12:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237754AbiIBQA0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 12:00:26 -0400
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544CA7E81C;
        Fri,  2 Sep 2022 08:06:45 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 1932c934;
        Fri, 2 Sep 2022 17:06:43 +0200 (CEST)
Date:   Fri, 2 Sep 2022 17:06:43 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     linux@armlinux.org.uk, krzysztof.kozlowski@linaro.org,
        arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        marcan@marcan.st, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, sven@svenpeter.dev,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
        (message from Rob Herring on Thu, 1 Sep 2022 17:33:31 -0500)
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org> <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org> <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org> <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org> <YxDiBFIn6artUOZm@shell.armlinux.org.uk> <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
Message-ID: <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Rob Herring <robh+dt@kernel.org>
> Date: Thu, 1 Sep 2022 17:33:31 -0500
> 
> On Thu, Sep 1, 2022 at 11:47 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, Sep 01, 2022 at 07:25:03PM +0300, Krzysztof Kozlowski wrote:
> > > On 01/09/2022 18:56, Russell King (Oracle) wrote:
> > > >
> > > > 8<===
> > > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> > > >  Controller
> > > >
> > > > Add a DT binding for the Apple Mac System Management Controller.
> > > >
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > >
> > > Yes, looks good.
> > >
> > > I won't add Reviewed-by tag, because I think it would confuse Patchwork,
> > > so please send a v2 at some point.
> >
> > Thanks. Do you have any suggestions for patch 2? Should I merge the
> > description in patch 2 into this file?
> >
> > The full dts for this series looks like this:
> >
> >                 smc: smc@23e400000 {
> >                         compatible = "apple,t8103-smc", "apple,smc";
> >                         reg = <0x2 0x3e400000 0x0 0x4000>,
> >                                 <0x2 0x3fe00000 0x0 0x100000>;
> >                         reg-names = "smc", "sram";
> >                         mboxes = <&smc_mbox>;
> >
> >                         smc_gpio: gpio {
> >                                 gpio-controller;
> >                                 #gpio-cells = <2>;
> >                         };
> >                 };
> >
> > but the fuller version in the asahi linux tree looks like:
> >
> >                 smc: smc@23e400000 {
> >                         compatible = "apple,t8103-smc", "apple,smc";
> >                         reg = <0x2 0x3e400000 0x0 0x4000>,
> >                                 <0x2 0x3fe00000 0x0 0x100000>;
> >                         reg-names = "smc", "sram";
> >                         mboxes = <&smc_mbox>;
> >
> >                         smc_gpio: gpio {
> >                                 gpio-controller;
> >                                 #gpio-cells = <2>;
> 
> Only 2 properties doesn't really need its own schema doc. However, I
> would just move these to the parent node.

When we designed the bindings, it was our understanding that having
separate nodes better matches Linux's MFD driver model.

Please be aware that OpenBSD is already using these bindings.  If
there are good reasons for moving things, we can probably deal with
that.  But this sounds a bit like a toss up.

> 
> >                         };
> >
> >                         smc_rtc: rtc {
> >                                 nvmem-cells = <&rtc_offset>;
> >                                 nvmem-cell-names = "rtc_offset";
> >                         };
> >
> >                         smc_reboot: reboot {
> >                                 nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> >                                         <&boot_error_count>, <&panic_count>, <&pm_setting>;
> >                                 nvmem-cell-names = "shutdown_flag", "boot_stage",
> >                                         "boot_error_count", "panic_count", "pm_setting";
> 
> Not really much reason to split these up either because you can just
> fetch the entry you want by name.

Again the separate nodes are there because the RTC and the reboot
functionality are logically separate and handled by different MFD
sub-drivers in Linux.

> How confident are the asahi folks that this is a complete binding?

There is a lot of functionality in the SMC that is still largely
unexplored.  The idea of the design of the binding is that additional
functionality may be added by adding more subnodes to the smc node.
But we expect that the main SMC node itself should be complete with
the "smc" and "sram" regions and the reference to the mailbox.

Cheers,

Mark
