Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C5938F731
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 02:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhEYA7U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 20:59:20 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51379 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229541AbhEYA7U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 20:59:20 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E7899580B43;
        Mon, 24 May 2021 20:57:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 24 May 2021 20:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=Ez6GbgXW+KJVgqjOVVGUMOYbeCl1lm6
        ncNcaQHWbV1w=; b=oHNG+JY1pb/luEgNwCQ6JiwbJrmTRM59ry579jqlr7kz0Eu
        vvSY16Z8fu+k3waz38JEQC0qpDghrb/aoa+20WdfIsdRSvihq7RkgsNQnq0xxWK/
        9eoEMy6I5eW0t2gX3JZD7WrjJ0nSCKzcK7/7IS8QiPJdu38sWGmquQvnqhMMxeX9
        yeRWv0sIeVoniQJrNH/e86iYGOPzIx9eU2Nr4UuVi/ng31wBtCjbXgAsqug0fGhM
        /bOS9BUxG6g5sGaBbbsID65ae3Owt4oC9NBI1x5atIEm4jb/2wl/LxEQqlqSd666
        CNMgg3c4ea2vEHjGvcD3uFQ0iHCCl6Q2P6o9R2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ez6Gbg
        XW+KJVgqjOVVGUMOYbeCl1lm6ncNcaQHWbV1w=; b=qXrxRe8MihRW0X8Hh2tMma
        sX512X6XvkKSb1kmBNSwYkYarCNX/TroVBRJPNVvDIBiMuAvaQzFMEWgvazX8d7M
        HI7aQrVWEsKFcvK1ZsQoZ5sWHBfx+gBmxJxbWpPxrsJARdMuTEZJ8yeJUBOQBEpT
        ODdxJ/RqKvB5T/TCDQ23KEqRKglORyDNi6dQpti6ZkXQBpwLSLaNLG7ApahgVzHV
        YVG/dzPzHgCfenN/JOfT9O9h81rnStoq6ToEUZtLjS96L8DrHINvnFNJyVfH5kss
        a/q5RPVF2AWBaCjFxvPqBU1kyglYO2sfagE8gU00Lf+nEdV7g6FCPX0wAo1jS9vA
        ==
X-ME-Sender: <xms:jkusYGBcka0b8Ferkh7cKiiz6SjsdnVNDONZW1_7Xhs_y3gt6MBYIQ>
    <xme:jkusYAixWDChV6nf6ZaJIu7TTGUJh5Tkw7kuNfoNm6ukuywRnxeZxu7obk00vAMw4
    QpDFr_DUPfKk4sW2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:jkusYJnokF_mtMSaLRDVjoQDIFgVycT7pH5YLHvYNKiJp6iMk6_JrQ>
    <xmx:jkusYEzrm0HEqSEWTqrvouU0LOY0qqd1B4pV9CNMhFr09f2xHQM2zg>
    <xmx:jkusYLQ7HRPEMewaSqv2KVoYIZd0OZDiWOI4vsxankyf5OA0B1T6sA>
    <xmx:jkusYAIj2jKiBFtasHY2dxyaCWB_CKa-Kgz_67XXxSeRCVqab44vsg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C1662A00079; Mon, 24 May 2021 20:57:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <ae8b0c3c-c090-47f3-b776-fe756f94f361@www.fastmail.com>
In-Reply-To: <20210524111338.16049-3-steven_lee@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-3-steven_lee@aspeedtech.com>
Date:   Tue, 25 May 2021 10:27:30 +0930
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
Subject: Re: [PATCH v1 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 24 May 2021, at 20:43, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
