Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549BE3A08CE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 02:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhFIA60 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 20:58:26 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:42415 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232076AbhFIA6Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 20:58:25 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 032DA580922;
        Tue,  8 Jun 2021 20:56:32 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=UEXUkaEiFQLjUvGmFiXJYNKYLn4GSKf
        Tv6e4CZYJsGQ=; b=TCl987RPTWC88e5PPQSgE+1qbePmZ/8iS6PC3qlnAMVXwGb
        ypLi0vQyfxhS4QW0Ya9NpzGB1C/UQ6JjgJCvfYnl0S157z+nPod0VRiYfF5ioeV9
        n/FtqPmGqrlSwR/14hPpX86Ji2iCOt5Q7GvlsMW179xr4sPCfMjnTinvvdh4HY08
        RClDdQck+TLWsNgYMcoPZFHJaamZBUVcuzjNV1FiftvY32vgmoMb5Tg+MBHY0M6q
        ldJD3VCm7r0M7jeypdo4ZeuMb7614S/NHVrS216JTPj3Dh3V0xlW4CxAthe2pQuQ
        U+1T4JTCfHfhyPXdoTCLYimwGvseovIAUfk/JVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UEXUka
        EiFQLjUvGmFiXJYNKYLn4GSKfTv6e4CZYJsGQ=; b=LpY8IeH51vX0Ts4LZ5c7h0
        TU2+6aHMRaxlx2pzZ2fIOivdgUbyPGcdO9SXrrEybJuL024+LKteiMrBUL4lhlzo
        F+FOoQIkFeluyxqhVnau2Nv9TAeJv/eZ9YFi68DZnxZ1nl986EFaD1JpUvufSkAc
        MBNxo6CpPPSO8Tt1tIjVodi4jye2WM1ZYKEc5ALQ6lvMvjxMfNxZiAk9auqquAfz
        JNEEDdR7k8MZ8XUR0KoZ06ZfTwtO806w24Bee8ee1GDoWffNzP3RRfdj332EakGC
        vZOFVBfPcRGJkwlQhfEeHtTtRwy+RTwRBIMao0f9do1+4WfiUeerNid9BTCDYkHQ
        ==
X-ME-Sender: <xms:vxHAYFhxctgAA3C4xcXS4ppQsJcn4-jv1El4ucwQfLjhFWlD2Zq66g>
    <xme:vxHAYKBupQ_RU5g-KVQm4FKlBUWivq8vPR7pQyVOsm4gtj6laIt3F0HAMRelhH2VA
    Cf_xVvxMmkyAP7EAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:vxHAYFEytP3CrsE9oyllP_AFL-UakUpXq0Y808ZD7b8Gshzx9zeCKg>
    <xmx:vxHAYKSefdA0tah_-C2awatNP-9wfRJmtcWYAL1EsLTxI6Iys-0y4g>
    <xmx:vxHAYCyod1UvLXhPm-9alWmlAEcO_IXxRs8gfGffvXMJTJ5tY3ZQ6Q>
    <xmx:wBHAYHqdCOfNkdNosTpvUcQqEvibNwtSvfxmQESAUPaLLsvXieGWPg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D6CB9AC0062; Tue,  8 Jun 2021 20:56:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <311d0c03-06f3-4c68-aa5a-877a592b6975@www.fastmail.com>
In-Reply-To: <20210608102547.4880-11-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-11-steven_lee@aspeedtech.com>
Date:   Wed, 09 Jun 2021 10:26:11 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_10/10]_gpio:_gpio-aspeed-sgpio:_Return_error_if_?=
 =?UTF-8?Q?ngpios_is_not_multiple_of_8.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> Add an else-if condition in the probe function to check whether ngpios is
> multiple of 8.
> Per AST datasheet, numbers of available serial GPIO pins in Serial GPIO
> Configuration Register must be n bytes. For instance, if n = 1, it means
> AST SoC supports 8 GPIO pins.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
