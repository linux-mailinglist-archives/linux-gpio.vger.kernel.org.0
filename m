Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833D93D873D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 07:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhG1Fnu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 01:43:50 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51021 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229814AbhG1Fnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 01:43:49 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 110B858075E;
        Wed, 28 Jul 2021 01:43:48 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Wed, 28 Jul 2021 01:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=8mTsTAru489HGgVKdhQ8Pd5T2sBSOVb
        +V3PjJK0kxrE=; b=Bql/f7NSgB8BpjW+EMx4py9cvlE5UW14bPWU/99jy2DAAHq
        JhDXy/kIGxAQ4SD5IPJj/ctT4bjGtCSO9HfRoHUVK8qt4ryjshwcLHrR+kJi49J6
        oNwqkoRQh9Qdl1Iozc0HLAVkfQR9Tec4+LvNEHwlvFkzuhKrwJwEZqXDLxZS9tcY
        TK1BGtbzxSkKz71LDy/p7MoOBWVp4ooD3PbPzK5EbPLwKTFwbULELBNS1fB84gig
        MXpmJMgdUcSSkbq597CZ+choHZvuFYwT3zMBt8XpndRX+VCLiwdvBhFPWK4ia9EP
        H6WTnHNT4i1xj8msdRq9VkbtdYpneDraL46CZrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8mTsTA
        ru489HGgVKdhQ8Pd5T2sBSOVb+V3PjJK0kxrE=; b=SDMIgFrZ3Ikjjmhf4nBd2K
        efRFbPHc/AnxB0s23kJ3Lu8RhP2R48XcKGMedP8MxrdxPark4GX/OQG0nKnlRR1L
        FklLr5tYPP5dyrYgKvClgVyC2xERuWqELsP2kBifOeY3uI8QtdCoG6VE5oIPvged
        i4qKQpTYVycyZllvhDwhQg/O0gVzKEuc0UdRCO63Kq8ZnhPsegmrQMttER7Ub1Rv
        B4VmRF4KVtXraJfKAdet0AgGvskylMqNiZABqu54mzekqfgojHXP83KwqFwot5T2
        AOHbjDQ2a/6oaUGXPlsUlR8iODZzTnM7czIyLVoVyMXzYyBb27lTK0yX/SCKkmCw
        ==
X-ME-Sender: <xms:ke4AYfNn-XlVWvWxZMkukETnWRJQSjYLNvdhDStlxOOC__6TLVkZkQ>
    <xme:ke4AYZ-wj9g1NdtglQrSD4gSsoRba-DpSo35aM3UM6tPJiSCenRJo4BZwaIaC6_z8
    6A9baF55IvSaFIRfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeekgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ke4AYeRl0fmJ2MUX9vcWQ4MxoR7Uvf0AvK9p1msLXqzVHLXcuj-tyg>
    <xmx:ke4AYTumxmpL-iNc5tAaRNzs-9HCY2yOgvaEEez24JQhlJql1j412Q>
    <xmx:ke4AYXeNlZQS5pOqBGNdKgZ-a26Qf0whlVX0yC2RSPpkmC40U4ZJVQ>
    <xmx:lO4AYb7LjTl9DtFs_Mcm45ridCpbFUsDyQSmJVrMEgnbrXb0hzXc9g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9CBAFAC0DD0; Wed, 28 Jul 2021 01:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-545-g7a4eea542e-fm-20210727.001-g7a4eea54
Mime-Version: 1.0
Message-Id: <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
In-Reply-To: <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
Date:   Wed, 28 Jul 2021 15:13:24 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>, "Pavel Machek" <pavel@ucw.cz>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/6] leds: Fix pca955x GPIO pin mappings
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 23 Jul 2021, at 17:45, Andy Shevchenko wrote:
> 
> 
> On Friday, July 23, 2021, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Hello,
> > 
> > This series does a bunch of crimes, so it's an RFC. I'm cross-posting to the
> > pinctrl/GPIO and LEDs lists because the PCA955x devices impact all of them. What
> > needs fixing is the leds-pca955x driver's failure to map the GPIO numberspace to
> > the pin numberspace of the PCA955x devices. The series solves that by
> > implementing pinctrl and pinmux in the leds-pca955x driver.
> > 
> > Things I'm unsure about:
> > 
> > 1. Patch 1: The pinctrl_gpio_as_pin() API feels a bit dirty, not sure what
> >    others thoughts are on that (Linus?).
> > 
> > 2. Patch 2: I've added a new callback to hook the entirety of the pinctrl map
> >    parsing rather than supplying a subnode-specific callback. This was necessary
> >    to handle the PCA955x devicetree binding in a backwards compatible way.
> > 
> > 3. Patch 4: The PCA955x devices don't actually have any pinmux hardware, but the
> >    properties of the pinctrl/pinmux subsystems in the kernel map nicely onto the
> >    problem we have. But it's quite a bit of code...
> > 
> > 4. Patch 6: I also lost a bunch of time to overlooking the get_group_pins()
> >    callback for pinctrl, and it seems odd to me that it isn't required.
> > 
> > Please review!
> 
> 
> Sounds like a hack.

Yes, possibly. Feedback like this is why I sent the series as an RFC.

> I was briefly looking into patches 1-4 and suddenly 
> realized that the fix can be similar as in PCA9685 (PWM), I.e. we 
> always have chips for the entire pin space and one may map them 
> accordingly, requested in one realm (LED) in the other (GPIO) 
> automatically is BUSY. Or I missed the point?

No, you haven't missed the point. I will look at the PCA9685 driver.

That said, my goal was to implement the behaviour intended by the 
existing binding (i.e. fix a bug). However, userspace would never have 
got the results it expected with the existing driver implementation, so 
I guess you could argue that no such (useful) userspace exists. Given 
that, we could adopt the strategy of always defining a gpiochip 
covering the whole pin space, and parts of the devicetree binding just 
become redundant.

Andrew
