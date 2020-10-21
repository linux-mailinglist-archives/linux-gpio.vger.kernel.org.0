Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CD229552F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 01:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507138AbgJUXjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 19:39:20 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45155 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2439511AbgJUXjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 19:39:20 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BFE525C0601;
        Wed, 21 Oct 2020 19:39:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 21 Oct 2020 19:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=KxHx0Z0PGBQzSx/sSWx4LOYQ1A63VNA
        Y03C08nAGQgo=; b=A9UzhIFJIZu+1lp/W2zH5Iihyss26kn1j8ajLMnM0cej9yX
        Oji0WUY1ayc7JppzPzDTp/LoFa6QGxw6wpmzIXvxINno7deGLtTnTXOGOl6bGEI0
        QK6K4BHsFKSP7xsoTil3Srf1IQ931ZG8+XQojKKB/090FJPVvPqFCT/jMJkEmUPZ
        TdPz5zT66hhiIS2+43CnWltQaB5mEftJ5MI2uqK30c64mfkbXzFjOvx/aE/bC/zr
        8AOX0ymiD57QXMjkndo6CEGGypAcwmCzsyrHCrZDX/gJVmyIeOG7v0ldkpIQmUC8
        nNRTi+aLwpkJe/yiypHp2wozVQbwTrykmrnpseQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KxHx0Z
        0PGBQzSx/sSWx4LOYQ1A63VNAY03C08nAGQgo=; b=NQbJQb9uJDLbzlgDXN9Sx4
        csLwy/VznH3pgG/gONqNU78ZLZ0nytSut+uzLfV0KJIakO+y/flLbgTJmJv7agaN
        eE9EGfy5UIdmZx902SGRzTn7pHLgSsl/HkxpFffxFj7lakKmzUi/1tuNRtysON+7
        cpSKVhzFjbHzohqf0Zk9L7yuNMXyVx742Gfui5UQgAHcgjzwKF2YPKnhV0AUTbrA
        QTq2HA44rQ6CUJKTbb1r3hIkh43bpuHDVYCEtxLbmSjZMgwHVFfj/ao7K+okkQ02
        4LUb6OrGEk4KvImOZiTWMYRvhK7ofGK5dX1UX8t2Z0NrlQA0AGkBnMO5dZWT1p9A
        ==
X-ME-Sender: <xms:pMaQX27oCqlQG3Vn-0iw08kZQrXtTLeUAXMYDOxc-5e5F-XdNOcI9A>
    <xme:pMaQX_7m1bdwG_yA8c0BOHvUsvK-6jzdcEW2lNfujDZosQIFeRSfcFoz8R4Ekl4Ot
    vlUOgHTfdOe-OZXVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:pMaQX1fmI6E149KCg3pGmXqlBOHQncmHq1fc4P-R3l1GfxKV0Ro5tA>
    <xmx:pMaQXzKpUuyT53oSafsF01NF-hiaEFs-rTzby_msxU1GD_TZjd3jOQ>
    <xmx:pMaQX6K6kHXir3o5Z5dKKOOtgdWrziy4u4aBh9lvkCY5h-udVO6MIg>
    <xmx:psaQXy9F2z6VjByQqGV9xuZKqzTUN1pDvw8QV0QAYhs3tStUYPV9iw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F042DE00B8; Wed, 21 Oct 2020 19:39:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-502-gfef6c88-fm-20201019.001-gfef6c888
Mime-Version: 1.0
Message-Id: <f56ce765-9d94-41b5-bda7-202c165ea8c9@www.fastmail.com>
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
Date:   Thu, 22 Oct 2020 10:08:55 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Billy Tsai" <billy_tsai@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Tao Ren" <rentao.bupt@gmail.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Joel Stanley" <joel@jms.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     BMC-SW@aspeedtech.com
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 19 Oct 2020, at 15:20, Billy Tsai wrote:
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Good catch, thanks Billy.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
