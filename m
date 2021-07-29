Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BC93D9A26
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 02:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhG2AjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 20:39:05 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:52007 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232869AbhG2AjF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 20:39:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8E791580B8B;
        Wed, 28 Jul 2021 20:39:02 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Wed, 28 Jul 2021 20:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=9IbRewnClnxS9l6M0pLMy55dQydOlsR
        xDHwEOF66KXI=; b=Y8OPiiCMQOcWR0PaHgRUdivy2vn7o5sC0L9P8l6kXbF/7Da
        GOQsKQAAWau//gDQx5K4oOJi/HlK764Cvi+/YBzEa3+QsM57yHQcWjLlbsBTU7MF
        22INHIUPBbLxej0hrxshMfT3UYfWEt8UotwUfpLN27Bcuehhum8VGOV1roN7OD6B
        hG8Ka1CoHkO5xCaOYGFumXqHeRClfVsfTQtWeXcu3It7hMV9XjsiV3llnO9Tey0U
        vSeWSmQcmswmYHKDTtjhofV+IfkrutvUoXbfctuJnjYz0IC8r9XAdLSVGkIbtkkE
        wEnU64VJ5gtKG/8havaEI4K87bul4AxqbjWZGBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9IbRew
        nClnxS9l6M0pLMy55dQydOlsRxDHwEOF66KXI=; b=CDtarNNZzKiyLynvEX6I/l
        MDwmt8NphT9dUmhuH9d7DRJvEp7UfWKmjDIlnkVa3p5JwuqUvxsnEk89aFaAfrLX
        6lPOqskMXRHU1ma6YtENcv9GBxrEKR3wGac0FRxWhK+hkDtsg4+9VJDwjijtfbrI
        XgJyZxk+FqA5ln8LzFr06swKs3tQ/1rOsOis8dDrJm1JWpDFiFfj4nRYwVas6sbw
        Eq+sdA4iopbbDt5RPeyEQCVxqXg5mlNi+aRk5NOMrdx8BsDP85Ytpnst7T0daIxc
        BCo3RlMuK/90X0q+WpyO+rK3OAhS9TqjYOiEC1P/0sRW3AmqvVOE0E6XVH5kPuEw
        ==
X-ME-Sender: <xms:pfgBYRMGfcCXkAS1DM07Dn1xRAvWKdxbFihuW4VE6r9Vji2UTlS2Lw>
    <xme:pfgBYT_EKqT6C0YbFhPPdPq7fbo2cvSP-Nf3sZz5wTz3z3HZLL7pR7Ti3x-UtFRFK
    6dM-JPjrQBrbOv7SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:pfgBYQSB-tVwLEab7KejDzxCm_vXsE_X-hEb0NNjfyQZPowsUFCKnQ>
    <xmx:pfgBYdvyJdj9pQUi59QDW16T2jp5_HjLpjlMdsKJLraaXMKKC4C-zg>
    <xmx:pfgBYZftgCgxzbF75eRceoqxvMNQ7z5TRwtxIT4r-Uyu2Wjh7UMElA>
    <xmx:pvgBYV6A2XWO3Tm6_39_jvIUGpl3zHZaW49Myl6XJ6JBm9zKV-tjdQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F3BD7AC0DD0; Wed, 28 Jul 2021 20:39:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-545-g7a4eea542e-fm-20210727.001-g7a4eea54
Mime-Version: 1.0
Message-Id: <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
In-Reply-To: <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
 <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
Date:   Thu, 29 Jul 2021 10:08:38 +0930
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



On Wed, 28 Jul 2021, at 18:43, Andy Shevchenko wrote:
> On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 23 Jul 2021, at 17:45, Andy Shevchenko wrote:
> >
> > > I was briefly looking into patches 1-4 and suddenly
> > > realized that the fix can be similar as in PCA9685 (PWM), I.e. we
> > > always have chips for the entire pin space and one may map them
> > > accordingly, requested in one realm (LED) in the other (GPIO)
> > > automatically is BUSY. Or I missed the point?
> >
> > No, you haven't missed the point. I will look at the PCA9685 driver.
> >
> > That said, my goal was to implement the behaviour intended by the
> > existing binding (i.e. fix a bug).
> 
> Okay, so it implies that this used to work at some point. 

I don't think this is true. It only "works" if the lines specified as 
GPIO in the devicetree are contiguous from line 0. That way the pin and 
GPIO number spaces align. I suspect that's all that's been tested up 
until this point.

We now have a board with a PCA9552 where the first 8 pins are LED and 
the last 8 pins are GPIO, and if you specify this in the devicetree 
according to the binding you hit the failure to map between the two 
number spaces.

> What has
> changed from that point? Why can't we simply fix the culprit commit?

As such nothing has changed, I think it's always been broken, just we 
haven't had hardware configurations that demonstrated the failure.

> 
> > However, userspace would never have
> > got the results it expected with the existing driver implementation, so
> > I guess you could argue that no such (useful) userspace exists. Given
> > that, we could adopt the strategy of always defining a gpiochip
> > covering the whole pin space, and parts of the devicetree binding just
> > become redundant.
> 
> I'm lost now. GPIO has its own userspace ABI, how does it work right
> now in application to this chip?

As above, it "works" if the GPIOs specified in the devicetree are 
contiguous from line 0. It's broken if they're not.

Andrew
