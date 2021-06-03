Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB3039AEAD
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 01:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhFCXay (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 19:30:54 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44895 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229629AbhFCXay (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 19:30:54 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id EE75458094B;
        Thu,  3 Jun 2021 19:29:08 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Thu, 03 Jun 2021 19:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=SS47D6i5AoLtCZF7DyB9f7Neb7i88hC
        t48l4KG4kK0E=; b=twZFJbyJLreY2lNfy+IHtzRd3XvHjVAZ1I+Aeg3ydGw/t/+
        cYCFNQqD2LYZY5fjMKFDSFF4+U3nOs5bjfTO3UGw1ejVv3h8VaJHcL6M/Nl5TSvz
        25wClq4IjNonW+3OHket4nn4zAmMzQF0x0NL6Ryd9jZx7HPUz9PBApgM+U+c3txo
        477VothgPkoFmNkyM81x2NxetYsOzCmGrYEEIM1NC32sf4CiN7QmaM87M3DAbFnJ
        3kEh/vOMk+vPEqF/kuzjBImdN7rHBiGhn3AjzxvablMvXbTxtevPwNzkRg7DjFoV
        4DaJN8EZMrXDoJWyVDw4gUOpnW2JWfQFd36VeKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SS47D6
        i5AoLtCZF7DyB9f7Neb7i88hCt48l4KG4kK0E=; b=Xv4LXDx1AlvdBsuhlk8nXw
        c4LenjKvbfYOrKA0PUbYnrn8+mPSrU3ey0GMmBeXavSuCSf5ntE/Qp6qlza+ganl
        i711JMjno9nY5lft2NUskGJGfoGLwiEUWrSWa2g4AW83u4KmomS3Q0aPPVYza4Gt
        LmiHimMAQ0mOxrDv7zALM18XRmiS9E0iby+Wj71e4p9VNld1YaESj6SXYArZgIX+
        wDu0Y6gobOv1gxBeu6FEarEpnyve6TC8eorLL/Iqhhb/aaJ7SQ74EP0XtLYM7m5b
        scRRzv3XF9QGGoN1/XTjNBN2HRifajIoMhLa3xPtkX1wk1gHPz+oNEzfazGhJ9eA
        ==
X-ME-Sender: <xms:w2W5YOVg0C7244BiyOUjaqfQWIZICqXs9osL7ldMAtXj7Xcyxddk6g>
    <xme:w2W5YKkb2VbWpKaPe869BECM_oDpEPB9Ch6NnHDb0UCO8IBKvAIbP20RyWK0EedtG
    JNuM0JkfbvanAjxrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:w2W5YCb1dg5rauJpS1ybtOZgq7ZNo0ySK3xcE3LPVIj8BfpkB6ARvQ>
    <xmx:w2W5YFXx0UCXVzXJCQju74_KnIqMZxB3tlBgDrXux-Or1jMjEXuUWw>
    <xmx:w2W5YInj1aSwn5GkQRP53Pm4x1Lnh9yK9SpiqWahPv_mZWiGTKpgvA>
    <xmx:xGW5YBdqkJDP525feyKgAH4_HJ9LjEKVeRRFlevv1rhJpum3qIWC4g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A4F85AC0062; Thu,  3 Jun 2021 19:29:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <c93cd6b7-229d-4f82-acc5-f85a9c66587f@www.fastmail.com>
In-Reply-To: <20210603101822.9645-6-steven_lee@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-6-steven_lee@aspeedtech.com>
Date:   Fri, 04 Jun 2021 08:58:46 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v3_5/5]_gpio:_gpio-aspeed-sgpio:_Move_irq=5Fchip_to?=
 =?UTF-8?Q?_aspeed-sgpio_struct?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 3 Jun 2021, at 19:48, Steven Lee wrote:
> The current design initializes irq->chip from a global irqchip struct,
> which causes multiple sgpio devices use the same irq_chip.
> The patch moves irq_chip to aspeed_sgpio struct for initializing
> irq_chip from their private gpio struct.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
