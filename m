Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3C241897E
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 16:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhIZOhy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 10:37:54 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50141 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231743AbhIZOhy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 26 Sep 2021 10:37:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 7B45D5C00B3;
        Sun, 26 Sep 2021 10:36:17 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Sun, 26 Sep 2021 10:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=lW/rYkJ0F2t3JpsHGorY61Eep/ZJ
        GA2XMB9EG9AHjWI=; b=ZaaGGqj8Q7wLYPM2lZVph2++PnMUJA5sPYj2KS0/qB6F
        JxX0Lob1Zwh5/PC1AZ4HsL3Nd4V2Lf13DEY1kcNLA+xLj6OVg1Cke76WIFzfxCZ+
        8uDgDeok/FAvBBgRFoQtRsG0eGfjJoyW9OWyughJI0QKD3eLyKuXRwknZTGdAiqp
        EQU+QobOQaH/1kzQdgg1sRHW4mHpvV+7Rrx3Ag90hAEYudLw64i0pgHG4bQGbols
        vOUsKFk+M618vgUS0/sOSYYtX3bEGihTBFTjJlZeCmHvTZfQIYw1EM1wsWiNxHK8
        JSgljdLkR6pk7jU7xNC0uJHoxwSkLW2lu9vKQq0q8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lW/rYk
        J0F2t3JpsHGorY61Eep/ZJGA2XMB9EG9AHjWI=; b=phyQT1xgdqs4UUpg1XcGlj
        HQn9wvydrE4FWWjOTghcIxo+IgsjyFSHggaxJbJ/uBbC7Oct2GJZIRZIKLTAQdhS
        o45H7r1xthWFqiqpIoir6xOcRpfWyQ38i6UKzVPwGjKiJag4X+LoOeEfFLdWqPRa
        7pRWLDpWuawZdNvfwh0HUUEbEzCMRX8aX8RLpVX/uSSyLg+ROhSm3lTsU+65EPDI
        DLpblS95RMfBeA8Tztp8z5qr9gAeCK4BZANlt6TU/ZrjsESdzT7w8ta/OpMusy2o
        bFcfh/Era3xjnJmXH4k5ULTp6YBsbbTm5/Sp6M2SkGF+WeONFA+SJTK/MyPT6pYA
        ==
X-ME-Sender: <xms:YIVQYUBRQ9Yn38hBMhlmudOD0IyoqRVA28Fujf31trVh1G9ycFbgBw>
    <xme:YIVQYWg0n2Rt35-PrHg1FChhZol0I3b5q-mYmCUnsfhC_hPe9zBdJGXRImByV4K-Z
    Hz0TaNEpNZQ4OsbUsk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:YIVQYXkYH1hmfDR4oJmxZ8YOVq6JD8VdDqLxuMCYZBK1C8jwYRcnLw>
    <xmx:YIVQYayNqTfqMrYPiJrDgb_s8d1uZaAK-Tc5cko41S1TjvnN3ZQ5-Q>
    <xmx:YIVQYZSeTQexMnC19NRrRmMf7lmWyupMIJ0G93Zlv9ETFnZDxoXUzw>
    <xmx:YYVQYaSoXnz5WWt42MU_7eM6ezNoLHfJePsKjLNdyDwX3tqqUbzrjg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B3EED51C0060; Sun, 26 Sep 2021 10:36:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
In-Reply-To: <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
 <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
Date:   Sun, 26 Sep 2021 16:35:56 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Joey Gouly" <joey.gouly@arm.com>,
        "Andy Shevchenko" <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Hector Martin" <marcan@marcan.st>,
        "Marc Zyngier" <maz@kernel.org>,
        "Alyssa Rosenzweig" <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, "Stan Skowronek" <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
> On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
>> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:
>
>> > I think npins should be known from the compatible (we know that
>> > this version of the SoC has so and so many pins) and the base
>> > should always be 0? It's not like we have several pin controllers
>> > of this type in the SoC is it?
>>
>> I've just checked: Looks like there are four different pin controllers of
>> this type with a different number of pins each in Apple's device tree for
>> the M1.
>
> So we need to understand this hardware: is this something like
> south/north/east/west, so the pins are oriented around the chip?
>
> I would suspect they should then be compatibles:
> apple,t8103-pinctrl-north, apple,t8103-pinctrl
> apple,t8103-pinctrl-south, apple,t8103-pinctrl
> apple,t8103-pinctrl-west, apple,t8103-pinctrl
> apple,t8103-pinctrl-east, apple,t8103-pinctrl
>
> going from specific to general signifying that we know which one
> we are dealing with and then we know the npins etc.

Apple calls those four controllers "gpio", "nub-gpio", "smc-gpio"
and "aop-gpio". SMC is their system management controller and AOP
is their "always-on processor". No idea what "nub-gpio" is.

>
> This also gives a normal grouping of functions associated with
> pins and the portion of the SoC, see for
> example drivers/pinctrl/intel/pinctrl-broxton.c.
>
> This shows that it might have been a bad idea to define the
> pins as opaque, because now that is hiding the fact that
> these pins are grouped in four distinct sets.
> APPLE_PINMUX(pin, func)
>
> Should rather have been APPLE_PINMUX(cardinal, pin, func)
> where cardinal would be 0..3 for north, south, west, east.
>
> This is a bit of guessing actually, but we should definitely
> try to make the driver reflect the reality and not over-generalize.
> If these four blocks in the SoC are different, they should have
> different compatible strings, because they are not, by
> definition, compatible.

I'd prefer to have a single compatible and get the npins from some
property and I don't think that's necessarily over-generalizing.
AFAICT Apple has been using the exact same MMIO interface for years
and I'd expect them to continue using it in the future. The only thing
that seems to change is the number of pins available and their assignment.
If we just have a single compatible we can likely support the M1X/2 or
however Apple calls the next SoCs with just a simple DTB change without
touching any driver code.



Best,

Sven

