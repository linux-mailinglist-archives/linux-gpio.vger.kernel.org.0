Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA832392402
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 02:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhE0A7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 20:59:37 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34641 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233477AbhE0A7g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 20:59:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id CED4E5804D2;
        Wed, 26 May 2021 20:58:02 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 26 May 2021 20:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=F/qifLq8yQh1az5Zwysk7y+47oJDirR
        vH4OiyQFYYzI=; b=cgLtwK0KLSeyC9oPpsRVpMHVer4QIWQNBhSHlFjKL1JVAon
        2JMsBkN+OW5KmdXJoM/tUAOwASMZ/gGXR7+56+VeL82x+hwj5Lg2Kz9+lcqOHRN+
        MIwE9aIa7AdpBuOGSZOn9qEFt2GhfgsaDddWdAIrWwqt9N0744+vn/0Ld5x19iQn
        vEnpIJA5PB9P8bM6P79e7xHEaPKSlWE/bxyKk9s//ldLflEsEkpe1L9PG5neDbFH
        jKfj21ObIWBxMt9wj22DhJpu4U3PAt3p8tvrN/8+3RfFfrJ5yO42gY7Vkh/Oe0Lp
        vZKTraMXVXBu5vXzSiIMbATh6rSNw17kLNbu1QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F/qifL
        q8yQh1az5Zwysk7y+47oJDirRvH4OiyQFYYzI=; b=sHDLbR58bET2rrmFXa3/6W
        prVsteoVnlf8HTsx2daI+12gwLkDqwdkfzQpu4bvtaVYoQXPN84IoS1Asj2fcTWr
        zkebpu+rS3KhnN4a3YAoBRsIKiB7C9dW+8mhPF9eY6SBRseVsKzF6PyvG7cT6nh/
        f/08COzhrFpW2JKzcgEmpM6G1Ll5LbUHUZKvuNTkXrwuGvp5FoCsTUQ7WC16g0sn
        N9AEu34zEX8rEOXW4Xh0mmoNup9IcLr+jHN5y8DPYxF7wgMd/eAKbQKQ7UxpXwV+
        zIePipYyxlf44gdsG73JkwLBdi7ithori8nHA6ZHE4Il2irXvMQAzG4+OICPMRXA
        ==
X-ME-Sender: <xms:me6uYBqdaxrKOtBWAogw44eIXD4ayATgEQGlcYDuKd_1Kmun4fTkUQ>
    <xme:me6uYDpc5ZaISSVe7CCqGeMEFk3M-yWzeUCZOjUq0gmuSrwP87kcCRRZOJNKiGfho
    NokK6jn6ivVc4DMog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:me6uYOO4XJkfIk61exzEPB5dAcQdKKACGacWWoAX7I0CiDbLRJ15Kw>
    <xmx:me6uYM4WvipUEbgGP5F_DWo8MZXCYcoFxE0QiWONFmHXz4K2miICyg>
    <xmx:me6uYA6OmOGhTQjTk_eV5liDSGS-Etj1FU7vkWhmF0TVBBWbFhPARQ>
    <xmx:mu6uYNy_lqeszQo3wSgC-tI6BpEkcmc40wIP1qNWCJZkmbn4nlCVLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5994EA00079; Wed, 26 May 2021 20:58:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <5c0670b1-269c-4aae-8639-c0866ac90dc9@www.fastmail.com>
In-Reply-To: <20210526094609.14068-2-steven_lee@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-2-steven_lee@aspeedtech.com>
Date:   Thu, 27 May 2021 10:27:37 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list" <linux-kernel@vger.kernel.org>
Cc:     "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_1/4]_dt-bindings:_aspeed-sgpio:_Convert_txt_bind?=
 =?UTF-8?Q?ings_to_yaml.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Steven,

On Wed, 26 May 2021, at 19:16, Steven Lee wrote:
> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.

Please add the new property in a separate patch to the YAML conversion. 
Having changes to the properties in addition to switching to dt schema 
makes it harder to catch errors, and it seems Rob's bot has already 
picked up some.

Reviewing the changes as separate patches means its easier to give you 
a Reviewed-by tag on that patches I'm happy with.

Andrew
