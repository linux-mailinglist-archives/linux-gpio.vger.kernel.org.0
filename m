Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C3F3A0CAC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 08:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhFIGsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 02:48:08 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52477 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233887AbhFIGsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 02:48:06 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id D8403580ADE;
        Wed,  9 Jun 2021 02:46:11 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Wed, 09 Jun 2021 02:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=2YOzmbDi1xjNEo1C6HPD/84oDZ0f4/H
        N3jUNZ1te9sM=; b=J52hxjoZPOK9ytKJdu6wtQ/DzS/sftP8GX+qfXN4vWKh204
        EHMUHffjlr6j0AzXsGwDPE8HdoCpjLD64IRBp8CtNAPhZfXApizkEL/T0E/bJqo8
        Aef3Wtv5kuGry35OCkY8Rc6e8m1AmxHyKLTCi0HnauSkZGIw+P87VekLzzDLqZlY
        5d/mZMEf492d5I6+1rSiYrpXM5x24KuniOBE1V76Nz7BpWQXN2P+P6Ghwvaxtc48
        m6CLohrFzQjcFwwth0Z8hmEu52H4dGafm+xZJxh8Apep9ta4a2zPPP5qa/Gu8RR5
        kYVpNWTKWXC5+xYqtn1kxqz4c2xaTj7jJ908f4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2YOzmb
        Di1xjNEo1C6HPD/84oDZ0f4/HN3jUNZ1te9sM=; b=P5o1uiLjTdXzogRlt4fEQn
        S7LjwMxu4kT9DYr4HTAcR29V47PKLRGn42nUkGedv2HpB6ShzgVyvJnP4WWOz8gs
        54zqjO9/rlqJs8jxCV1W4k+DBb2aC3Mb7+5Sx4BW7vAkZ6IzZIbRgGigPdQpAjbG
        Ti8xUb6Qjef1EutUD4fGjO7+HR8mXR3wB3BWfMlTu/WZMLIA98CvpcZtJyXVuCU8
        Q5GUAGWD3gPp8DWKDvHDb6SD5IxjLijI9rAFjyp6QdTfHpCP8cWtdDR9SV/JqwFg
        hepsLNXfPL8KJPu9v10qnWurCw+AnOHc2nkyVbZ7rZahoaR+tDmMlw8IDk57M0Iw
        ==
X-ME-Sender: <xms:smPAYAdcPlnp6-PIsL4jZ-8nCYYBtaz-aMpbrCT8uIKy-in0O1UNVQ>
    <xme:smPAYCOVpTY63fl9k4H90CxBYVdFfg-iHVTgJ41MeAeaPQmP6QhNpC2gxsks8SnJP
    Sryw8q8rTfH90Fe7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileet
    tedvtdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:smPAYBhKItYPXGBd7dV-5NJqq6TtnPv2gLqw5mwYibXyNiFvt0ndng>
    <xmx:smPAYF-ILl5xOI7Q9nTNggc4nq9qtx1hFEeGCvR_h6mL_kj8x4IAXw>
    <xmx:smPAYMsuLT6FX30WXFHJGisGOJrMF1H-fKl0qvV4ClzciKwveP2ojA>
    <xmx:s2PAYNkJOQh8NQcZLD581QUbS8ySKQnEIBzBDgxFpR-aI-HVk6xKnw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3D808AC0064; Wed,  9 Jun 2021 02:46:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <1a4dc5a6-8035-4879-ba9d-b6d6afd48196@www.fastmail.com>
In-Reply-To: <20210609041227.GB14839@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-7-steven_lee@aspeedtech.com>
 <6f87ccf4-9b8f-4c67-84a1-e83a2ee5103b@www.fastmail.com>
 <20210609041227.GB14839@aspeedtech.com>
Date:   Wed, 09 Jun 2021 16:15:50 +0930
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
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v5_06/10]_gpio:_gpio-aspeed-sgpio:_Add_AST2400_and_?=
 =?UTF-8?Q?AST2500_platform_data.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 9 Jun 2021, at 13:42, Steven Lee wrote:
> The 06/09/2021 08:55, Andrew Jeffery wrote:
> > 
> > 
> > On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> > > We use platform data to store GPIO pin mask and the max number of
> > > available GPIO pins for AST2600.
> > > Refactor driver to also add the platform data for AST2400/AST2500 and
> > > remove unused MAX_NR_HW_SGPIO and ASPEED_SGPIO_PINS_MASK macros.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/gpio/gpio-aspeed-sgpio.c | 34 +++++++++++---------------------
> > >  1 file changed, 12 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > > index ea20a0127748..7d0a4f6fd9d1 100644
> > > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > > @@ -17,21 +17,8 @@
> > >  #include <linux/spinlock.h>
> > >  #include <linux/string.h>
> > >  
> > > -/*
> > > - * MAX_NR_HW_GPIO represents the number of actual hardware-supported GPIOs (ie,
> > > - * slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > > - * input and an output, we provide MAX_NR_HW_GPIO * 2 lines on our gpiochip
> > > - * device.
> > > - *
> > > - * We use SGPIO_OUTPUT_OFFSET to define the split between the inputs and
> > > - * outputs; the inputs start at line 0, the outputs start at OUTPUT_OFFSET.
> > > - */
> > > -#define MAX_NR_HW_SGPIO			80
> > > -#define SGPIO_OUTPUT_OFFSET		MAX_NR_HW_SGPIO
> > > -
> > >  #define ASPEED_SGPIO_CTRL		0x54
> > >  
> > > -#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
> > >  #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
> > >  #define ASPEED_SGPIO_ENABLE		BIT(0)
> > >  #define ASPEED_SGPIO_PINS_SHIFT		6
> > > @@ -484,6 +471,11 @@ static int aspeed_sgpio_setup_irqs(struct 
> > > aspeed_sgpio *gpio,
> > >  	return 0;
> > >  }
> > >  
> > > +static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
> > > +	.max_ngpios = 80,
> > > +	.pin_mask = GENMASK(9, 6),
> > > +};
> > > +
> > >  static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
> > >  	.max_ngpios = 128,
> > >  	.pin_mask = GENMASK(10, 6),
> > > @@ -495,8 +487,8 @@ static const struct aspeed_sgpio_pdata 
> > > ast2600_sgpiom_80_pdata = {
> > >  };
> > >  
> > >  static const struct of_device_id aspeed_sgpio_of_table[] = {
> > > -	{ .compatible = "aspeed,ast2400-sgpio" },
> > > -	{ .compatible = "aspeed,ast2500-sgpio" },
> > > +	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata, 
> > > },
> > > +	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata, 
> > > },
> > >  	{ .compatible = "aspeed,ast2600-sgpiom-128", .data = 
> > > &ast2600_sgpiom_128_pdata, },
> > >  	{ .compatible = "aspeed,ast2600-sgpiom-80", .data = 
> > > &ast2600_sgpiom_80_pdata, },
> > >  	{}
> > > @@ -521,13 +513,11 @@ static int __init aspeed_sgpio_probe(struct 
> > > platform_device *pdev)
> > >  		return PTR_ERR(gpio->base);
> > >  
> > >  	pdata = device_get_match_data(&pdev->dev);
> > > -	if (pdata) {
> > > -		gpio->max_ngpios = pdata->max_ngpios;
> > > -		pin_mask = pdata->pin_mask;
> > > -	} else {
> > > -		gpio->max_ngpios = MAX_NR_HW_SGPIO;
> > > -		pin_mask = ASPEED_SGPIO_PINS_MASK;
> > > -	}
> > > +	if (!pdata)
> > > +		return -EINVAL;
> > > +
> > > +	gpio->max_ngpios = pdata->max_ngpios;
> > > +	pin_mask = pdata->pin_mask;
> > 
> > Hmm, okay, maybe just re-order the patches so this commit comes before the previous one. That way we don't immediately rip out this condition that we just introduced in the previous patch.
> > 
> > I think I suggested squashing it into the previous patch, but with the removal of the comments and macros I think it's worth leaving it separate, just reordered.
> > 
> 
> I was wondering if I can squash patch-05 and patch-06 into one patch
> as this patch(patch-06) requires macros, structures, and functions that
> modified in the previous patch(patch-05).

Yeah, fair enough. Just squash them.

Cheers,

Andrew
