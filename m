Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4442DA48E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 01:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgLOANb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 19:13:31 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33169 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727393AbgLOANb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 19:13:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7131F5801AF;
        Mon, 14 Dec 2020 19:12:24 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 14 Dec 2020 19:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=dllxipO8JT/5qcBD2+BfCaHxR11sVzk
        Jmb++D51EVso=; b=ewcTi76yr6ufVEf4Ui1plZqNsQbXiKjNqfw4fez/Oa5YN69
        WtH9wxbpHdswK24M2QyXtAHt0UtbYVGHomcel9r1oZtEQa9ZDJLgf+uZYdGtASjC
        Ia7wdzCur6+F3zWpJQHlEuOaP6oJA6dASZR48CL/aZtY1AOwohDBkPHHhnI4JfmQ
        dc/bhZaAoYrkGZ5tJ0YUrURweXivm7+/xAd1nwYkpFOknXClJ4YwqA8HeCyWIe6S
        mFW84IQmQLt395E4qoHVIQZ9Pl3CUnof6DYcjBUI8bHUH7I/6R6Spt6Y7ALFy6iX
        Qco9z2VRlJQse+Xq5+t9uVXr8m0CmOQpCUxUn7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dllxip
        O8JT/5qcBD2+BfCaHxR11sVzkJmb++D51EVso=; b=civb3tWtoCoCXcgxgHpr76
        QO3YQHdQqdhQsajmuqMzNrKJE3BJuPgOs2g/5KgtMy0gYvNdZvRCvNQtmtpvegq3
        AE3kE1pHskTxXiQqo7C7SRATC1MqXQ0t1WHX1/y285yvtElfqZvVRnJpgcg/JdjP
        Llwdjg37/3gZuf6rqPvP9slN+d+D88tZ/ieJLcyL4Gj2+qkd16XALX76Ic6KeNR5
        7IGmo/qvfVcAI5YXthK+NUgqTG6+uZmJ8gRBe/eMfTcCfB96tgEGE65HI+69/DAt
        WDFZ88HlDn72cwJmtLJ4HHpBRvfBBtY2eo3949kdUg1kVhqzgvelrnYY92eC6n8g
        ==
X-ME-Sender: <xms:Zv_XX57alwmXvBr4PmGzFaQs5RRYXjI9A5j4CeBg9cqnxGA2I-E8wQ>
    <xme:Zv_XX24lsFkEEah4BVQe8dMW3VOF58F-ohlVQEPTMcxnDGztoVB82uf5cSFtxrgxT
    MhjqkUhvmYfQDcUxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekledgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Zv_XXwccaU6qC8132oJZvS6VloKzQ4dj5ioWn5T2mZ1D_PpH1XREYA>
    <xmx:Zv_XXyKlRv8-WKBjV7B_OTLjt4IRms7qiSCScXkm-KF-cys-4S4ydA>
    <xmx:Zv_XX9KfDB2e1udMs2qVu0nMoKkMeVp8O6S_Mj6I8t1_KUs7PWDk9Q>
    <xmx:aP_XX3AW1lAtzdjKIVvaW1JaJFxebiuimlWurXr6eD-rGV0_NxbehA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2A6C0E010E; Mon, 14 Dec 2020 19:12:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <d6f83615-c9d1-4906-81e7-10528e963c94@www.fastmail.com>
In-Reply-To: <HK0PR06MB3779F5B4B9629909DDF441F091C70@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
 <20201005082806.28899-6-chiawei_wang@aspeedtech.com>
 <2e2d3a02-6677-4b0e-b538-d3130a3b20d1@www.fastmail.com>
 <HK0PR06MB3779F5B4B9629909DDF441F091C70@HK0PR06MB3779.apcprd06.prod.outlook.com>
Date:   Tue, 15 Dec 2020 10:42:01 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>
Cc:     "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Corey Minyard" <minyard@acm.org>, "Arnd Bergmann" <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Haiyue Wang" <haiyue.wang@linux.intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chiawei,

On Mon, 14 Dec 2020, at 13:14, ChiaWei Wang wrote:
> Hi Andrew & Rob,
> 
> Do you have any suggestion on this patch?

Rob hasn't responded, but I think it will be easier to get an Ack out of him if 
we do a v2 of the binding so we're not breaking backwards-compatibility with 
the current definition. Concretely:

- compatible:   One of:                                                         
                "aspeed,ast2400-lpc", "simple-mfd"
                "aspeed,ast2500-lpc", "simple-mfd"

Becomes something like:

- compatible:   One of:                                                         
                "aspeed,ast2400-lpc-v2", "simple-mfd"
                "aspeed,ast2500-lpc-v2", "simple-mfd"

We can convert the in-tree devicetrees, immediately drop support for the 
current binding in the drivers, and _only_ support v2 of the binding going 
forward. That way your patches stay largely the same, the binding isn't 
hamstrung as it is currently, and we're not trying to maintain code to support 
the current binding definition - but we're also not pretending that old 
devicetrees will work with newer kernels that only support the new binding 
definition (which is the problem with your current patch series).

How does that sound?

As to how to implement this, I think we'll need to add some 
of_device_is_compatible() checks in the relevant drivers to make sure that 
they're using the new LPC binding, such as in 
drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c before we fetch the regmap on line 
2657.

Sorry that this is dragging out a bit (and for the mess I made).

Cheers,

Andrew
