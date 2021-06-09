Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091F33A088D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 02:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbhFIArR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 20:47:17 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58087 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233682AbhFIArQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 20:47:16 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id F0C8C58080A;
        Tue,  8 Jun 2021 20:45:22 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=KfiDffVkxnvv11SVkb8pJKMihOr1O/9
        5B4gsVfnBBxA=; b=XCXV6r+9f1y3gqQ87+s0KLkMLNLuo4LfKIribKkQy6QjBj6
        uHAmQcegdDoEPYut3wrfVTWHYhW6OwVA6wvehmkLUgTroz3kV3eiWnK2/QnLayxT
        uGEnslC379SjxKLvCXf/Nhrjcc3mPRAhX0jmTvpSIWduvXgnRgIyFTAfgzm5j9ZM
        tgkVnrOKHD42koAi7pLR+NpZwXi7mftcYT/jHvck/bU08ZcjopCG+Lskpz0hwyNZ
        czASmqeHel4TI7a0yKZC73IFJPg5OjeSz5dSR1EGIUFcmalp3R5/1pxBEBp2ymev
        CSsOZ2Evd5kyBz6kiVMlJ0ScjY6fAdv1pCuUgZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KfiDff
        Vkxnvv11SVkb8pJKMihOr1O/95B4gsVfnBBxA=; b=huFl0Z5c4zKitSf4xVD/ZQ
        5ZMdZErE1FyvSRmezEmu792rY/XURKTVeKQ0eb/hWys87X35prIIsP9bj/SEO8B0
        gPJCs3Is2N6vKxXvIZ4i9tfZwZeMOHq5+FCRvUhPCsEwCZfpvamRBdZtkdB3rjbt
        btQHgd3TADHEdgsLVS6Q3LP2U2TioZECZMdIbDmQnGpaNvBubm3Iq9ST4gtsnv0S
        sYHcN9eqBUA5eXv2TuOC8/OdSxwM+iKoDnphEnNLoHw7jM3Qt5wi/mY1TYfBuDsk
        oaL/8nE3NSm8WR4VsKiXgjwgA34/d8zeT8o+50ZI0ssb2oHGRLUfEr/Lm972OClA
        ==
X-ME-Sender: <xms:IQ_AYIXAZvDBUbgZqGYVF_W0APL5ilIgQG-YssoaIdJBrHUETJy9ug>
    <xme:IQ_AYMmSScUXjhHo5FEqDZ04zbSVAewkpftSyd0Rwg_D9BQUXwICUKIwnpinO5tYt
    aHYj1wLcL_w1oMYfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:IQ_AYMZt4LCO-cY6rLYvQrm59Dw56uQOywsz1_CaHD65cTDUFCC-8A>
    <xmx:IQ_AYHUNmh34-Hesxq4yrSglXNGXPhDTsbD98RcuRX27NiQ6w0fYkw>
    <xmx:IQ_AYCmdzhzBQcoYiPwiY9SiDlQcL79wHn83FMqO2R7jCm5F0DuXLw>
    <xmx:Ig_AYLfLqhSsKoW1n1G_ChvrT7xjg1m5UkUMBS5BP4ffkdtmPdI6cA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CBD3DAC0062; Tue,  8 Jun 2021 20:45:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <fb3ea3b6-8af1-4ad8-880d-acc296ad8160@www.fastmail.com>
In-Reply-To: <20210608102547.4880-5-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-5-steven_lee@aspeedtech.com>
Date:   Wed, 09 Jun 2021 10:15:01 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_04/10]_ARM:_dts:_aspeed-g5:_Remove_ngpios_from_s?=
 =?UTF-8?Q?gpio_node.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> Remove ngpios property from sgpio node as it should be defined in the
> platform dts.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

I guess someone will make some noise if this breaks them.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
