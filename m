Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C648C680502
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 05:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbjA3Eb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Jan 2023 23:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjA3Eb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Jan 2023 23:31:26 -0500
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2911E1C6
        for <linux-gpio@vger.kernel.org>; Sun, 29 Jan 2023 20:31:25 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id E61C03200989;
        Sun, 29 Jan 2023 23:31:22 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Sun, 29 Jan 2023 23:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1675053082; x=1675139482; bh=EO0YnO8Trq
        EZKy6XJ4elRypf/CzykWRvtL/dukKJhr8=; b=MkLYrtqAEXWkz/PVh3xlzZLzht
        QVgnW+ebJLmWiFaVY1XHFqbVQCVTKz6fS1bSen56OOIJpNw92317zVMKParw3veu
        Sq7+GQtB6WWH0TMhFWs93MyR85b/gglWr+bUSPKab0j+E5QA4P2ZAIWPx6663G6D
        bd4VDIqB1TkvJ7F9dY4QXs6R0p5OXm9E+Sd1V/F+4uCLwmI2y6Y8h9i2OOjT+BVP
        CgZ07DzXOyyytwPSRK99vYQLw2ZdjdpKp+IRHNXYgOkuWQfI0AvAD45luxo5R14/
        biFXUsg9AJoF+VqbK45ZwBeZn9qgJwmytPBBCWf8qlIYk/9rc6eA4qWc7/Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1675053082; x=1675139482; bh=EO0YnO8TrqEZKy6XJ4elRypf/Czy
        kWRvtL/dukKJhr8=; b=WcR413usd4xyPR/QFIKRhxvZTAkHM58nYRG1huBiKL49
        2Y7gunQJZQwKj4uY5VwNAc4ZR7yDPUpt9lilqm8SvCJD//5bxYLSVg/h6SIRSp17
        JuCNME6/YQCHrD6Nt+de5JQVueqHv0Wz7UxPBxQxMlWTT/JGQEQR/QuAhr3DWnBT
        Ok2F3fQ2ro/GIanVyaXvRH9OLnVg3nCTxnvqjHY0X/Lhcogd2PB6Ee55bNWtXQl3
        TTH8ziKQnPygh7tOq/gRjre368RXSqJMq4COnXeOk1Yq+cLb9ZQtkFgxFIynw8qR
        dtNiv6CxhiPhEnwueQS542lhe3ZPrRxwwYRmO1I8mQ==
X-ME-Sender: <xms:GUjXY2biCit-f6N6WLxfleTtIXhyZ6ks_IlkyZc0RksGVN6AALuABw>
    <xme:GUjXY5YlCI3kkXc2f2zKdDGtV3X1wJ72hc1bbXNIAWz0TpJc1H_tiXT1PJC0tTM1f
    tKqA2oI06zEsr7HSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GUjXYw8d5Q9kSg8cKHp1j9oyz4BUM9cXyG973X3SqorYKzFz16c2BA>
    <xmx:GUjXY4pFYK0QoBkn6fcFBsI_EnsKDbkOXGgHyW6FEBjEN4xVyC7TnQ>
    <xmx:GUjXYxpc81NhmKcfJOHnzcHOtlsMBMOaTYqchtd1nkbut0z4tV_dzw>
    <xmx:GkjXY40SICuUKQzauoXkJzyCiGdyrca78n6aQfpiO0ohSpP3rkPb0A>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 24F2F1700089; Sun, 29 Jan 2023 23:31:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <e87f3c0f-4741-4b0e-8d56-eba3225a977e@app.fastmail.com>
In-Reply-To: <CACPK8Xf3Nz8mZrGrwUXx9PZWp90jYwEOAoZ2giY4qKou3opn3w@mail.gmail.com>
References: <20230119235501.53294-1-joel@jms.id.au>
 <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
 <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
 <CACPK8Xf3Nz8mZrGrwUXx9PZWp90jYwEOAoZ2giY4qKou3opn3w@mail.gmail.com>
Date:   Mon, 30 Jan 2023 15:00:50 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Billy Tsai" <billy_tsai@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 30 Jan 2023, at 13:29, Joel Stanley wrote:
> On Fri, 27 Jan 2023 at 12:36, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> On Fri, Jan 20, 2023 at 3:35 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>> > On Fri, 20 Jan 2023, at 10:25, Joel Stanley wrote:
>>
>> > > A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
>> > > function's signal") exposed a problem with fetching the regmap for
>> > > reading the GFX register.
>> > >
>> > > The Romulus machine the device tree contains a gpio hog for GPIO S7.
>> > > With the patch applied:
>> > >
>> > >   Muxing pin 151 for GPIO
>> > >   Disabling signal VPOB9 for VPO
>> > >   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
>> > >   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
>> > >
>> > > The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
>> > > of_clock code returns an error as it doesn't have a valid struct clk_hw
>> > > pointer. The regmap call happens because pinmux wants to check the GFX
>> > > node (IP block 1) to query bits there.
>> > >
>> > > For reference, before the offending patch:
>> > >
>> > >   Muxing pin 151 for GPIO
>> > >   Disabling signal VPOB9 for VPO
>> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>> > >   Disabling signal VPOB9 for VPOOFF1
>> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>> > >   Disabling signal VPOB9 for VPOOFF2
>> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>> > >   Enabling signal GPIOS7 for GPIOS7
>> > >   Muxed pin 151 as GPIOS7
>> > >   gpio-943 (seq_cont): hogged as output/low
>> > >
>> > > As a workaround, skip the clock check to allow pinmux to proceed.
>> >
>> > We'd want the clock on and and the device out of reset before this
>> > makes sense though. We're just assuming the IP is in an operational
>> > state? Was this just accidentally working because reading the register
>> > in a bad state is producing 0 instead of other undefined garbage?
>>
>> This makes sense, can we come up with a resonable patch for this
>> problem or should this one be merged as an intermediate remedy?
>
> Andrew is correct, my testing showed that we do need to take the
> device out of reset in order to write a value that sticks. Qemu is
> insufficient for testing this as it doesn't model the reset lines.
>
> We really don't want to enable the clocks just to set a value that
> doesn't need to be set. There's a big nasty delay in the clock driver.
>
> I suggest we revert the problematic patch until we can come up with a
> better solution.

Yeah, based on the testing I've just done the GFX logic is always
clocked (D1CLK might be an output clock?), it's the reset that matters.
I applied Joel's patch and did some testing using the romulus-bmc
machine in qemu and we still see some failures to request some GPIOs. 
Given that Joel's patch doesn't completely resolve the regression I agree
we revert Billy's patch for now, and I'll reconsider my life
choices^W^W^W^W think about how to deal with Billy's problem another
way.

Cheers,

Andrew
