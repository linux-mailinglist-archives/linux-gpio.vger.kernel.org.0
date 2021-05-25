Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6689A38F9A6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 06:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhEYEi7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 00:38:59 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49849 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229476AbhEYEi6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 00:38:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8DF82581068;
        Tue, 25 May 2021 00:37:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Tue, 25 May 2021 00:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=zFo1oGVlR9BWzHQX/BoXdwfOJEHWy/V
        aAoNOqIJAtPQ=; b=futuX7gOOBwrT6oJVQPSupBN1R1Ob4fVnF9YYDRvvjsQUMP
        Y5HHsGOGuTh0vmwxs9NtIMkwTGElxuuAWADC14Ujy2iOBxcZWQJ1UPAFNLaGJ+gZ
        17vy4KFu1mH1znFquCKgNEu/t4OOvKgA1o2g+ULakueirIA8UN2SOxSYDWbF0KmZ
        af2zsiYtkXjh1ruSbgtzeJdOqWhS2o2OU9Zjlx6j86EdTgGA+YeNIiFrBj0CrIqR
        ZA3LMfoQ++KK7Yddanj9/VBrqpDFJyFqtwdf6e8oh8RJ1Lb79/puVBbrAYe2ytli
        NnsjmmIewizUb5msxd0MxaQdC/8EShEAC5TAIvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zFo1oG
        VlR9BWzHQX/BoXdwfOJEHWy/VaAoNOqIJAtPQ=; b=NeMLdSOvPC0GVg8cTUC+v9
        NN0unXHXvIcxihEhFtLGFMQqiEKpqt9PHxr2fAvDhKfkmyt/Fckars9EPIy0phOd
        FA1DEGNzvET7uPlUxU6/4D4Q8QLpNwngQo+Ib7x+PLk/ocG1evLo8fXfQ59K4w7X
        ImnD5tRzFSzRJGjOme7BCzMUz/fxFJnCZgwoIo73V7P1oApyjCdnQWfpJCzH25Cl
        4Y5RxL8Gtc5fmnlrmcPw9DNogptN6F5Gdv15JQVoIbzpVVieSnjuunUcHfa+REXI
        LJfP6p5MwLnps3LF6QG9VW6VJ06rtZvw4Nzmp73wWlYFEivdnBcC17sz7F8TzPXQ
        ==
X-ME-Sender: <xms:CH-sYOD_4v8QbYfZqpFzj02pmQTjMxgoUCI9-H1D39NPv3FL-OEp_Q>
    <xme:CH-sYIhOAFAfnEUzB6_MwNLXuTItp2aKyHUO4auMoxKoclVFRBXub5hQ3MjCdBK6Q
    VZisNYOPOImxsNUQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:CH-sYBn4b6NkIap0_2dg9sPDWagHjtvUVTgnpxUQwsK0yp1i7B6uzQ>
    <xmx:CH-sYMyEgtlytQYMsItyZ4J_Lrleo2-RwgSz-EuqbrAOdJV_M4y4Gw>
    <xmx:CH-sYDSXNXCoVsCGPhXLZh5HDIBTFkI1EwVnwhiEja_o9shd-T7N4g>
    <xmx:CX-sYIJewHwr4gW-amogiccRpA1IQS5dfHR3zg0Gf5hUQHOU4Wn-XQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 76510A00079; Tue, 25 May 2021 00:37:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <7f673953-7a90-4143-a475-444a1096e55f@www.fastmail.com>
In-Reply-To: <20210525042736.10379-4-steven_lee@aspeedtech.com>
References: <20210525042736.10379-1-steven_lee@aspeedtech.com>
 <20210525042736.10379-4-steven_lee@aspeedtech.com>
Date:   Tue, 25 May 2021 14:07:07 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list" <linux-kernel@vger.kernel.org>
Cc:     "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_3/3]_pinctrl:_pinctrl-aspeed-g6:_Add_sgpio_pinct?=
 =?UTF-8?Q?rl_settings?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 25 May 2021, at 13:57, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Current pinctrl driver only define the first sgpio master and slave
> interfaces.
> The sencond SGPIO master and slave interfaces should be added in

Typo here: 'second', 

Regardless, this looks good to me.

Thanks Steven!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
