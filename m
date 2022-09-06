Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4461B5AF081
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 18:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238880AbiIFQf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 12:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238824AbiIFQfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 12:35:02 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09083DE4;
        Tue,  6 Sep 2022 09:10:52 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-127d10b4f19so3571296fac.9;
        Tue, 06 Sep 2022 09:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0UoPNDaC8NCrfq0xjsW8qx2SIU/bt2Qiddj8DCUAP+M=;
        b=W3n2LHsDE58CAohESlZpMYooRETwI6VQU//debaLyVg6Rglzjd/zT98NHclbTvwpEQ
         7NasgJuaoWNsQAcKy8mzjC7M4AGPNzs31k7Dk5ZHf7J7lFAgnBXLVhcCaSdH+ZZddfE7
         NF77tApbBVisw8bXTIcDmZuAy6vMNXcXaXj/OoBMMUlxHrPdVSwyBuq1hYBB9gKjdVE7
         mdtwmsYjFLCuo1LvNbCQvQVCHZIIlGoHufroxdSZRyPd0osvHftYbsJHcjATrmyuc3cf
         5F0MnLYeTw3ioY6OGOjkjBs4TSO5ZuIg7if7PH+ehhvmMGskSEqSfiNiw0NxsObE8WrW
         BKxQ==
X-Gm-Message-State: ACgBeo1r5vhrwcjqkdlr87QvO2t4rAqWwR5nJ3FkejxGTHHgj83yV0Jh
        XzQ1xTsTsqKLDb+nR/CCXg==
X-Google-Smtp-Source: AA6agR5Jt/pp6V/0cSJbLG/uZ3wRLl3rUFetLiWmtRsQju4iEwOlY/LWBZGhv3u72wd7Ebj6Z31rKA==
X-Received: by 2002:a05:6870:d354:b0:126:6b86:449d with SMTP id h20-20020a056870d35400b001266b86449dmr8005579oag.107.1662480651214;
        Tue, 06 Sep 2022 09:10:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h6-20020a9d6406000000b00636f7059b27sm6062359otl.5.2022.09.06.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:10:50 -0700 (PDT)
Received: (nullmailer pid 618747 invoked by uid 1000);
        Tue, 06 Sep 2022 16:10:49 -0000
Date:   Tue, 6 Sep 2022 11:10:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        linus.walleij@linaro.org, alyssa@rosenzweig.io,
        asahi@lists.linux.dev, brgl@bgdev.pl, marcan@marcan.st,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220906161049.GC534217-robh@kernel.org>
References: <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
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

On Tue, Sep 06, 2022 at 10:04:45AM +0100, Russell King (Oracle) wrote:
> On Fri, Sep 02, 2022 at 12:28:08PM -0500, Rob Herring wrote:
> > This one is actually pretty odd in that the child nodes don't have a 
> > compatible string which breaks the automagical probing.
> 
> I don't think that is necessarily true, and I don't think it's true in
> this case.

It is, because you are creating the devices in the driver rather than 
creating devices based on child nodes that exist.

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

Yes, and that's how MFD devices with no child nodes work. The difference 
is those get any DT info out of the parent node. Here you are presumably 
manually getting the child DT node you want for each driver.


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

I'm just looking for more information first.

> Firstly, I don't think that the number of properties in a node should
> have a bearing on the design of the DT binding - what should have a
> bearing is the logical partitioning of functionality.

It's not strictly about number of properties. Though nodes with only a 
compatible string is generally a red flag for me.

> Mark suggests that it would take six months for OpenBSD to transition to
> some other description - for example, if we merged the nodes.

The risk you take when using undocumented bindings...

> Hector says that MacOS's firmware description has the nodes merged, but
> their description is a mess.
> 
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

As I said elsewhere, sub-nodes is probably the right choice here. I 
think they need compatible strings in the child nodes, and addressing 
has to be sorted out which it seems may also break OpenBSD.

Rob
