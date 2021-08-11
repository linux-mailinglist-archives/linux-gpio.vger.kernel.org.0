Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0BA3E8731
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 02:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbhHKAUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 20:20:14 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:53659 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235692AbhHKAUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Aug 2021 20:20:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4019058041A;
        Tue, 10 Aug 2021 20:19:50 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 10 Aug 2021 20:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=TJnR3Y1jRHyuvNKz98aoSVU7LBqrfX9
        Q1XFcqdbpwL0=; b=otc4PnNARgoLm1XBiDUZWQ8vgpp/dj0SeUE3PcX17toYGay
        SLVTUGVuw9SgBR623QsWDhaHx594itB5W6LGMjYcb3mRnBdj/lj4PosvJfI/lYwd
        cmAE+ZP7K9QckxMGAwQ/S/zSXaKpy0nCEooyyK0jIsErAs0fwu1WKxqvQkaR9fvX
        g98qBCk3+1W/H9N+9Vm0cTf7chZ4eqf7pXRulyxZ3907MoYBBPAhdb2tq0+3K5m+
        WWcNrQgnJf+wt+QcCAn9IEeqbpYGKvMSK6/A93kBe9ICmS5yWoO4rBEP+V07SJkC
        p0Osqu9r2ZTc4dUcME63iniXInzHVX2kM57MvCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TJnR3Y
        1jRHyuvNKz98aoSVU7LBqrfX9Q1XFcqdbpwL0=; b=ZSUuRYKCUqHRZBsFFklFyz
        IoHgNcnsC9GQLtyhUERApUoK46BH/NzfAV4S6U525WMZqiEOXYetQEXYnPnIAp85
        ZyxufUwGuO8RRnqOJ7ZY7Wk9EqYWIrJXx+xo/Bz9iR8PyRSue9rVt328dF6TNNPw
        0svbooiiaPdEDDVJXD37f2g9bRtNOGSd9/7K/BYEL16o/vxkZiQFNRQmqvM1E/mv
        xyg7jEup2VIfpm2odPeJK+/O2vFaYfknt/JRevmlQLqDz9K1r8yoiFNSCnMPjVjE
        yAbxejAhkjFF72bxuJBXVwZyXEYZv2Hy/BH4bW7iUjOk0lLvEeSG/xfMvobNpWUA
        ==
X-ME-Sender: <xms:oxcTYQMs9hRztGtED_kTlD9Hcik9VxQ8he7kjxErnKtRbIsIAAgxHA>
    <xme:oxcTYW-LFY09y7PMvujnBEg2srKUu_Pk66ylPyC-B5P6FIOeXFp9R2AlI-wgbVN-R
    YF4RRCeT-aFYmlPEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedtgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oxcTYXRwJjHMLOmgVtRkmOHdavu-M1RbiUfLeo8UZQr3hZfrUd_8og>
    <xmx:oxcTYYuFOf7V3nLo1y0AdEiAKOREhvWOTQxNrL4tYYuZxSY34_nDSw>
    <xmx:oxcTYYeC4M5cveV0Zodk6hgp-e9hgtHBg80uctI2a5BcWp44JMLw8g>
    <xmx:phcTYfxd4nMtKVK_Jn7ebZTvlJPezURA6FbGPOMUA_o_pbQoLrB3Yw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 91878AC0DD0; Tue, 10 Aug 2021 20:19:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-554-g53a5f93b7d-fm-20210809.002-g53a5f93b
Mime-Version: 1.0
Message-Id: <96e52916-f113-4a91-b83f-e0de144611ca@www.fastmail.com>
In-Reply-To: <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <20210723075858.376378-5-andrew@aj.id.au>
 <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
Date:   Wed, 11 Aug 2021 09:49:05 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Linux LED Subsystem" <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>, "Pavel Machek" <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 4/6] leds: pca955x: Use pinctrl to map GPIOs to pins
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 10 Aug 2021, at 23:24, Linus Walleij wrote:
> On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The leds-pca955x driver currently assumes that the GPIO numberspace and
> > the pin numberspace are the same. This quickly falls apart with a
> > devicetree binding such as the following:
> (...)
> 
> Honestly I do not understand this patch. It seems to implement a pin
> controller and using it in nonstandard ways.

Yeah, it's a bit abusive, hence RFC :)

> 
> If something implements the pin controller driver API it should be
> used as such IMO, externally. This seems to be using it do relay
> calls to itself which seems complicated, just invent something
> locally in the driver in that case? No need to use pin control?

Right. After discussions with Andy I'm going to rework the approach to 
GPIOs which will remove a lot of complexity.

The thought was to try to maintain the intent of the devicetree binding 
and use existing APIs, but all-in-all it's ended up twisting things up 
in knots a fair bit. We discard a lot of it by making the gpiochip 
always cover all pins and track use directly in the driver.

> 
> Can you explain why this LED driver needs to implement a pin
> controller?

The short answer is it doesn't as it has none of the associated 
hardware.

I'll cook up something simpler with the aim to avoid non-standard (or 
any) pinctrl.

Andrew
