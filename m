Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6865263A05
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 04:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbgIJCRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 22:17:14 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53047 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730150AbgIJCP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 22:15:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 888825C00DB;
        Wed,  9 Sep 2020 22:15:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=tFrYXSEwyjn07BpgFaxpcCF3u4JS6a2
        l5VCkYQ8zpJw=; b=ZnPWMXRTFyOhRNKgUQYKLPW1mXyf27K5QVqSSJA7k9OWR5Z
        hcD1Iv0Qf2c+azh4Go3omN7bLlbGN7r3/vGFGUujpLjMcZfD8iT7044YIuqPBC9V
        QFQRYiBGHN67LzxQu9zBZTuqTAtWWIxS4ymsTFqVrd7hRXGWJ133YBz29aAm3+2Q
        V2nR7mzW0FpQFQ/J9/CGqrM4CsROd2hv3o5q677BxSeLeiH0ehJeYCMYw6kXhDln
        blr6uiz46lAA5SQp4nnTgF0vHvZXh8BUYKB5+z07X/bvcbqUDdbW9imXpvAtdFdd
        LCgURzSUL0BXYAEsa3T6Be3J5Aku51kV53/mJBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tFrYXS
        Ewyjn07BpgFaxpcCF3u4JS6a2l5VCkYQ8zpJw=; b=AHsRL/hke0PEO20lK2MgSa
        /e81mN5INU4tKln03n1wD6LiACl4UdQ8VPtojsfwm3imf5PNBn0bJ/LXKD7nDexx
        /K1k2xkRIE5mE9T8dvzfMKyNz+KiOiml8Ay8ibOUNJpJ6cQZxDXMG6k46XUIjLNz
        194OwmICrnElaN1QJR+iPOFbD0Porlk7HWkVOXfCSzkd+4AWDRNi2G47Y2HLnZKg
        aOYSya2Hbt+uo7obAZjXyRKkhhsPrb6xvPrinWSLdiXqd9A8HQmf4y8nQOFWIMcE
        8gHbySLF3JYvYQqdPm5jw2i2vb1kFmLs9f8B9Lyr553SnpwEKSCesKbpExPWfUaQ
        ==
X-ME-Sender: <xms:WIxZX06yv2ohcHJKn9TFHPF4w2xiJVI3a4OxtYucsnvU0eK352BMYg>
    <xme:WIxZX14br_myZuOpzmNfIA6mFGC1m-cqmY42UL1J9N2k5aNXUnYXoPgPwAD8VZ-WG
    H7RtKjRuV9_RAxx6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WIxZXzdzLViROxxLHBzHqRX1a1NQlSQgUkSJfEtlQqFTEPBlox02jA>
    <xmx:WIxZX5LkdI6Zd4phlrUUgqHN97sGVDI34YcF4qpCWtYRoRsW-NdgjQ>
    <xmx:WIxZX4JC_DuuQJ9kE_QYrBfPfiKr5jofn-XMM23ngpUzKz-Q4tzl6w>
    <xmx:WYxZXyjRnScmnUzM-jECiFE8YJXGzf2njjfcfatYyX19BNNSvVhsUA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F00FFE00A6; Wed,  9 Sep 2020 22:15:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <ec40306b-39d4-48cb-8e14-28e5ed615655@www.fastmail.com>
In-Reply-To: <CACPK8XeOf1H2Cdo434DsAjDNGrohip_MZTSMMOh1nhspz2y7dA@mail.gmail.com>
References: <20200909114312.2863675-1-andrew@aj.id.au>
 <20200909114312.2863675-2-andrew@aj.id.au>
 <CACPK8XeOf1H2Cdo434DsAjDNGrohip_MZTSMMOh1nhspz2y7dA@mail.gmail.com>
Date:   Thu, 10 Sep 2020 11:45:30 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Johnny Huang" <johnny_huang@aspeedtech.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/3]_pinctrl:_aspeed:_Format_pinconf_debug_consiste?=
 =?UTF-8?Q?nt_with_pinmux?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 10 Sep 2020, at 11:22, Joel Stanley wrote:
> On Wed, 9 Sep 2020 at 11:43, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > When displaying which pinconf register and field is being touched, format the
> > field mask so that it's consistent with the way the pinmux portion
> > formats the mask.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > index 53f3f8aec695..d8972911d505 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > @@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
> >                 if (rc < 0)
> >                         return rc;
> >
> > -               pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
> > -                               __func__, pconf->reg, __ffs(pconf->mask),
> > -                               pmap->val, param, arg, offset);
> > +               pr_debug("%s: Set SCU%02X[0x%08X]=%d for param %d(=%d) on pin %d\n",
> 
> 
> The pr_debug in pinmux-aspeed.c prints val as 0x%X. Did you want to do
> that here?

Fair point, I'll do a v2.

Andrew
