Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082CA418EC1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 07:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbhI0Frr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 01:47:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41801 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232594AbhI0Frq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Sep 2021 01:47:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 981A25C00E2;
        Mon, 27 Sep 2021 01:46:08 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Mon, 27 Sep 2021 01:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=ve+o2TpT1Z9PtE/NHBe/YrUz27po
        l7XQHbYlxupqpzI=; b=jHRBPL06iyyUv8ZY6Ji6u2nu9BsXhbYes5HG60KX6u6o
        nkYwTGQ5HAyItXGtJC7mCypA1OO+tP++ObRQy8kP6bmgd/5L36ld8B0zpll4W3nx
        mzDdSStT70uWR52qLnqejrvFD11X8N5VZ7UvrxPZ2rJuXkfksFaJIRDZITDt6xfq
        PG378vfk630YjEcFfrn1kdlN8MlPovzGJ7tTuAqWLX6pyYUpCqBxJDv+x4DoiWqO
        XbJQs0jAaoV/iEmmKxcM4uOZsj0n8MY4SfORbmQSfOkK32rdSBOvQPuZe14nqH8V
        cJl2I6XVwNqYmJlsiU1RYSPMiERER5oVMc5kRunIFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ve+o2T
        pT1Z9PtE/NHBe/YrUz27pol7XQHbYlxupqpzI=; b=Vm4tKpqDMKwbJ+N7p4tJ1J
        jyN5M2xw5CMbEAX8Lck7AP+i83dJ9+Sss95N43xTmGotqNJUANv/U/xAGe6XGcUC
        YjWC0BLRV9gXcy/rNEcPo40eQ7o3O2yAQ/36MUqDzI3/4P4k2LGdB8RL1Sef2MI4
        YO1MFXkBSG9m2XvgrNAXT8fA29Ss4+QNqp+eJErbp5ieCbMrbQhI0h5iKMRK3yd/
        eW0Y6IzMzI5cbjPmCWT6pTDOyD5P7JL+pbE9vchFUQkcw+u9bVwP2gIfXQkaiN9O
        4NogJ4/hBoow3M57pmGF3pP1u5VVQBzyW4fGL4YLudemOAVhdtg/++HlQMhGomqA
        ==
X-ME-Sender: <xms:oFpRYd5LmKPVTMZkGdsiaP4AMWPWlAOMfLkbCMtvJKz4xbPpWnyWLA>
    <xme:oFpRYa7dnzhRpWQYbkw-5PFIiL_v2zUaySy0ftT-9s7Ks22gTEAvNXKvIYMyD8EQs
    ddTdYtK0hAiynxXTvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:oFpRYUcPBPWU0zBjJb4K9BcyvvpBKbLw1Urab0jchPy_rgkRGXrAJA>
    <xmx:oFpRYWK3y-R_glLqdh8UfvWAOljtEFmUyBCAfue9LCAzuh51_3UI2Q>
    <xmx:oFpRYRLlGri8eN82KqTkc21xSxpyXfwMCgkD_uvfJtjfryJB2EIRFw>
    <xmx:oFpRYWovlEW0JGf8FzuyAu0mnlO4cFOIkPM4P9gActveQNkV8sjUjw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2B42D51C0060; Mon, 27 Sep 2021 01:46:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <79b0a69f-bb30-4f7d-afbd-8d635870f6b3@www.fastmail.com>
In-Reply-To: <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
 <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
 <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
Date:   Mon, 27 Sep 2021 07:45:47 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
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

Hi Andy,

On Sun, Sep 26, 2021, at 18:28, Andy Shevchenko wrote:
> On Sun, Sep 26, 2021 at 5:36 PM Sven Peter <sven@svenpeter.dev> wrote:
>> On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
>> > On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
>> >> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:
>> >
>> >> > I think npins should be known from the compatible (we know that
>> >> > this version of the SoC has so and so many pins) and the base
>> >> > should always be 0? It's not like we have several pin controllers
>> >> > of this type in the SoC is it?
>> >>
>> >> I've just checked: Looks like there are four different pin controllers of
>> >> this type with a different number of pins each in Apple's device tree for
>> >> the M1.
>> >
>> > So we need to understand this hardware: is this something like
>> > south/north/east/west, so the pins are oriented around the chip?
>> >
>> > I would suspect they should then be compatibles:
>> > apple,t8103-pinctrl-north, apple,t8103-pinctrl
>> > apple,t8103-pinctrl-south, apple,t8103-pinctrl
>> > apple,t8103-pinctrl-west, apple,t8103-pinctrl
>> > apple,t8103-pinctrl-east, apple,t8103-pinctrl
>> >
>> > going from specific to general signifying that we know which one
>> > we are dealing with and then we know the npins etc.
>>
>> Apple calls those four controllers "gpio", "nub-gpio", "smc-gpio"
>> and "aop-gpio". SMC is their system management controller and AOP
>> is their "always-on processor". No idea what "nub-gpio" is.
>
> It's similar to what we have in Baytrail/Cherrytrail.
> AOP -> SUS
> SMC -> ...

Interesting! I'll take a look at those.
 
>
> nub is probably related to some type of hub (or maybe simple typo, or
> typo on purpose?).
>
>> > This also gives a normal grouping of functions associated with
>> > pins and the portion of the SoC, see for
>> > example drivers/pinctrl/intel/pinctrl-broxton.c.
>> >
>> > This shows that it might have been a bad idea to define the
>> > pins as opaque, because now that is hiding the fact that
>> > these pins are grouped in four distinct sets.
>> > APPLE_PINMUX(pin, func)
>> >
>> > Should rather have been APPLE_PINMUX(cardinal, pin, func)
>> > where cardinal would be 0..3 for north, south, west, east.
>> >
>> > This is a bit of guessing actually, but we should definitely
>> > try to make the driver reflect the reality and not over-generalize.
>> > If these four blocks in the SoC are different, they should have
>> > different compatible strings, because they are not, by
>> > definition, compatible.
>>
>> I'd prefer to have a single compatible and get the npins from some
>> property and I don't think that's necessarily over-generalizing.
>> AFAICT Apple has been using the exact same MMIO interface for years
>> and I'd expect them to continue using it in the future. The only thing
>> that seems to change is the number of pins available and their assignment.
>> If we just have a single compatible we can likely support the M1X/2 or
>> however Apple calls the next SoCs with just a simple DTB change without
>> touching any driver code.
>
> Hmm... Dunno the details, but at least AOP GPIO is definitely ca[able
> of waking a system from a deep sleep (that's what SUS == suspend do on
> Intel). Haven't checked if you implemented ->irq_set_wake() callbacks,
> though.

I don't think Joey implemented the set_wake callback because we didn't
even consider that the AOP GPIOs might be able to wake the system from
deep sleep. I'll see if I can figure out some details about that though.

>
> And I don't know if the pin's in the rest of the GPIO blocks have the
> wake-source capable pins. Also I don't know if it's fine to have one
> compatible string if you really know that the difference is the amount
> of pins and nothing else (like crucial properties being changed).

Yeah, I don't know either. Another thing we could do is have the base
compatible just support the maximum number of pins supported by the MMIO
space and only limit that (and possibly add wake-capable pins or other
different properties if there are any) for the more specific ones.


Best,


Sven
