Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79443A08C6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 02:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbhFIA5f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 20:57:35 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:44771 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231765AbhFIA5f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 20:57:35 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0EBE658090F;
        Tue,  8 Jun 2021 20:55:41 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=3Nt5JvyrsYxWZO5AoBJCPRdGxY3UPM3
        x9iKRgVLmBwk=; b=afsQfp/NSm1WxsJ/I45w+huEp4GTjrjG5RwEBMvnGR/C8Me
        HoS4PON7JvTOdMN97st2whfv82hgOTmIplhVkgiAXl0aGLAXVX7bcYCOltuGZ3PB
        9Fwrh/i+uq8Bo+QaLJ/oQYo6/nB7ay846usSgDLxgyW/qNdLxFGsjd/LylhwxC7j
        c6pD9JhjqutrniYQo0X5pI7/UePfkeyQtWdmsw/op1PndaOYZffG2FtJrs0u/FPG
        wXHPJNrWUHY4cxZSZGe3Pgow9i/AfZxDdz2cCwXTVdbRgD0a06SLkzYs755pOa/3
        nlcDKmuKXEbDeTY/q1tjcGwaPesfXKinkcd1n3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3Nt5Jv
        yrsYxWZO5AoBJCPRdGxY3UPM3x9iKRgVLmBwk=; b=QRbV2p3fWsZ6GbTYxbm/bv
        T1+hbuKApW2yeY3nOG34rkboMbDvjO2gD8c1AhCdK+BlM4CzDSTNxQReiQ38ooiQ
        IDv+bT89kT5LzLzK3GesX/vhQarvdkZQq52utc5YliJ2R+THIjVkV9I6wPnWZKfd
        e31C4qbqOqO0LCFnyWqgZ0yBU0bTFChX13Djc91Nw4NuSFUvocPPqONf/gZvloH6
        PkHD2y+qq0+XjnG2WLJBm5PD7EQfIQeGlP69f1Gw6ApdwAk4U3v5JV0joKyHIQhA
        NpoH2TB22h7AfTewip5XjYeRQ+oXfGr9mLQ/xkfsZ8gdDGpa18j6RS0EiHhQtgiw
        ==
X-ME-Sender: <xms:ixHAYD8BCTUtPorKFfl_hv-nNhoDQ8t2TgAc1XC0NEv9XkH5kLhEcg>
    <xme:ixHAYPs9_rvaRbruLJcTv6YUm9qEXUNhpXUtg1r7BQQpZSoymptlETAYPrx1TWmvf
    slBI0MFPhtkexzB6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ixHAYBA-tDvS-Mq3RgdUNgb1qDHrw6Cxk5s17sPc0_b8ZS3S7-EMZA>
    <xmx:ixHAYPc4JLfvHf8FDdNcVruy2eoOE_WW7H2uwR9DJpj8XVFi_QwXTA>
    <xmx:ixHAYIPvkXfsdj9d2m6FR2YamFeqNEmNnMDbD_XFq3-cWlpxcKqF-w>
    <xmx:jRHAYJFor7evvN5VT9oxUmWCf5siRI9P51tdY3ZECoUiKRuGYMQUIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AAD91AC0062; Tue,  8 Jun 2021 20:55:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <6f87ccf4-9b8f-4c67-84a1-e83a2ee5103b@www.fastmail.com>
In-Reply-To: <20210608102547.4880-7-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-7-steven_lee@aspeedtech.com>
Date:   Wed, 09 Jun 2021 10:25:08 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_06/10]_gpio:_gpio-aspeed-sgpio:_Add_AST2400_and_?=
 =?UTF-8?Q?AST2500_platform_data.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> We use platform data to store GPIO pin mask and the max number of
> available GPIO pins for AST2600.
> Refactor driver to also add the platform data for AST2400/AST2500 and
> remove unused MAX_NR_HW_SGPIO and ASPEED_SGPIO_PINS_MASK macros.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 34 +++++++++++---------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index ea20a0127748..7d0a4f6fd9d1 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -17,21 +17,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>  
> -/*
> - * MAX_NR_HW_GPIO represents the number of actual hardware-supported GPIOs (ie,
> - * slots within the clocked serial GPIO data). Since each HW GPIO is both an
> - * input and an output, we provide MAX_NR_HW_GPIO * 2 lines on our gpiochip
> - * device.
> - *
> - * We use SGPIO_OUTPUT_OFFSET to define the split between the inputs and
> - * outputs; the inputs start at line 0, the outputs start at OUTPUT_OFFSET.
> - */
> -#define MAX_NR_HW_SGPIO			80
> -#define SGPIO_OUTPUT_OFFSET		MAX_NR_HW_SGPIO
> -
>  #define ASPEED_SGPIO_CTRL		0x54
>  
> -#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
>  #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
>  #define ASPEED_SGPIO_ENABLE		BIT(0)
>  #define ASPEED_SGPIO_PINS_SHIFT		6
> @@ -484,6 +471,11 @@ static int aspeed_sgpio_setup_irqs(struct 
> aspeed_sgpio *gpio,
>  	return 0;
>  }
>  
> +static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
> +	.max_ngpios = 80,
> +	.pin_mask = GENMASK(9, 6),
> +};
> +
>  static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
>  	.max_ngpios = 128,
>  	.pin_mask = GENMASK(10, 6),
> @@ -495,8 +487,8 @@ static const struct aspeed_sgpio_pdata 
> ast2600_sgpiom_80_pdata = {
>  };
>  
>  static const struct of_device_id aspeed_sgpio_of_table[] = {
> -	{ .compatible = "aspeed,ast2400-sgpio" },
> -	{ .compatible = "aspeed,ast2500-sgpio" },
> +	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata, 
> },
> +	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata, 
> },
>  	{ .compatible = "aspeed,ast2600-sgpiom-128", .data = 
> &ast2600_sgpiom_128_pdata, },
>  	{ .compatible = "aspeed,ast2600-sgpiom-80", .data = 
> &ast2600_sgpiom_80_pdata, },
>  	{}
> @@ -521,13 +513,11 @@ static int __init aspeed_sgpio_probe(struct 
> platform_device *pdev)
>  		return PTR_ERR(gpio->base);
>  
>  	pdata = device_get_match_data(&pdev->dev);
> -	if (pdata) {
> -		gpio->max_ngpios = pdata->max_ngpios;
> -		pin_mask = pdata->pin_mask;
> -	} else {
> -		gpio->max_ngpios = MAX_NR_HW_SGPIO;
> -		pin_mask = ASPEED_SGPIO_PINS_MASK;
> -	}
> +	if (!pdata)
> +		return -EINVAL;
> +
> +	gpio->max_ngpios = pdata->max_ngpios;
> +	pin_mask = pdata->pin_mask;

Hmm, okay, maybe just re-order the patches so this commit comes before the previous one. That way we don't immediately rip out this condition that we just introduced in the previous patch.

I think I suggested squashing it into the previous patch, but with the removal of the comments and macros I think it's worth leaving it separate, just reordered.

Andrew
