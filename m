Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A9B39ED07
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 05:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhFHDY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 23:24:58 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:42151 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230266AbhFHDY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 23:24:58 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id B82C1580396;
        Mon,  7 Jun 2021 23:22:57 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Mon, 07 Jun 2021 23:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=4Xae7CRnIiDzhAqUcXAYIJ05byHEZlC
        LmNlNacGJVLg=; b=LmtxlVZIGmrmI3YiKQglPKp8Ei7sIPAxLn4co4xSj8hT9I6
        vOwjsZcwC+RmffNaOmLpuBySzYfUATwdCTJprIi6OT9MDq1JcZOF7oC+3VCofg/p
        pp+jsisVS8xYYd+zfQZIea4KA/UxOPCwVPF7hISIrOHVxG8ofjvUutkvNwCCeil4
        AW9OaFkgRPy/RFI3hqu2WE5s9zeA/6SYrlJeM/Uhu8lgGa+IU3ZaFZh/maYJ2d5v
        kdXHEhIYuzDGxhrWQna8bmxQoxKvmftFlOYF+OcO1NMM8Vth+9pBPmGvwlHiTqwO
        1SMtFlLrA7KVVv7XxArh6Bf4m2BdylMHE9RlxZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4Xae7C
        RnIiDzhAqUcXAYIJ05byHEZlCLmNlNacGJVLg=; b=Y8I8hG9N23jDnYt+zn9G24
        2AsCx79Rvg4jjOKGjGfcHXXy0XqngQ5iO0B2arVT53vp9aB/3B6jZMiU0eNgF8ME
        zCJeENeVZVR8fhGl30jvpe6JNVqp8QBXBiFOlrndQTYnEpnm6qVZoZ0+gyjeW55t
        d3AoC865cZpwc6Qy+tBcmc0f2kFXrecH3Go81nft04rzhl8Hzf+bYsDC2HofaZwG
        fzbixzZS2QhowhtTF30v9ESbi/NZaa79PzGWRNP60OXGtL/n7O6jzzV2NJWm9cUM
        YrmENVpwKjUMpJkQ5SgRF7CzPndXSVuQ0MG1x4HXDGDoEnf8b4ARQWItYnGc8wIA
        ==
X-ME-Sender: <xms:juK-YG0lIqzFY6oiMV3QATe9JK0GRwP18f4fWo7l08m06SaUD58ZuQ>
    <xme:juK-YJH5m0Zh9-aSdIuOBoFQ3xOnW2gV20kIFReKtsslj1dkSQF3qC-2a0ThXMTeR
    LyGNhXWyyEVkd9E2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:juK-YO7grfmyv5wfDoTA712uoiRpqBsD4aK9SbDtq7LcgCfCv1s7Aw>
    <xmx:juK-YH0Faot6n486U3zedjuq1CRPmNCLrc36qTCEwXtD1y0tbWC5ew>
    <xmx:juK-YJFokk7mq5f2NqVFtMCfmHVCEAkQ0eMbvW2lI5rSTCZ2p3UgVA>
    <xmx:keK-YB9BGGos1ga8je9QS6qaw0BqCfShxns4nJ0cYnUnxqmo1Mjsfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2FFC0AC0062; Mon,  7 Jun 2021 23:22:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <b8734d24-715c-46b3-ac70-e9c7c845a01b@www.fastmail.com>
In-Reply-To: <20210608025033.GB2948@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-5-steven_lee@aspeedtech.com>
 <f3805ca3-3d77-4482-b75f-3e869625e0bc@www.fastmail.com>
 <20210608025033.GB2948@aspeedtech.com>
Date:   Tue, 08 Jun 2021 12:52:24 +0930
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
Subject: Re: [PATCH v4 4/7] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 8 Jun 2021, at 12:20, Steven Lee wrote:
> The 06/08/2021 07:43, Andrew Jeffery wrote:
> > 
> > 
> > On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> > > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > > with 80 pins.
> > > In the current driver, the maximum number of gpio pins of SoC is hardcoded
> > > as 80 and the gpio pin count mask for GPIO Configuration register is
> > > hardcode as GENMASK(9,6). In addition, some functions use the hardcoded
> > > value to calculate the gpio offset.
> > > The patch adds ast2600 compatibles and platform data that includes the
> > > max number of gpio pins supported by ast2600 and gpio pin count mask for
> > > GPIO Configuration register.
> > > The patch also modifies some functions to pass aspeed_sgpio struct for
> > > calculating gpio offset without using the hardcoded value.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/gpio/gpio-aspeed-sgpio.c | 110 +++++++++++++++++++++----------
> > >  1 file changed, 76 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > > index 64e54f8c30d2..8b893356f0ca 100644
> > > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > > @@ -35,12 +35,18 @@
> > >  #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
> > >  #define ASPEED_SGPIO_ENABLE		BIT(0)
> > >  
> > > +struct aspeed_sgpio_pdata {
> > > +	const u32 pin_mask;
> > > +	int max_ngpios;
> > > +};
> > > +
> > >  struct aspeed_sgpio {
> > >  	struct gpio_chip chip;
> > >  	struct clk *pclk;
> > >  	spinlock_t lock;
> > >  	void __iomem *base;
> > >  	int irq;
> > > +	int max_ngpios;
> > >  	int n_sgpio;
> > >  };
> > >  
> > > @@ -75,7 +81,13 @@ static const struct aspeed_sgpio_bank 
> > > aspeed_sgpio_banks[] = {
> > >  		.val_regs = 0x0038,
> > >  		.rdata_reg = 0x0078,
> > >  		.irq_regs = 0x003C,
> > > -		.names = { "I", "J" },
> > > +		.names = { "I", "J", "K", "L" },
> > > +	},
> > > +	{
> > > +		.val_regs = 0x0090,
> > > +		.rdata_reg = 0x007C,
> > > +		.irq_regs = 0x0094,
> > > +		.names = { "M", "N", "O", "P" },
> > >  	},
> > >  };
> > >  
> > > @@ -121,15 +133,15 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
> > >  	}
> > >  }
> > >  
> > > -#define GPIO_BANK(x)    ((x % SGPIO_OUTPUT_OFFSET) >> 5)
> > > -#define GPIO_OFFSET(x)  ((x % SGPIO_OUTPUT_OFFSET) & 0x1f)
> > > -#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
> > > +#define GPIO_BANK(x, gpio)    ((x % (gpio)->max_ngpios) >> 5)
> > 
> > I couldn't stop myself from commenting on this: The 'context' parameter should be first (by convention), so:
> > 
> > #define GPIO_BANK(gpio, x) ((x % (gpio)->max_ngpios) >> 5)
> > 
> > There's another fix necessary here too - the x needs to be parenthesised:
> > 
> > #define GPIO_BANK(gpio, x) (((x) % (gpio)->max_ngpios) >> 5)
> > 
> > > +#define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))
> > > +#define GPIO_BIT(x, gpio)     BIT(GPIO_OFFSET(x % (gpio)->max_ngpios))
> > 
> > Again, put the context parameter first. And again we should add the parentheses around x in the expression.
> > 
> > >  
> > > -static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
> > > +static const struct aspeed_sgpio_bank *to_bank(unsigned int offset, 
> > > const struct aspeed_sgpio *gpio)
> > >  {
> > >  	unsigned int bank;
> > >  
> > > -	bank = GPIO_BANK(offset);
> > > +	bank = GPIO_BANK(offset, gpio);
> > >  
> > >  	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
> > >  	return &aspeed_sgpio_banks[bank];
> > > @@ -139,18 +151,19 @@ static int aspeed_sgpio_init_valid_mask(struct 
> > > gpio_chip *gc,
> > >  		unsigned long *valid_mask, unsigned int ngpios)
> > >  {
> > >  	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > > +	int max_ngpios = sgpio->max_ngpios;
> > >  	int n = sgpio->n_sgpio;
> > > -	int c = SGPIO_OUTPUT_OFFSET - n;
> > > +	int c = max_ngpios - n;
> > >  
> > > -	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > > +	WARN_ON(ngpios < max_ngpios * 2);
> > >  
> > >  	/* input GPIOs in the lower range */
> > >  	bitmap_set(valid_mask, 0, n);
> > >  	bitmap_clear(valid_mask, n, c);
> > >  
> > > -	/* output GPIOS above SGPIO_OUTPUT_OFFSET */
> > > -	bitmap_set(valid_mask, SGPIO_OUTPUT_OFFSET, n);
> > > -	bitmap_clear(valid_mask, SGPIO_OUTPUT_OFFSET + n, c);
> > > +	/* output GPIOS above max_ngpios */
> > > +	bitmap_set(valid_mask, max_ngpios, n);
> > > +	bitmap_clear(valid_mask, max_ngpios + n, c);
> > >  
> > >  	return 0;
> > >  }
> > > @@ -161,30 +174,30 @@ static void 
> > > aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> > >  	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > >  	int n = sgpio->n_sgpio;
> > >  
> > > -	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > > +	WARN_ON(ngpios < sgpio->max_ngpios * 2);
> > >  
> > >  	/* input GPIOs in the lower range */
> > >  	bitmap_set(valid_mask, 0, n);
> > >  	bitmap_clear(valid_mask, n, ngpios - n);
> > >  }
> > >  
> > > -static bool aspeed_sgpio_is_input(unsigned int offset)
> > > +static bool aspeed_sgpio_is_input(unsigned int offset, const struct 
> > > aspeed_sgpio *gpio)
> > >  {
> > > -	return offset < SGPIO_OUTPUT_OFFSET;
> > > +	return offset < gpio->max_ngpios;
> > >  }
> > >  
> > >  static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
> > >  {
> > >  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > > -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > > +	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio);
> > >  	unsigned long flags;
> > >  	enum aspeed_sgpio_reg reg;
> > >  	int rc = 0;
> > >  
> > >  	spin_lock_irqsave(&gpio->lock, flags);
> > >  
> > > -	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
> > > -	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
> > > +	reg = aspeed_sgpio_is_input(offset, gpio) ? reg_val : reg_rdata;
> > > +	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset, gpio));
> > >  
> > >  	spin_unlock_irqrestore(&gpio->lock, flags);
> > >  
> > > @@ -194,11 +207,11 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, 
> > > unsigned int offset)
> > >  static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, 
> > > int val)
> > >  {
> > >  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > > -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > > +	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio);
> > >  	void __iomem *addr_r, *addr_w;
> > >  	u32 reg = 0;
> > >  
> > > -	if (aspeed_sgpio_is_input(offset))
> > > +	if (aspeed_sgpio_is_input(offset, gpio))
> > >  		return -EINVAL;
> > >  
> > >  	/* Since this is an output, read the cached value from rdata, then
> > > @@ -209,9 +222,9 @@ static int sgpio_set_value(struct gpio_chip *gc, 
> > > unsigned int offset, int val)
> > >  	reg = ioread32(addr_r);
> > >  
> > >  	if (val)
> > > -		reg |= GPIO_BIT(offset);
> > > +		reg |= GPIO_BIT(offset, gpio);
> > >  	else
> > > -		reg &= ~GPIO_BIT(offset);
> > > +		reg &= ~GPIO_BIT(offset, gpio);
> > >  
> > >  	iowrite32(reg, addr_w);
> > >  
> > > @@ -232,7 +245,9 @@ static void aspeed_sgpio_set(struct gpio_chip *gc, 
> > > unsigned int offset, int val)
> > >  
> > >  static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
> > >  {
> > > -	return aspeed_sgpio_is_input(offset) ? 0 : -EINVAL;
> > > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > > +
> > > +	return aspeed_sgpio_is_input(offset, gpio) ? 0 : -EINVAL;
> > >  }
> > >  
> > >  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int 
> > > offset, int val)
> > > @@ -253,7 +268,9 @@ static int aspeed_sgpio_dir_out(struct gpio_chip 
> > > *gc, unsigned int offset, int v
> > >  
> > >  static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned 
> > > int offset)
> > >  {
> > > -	return !!aspeed_sgpio_is_input(offset);
> > > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > > +
> > > +	return !!aspeed_sgpio_is_input(offset, gpio);
> > >  }
> > >  
> > >  static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> > > @@ -268,8 +285,8 @@ static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> > >  	WARN_ON(!internal);
> > >  
> > >  	*gpio = internal;
> > > -	*bank = to_bank(*offset);
> > > -	*bit = GPIO_BIT(*offset);
> > > +	*bank = to_bank(*offset, internal);
> > > +	*bit = GPIO_BIT(*offset, internal);
> > >  }
> > >  
> > >  static void aspeed_sgpio_irq_ack(struct irq_data *d)
> > > @@ -466,9 +483,21 @@ static int aspeed_sgpio_setup_irqs(struct 
> > > aspeed_sgpio *gpio,
> > >  	return 0;
> > >  }
> > >  
> > > +static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
> > > +	.max_ngpios = 128,
> > > +	.pin_mask = GENMASK(10, 6),
> > > +};
> > > +
> > > +static const struct aspeed_sgpio_pdata ast2600_sgpiom_80_pdata = {
> > > +	.max_ngpios = 80,
> > > +	.pin_mask = GENMASK(10, 6),
> > > +};
> > > +
> > >  static const struct of_device_id aspeed_sgpio_of_table[] = {
> > >  	{ .compatible = "aspeed,ast2400-sgpio" },
> > >  	{ .compatible = "aspeed,ast2500-sgpio" },
> > 
> > Add .data for these too.
> > 
> 
> I was wondering if I can define a platform data for both ast2400 and
> ast2500 as they have the same configurations.
> 
> For example:
> 
> static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
> 	.max_ngpios = 80,
> 	.pin_mask = GENMASK(9, 6),
> };
> 
> static const struct of_device_id aspeed_sgpio_of_table[] = {
> 	{ .compatible = "aspeed,ast2400-sgpio", .data = ast2400_sgpio_pdata, },
> 	{ .compatible = "aspeed,ast2500-sgpio", .data = ast2400_sgpio_pdata, },
> 

Yep, that's fine.

Cheers,

Andrew
