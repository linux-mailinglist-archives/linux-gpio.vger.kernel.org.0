Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847405AE3CC
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 11:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239589AbiIFJFG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 05:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239321AbiIFJFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 05:05:03 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C998B1928A;
        Tue,  6 Sep 2022 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zD51EHbUMEGF34YrRuNppOWB4NaAsrvsQWAlBIvtq70=; b=WKZULGD3yfXwyVmbbYgw+9fy1Y
        YPu5oQIPHhCQyZBY5eJLPtRD5DE/4LTd4R3pHzvTp18gSj8Lnj0hrBT3u77EYgUAu/9VpPw2Vm+Hu
        vXBllKnTTILtAfDOzApwbLIzHe+Qnhjae7h78U9OQVq8Li0QZ1XPzj9gW3t4qIsAsNTUTyWL+8ymq
        A25EvLzvxMHuJGyX6hbfyuHJf5twn9+56foueY+7KMd37iXQ7WFKAJKGQfl7hVNAHgwMhRnRyLyGo
        d9K+x36Ipek1NL/pGvkbuN0wRaO9p1elxpXtR10UEzxnNxrNARQQKwVtNeiN6WnLXDhB9hk68QXKo
        8gC85/pQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34142)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVUVl-0003eF-S3; Tue, 06 Sep 2022 10:04:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVUVh-00088w-Rq; Tue, 06 Sep 2022 10:04:45 +0100
Date:   Tue, 6 Sep 2022 10:04:45 +0100
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
Message-ID: <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
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
> This one is actually pretty odd in that the child nodes don't have a 
> compatible string which breaks the automagical probing.

I don't think that is necessarily true, and I don't think it's true in
this case.

The SMC core driver instructs the MFD core to create devices for the
individual functional items:

static const struct mfd_cell apple_smc_devs[] = {
        {
                .name = "macsmc-gpio",
        },
        {
                .name = "macsmc-hid",
        },
        {
                .name = "macsmc-power",
        },
        {
                .name = "macsmc-reboot",
        },
        {
                .name = "macsmc-rtc",
        },
};

Since MFD uses platform devices for these, they get all the normal
functionality that these devices have, which include matching by
device name ot the driver name, and udev events being appropriately
triggered. As long as the platform drivers for these devices have the
correct modalias lines, autoloading of the modules will work and the
drivers will be correctly matched and probed.

The Asahi kernel builds most of the platform support as modules,
including these, so we know it works (if it didn't, then lots of
module autoloading would be broken on non-DT platforms.)

> > Again the separate nodes are there because the RTC and the reboot
> > functionality are logically separate and handled by different MFD
> > sub-drivers in Linux.
> 
> It's really a question of whether the subset of functionality is going 
> to get reused on its own or has its own resources in DT. MFD bindings 
> are done both ways.

I think the current position on what to do about these is that everyone
is looking for someone else to make a decision, and no one wants to!

Firstly, I don't think that the number of properties in a node should
have a bearing on the design of the DT binding - what should have a
bearing is the logical partitioning of functionality.

Mark suggests that it would take six months for OpenBSD to transition to
some other description - for example, if we merged the nodes.

Hector says that MacOS's firmware description has the nodes merged, but
their description is a mess.

The overall preference seems to be to keep the sub-nodes unless there
is a strong technical reason not to.

The feeling I am getting from the review is that there doesn't seem to
be a strong technical reason to merge the nodes - there are desires and
preferences, but nothing concrete.

So at this point, I think it would make sense if I post a v2 with all
the updates so far (sorry, given the long drawn out discussions on
this, I've lost track of what changes have been made to the code, so
I won't include a detailed change log.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
