Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179785AED32
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 16:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240373AbiIFODQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 10:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240963AbiIFOBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 10:01:36 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F803BD3;
        Tue,  6 Sep 2022 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=McYIwfZBgzxgmWc7SJ1PwQ2CQF+LE/MZfa5qx6kR+VM=; b=IRwNSVo7beJEwiaueneipvg8OW
        sc0pBQ+v4aJUiYMQuzwldNkAcqfIMZOR0F7acW2Y/i6mWl/TXDM5FCFhpOJFnxORqUMbmVS1JKf4U
        jWq3gDA9sg9jWlrGKeIfgQazckRZw08jXrgfxBFLSAyUPfDUHZEarii9XzNha1u2pNgRLbzOqa7Ye
        WLU6WHq4ePhcmkC2WtMjOSk85yKetdMvvM4W8xeFBwDoCGNtofv6UTn+CbmW6D55izeI5+ZswDQ2v
        UySB0zn8nrdvT2s364JHK9eJJk9j8X2M78VrA4oBgzuJhCwDcSHyon86+F6YadO24urPuhhN4pUpD
        Pg0KFlMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34148)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oVYr4-0003vl-1Z; Tue, 06 Sep 2022 14:43:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oVYr3-0008JM-2I; Tue, 06 Sep 2022 14:43:05 +0100
Date:   Tue, 6 Sep 2022 14:43:05 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Hector Martin <marcan@marcan.st>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <YxdOafCWnDUNourH@shell.armlinux.org.uk>
References: <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
 <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
 <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 10:28:25PM +0900, Hector Martin wrote:
> Ultimately, we're working with a reverse engineered platform here, and
> DTs will inevitaby be incremental. But in this particular case, of
> hardware that has no known useful purpose to an OS, I don't see the
> point in gratuitously describing it. And besides, the way we set things
> up, forward-compatible DT upgrades are trivial, and no actual user on
> this platform is going to be stuck with an old DT and newer software (if
> their software supports the platform properly, and that takes more than
> the relatively trivial DT upgrade stuff anyway). I'm a lot more
> interested in getting bindings upstreamed ASAP (so we can start
> guaranteeing no backwards-compat breaks, which is important to avoid
> outright breakage) than I am in trying to be exhaustive up front with
> device instances. It's perfectly fine to say that users have to upgrade
> both their DTs and kernels to get newer hardware support, on these
> platforms.

It's also a very common process for SoCs - almost no one writes the
DT first and then writes the drivers. You always see on the mailing
list series of patches that add a driver for some bit of hardware,
along with patches adding the DT binding and the DT description.

I don't think you're doing anything different here to what is common
practice within the mainline kernel community with this approach.

The exception to that is when adding a driver for feature X in a SoC,
it's common to add all instances of X to the dtsi with ``status =
"disabled"'' and only enable the appropriate blocks on platforms that
need it.

So, for example, if a SoC has three network interfaces, all of them
identical, when adding a network driver and the bindings for the
network hardware, one would add all three to the SoC description
whether or not the platform one was working with makes use of them.

It means that one has to think about how to support all instances
of the hardware on the platform and design the binding to allow
that flexibility, rather than having to augment the binding later.

In the case of gpio-macsmc, how would we later add support for the
slave PMU GPIOs, given that these use keys "gpXX" rather than "gPxx"?
How do we tell the gpio-macsmc code to use a different set of keys?
Should DT describe the key "prefix" (in other words "gp" vs "gP"),
or should it describe it some other way. What if Apple decides to
instantiate another GPIO controller in a later platform with a
different prefix, could that be accomodated without breaking any
solution we come up today?

Maybe the solution to this would be to describe the key prefix in DT
as that's effectively its "reg". Or maybe we use "reg" to describe
it somehow (which is value of the key, which seems to have an
"address" like quality to it?)

We don't have to implement code for this now, we just need to get a
reasonably correct DT binding for the gpio controller.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
