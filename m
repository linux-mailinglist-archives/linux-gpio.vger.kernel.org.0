Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15055AB77F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 19:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbiIBR2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 13:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237053AbiIBR2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 13:28:11 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD7B6DAF1;
        Fri,  2 Sep 2022 10:28:10 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so1875978otq.11;
        Fri, 02 Sep 2022 10:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OcvzQvUSS5BtKmCuAUECPvo/XLnVbi/A8dYrn8VmGY8=;
        b=RHjmbFCQAM43ykT7EzWwuzUy4dd5i0vkSPHq2d7i1T7WrCh/DIE3lpnCw+K1JMy6iP
         8iec8uZh5BnxXYGvJwEBSogrLEjHrxk7ewHZaHvHPhbrPqDVSOYWYGlQ91m5RbA+R0OM
         fwb7+/inqGFSG9yzN+D6qtROAr3n9oAZ1fjaY4UXVtGy7YhNRi6eE+ZMKESARl6+xdiQ
         PKL7yX50cIWQW516hjaOyoMfvdKEe+l/Yw8M8mI4f2n7zU6JgMQdjzBfxim5bQCYyM+D
         rV1M6OL+oEOTNHGmDrg9kDJE6sCGqEdYsMvN9rAxkjGXdNf9+3V77yG6oOKFPLtHVaXO
         ooWw==
X-Gm-Message-State: ACgBeo0DI4A8alSYbIqrz8Jo/DineBJyebJc8HUCkfrWVzjiQf9kJ5iV
        wjqp6z2+FFA2rjTGeBLXWiL8stp1Gg==
X-Google-Smtp-Source: AA6agR6ne64hi/duoCub5KI+hVE1YPF+X4QCb+HaiW6b/UpaTprnQRbugYjsvv1s/+lraQv3IukWkA==
X-Received: by 2002:a05:6830:929:b0:63b:25ba:dfe4 with SMTP id v41-20020a056830092900b0063b25badfe4mr12145905ott.311.1662139689454;
        Fri, 02 Sep 2022 10:28:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b10-20020a05687051ca00b0011e73536301sm1389723oaj.52.2022.09.02.10.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:28:09 -0700 (PDT)
Received: (nullmailer pid 90543 invoked by uid 1000);
        Fri, 02 Sep 2022 17:28:08 -0000
Date:   Fri, 2 Sep 2022 12:28:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     linux@armlinux.org.uk, krzysztof.kozlowski@linaro.org,
        arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        marcan@marcan.st, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, sven@svenpeter.dev,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220902172808.GB52527-robh@kernel.org>
References: <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 05:06:43PM +0200, Mark Kettenis wrote:
> > From: Rob Herring <robh+dt@kernel.org>
> > Date: Thu, 1 Sep 2022 17:33:31 -0500
> > 
> > On Thu, Sep 1, 2022 at 11:47 AM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, Sep 01, 2022 at 07:25:03PM +0300, Krzysztof Kozlowski wrote:
> > > > On 01/09/2022 18:56, Russell King (Oracle) wrote:
> > > > >
> > > > > 8<===
> > > > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > > > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> > > > >  Controller
> > > > >
> > > > > Add a DT binding for the Apple Mac System Management Controller.
> > > > >
> > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > >
> > > > Yes, looks good.
> > > >
> > > > I won't add Reviewed-by tag, because I think it would confuse Patchwork,
> > > > so please send a v2 at some point.
> > >
> > > Thanks. Do you have any suggestions for patch 2? Should I merge the
> > > description in patch 2 into this file?
> > >
> > > The full dts for this series looks like this:
> > >
> > >                 smc: smc@23e400000 {
> > >                         compatible = "apple,t8103-smc", "apple,smc";
> > >                         reg = <0x2 0x3e400000 0x0 0x4000>,
> > >                                 <0x2 0x3fe00000 0x0 0x100000>;
> > >                         reg-names = "smc", "sram";
> > >                         mboxes = <&smc_mbox>;
> > >
> > >                         smc_gpio: gpio {
> > >                                 gpio-controller;
> > >                                 #gpio-cells = <2>;
> > >                         };
> > >                 };
> > >
> > > but the fuller version in the asahi linux tree looks like:
> > >
> > >                 smc: smc@23e400000 {
> > >                         compatible = "apple,t8103-smc", "apple,smc";
> > >                         reg = <0x2 0x3e400000 0x0 0x4000>,
> > >                                 <0x2 0x3fe00000 0x0 0x100000>;
> > >                         reg-names = "smc", "sram";
> > >                         mboxes = <&smc_mbox>;
> > >
> > >                         smc_gpio: gpio {
> > >                                 gpio-controller;
> > >                                 #gpio-cells = <2>;
> > 
> > Only 2 properties doesn't really need its own schema doc. However, I
> > would just move these to the parent node.
> 
> When we designed the bindings, it was our understanding that having
> separate nodes better matches Linux's MFD driver model.

Well, it is convenient to have subnodes with compatibles so that your 
drivers automagically probe. So yes, a 1:1 relationship of nodes to 
drivers is nice and tidy. But h/w is not always packaged up neatly and 
it's not DT's job to try to abstract it such that it is. Also, we 
shouldn't design bindings around the *current* driver partitioning of 
some OS.

This one is actually pretty odd in that the child nodes don't have a 
compatible string which breaks the automagical probing.

> Please be aware that OpenBSD is already using these bindings.  If
> there are good reasons for moving things, we can probably deal with
> that.  But this sounds a bit like a toss up.

Sigh. If there are other bindings in use, please submit them even if the 
Linux driver isn't ready. If a Linux subsystem maintainer doesn't want 
to take it, then I will. 

It is a toss up though...

> > >                         };
> > >
> > >                         smc_rtc: rtc {
> > >                                 nvmem-cells = <&rtc_offset>;
> > >                                 nvmem-cell-names = "rtc_offset";
> > >                         };
> > >
> > >                         smc_reboot: reboot {
> > >                                 nvmem-cells = <&shutdown_flag>, <&boot_stage>,
> > >                                         <&boot_error_count>, <&panic_count>, <&pm_setting>;
> > >                                 nvmem-cell-names = "shutdown_flag", "boot_stage",
> > >                                         "boot_error_count", "panic_count", "pm_setting";
> > 
> > Not really much reason to split these up either because you can just
> > fetch the entry you want by name.
> 
> Again the separate nodes are there because the RTC and the reboot
> functionality are logically separate and handled by different MFD
> sub-drivers in Linux.

It's really a question of whether the subset of functionality is going 
to get reused on its own or has its own resources in DT. MFD bindings 
are done both ways.

Rob
