Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A88E3A08BF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 02:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbhFIAym (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 20:54:42 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:57083 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232063AbhFIAym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 20:54:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id E2BA658085F;
        Tue,  8 Jun 2021 20:52:47 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=bAga2k4aUZu9v73raYgmoUrzd2Zcccy
        W+6BWdcFp5Kw=; b=NRb6RMXFZxD5DyGLvB/Ej88qt5krZaw9iLW+Sw46JXRUabr
        eGBiewo6vypqFvCAA+PVPVo7LnRIsoEPDvPECVUq5g1fomXh60glBOaq5L/jvhfZ
        PMcb+JGgZQZ4Niy1vXZ4sdiRaOrGuXCVUSHF3wLtnnKchhSI+WM1jBfHd37/IDSZ
        3Ip0jl/vZk04c0yDqY3O0VpUNKFdGVMGRRAQ6kwiw2QYe3wdlObNLSOQDtE1KLs5
        d/qMyZgv5eFGg+JQVINz17rYuALZOlQZ6fwAR4Ublfe5Z8tERwxei//nZH13fW1Q
        3tG64DjBzvNToBzUepDbFPIbgJ1pQlLvHcsbFIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bAga2k
        4aUZu9v73raYgmoUrzd2ZcccyW+6BWdcFp5Kw=; b=r6IY9XL9i1gVRlCPD0cCuA
        4mv4XZVtHXyhLm3M45M45ST9KWwIpvxsu9tdVy0sQbMmeRqN2gaQPu+FETnY64WW
        h5R9lxrEFaGKbV6QVoKs2IjmMl92RC3RDeLtVwrFhUm+jn6LQ+WRdKT1iTMEvVjV
        8jCSkM2j/BRPL1EXNJzrtZu6kGaOtvYQvtGIq5aPo3FL3EDu35EDFtwEe//f3LYM
        /FCMG62VW2JK+YSAVR9D2odz5UB4syp/hLmYhQkhDta8QKo20zSfrE/mMRGEraAa
        3uJ5RRRdeS6RHbk8yGJnrvM9rFA4vIZevvycXXEjM6EPhmOihuEo/IFrC7aJDtdA
        ==
X-ME-Sender: <xms:3hDAYEGx9oZ61zp3nFcTGUuZKcu3XHg6V4JstZeoRjj2jjCm1uWBBw>
    <xme:3hDAYNX6KygAV5yduHS3yx5g-pA9ZanJIienz2W0q9Xm1nUg9aMm3lWR6amXyX2S9
    IXjvNb8WlZkS7FD1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3hDAYOKC0YdYN2w_WXivKg-uZRFfAbv0RNhFmuh9_q2WHcE-u4kjzA>
    <xmx:3hDAYGEyB_lvOE_1EeDSzRdfi7hx4zxeLkM64Dt05oNlvT_jP014ow>
    <xmx:3hDAYKVdA0us6NLmFhLdE-49MPVAsnd-2_3wUFRrTxf2lSjf3U0Wcg>
    <xmx:3xDAYDOjwPHMuSG6CmKdEyNsuQVX1MTBRUSIsNuiEFOx9VDpPxxsrw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7D561AC0062; Tue,  8 Jun 2021 20:52:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <faf26ac4-a2b7-413b-bd0b-5d4c8676a74e@www.fastmail.com>
In-Reply-To: <20210608102547.4880-6-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-6-steven_lee@aspeedtech.com>
Date:   Wed, 09 Jun 2021 10:22:24 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_05/10]_gpio:_gpio-aspeed-sgpio:_Add_AST2600_sgpi?=
 =?UTF-8?Q?o_support?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> In the current driver, the maximum number of gpio pins of SoC is hardcoded
> as 80 and the gpio pin count mask for GPIO Configuration register is
> hardcode as GENMASK(9,6). In addition, some functions use the hardcoded
> value to calculate the gpio offset.
> The patch adds ast2600 compatibles and platform data that includes the
> max number of gpio pins supported by ast2600 and gpio pin count mask for
> GPIO Configuration register.
> The patch also modifies some functions to pass aspeed_sgpio struct for
> calculating gpio offset without using the hardcoded value.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 107 +++++++++++++++++++++----------
>  1 file changed, 73 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 64e54f8c30d2..ea20a0127748 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -34,6 +34,12 @@
>  #define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
>  #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
>  #define ASPEED_SGPIO_ENABLE		BIT(0)
> +#define ASPEED_SGPIO_PINS_SHIFT		6
> +
> +struct aspeed_sgpio_pdata {
> +	const u32 pin_mask;
> +	int max_ngpios;
> +};
>  
>  struct aspeed_sgpio {
>  	struct gpio_chip chip;
> @@ -41,6 +47,7 @@ struct aspeed_sgpio {
>  	spinlock_t lock;
>  	void __iomem *base;
>  	int irq;
> +	int max_ngpios;
>  	int n_sgpio;
>  };
>  
> @@ -75,7 +82,13 @@ static const struct aspeed_sgpio_bank 
> aspeed_sgpio_banks[] = {
>  		.val_regs = 0x0038,
>  		.rdata_reg = 0x0078,
>  		.irq_regs = 0x003C,
> -		.names = { "I", "J" },
> +		.names = { "I", "J", "K", "L" },
> +	},
> +	{
> +		.val_regs = 0x0090,
> +		.rdata_reg = 0x007C,
> +		.irq_regs = 0x0094,
> +		.names = { "M", "N", "O", "P" },
>  	},
>  };
>  
> @@ -121,15 +134,15 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
>  	}
>  }
>  
> -#define GPIO_BANK(x)    ((x % SGPIO_OUTPUT_OFFSET) >> 5)
> -#define GPIO_OFFSET(x)  ((x % SGPIO_OUTPUT_OFFSET) & 0x1f)
> -#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
> +#define GPIO_BANK(gpio, x)    (((x) % (gpio)->max_ngpios) >> 5)
> +#define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))
> +#define GPIO_BIT(gpio, x)     BIT(GPIO_OFFSET((x) % (gpio)->max_ngpios))
>  
> -static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
> +static const struct aspeed_sgpio_bank *to_bank(unsigned int offset, 
> const struct aspeed_sgpio *gpio)

Bit of a nit-pick, but again here, the context pointer (const struct aspeed_sgpio *) should be the first argument.

>  {
>  	unsigned int bank;
>  
> -	bank = GPIO_BANK(offset);
> +	bank = GPIO_BANK(gpio, offset);
>  
>  	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
>  	return &aspeed_sgpio_banks[bank];
> @@ -139,18 +152,19 @@ static int aspeed_sgpio_init_valid_mask(struct 
> gpio_chip *gc,
>  		unsigned long *valid_mask, unsigned int ngpios)
>  {
>  	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> +	int max_ngpios = sgpio->max_ngpios;
>  	int n = sgpio->n_sgpio;
> -	int c = SGPIO_OUTPUT_OFFSET - n;
> +	int c = max_ngpios - n;
>  
> -	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> +	WARN_ON(ngpios < max_ngpios * 2);
>  
>  	/* input GPIOs in the lower range */
>  	bitmap_set(valid_mask, 0, n);
>  	bitmap_clear(valid_mask, n, c);
>  
> -	/* output GPIOS above SGPIO_OUTPUT_OFFSET */
> -	bitmap_set(valid_mask, SGPIO_OUTPUT_OFFSET, n);
> -	bitmap_clear(valid_mask, SGPIO_OUTPUT_OFFSET + n, c);
> +	/* output GPIOS above max_ngpios */
> +	bitmap_set(valid_mask, max_ngpios, n);
> +	bitmap_clear(valid_mask, max_ngpios + n, c);
>  
>  	return 0;
>  }
> @@ -161,30 +175,30 @@ static void 
> aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
>  	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
>  	int n = sgpio->n_sgpio;
>  
> -	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> +	WARN_ON(ngpios < sgpio->max_ngpios * 2);
>  
>  	/* input GPIOs in the lower range */
>  	bitmap_set(valid_mask, 0, n);
>  	bitmap_clear(valid_mask, n, ngpios - n);
>  }
>  
> -static bool aspeed_sgpio_is_input(unsigned int offset)
> +static bool aspeed_sgpio_is_input(unsigned int offset, const struct 
> aspeed_sgpio *gpio)
>  {
> -	return offset < SGPIO_OUTPUT_OFFSET;
> +	return offset < gpio->max_ngpios;
>  }
>  
>  static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> +	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio);
>  	unsigned long flags;
>  	enum aspeed_sgpio_reg reg;
>  	int rc = 0;
>  
>  	spin_lock_irqsave(&gpio->lock, flags);
>  
> -	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
> -	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
> +	reg = aspeed_sgpio_is_input(offset, gpio) ? reg_val : reg_rdata;
> +	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(gpio, offset));
>  
>  	spin_unlock_irqrestore(&gpio->lock, flags);
>  
> @@ -194,11 +208,11 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, 
> unsigned int offset)
>  static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, 
> int val)
>  {
>  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> +	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio);
>  	void __iomem *addr_r, *addr_w;
>  	u32 reg = 0;
>  
> -	if (aspeed_sgpio_is_input(offset))
> +	if (aspeed_sgpio_is_input(offset, gpio))
>  		return -EINVAL;
>  
>  	/* Since this is an output, read the cached value from rdata, then
> @@ -209,9 +223,9 @@ static int sgpio_set_value(struct gpio_chip *gc, 
> unsigned int offset, int val)
>  	reg = ioread32(addr_r);
>  
>  	if (val)
> -		reg |= GPIO_BIT(offset);
> +		reg |= GPIO_BIT(gpio, offset);
>  	else
> -		reg &= ~GPIO_BIT(offset);
> +		reg &= ~GPIO_BIT(gpio, offset);
>  
>  	iowrite32(reg, addr_w);
>  
> @@ -232,7 +246,9 @@ static void aspeed_sgpio_set(struct gpio_chip *gc, 
> unsigned int offset, int val)
>  
>  static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
>  {
> -	return aspeed_sgpio_is_input(offset) ? 0 : -EINVAL;
> +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> +
> +	return aspeed_sgpio_is_input(offset, gpio) ? 0 : -EINVAL;
>  }
>  
>  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int 
> offset, int val)
> @@ -253,7 +269,9 @@ static int aspeed_sgpio_dir_out(struct gpio_chip 
> *gc, unsigned int offset, int v
>  
>  static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned 
> int offset)
>  {
> -	return !!aspeed_sgpio_is_input(offset);
> +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> +
> +	return !!aspeed_sgpio_is_input(offset, gpio);
>  }
>  
>  static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> @@ -268,8 +286,8 @@ static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
>  	WARN_ON(!internal);
>  
>  	*gpio = internal;
> -	*bank = to_bank(*offset);
> -	*bit = GPIO_BIT(*offset);
> +	*bank = to_bank(*offset, internal);
> +	*bit = GPIO_BIT(internal, *offset);
>  }
>  
>  static void aspeed_sgpio_irq_ack(struct irq_data *d)
> @@ -466,9 +484,21 @@ static int aspeed_sgpio_setup_irqs(struct 
> aspeed_sgpio *gpio,
>  	return 0;
>  }
>  
> +static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
> +	.max_ngpios = 128,
> +	.pin_mask = GENMASK(10, 6),
> +};
> +
> +static const struct aspeed_sgpio_pdata ast2600_sgpiom_80_pdata = {
> +	.max_ngpios = 80,
> +	.pin_mask = GENMASK(10, 6),
> +};
> +
>  static const struct of_device_id aspeed_sgpio_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-sgpio" },
>  	{ .compatible = "aspeed,ast2500-sgpio" },

What happened to defining platform data for the 2400 and 2500 ...

> +	{ .compatible = "aspeed,ast2600-sgpiom-128", .data = 
> &ast2600_sgpiom_128_pdata, },
> +	{ .compatible = "aspeed,ast2600-sgpiom-80", .data = 
> &ast2600_sgpiom_80_pdata, },
>  	{}
>  };
>  
> @@ -476,10 +506,11 @@ MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
>  
>  static int __init aspeed_sgpio_probe(struct platform_device *pdev)
>  {
> +	u32 nr_gpios, sgpio_freq, sgpio_clk_div, gpio_cnt_regval, pin_mask;
> +	const struct aspeed_sgpio_pdata *pdata;
>  	struct aspeed_sgpio *gpio;
> -	u32 nr_gpios, sgpio_freq, sgpio_clk_div;
> -	int rc;
>  	unsigned long apb_freq;
> +	int rc;
>  
>  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> @@ -489,13 +520,22 @@ static int __init aspeed_sgpio_probe(struct 
> platform_device *pdev)
>  	if (IS_ERR(gpio->base))
>  		return PTR_ERR(gpio->base);
>  
> +	pdata = device_get_match_data(&pdev->dev);
> +	if (pdata) {
> +		gpio->max_ngpios = pdata->max_ngpios;
> +		pin_mask = pdata->pin_mask;
> +	} else {
> +		gpio->max_ngpios = MAX_NR_HW_SGPIO;
> +		pin_mask = ASPEED_SGPIO_PINS_MASK;
> +	}
> +

... because we should avoid introducing this branch if possible.

Aside from these two minor issues, it looks okay to me.

Andrew
