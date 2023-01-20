Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEEE6674960
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 03:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjATCf0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 21:35:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjATCfZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 21:35:25 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC1CA295B
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 18:35:24 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 221585C00F9;
        Thu, 19 Jan 2023 21:35:24 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 21:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1674182124; x=1674268524; bh=Fy7EKPXBAr
        N+WCsmzbW5Z4IW68RVTvGvcLHcC0xPOOg=; b=x94vPwB5Ps/232XtN9oMJhQcng
        wqzFrJp4q/IVKzn40Rt+HybPa0BXIjFsHRZ6i9t0QdYI3GfplJJZlNNQKL1W+jCG
        trKc2dsoVuKVgVKtem3qxLwW7wbSw1Y2H8my5bVY4zOad9hom06TO32zDambzzGm
        fE0ePg49Kmpvbdq9kbfCq9KyxfTK4j2422FmtVSa5OcSAqguXmY4Fne+7GgpOW8Q
        R9eJKsBMVmoUtvDILRayUCBWEWePdtz72xPNXGKWQ2B+7bYsF+bDwaJNF8Qmiv7P
        iz8y4A7UE1f+9quhonk+XcfCyVDM3emPqT2AShsajMssUhjERt7xSqD+omfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674182124; x=1674268524; bh=Fy7EKPXBArN+WCsmzbW5Z4IW68RV
        TvGvcLHcC0xPOOg=; b=RTv8KibRMz/CwKnZSmcLrnrTQjrR2iNZOMR91TwkbjBf
        rADcpben7krIWVfqYPhohoLl9/n+yBAUQf8bbEKdMEKFotvOCDWCdmCn5av5oVtK
        bKPV+OHayUm1959oM6R+wnh2zT35iX2pC2zAtqyCYHweI/geq8hIekdpyqT5RRsv
        lB8fxzWKArr/RPD4BHNgmgazX6ZqIK/m3RdDAwDs3YVetSdZpCQXoMOvdk7vrKzQ
        w4KyFg4/hTxOSmbZfct/xcNcI28BO35JLZGVWyLjVGhRGunBpQskp2lRVxS4gMBK
        oJa8M0hOm8BNFUxtexctdTcnn4vMCPoVOZfBZ7StPw==
X-ME-Sender: <xms:6_3JYyT6Jmb-jVoQuTBHwWWssQ-QvBWB_q-l5_25pz8231JJ2oWajg>
    <xme:6_3JY3z1epznseJ5GFuhZnV-AfjStPuy4SM34kO76Hh9z7RPyoCEovjk_onpgXTgJ
    k2eJioGH3vb7qdYOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6_3JY_1FmOa68-vdB9nk0rtkkIASjHEx7u-qZSlNe68_k1PmYiRygg>
    <xmx:6_3JY-CG1i1pKwvxrysWxWBnYRQD2EnUS6M4sSYyDnZlxRyz5SV7ag>
    <xmx:6_3JY7hxSBQQ72xNVT4HJWRtaz5dLVFHd_9Fxea3uyHuFP_jDkF1lQ>
    <xmx:7P3JY-v9WhDbkZdwm5m7Xtdgc5fBUoKTtPbtEeF67GCKeqjzR9oXbA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7544C1700089; Thu, 19 Jan 2023 21:35:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
In-Reply-To: <20230119235501.53294-1-joel@jms.id.au>
References: <20230119235501.53294-1-joel@jms.id.au>
Date:   Fri, 20 Jan 2023 13:05:02 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 20 Jan 2023, at 10:25, Joel Stanley wrote:
> A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> function's signal") exposed a problem with fetching the regmap for
> reading the GFX register.
>
> The Romulus machine the device tree contains a gpio hog for GPIO S7.
> With the patch applied:
>
>   Muxing pin 151 for GPIO
>   Disabling signal VPOB9 for VPO
>   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
>   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
>
> The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> of_clock code returns an error as it doesn't have a valid struct clk_hw
> pointer. The regmap call happens because pinmux wants to check the GFX
> node (IP block 1) to query bits there.
>
> For reference, before the offending patch:
>
>   Muxing pin 151 for GPIO
>   Disabling signal VPOB9 for VPO
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Disabling signal VPOB9 for VPOOFF1
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Disabling signal VPOB9 for VPOOFF2
>   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
>   Enabling signal GPIOS7 for GPIOS7
>   Muxed pin 151 as GPIOS7
>   gpio-943 (seq_cont): hogged as output/low
>
> As a workaround, skip the clock check to allow pinmux to proceed.

We'd want the clock on and and the device out of reset before this 
makes sense though. We're just assuming the IP is in an operational 
state? Was this just accidentally working because reading the register 
in a bad state is producing 0 instead of other undefined garbage?

Andrew
