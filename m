Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4DC3DFACE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 06:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234530AbhHDE4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 00:56:06 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:42167 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230120AbhHDE4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 00:56:06 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2555D580CD5;
        Wed,  4 Aug 2021 00:55:53 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Wed, 04 Aug 2021 00:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=9XjffQmF6lTmPHU66jetoLIN3u8J1m8
        62Uw9vnKlA8U=; b=KEYAHsc7/Zz52/TQ4WT3Z6jBls0MTldF773h9oaPwKchwZ0
        N1FrHfGMEcUwEccHBsX6RvKkXbopJlA07+lgWvHJi4NeWihGoAG8L87Xd0gaD7mL
        FbHxC9YVA4eQ1+JbfpQsefhi22JgclmXKdYN0P2zdrEBmWJLCiwtW8mP+LhkhJXF
        GlvUFbLkrUrrBwvDR13kf4iz41JeIW5n/wGZCFwoNcCmh5Mc81/nC7n7ppFx63B0
        JxT+Q9IuxNI3DLx5j8sqY3u9snX+SwDk1nL6ChmAW8RRtB8m3PiKT9Hvu4nxRM4u
        7hYsXsId8PeB66Qq19MuDsIF/DDED10P7f02ODg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9XjffQ
        mF6lTmPHU66jetoLIN3u8J1m862Uw9vnKlA8U=; b=ZxzFla7EaW9oEpDm+JIdwg
        lcXeQNPwXLXqoT8qYo0AaSIx7Sx9miunUosC/EsbRgYESV0O0Ot4qyYNxQ5KgqiO
        QIfAHk2GJb4KQfs7bXfGqit1IaS7GRkgFqfONPGsCdH4KScEvf482INENvICluFT
        3S0LI6cBWmORoMtfUvRC5ohxXbCS9s8I7tBi5hEnNaucOuKOdXKgC5Xg5obNsEtV
        KcfqRUjAPMGJ8j3zDROzdzyBj4deg5cwXLlQAaiKGuZPYdM+R61XL7b8D4W6SaOd
        dL1NAxy7LNdmq2Wgw8oyVjOQV/PGAXmq2aP7r7Ht1m1me3YVYospirMT2tv73KUg
        ==
X-ME-Sender: <xms:1x0KYWYZ8ZwUT8UPCwBLl8E2p5rQZ3a1Hope9SwuGzes8SV0yuD1PQ>
    <xme:1x0KYZaQd5Xz4YZTsIzdBxao5UTGreaoQHn5dmxHmBXFGJmOo5ibg8pNIUYhbKQF9
    zmOtYTrZvX8nnzGGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1x0KYQ-sd2UceScNSdev8sqTDC0WBWlQwDrtX5ro7oZqb_mLwo5bPQ>
    <xmx:1x0KYYooQZ3T4FOk7yLj4rvtT6g7mu4xmjVi_2kBp5ZHlxGkMpuGvQ>
    <xmx:1x0KYRoDpsbMbqMtt8VNckBoUMKAvh4L3wI0xaQVnviFTsurTFBfxw>
    <xmx:2R0KYc1_eatSt-l3OoCThU2itCTipOki1yIJO2pKl6xwCjlE_zZ1RQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 01223AC0DD0; Wed,  4 Aug 2021 00:55:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <7c20e892-1675-47b6-874f-5e42e7bd73ef@www.fastmail.com>
In-Reply-To: <CAHp75Ve-6zKE9UX+LR022cGAA6xvd8CeLnnKE_fT3snnzmNusA@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
 <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
 <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
 <CAHp75Vdx9QA7dmSWK8GHxBBxP0uYjrz=Gm=75yqaWbBX6k3v=w@mail.gmail.com>
 <50aaf381-8cda-4656-9222-f23fda75d3bc@www.fastmail.com>
 <CAHp75Ve-6zKE9UX+LR022cGAA6xvd8CeLnnKE_fT3snnzmNusA@mail.gmail.com>
Date:   Wed, 04 Aug 2021 14:25:29 +0930
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



On Tue, 3 Aug 2021, at 20:03, Andy Shevchenko wrote:
> On Tue, Aug 3, 2021 at 7:07 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 29 Jul 2021, at 17:10, Andy Shevchenko wrote:
> > > On Thu, Jul 29, 2021 at 3:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > On Wed, 28 Jul 2021, at 18:43, Andy Shevchenko wrote:
> > > > > On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > > > However, userspace would never have
> > > > > > got the results it expected with the existing driver implementation, so
> > > > > > I guess you could argue that no such (useful) userspace exists. Given
> > > > > > that, we could adopt the strategy of always defining a gpiochip
> > > > > > covering the whole pin space, and parts of the devicetree binding just
> > > > > > become redundant.
> > > > >
> > > > > I'm lost now. GPIO has its own userspace ABI, how does it work right
> > > > > now in application to this chip?
> > > >
> > > > As above, it "works" if the GPIOs specified in the devicetree are
> > > > contiguous from line 0. It's broken if they're not.
> > >
> > > So, "it never works" means there is no bug. Now, what we need is to
> > > keep the same enumeration scheme, but if you wish to be used half/half
> > > (or any other ratio), the driver should do like the above mentioned
> > > PWM, i.e. register entire space and depending on the requestor either
> > > proceed with a line or mark it as BUSY.
> > >
> > > Ideally, looking into what the chip can do, this should be indeed
> > > converted to some like pin control + PWM + LED + GPIO drivers. Then
> > > the function in pin mux configuration can show what exactly is enabled
> > > on the certain line(s).
> >
> > So just to clarify, you want both solutions here?
> >
> > 1. A gpiochip that covers the entire pin space
> > 2. A pinmux implementation that manages pin allocation to the different drivers
> >
> > In that case we can largely leave this series as is? We only need to
> > adjust how we configure the gpiochip by dropping the pin-mapping
> > implementation?
> 
> Nope. It's far from what I think of. Re-reading again your cover
> letter it points out that pin mux per se does not exist in the
> hardware. In this case things become a bit too complicated, but we
> still may manage to handle them. Before I was thinking about this
> hierarchy
> 
> 1. pinmux driver (which is actually the main driver here)
> 2. LED driver (using regmap API)
> 3. GPIO driver (via gpio-regmap)
> 4. PWM driver.

Okay - I need to look at gpio-regmap, this wasn't something I was aware 
of.

> 
> Now what we need here is some kind of "virtual" pinmux. Do I
> understand correctly?

Possibly. My thoughts went to pinctrl as part of its job is mutual 
exclusion *and* pin mapping, plus we get the nice debugfs interface 
with the pin allocation details. The need for pin mapping came from 
trying to stay true to the intent of the existing devicetree binding. 
If we throw that out and have the gpiochip cover the pin space for the 
chip then using pinctrl only gives us mutual exclusion and the debugfs 
interface. pinctrl seems pretty heavy-weight to use *just* for mutual 
exclusion - with no requirement for pin mapping I feel whether or not 
we go this way hinges on the utility of debugfs.

As outlined earlier, there's no mux hardware, the only thing that 
changes is software's intent.

> 
> To be clear: I do not like putting everything into one driver when the
> logical parts may be separated.

Right, its already a bit unwieldy.

Andrew
