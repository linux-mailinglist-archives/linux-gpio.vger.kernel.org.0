Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9F65AEE92
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 17:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbiIFPWB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 11:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbiIFPVh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 11:21:37 -0400
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E4E98370;
        Tue,  6 Sep 2022 07:33:36 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id c29ccd8f;
        Tue, 6 Sep 2022 16:25:49 +0200 (CEST)
Date:   Tue, 6 Sep 2022 16:25:49 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux@armlinux.org.uk, linus.walleij@linaro.org, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
In-Reply-To: <f5bef359-3abe-311c-3521-136eb5b54c4b@marcan.st> (message from
        Hector Martin on Tue, 6 Sep 2022 22:53:47 +0900)
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
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
 <YxdOafCWnDUNourH@shell.armlinux.org.uk> <f5bef359-3abe-311c-3521-136eb5b54c4b@marcan.st>
Message-ID: <d3ced0ffaec45e3c@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Date: Tue, 6 Sep 2022 22:53:47 +0900
> From: Hector Martin <marcan@marcan.st>
> 
> On 06/09/2022 22.43, Russell King (Oracle) wrote:
> > In the case of gpio-macsmc, how would we later add support for the
> > slave PMU GPIOs, given that these use keys "gpXX" rather than "gPxx"?
> > How do we tell the gpio-macsmc code to use a different set of keys?
> > Should DT describe the key "prefix" (in other words "gp" vs "gP"),
> > or should it describe it some other way. What if Apple decides to
> > instantiate another GPIO controller in a later platform with a
> > different prefix, could that be accomodated without breaking any
> > solution we come up today?
> > 
> > Maybe the solution to this would be to describe the key prefix in DT
> > as that's effectively its "reg". Or maybe we use "reg" to describe
> > it somehow (which is value of the key, which seems to have an
> > "address" like quality to it?)
> > 
> > We don't have to implement code for this now, we just need to get a
> > reasonably correct DT binding for the gpio controller.
> 
> I agree that this is something to think about (I was about to reply on
> the subject).
> 
> I can think of two ways: using `reg` for the key name, but that feels
> icky since it's ASCII and not *really* a register number/address, or
> something like this:
> 
> gpio@0 {
> 	apple,smc-key-base = "gP00";
> 	...
> }
> 
> gpio@1 {
> 	apple,smc-key-base = "gp00";
> 	...
> }

This would still require us to add a (one-cell) "reg" property and
would require adding the appropriate "#address-cells" and
"#size-cells" properties to the SMC node.

> But this ties back to the device enumeration too, since right now the DT
> does not drive that (we'd have to add the subdevice to the mfd subdevice
> list somehow anyway, if we don't switch to compatibles).
> 
> I'd love to hear Rob's opinion on this one, and also whether the
> existing Linux and OpenBSD code would currently find gpio@0 {} instead
> of gpio {} for backwards compat.

The OpenBSD driver does a lookup by name and the "@0" is part of that
name.  So that would break backwards compat.

Maybe just name the slave GPIO controller "gpio-slave"?  If we add
compatibles, the compatibles for the nodes should propbably be
different such that we can switch to do a lookup by compatible?
