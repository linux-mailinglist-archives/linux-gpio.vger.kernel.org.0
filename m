Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937F6392532
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 05:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhE0DGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 23:06:36 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48089 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234331AbhE0DGf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 23:06:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 78DE358065E;
        Wed, 26 May 2021 23:05:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 26 May 2021 23:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=gFijnxHcgjqP0YTrL7H2zWs78QnPx7+
        eU0DB7H0pXN0=; b=oG/V5WpMvdfBlah7MnbrhN5mg3JroAseExaProxhdnBVtqd
        k8dQgBeu5LMYQkE27622sL0RyKRvUdHdP8ztRdx6PSrLVo0OySOjvuUlPYmpN5bG
        7H6zKzSNmkmRcaJ9+aT54mSz67EDQOYH7OnG2yP1voGtPqldA2yBKLs3yRQbebs2
        nqEVasxE+dnJAiwNij06rSMkov7IhKaMendina2cc7rnaAElFEIBuJJRbjPfi/mB
        QvKDlNKqJOGfdt85LpgewnuobGv9CjOlijPK4AFev/m66UMEtiW8nycvRhiCjYK8
        ggS6CQzD/0Bfbm5PCjpOrOZCXQZ/sSXYIZ2p8JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gFijnx
        HcgjqP0YTrL7H2zWs78QnPx7+eU0DB7H0pXN0=; b=t9/xYrJTmG3YcgY26+jnz9
        Sqjr+IH3KXBy1x8Vr0ZqrAgVtfxaibEVh+QgkFG5ziDLUfdURjpuHh0GWSH0CGzd
        KPdHFUa6KHonssMvxNrQOPFoJcKABbg2wejnBGWQvfbjHKTLrFIlPdp1/uTtqfnk
        5XyleO/FS9kkiXSCUrOFw8vT3ep5v85P4Iy1tFzDTkb3WXewEAy/4nBg7m/AKZT1
        +EmdDiYzAxZDVGDekixHj2DkWAC8D3jHgIAkON7nisLq+mUZOOU999kZ30y1JAGF
        k+KTMk4GNSv2GNHqLV0vaoWChUkIT4jwEScfaHAZt/XGZ1wOxtIooVy029qGI34Q
        ==
X-ME-Sender: <xms:WwyvYJyQ4fTXO6hUGGrSlSK1CM4WKK_DsJ8kfR0UVmhJek_RDaai6A>
    <xme:WwyvYJTWvMvPZhXqa6K1y7mYuyMmX95xWoZwRYF34J6JZOUoscdyPVy6PGWtdxURW
    fb5acLlR68QkW5mgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WwyvYDWtAIjNSm5R2QEIN4g_N0aaP1mJ1f7VsKEY87PaSe7qN6MOng>
    <xmx:WwyvYLjJpmvTsUQBYREWJtNw0f6bPvMUbxERbUIqqqVGP3dUR5CC8A>
    <xmx:WwyvYLD3InFqfwzUOCJcqMxttiUkwEXYiYH560DHWlEIEjIVPPStWg>
    <xmx:XQyvYIJZAVvcsazYrSU2EXRZ0XzRSoQZuEKeZKZwGk0W2Z3A7OHyWw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 883E0A00079; Wed, 26 May 2021 23:04:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <3a9513fa-bdd2-45c9-bb4a-18ae3953d28a@www.fastmail.com>
In-Reply-To: <20210527023455.GA9971@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-5-steven_lee@aspeedtech.com>
 <0826dc6a-1c76-4301-985e-7885eb0e151d@www.fastmail.com>
 <20210527023455.GA9971@aspeedtech.com>
Date:   Thu, 27 May 2021 12:34:38 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
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
        "open list" <linux-kernel@vger.kernel.org>,
        "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>,
        "Jeremy Kerr" <jk@codeconstruct.com.au>
Subject: Re: [PATCH v1 4/4] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 27 May 2021, at 12:04, Steven Lee wrote:
> The 05/27/2021 09:26, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Wed, 26 May 2021, at 19:16, Steven Lee wrote:
> > >  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > > -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > >  	unsigned long flags;
> > >  	enum aspeed_sgpio_reg reg;
> > >  	int rc = 0;
> > >  
> > >  	spin_lock_irqsave(&gpio->lock, flags);
> > >  
> > > -	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
> > > -	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
> > > +	reg = aspeed_sgpio_is_input(offset, gpio->max_ngpios) ? reg_val : 
> > > reg_rdata;
> > 
> > We should just pass gpio here (i.e. make aspeed_sgpio_is_input take a 
> > 'const struct aspeed_sgpio *' parameter), rather than open-coding 
> > gpio->max_ngpios. This approach will make it easier to refactor the 
> > implementation in the future (if necessary).
> > 
> 
> I will rewrite the function to use aspeed_sgpio struct.


> > >  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > > -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > >  	void __iomem *addr_r, *addr_w;
> > >  	u32 reg = 0;
> > >  
> > > -	if (aspeed_sgpio_is_input(offset))
> > > +	if (aspeed_sgpio_is_input(offset, gpio->max_ngpios))
> > >  		return -EINVAL;
> > >  
> > >  	/* Since this is an output, read the cached value from rdata, then
> > > @@ -209,9 +214,9 @@ static int sgpio_set_value(struct gpio_chip *gc, 
> > > unsigned int offset, int val)
> > >  	reg = ioread32(addr_r);
> > >  
> > >  	if (val)
> > > -		reg |= GPIO_BIT(offset);
> > > +		reg |= GPIO_BIT(offset % gpio->max_ngpios);
> > 
> > Pass gpio through GPIO_BIT() too.
> > 
> 
> I don't understand this comment.
> Could you describe more?

Oh, sure, what I was suggesting was to make a similar change to 
GPIO_BIT() as I suggested for aspeed_sgpio_is_input() above.

Hope that helps.

Andrew
