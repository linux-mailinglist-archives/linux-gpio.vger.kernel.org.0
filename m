Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E80B3DE4E3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 06:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhHCEHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 00:07:41 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:50127 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhHCEHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 00:07:41 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id E90DD2B0114E;
        Tue,  3 Aug 2021 00:07:29 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 03 Aug 2021 00:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=Ppnjgn9uT3nmuKcO7tOFj+ln9O4wmRR
        NvfgdBYB7dI8=; b=OKHYuR8QZZlGqTrvGubS+4e0MQo1R70rVcET9ytidu7sxph
        yJt4i/gOXrrca9QRlpLIr4NrWiEI+dNx6aWV9jbF+t1pifDlnWZWYwFWzq08FP6W
        JFnZJs+QcTR339vXltq9ATJN9WIS1nsQSOp+/2CVnsTDqxX14GwcVRVtjyw0y+7a
        MUZyOiTBN6/MpcHwhtwT4T8D14ZU3McUGXMZWwvr9A929IDxtdoUcu5aFh3A/B9E
        DD1EqRncPBaRp+nm9eevBS3dkRBzH2z0RcMm1rXrSaq7cEum+BYVbs2778qA9WWb
        CxNXl+f2uix6CeRXubuWw6FoDVLukJAbSkw47Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ppnjgn
        9uT3nmuKcO7tOFj+ln9O4wmRRNvfgdBYB7dI8=; b=eaIYKV3Y5GoVbgReKh+RM2
        JGBu+L4Afj8EUiBJI3cDyRe3Jryb23kYKJMZRIJGkEfYaGy1jhvCaSaJKdwRAjps
        nC6lYM4h37UnmrhFIZJk67D1AtRO4xDJcmwbQcUZw98bbv6tSBap2Jhw9oZc3ndD
        jG843fceNArsjNPKqsa89HzJ6gujxDdjLYPRP7AH1RDlGBjH5FqbWvyLl9PaK/qx
        oa3tPvSvToJc/T+uj5LO+NKzgnvi22EKyGxMIKuhS+sA6OqGd/QtzXSIFYNbsNsY
        DCri3zyPwqWOw26Nl434ybU6EeX3LB+PgEWBj4jgmryZugkwrhvglX3/VipwmYDA
        ==
X-ME-Sender: <xms:AMEIYVLjt93FybOWFgADOALilosXVsR4f5JrWUspOxDvlhUL35q_Sg>
    <xme:AMEIYRKSFZGOCubEzXBIftEsnTEQZdSkUfiNTOilAhzQBjO-Exn9v9y4NFsArGkh7
    k_TgDlCDDdsJe0tnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieefgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:AMEIYdu1Y2NPjTkklOrZaN2uA00iHraj7UGZ4WR0bVrM8OC4tnoBcQ>
    <xmx:AMEIYWacnrv6Yz8o-MtOdRkAnWaMIgzj13hQNDaMUWMlMoVahMIAWw>
    <xmx:AMEIYcb_V0H3WIDP4K4Pb4F4YMTBu8uAWnxU6C2YZfijNAuGsp-Pfw>
    <xmx:AcEIYamiyxvRIf1TCYYqtGn9mUAjzZhuewuQ_42ivabLuCy-wfVw_wXguRs>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id EEF55AC0DD0; Tue,  3 Aug 2021 00:07:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <50aaf381-8cda-4656-9222-f23fda75d3bc@www.fastmail.com>
In-Reply-To: <CAHp75Vdx9QA7dmSWK8GHxBBxP0uYjrz=Gm=75yqaWbBX6k3v=w@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
 <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
 <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
 <CAHp75Vdx9QA7dmSWK8GHxBBxP0uYjrz=Gm=75yqaWbBX6k3v=w@mail.gmail.com>
Date:   Tue, 03 Aug 2021 13:37:07 +0930
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



On Thu, 29 Jul 2021, at 17:10, Andy Shevchenko wrote:
> On Thu, Jul 29, 2021 at 3:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Wed, 28 Jul 2021, at 18:43, Andy Shevchenko wrote:
> > > On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > However, userspace would never have
> > > > got the results it expected with the existing driver implementation, so
> > > > I guess you could argue that no such (useful) userspace exists. Given
> > > > that, we could adopt the strategy of always defining a gpiochip
> > > > covering the whole pin space, and parts of the devicetree binding just
> > > > become redundant.
> > >
> > > I'm lost now. GPIO has its own userspace ABI, how does it work right
> > > now in application to this chip?
> >
> > As above, it "works" if the GPIOs specified in the devicetree are
> > contiguous from line 0. It's broken if they're not.
> 
> So, "it never works" means there is no bug. Now, what we need is to
> keep the same enumeration scheme, but if you wish to be used half/half
> (or any other ratio), the driver should do like the above mentioned
> PWM, i.e. register entire space and depending on the requestor either
> proceed with a line or mark it as BUSY.
> 
> Ideally, looking into what the chip can do, this should be indeed
> converted to some like pin control + PWM + LED + GPIO drivers. Then
> the function in pin mux configuration can show what exactly is enabled
> on the certain line(s).

So just to clarify, you want both solutions here?

1. A gpiochip that covers the entire pin space
2. A pinmux implementation that manages pin allocation to the different drivers

In that case we can largely leave this series as is? We only need to 
adjust how we configure the gpiochip by dropping the pin-mapping 
implementation?

I don't have a need to implement a PWM driver for it right now but that 
would make sense to do at some point.

Andrew
