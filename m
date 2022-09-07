Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3965B00AF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 11:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiIGJjb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 05:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiIGJjX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 05:39:23 -0400
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8139FB2871;
        Wed,  7 Sep 2022 02:39:19 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id e57b84d2;
        Wed, 7 Sep 2022 11:39:16 +0200 (CEST)
Date:   Wed, 7 Sep 2022 11:39:16 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Hector Martin <marcan@marcan.st>
Cc:     robh@kernel.org, linux@armlinux.org.uk,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        linus.walleij@linaro.org, alyssa@rosenzweig.io,
        asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
In-Reply-To: <39c32c75-207c-3807-0c97-8a6bd9555b5e@marcan.st> (message from
        Hector Martin on Wed, 7 Sep 2022 03:38:09 +0900)
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <20220906161049.GC534217-robh@kernel.org>
 <91466e41-d3f7-0993-9082-80f94e53f375@marcan.st>
 <20220906173535.GA734389-robh@kernel.org> <39c32c75-207c-3807-0c97-8a6bd9555b5e@marcan.st>
Message-ID: <d3ced597b1c472c9@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Date: Wed, 7 Sep 2022 03:38:09 +0900
> From: Hector Martin <marcan@marcan.st>
> 
> On 07/09/2022 02.35, Rob Herring wrote:
> 
> > If only those 2 nodes, then I really don't care so much and gpio-sec 
> > would be fine. It's 1 node in 1 binding.
> 
> I think it might make sense to just go with this then. If Apple ever
> introduces yet another GPIO sub-controller we can just add another one,
> and honestly I don't think that's very likely, given they don't even use
> any of the GPIOs from the second one from the AP yet. I don't see SMC
> growing a big list of GPIO controllers any time soon, such that we
> regret doing it this way. And then the node-name can just map to a given
> key prefix statically in the driver, and thus we don't even need a
> property for that (gpio would be gP?? and gpio-sec gp?? right now).

We could also use a compatible property to map the key prefix.  For
example we could have "apple,smc-gpio-primary" map to gP??  and
"apple,smc-gpio-secondary" map to gp??.  Then we can keep the generic
"gpio" name for both GPIO nodes.  And if Apple introduces yet another
GPIO sub-controller we just have to invent a new compatible for it.
Probably the cleanest solution if Rob still thinks it is better for
these nodes to have a compatible property anyway.
