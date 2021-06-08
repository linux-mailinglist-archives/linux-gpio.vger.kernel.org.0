Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC51A39EC61
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 04:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhFHCxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 22:53:39 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:52205 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhFHCxj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 22:53:39 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1582arTa067083;
        Tue, 8 Jun 2021 10:36:53 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 10:50:41 +0800
Date:   Tue, 8 Jun 2021 10:50:33 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v4 4/7] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Message-ID: <20210608025033.GB2948@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-5-steven_lee@aspeedtech.com>
 <f3805ca3-3d77-4482-b75f-3e869625e0bc@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <f3805ca3-3d77-4482-b75f-3e869625e0bc@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1582arTa067083
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 06/08/2021 07:43, Andrew Jeffery wrote:
> 
> 
> On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins.
> > In the current driver, the maximum number of gpio pins of SoC is hardcoded
> > as 80 and the gpio pin count mask for GPIO Configuration register is
> > hardcode as GENMASK(9,6). In addition, some functions use the hardcoded
> > value to calculate the gpio offset.
> > The patch adds ast2600 compatibles and platform data that includes the
> > max number of gpio pins supported by ast2600 and gpio pin count mask for
> > GPIO Configuration register.
> > The patch also modifies some functions to pass aspeed_sgpio struct for
> > calculating gpio offset without using the hardcoded value.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  drivers/gpio/gpio-aspeed-sgpio.c | 110 +++++++++++++++++++++----------
> >  1 file changed, 76 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > index 64e54f8c30d2..8b893356f0ca 100644
> > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > @@ -35,12 +35,18 @@
> >  #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
> >  #define ASPEED_SGPIO_ENABLE		BIT(0)
> >  
> > +struct aspeed_sgpio_pdata {
> > +	const u32 pin_mask;
> > +	int max_ngpios;
> > +};
> > +
> >  struct aspeed_sgpio {
> >  	struct gpio_chip chip;
> >  	struct clk *pclk;
> >  	spinlock_t lock;
> >  	void __iomem *base;
> >  	int irq;
> > +	int max_ngpios;
> >  	int n_sgpio;
> >  };
> >  
> > @@ -75,7 +81,13 @@ static const struct aspeed_sgpio_bank 
> > aspeed_sgpio_banks[] = {
> >  		.val_regs = 0x0038,
> >  		.rdata_reg = 0x0078,
> >  		.irq_regs = 0x003C,
> > -		.names = { "I", "J" },
> > +		.names = { "I", "J", "K", "L" },
> > +	},
> > +	{
> > +		.val_regs = 0x0090,
> > +		.rdata_reg = 0x007C,
> > +		.irq_regs = 0x0094,
> > +		.names = { "M", "N", "O", "P" },
> >  	},
> >  };
> >  
> > @@ -121,15 +133,15 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
> >  	}
> >  }
> >  
> > -#define GPIO_BANK(x)    ((x % SGPIO_OUTPUT_OFFSET) >> 5)
> > -#define GPIO_OFFSET(x)  ((x % SGPIO_OUTPUT_OFFSET) & 0x1f)
> > -#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
> > +#define GPIO_BANK(x, gpio)    ((x % (gpio)->max_ngpios) >> 5)
> 
> I couldn't stop myself from commenting on this: The 'context' parameter should be first (by convention), so:
> 
> #define GPIO_BANK(gpio, x) ((x % (gpio)->max_ngpios) >> 5)
> 
> There's another fix necessary here too - the x needs to be parenthesised:
> 
> #define GPIO_BANK(gpio, x) (((x) % (gpio)->max_ngpios) >> 5)
> 
> > +#define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))
> > +#define GPIO_BIT(x, gpio)     BIT(GPIO_OFFSET(x % (gpio)->max_ngpios))
> 
> Again, put the context parameter first. And again we should add the parentheses around x in the expression.
> 
> >  
> > -static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
> > +static const struct aspeed_sgpio_bank *to_bank(unsigned int offset, 
> > const struct aspeed_sgpio *gpio)
> >  {
> >  	unsigned int bank;
> >  
> > -	bank = GPIO_BANK(offset);
> > +	bank = GPIO_BANK(offset, gpio);
> >  
> >  	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
> >  	return &aspeed_sgpio_banks[bank];
> > @@ -139,18 +151,19 @@ static int aspeed_sgpio_init_valid_mask(struct 
> > gpio_chip *gc,
> >  		unsigned long *valid_mask, unsigned int ngpios)
> >  {
> >  	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> > +	int max_ngpios = sgpio->max_ngpios;
> >  	int n = sgpio->n_sgpio;
> > -	int c = SGPIO_OUTPUT_OFFSET - n;
> > +	int c = max_ngpios - n;
> >  
> > -	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > +	WARN_ON(ngpios < max_ngpios * 2);
> >  
> >  	/* input GPIOs in the lower range */
> >  	bitmap_set(valid_mask, 0, n);
> >  	bitmap_clear(valid_mask, n, c);
> >  
> > -	/* output GPIOS above SGPIO_OUTPUT_OFFSET */
> > -	bitmap_set(valid_mask, SGPIO_OUTPUT_OFFSET, n);
> > -	bitmap_clear(valid_mask, SGPIO_OUTPUT_OFFSET + n, c);
> > +	/* output GPIOS above max_ngpios */
> > +	bitmap_set(valid_mask, max_ngpios, n);
> > +	bitmap_clear(valid_mask, max_ngpios + n, c);
> >  
> >  	return 0;
> >  }
> > @@ -161,30 +174,30 @@ static void 
> > aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> >  	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
> >  	int n = sgpio->n_sgpio;
> >  
> > -	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
> > +	WARN_ON(ngpios < sgpio->max_ngpios * 2);
> >  
> >  	/* input GPIOs in the lower range */
> >  	bitmap_set(valid_mask, 0, n);
> >  	bitmap_clear(valid_mask, n, ngpios - n);
> >  }
> >  
> > -static bool aspeed_sgpio_is_input(unsigned int offset)
> > +static bool aspeed_sgpio_is_input(unsigned int offset, const struct 
> > aspeed_sgpio *gpio)
> >  {
> > -	return offset < SGPIO_OUTPUT_OFFSET;
> > +	return offset < gpio->max_ngpios;
> >  }
> >  
> >  static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
> >  {
> >  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio);
> >  	unsigned long flags;
> >  	enum aspeed_sgpio_reg reg;
> >  	int rc = 0;
> >  
> >  	spin_lock_irqsave(&gpio->lock, flags);
> >  
> > -	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
> > -	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
> > +	reg = aspeed_sgpio_is_input(offset, gpio) ? reg_val : reg_rdata;
> > +	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset, gpio));
> >  
> >  	spin_unlock_irqrestore(&gpio->lock, flags);
> >  
> > @@ -194,11 +207,11 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, 
> > unsigned int offset)
> >  static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, 
> > int val)
> >  {
> >  	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > -	const struct aspeed_sgpio_bank *bank = to_bank(offset);
> > +	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio);
> >  	void __iomem *addr_r, *addr_w;
> >  	u32 reg = 0;
> >  
> > -	if (aspeed_sgpio_is_input(offset))
> > +	if (aspeed_sgpio_is_input(offset, gpio))
> >  		return -EINVAL;
> >  
> >  	/* Since this is an output, read the cached value from rdata, then
> > @@ -209,9 +222,9 @@ static int sgpio_set_value(struct gpio_chip *gc, 
> > unsigned int offset, int val)
> >  	reg = ioread32(addr_r);
> >  
> >  	if (val)
> > -		reg |= GPIO_BIT(offset);
> > +		reg |= GPIO_BIT(offset, gpio);
> >  	else
> > -		reg &= ~GPIO_BIT(offset);
> > +		reg &= ~GPIO_BIT(offset, gpio);
> >  
> >  	iowrite32(reg, addr_w);
> >  
> > @@ -232,7 +245,9 @@ static void aspeed_sgpio_set(struct gpio_chip *gc, 
> > unsigned int offset, int val)
> >  
> >  static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
> >  {
> > -	return aspeed_sgpio_is_input(offset) ? 0 : -EINVAL;
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +
> > +	return aspeed_sgpio_is_input(offset, gpio) ? 0 : -EINVAL;
> >  }
> >  
> >  static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int 
> > offset, int val)
> > @@ -253,7 +268,9 @@ static int aspeed_sgpio_dir_out(struct gpio_chip 
> > *gc, unsigned int offset, int v
> >  
> >  static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned 
> > int offset)
> >  {
> > -	return !!aspeed_sgpio_is_input(offset);
> > +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
> > +
> > +	return !!aspeed_sgpio_is_input(offset, gpio);
> >  }
> >  
> >  static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> > @@ -268,8 +285,8 @@ static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
> >  	WARN_ON(!internal);
> >  
> >  	*gpio = internal;
> > -	*bank = to_bank(*offset);
> > -	*bit = GPIO_BIT(*offset);
> > +	*bank = to_bank(*offset, internal);
> > +	*bit = GPIO_BIT(*offset, internal);
> >  }
> >  
> >  static void aspeed_sgpio_irq_ack(struct irq_data *d)
> > @@ -466,9 +483,21 @@ static int aspeed_sgpio_setup_irqs(struct 
> > aspeed_sgpio *gpio,
> >  	return 0;
> >  }
> >  
> > +static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
> > +	.max_ngpios = 128,
> > +	.pin_mask = GENMASK(10, 6),
> > +};
> > +
> > +static const struct aspeed_sgpio_pdata ast2600_sgpiom_80_pdata = {
> > +	.max_ngpios = 80,
> > +	.pin_mask = GENMASK(10, 6),
> > +};
> > +
> >  static const struct of_device_id aspeed_sgpio_of_table[] = {
> >  	{ .compatible = "aspeed,ast2400-sgpio" },
> >  	{ .compatible = "aspeed,ast2500-sgpio" },
> 
> Add .data for these too.
> 

I was wondering if I can define a platform data for both ast2400 and
ast2500 as they have the same configurations.

For example:

static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
	.max_ngpios = 80,
	.pin_mask = GENMASK(9, 6),
};

static const struct of_device_id aspeed_sgpio_of_table[] = {
	{ .compatible = "aspeed,ast2400-sgpio", .data = ast2400_sgpio_pdata, },
	{ .compatible = "aspeed,ast2500-sgpio", .data = ast2400_sgpio_pdata, },

Thanks,
Steven

> > +	{ .compatible = "aspeed,ast2600-sgpiom-128", .data = 
> > &ast2600_sgpiom_128_pdata, },
> > +	{ .compatible = "aspeed,ast2600-sgpiom-80", .data = 
> > &ast2600_sgpiom_80_pdata, },
> >  	{}
> >  };
> >  
> > @@ -476,10 +505,11 @@ MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
> >  
> >  static int __init aspeed_sgpio_probe(struct platform_device *pdev)
> >  {
> > +	u32 nr_gpios, sgpio_freq, sgpio_clk_div, gpio_cnt_regval, pin_mask;
> > +	const struct aspeed_sgpio_pdata *pdata;
> >  	struct aspeed_sgpio *gpio;
> > -	u32 nr_gpios, sgpio_freq, sgpio_clk_div;
> > -	int rc;
> >  	unsigned long apb_freq;
> > +	int rc;
> >  
> >  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> >  	if (!gpio)
> > @@ -489,13 +519,26 @@ static int __init aspeed_sgpio_probe(struct 
> > platform_device *pdev)
> >  	if (IS_ERR(gpio->base))
> >  		return PTR_ERR(gpio->base);
> >  
> > +	pdata = device_get_match_data(&pdev->dev);
> > +	if (pdata) {
> > +		gpio->max_ngpios = pdata->max_ngpios;
> > +		pin_mask = pdata->pin_mask;
> > +	} else {
> > +		gpio->max_ngpios = MAX_NR_HW_SGPIO;
> > +		pin_mask = ASPEED_SGPIO_PINS_MASK;
> 
> Given the refactor I think the MAX_NR_HW_SGPIO and ASPEED_SGPIO_PINS_MASK macros are confusing and should be dropped.
> 
> Further, I think it would be better to just define these 'default' values in .data for the 2400 and 2500 compatibles and drop this if/else entirely.
> 
> > +	}
> > +
> >  	rc = of_property_read_u32(pdev->dev.of_node, "ngpios", &nr_gpios);
> >  	if (rc < 0) {
> >  		dev_err(&pdev->dev, "Could not read ngpios property\n");
> >  		return -EINVAL;
> > -	} else if (nr_gpios > MAX_NR_HW_SGPIO) {
> > +	} else if (nr_gpios % 8) {
> > +		dev_err(&pdev->dev, "Number of GPIOs not multiple of 8: %d\n",
> > +			nr_gpios);
> > +		return -EINVAL;
> > +	} else if (nr_gpios > gpio->max_ngpios) {
> 
> I'd prefer this in a separate patch.
> 
> >  		dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: 
> > %d\n",
> > -			MAX_NR_HW_SGPIO, nr_gpios);
> > +			gpio->max_ngpios, nr_gpios);
> >  		return -EINVAL;
> >  	}
> >  	gpio->n_sgpio = nr_gpios;
> > @@ -531,15 +574,14 @@ static int __init aspeed_sgpio_probe(struct 
> > platform_device *pdev)
> >  	if (sgpio_clk_div > (1 << 16) - 1)
> >  		return -EINVAL;
> >  
> > -	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) |
> > -		  FIELD_PREP(ASPEED_SGPIO_PINS_MASK, (nr_gpios / 8)) |
> > -		  ASPEED_SGPIO_ENABLE,
> > -		  gpio->base + ASPEED_SGPIO_CTRL);
> > +	gpio_cnt_regval = ((nr_gpios / 8) << 6) & pin_mask;
> 
> Add a #define for the field starting at bit 6.
> 
> Andrew
