Return-Path: <linux-gpio+bounces-30138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D3CF2BC3
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 495403030397
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A47932FA2E;
	Mon,  5 Jan 2026 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMFzm6/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953A2E173D
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605025; cv=none; b=VQqTeYQCHX6wxYwvt1caAfE8N0yvXEHeP2jbZhDcMnoFs9A7gwXrwKV/4pf8aRn24HEPZnh0ijM+dP63jao5qc7dIa11GdkoP1yEqds4IsTWMMPLA0VLkkeTN8j4szDM/npHkHwSHNJhi3RzTU/IsTK8lFRibGfRp+upo6puN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605025; c=relaxed/simple;
	bh=Eqrv+Xj2NyleWcewu+19KnPhFkn7AkPT9dcxYQG9tDQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZi1a5aYNYPW4hQd6qms3CuXHqklw/GVr0iqwwSqixyhMOjbi5oRRaJFbqDc5sHKe/jxm6XwAEPGe7GH3498912cXn7odvQDfVf2iZDys+dpMGLBkH2eMtUOQro4OcgTmPicOXLYJf6WdN/oIRhSqpx/cft6tKU45K6Os3q12Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMFzm6/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E85C116D0
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767605025;
	bh=Eqrv+Xj2NyleWcewu+19KnPhFkn7AkPT9dcxYQG9tDQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=aMFzm6/ccp85thBFqzvUmxiMjWv7uhxGQgSAzg6uoi9/7EpksmaMedt69ctnboEvg
	 AyonfC1ldOHf8VV98IINhc97WjjLNN6Rt9oyWKhNGRQr1WTY/J+2ZfCMqADC4AWsno
	 cSQqSgCDodLIWqH0S4kZNT6udtIdj+OKQok1FvVOze570hKbZTsonmVjErEXopJlR/
	 fA6VpynoiWor//Fu5RGvZoFYaB/LjeM/270Fm5z2nlIm31ul1BSzzG3VA4XRnTP7tc
	 qj6Sis4moRH/sfpI56da/kyYwQIU1y+Tsvq8S4DRFRfQp8h25Ncbh6tp6oyHipJctC
	 BYVkoKmCa0RGw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5943d20f352so14562554e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:23:45 -0800 (PST)
X-Gm-Message-State: AOJu0YyCfV4YYNGAE5o21wui+fzcoIcpTG15MQJQ66fyhegr9J7rhXHd
	lmp2S8v6C78ZVeor8Pkyjva8hKIia6KnyyXWHJh1vOFqTZqM8dTpz6TaD+Zn83plySrcLa+Ues1
	EC7hRd/hmJEy6H31jDW7VXRtjcaarkOzWlE3EO4b4RQ==
X-Google-Smtp-Source: AGHT+IFGYSai2nZvUP8n2GQ4zJ4ZHV+oe3ze6WQHzze+aMJ+pngnFUNSkH6e+d0MuW5d/47vycCJf5qrwt41Cb+t4LA=
X-Received: by 2002:a05:6512:224b:b0:594:27c6:a08 with SMTP id
 2adb3069b0e04-59a17ddb4dbmr17350284e87.32.1767605022660; Mon, 05 Jan 2026
 01:23:42 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 01:23:41 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 01:23:41 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org> <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
Date: Mon, 5 Jan 2026 01:23:41 -0800
X-Gmail-Original-Message-ID: <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
X-Gm-Features: AQt7F2rMiyImlu2F3iBTrebEhOiAXtREj8zFQ8q62Gp72jQPU8L3aYjjTNf4ie0
Message-ID: <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Jan 2026 22:33:39 +0100, Yixun Lan <dlan@gentoo.org> said:
> SpacemiT K3 SoC has changed gpio register layout while comparing
> with previous generation, the register offset and bank offset
> need to be adjusted, introduce a compatible data to extend the
> driver to support this.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpio-spacemit-k1.c | 163 ++++++++++++++++++++++++++++------------
>  1 file changed, 117 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> index eb66a15c002f..bca5c3dc13ca 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -15,29 +15,37 @@
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>
> -/* register offset */
> -#define SPACEMIT_GPLR		0x00 /* port level - R */
> -#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
> -#define SPACEMIT_GPSR		0x18 /* port set - W */
> -#define SPACEMIT_GPCR		0x24 /* port clear - W */
> -#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
> -#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
> -#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
> -#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
> -#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
> -#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
> -#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
> -#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
> -#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
> -#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
> -
>  #define SPACEMIT_NR_BANKS		4
>  #define SPACEMIT_NR_GPIOS_PER_BANK	32
>
>  #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> +#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->offsets)
> +
> +enum spacemit_gpio_registers {
> +	SPACEMIT_GPLR = 0,	/* port level - R */

No need for the = 0 here.

> +	SPACEMIT_GPDR,		/* port direction - R/W */
> +	SPACEMIT_GPSR,		/* port set - W */
> +	SPACEMIT_GPCR,		/* port clear - W */
> +	SPACEMIT_GRER,		/* port rising edge R/W */
> +	SPACEMIT_GFER,		/* port falling edge R/W */
> +	SPACEMIT_GEDR,		/* edge detect status - R/W1C */
> +	SPACEMIT_GSDR,		/* (set) direction - W */
> +	SPACEMIT_GCDR,		/* (clear) direction - W */
> +	SPACEMIT_GSRER,		/* (set) rising edge detect enable - W */
> +	SPACEMIT_GCRER,		/* (clear) rising edge detect enable - W */
> +	SPACEMIT_GSFER,		/* (set) falling edge detect enable - W */
> +	SPACEMIT_GCFER,		/* (clear) falling edge detect enable - W */
> +	SPACEMIT_GAPMASK,	/* interrupt mask , 0 disable, 1 enable - R/W */
> +	SPACEMIT_GCPMASK,	/* interrupt mask for K3 */
> +};
>
>  struct spacemit_gpio;
>
> +struct spacemit_gpio_data {
> +	const unsigned int *offsets;
> +	u32 bank_offsets[SPACEMIT_NR_BANKS];
> +};
> +
>  struct spacemit_gpio_bank {
>  	struct gpio_generic_chip chip;
>  	struct spacemit_gpio *sg;
> @@ -49,9 +57,22 @@ struct spacemit_gpio_bank {
>
>  struct spacemit_gpio {
>  	struct device *dev;
> +	const struct spacemit_gpio_data *data;
>  	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
>  };
>
> +static u32 spacemit_gpio_read(struct spacemit_gpio_bank *gb,
> +			      enum spacemit_gpio_registers reg)
> +{
> +	return readl(gb->base + to_spacemit_gpio_regs(gb)[reg]);
> +}
> +
> +static void spacemit_gpio_write(struct spacemit_gpio_bank *gb,
> +				enum spacemit_gpio_registers reg, u32 val)
> +{
> +	writel(val, gb->base + to_spacemit_gpio_regs(gb)[reg]);
> +}
> +
>  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>  {
>  	return (u32)(gb - gb->sg->sgb);
> @@ -63,10 +84,10 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>  	unsigned long pending;
>  	u32 n, gedr;
>
> -	gedr = readl(gb->base + SPACEMIT_GEDR);
> +	gedr = spacemit_gpio_read(gb, SPACEMIT_GEDR);
>  	if (!gedr)
>  		return IRQ_NONE;
> -	writel(gedr, gb->base + SPACEMIT_GEDR);
> +	spacemit_gpio_write(gb, SPACEMIT_GEDR, gedr);
>
>  	pending = gedr & gb->irq_mask;
>  	if (!pending)
> @@ -82,7 +103,7 @@ static void spacemit_gpio_irq_ack(struct irq_data *d)
>  {
>  	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
>
> -	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
> +	spacemit_gpio_write(gb, SPACEMIT_GEDR, BIT(irqd_to_hwirq(d)));
>  }
>
>  static void spacemit_gpio_irq_mask(struct irq_data *d)
> @@ -91,13 +112,13 @@ static void spacemit_gpio_irq_mask(struct irq_data *d)
>  	u32 bit = BIT(irqd_to_hwirq(d));
>
>  	gb->irq_mask &= ~bit;
> -	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
> +	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
>
>  	if (bit & gb->irq_rising_edge)
> -		writel(bit, gb->base + SPACEMIT_GCRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
>
>  	if (bit & gb->irq_falling_edge)
> -		writel(bit, gb->base + SPACEMIT_GCFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
>  }
>
>  static void spacemit_gpio_irq_unmask(struct irq_data *d)
> @@ -108,12 +129,12 @@ static void spacemit_gpio_irq_unmask(struct irq_data *d)
>  	gb->irq_mask |= bit;
>
>  	if (bit & gb->irq_rising_edge)
> -		writel(bit, gb->base + SPACEMIT_GSRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
>
>  	if (bit & gb->irq_falling_edge)
> -		writel(bit, gb->base + SPACEMIT_GSFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
>
> -	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
> +	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
>  }
>
>  static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> @@ -123,18 +144,18 @@ static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>
>  	if (type & IRQ_TYPE_EDGE_RISING) {
>  		gb->irq_rising_edge |= bit;
> -		writel(bit, gb->base + SPACEMIT_GSRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
>  	} else {
>  		gb->irq_rising_edge &= ~bit;
> -		writel(bit, gb->base + SPACEMIT_GCRER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
>  	}
>
>  	if (type & IRQ_TYPE_EDGE_FALLING) {
>  		gb->irq_falling_edge |= bit;
> -		writel(bit, gb->base + SPACEMIT_GSFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
>  	} else {
>  		gb->irq_falling_edge &= ~bit;
> -		writel(bit, gb->base + SPACEMIT_GCFER);
> +		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
>  	}
>
>  	return 0;
> @@ -179,15 +200,16 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	struct device *dev = sg->dev;
>  	struct gpio_irq_chip *girq;
>  	void __iomem *dat, *set, *clr, *dirin, *dirout;
> -	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
> +	int ret;
>
> -	gb->base = regs + bank_base[index];
> +	gb->base = regs + sg->data->bank_offsets[index];
> +	gb->sg = sg;
>
> -	dat	= gb->base + SPACEMIT_GPLR;
> -	set	= gb->base + SPACEMIT_GPSR;
> -	clr	= gb->base + SPACEMIT_GPCR;
> -	dirin	= gb->base + SPACEMIT_GCDR;
> -	dirout	= gb->base + SPACEMIT_GSDR;
> +	dat	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPLR];
> +	set	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPSR];
> +	clr	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPCR];
> +	dirin	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GCDR];
> +	dirout	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GSDR];
>
>  	config = (struct gpio_generic_chip_config) {
>  		.dev = dev,
> @@ -206,8 +228,6 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
>
> -	gb->sg = sg;
> -
>  	gc->label		= dev_name(dev);
>  	gc->request		= gpiochip_generic_request;
>  	gc->free		= gpiochip_generic_free;
> @@ -223,13 +243,13 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
>
>  	/* Disable Interrupt */
> -	writel(0, gb->base + SPACEMIT_GAPMASK);
> +	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, 0);
>  	/* Disable Edge Detection Settings */
> -	writel(0x0, gb->base + SPACEMIT_GRER);
> -	writel(0x0, gb->base + SPACEMIT_GFER);
> +	spacemit_gpio_write(gb, SPACEMIT_GRER, 0x0);
> +	spacemit_gpio_write(gb, SPACEMIT_GFER, 0x0);
>  	/* Clear Interrupt */
> -	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
> -	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
> +	spacemit_gpio_write(gb, SPACEMIT_GCRER, 0xffffffff);
> +	spacemit_gpio_write(gb, SPACEMIT_GCFER, 0xffffffff);
>
>  	ret = devm_request_threaded_irq(dev, irq, NULL,
>  					spacemit_gpio_irq_handler,
> @@ -260,6 +280,10 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
>  	if (!sg)
>  		return -ENOMEM;
>
> +	sg->data = of_device_get_match_data(dev);
> +	if (!sg->data)
> +		return dev_err_probe(dev, -EINVAL, "No available compatible data.");
> +
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> @@ -287,8 +311,55 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
>  	return 0;
>  }
>
> +static const unsigned int spacemit_gpio_k1_offsets[] = {
> +	0x00,
> +	0x0c,
> +	0x18,
> +	0x24,
> +	0x30,
> +	0x3c,
> +	0x48,
> +	0x54,
> +	0x60,
> +	0x6c,
> +	0x78,
> +	0x84,
> +	0x90,
> +	0x9c,
> +	0xA8,
> +};
> +
> +static const unsigned int spacemit_gpio_k3_offsets[] = {
> +	0x0,
> +	0x4,
> +	0x8,
> +	0xc,
> +	0x10,
> +	0x14,
> +	0x18,
> +	0x1c,
> +	0x20,
> +	0x24,
> +	0x28,
> +	0x2c,
> +	0x30,
> +	0x34,
> +	0x38,
> +};

I would very much prefer for you to use the

    [ENUM] = 0xVALUE

style of initialization here for better readability.

Otherwise looks good so LGTM on the next iteration.

Bart

> +
> +static const struct spacemit_gpio_data k1_gpio_data = {
> +	.offsets = spacemit_gpio_k1_offsets,
> +	.bank_offsets = { 0x0, 0x4, 0x8, 0x100 },
> +};
> +
> +static const struct spacemit_gpio_data k3_gpio_data = {
> +	.offsets = spacemit_gpio_k3_offsets,
> +	.bank_offsets = { 0x0, 0x40, 0x80, 0x100 },
> +};
> +
>  static const struct of_device_id spacemit_gpio_dt_ids[] = {
> -	{ .compatible = "spacemit,k1-gpio" },
> +	{ .compatible = "spacemit,k1-gpio", .data = &k1_gpio_data },
> +	{ .compatible = "spacemit,k3-gpio", .data = &k3_gpio_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
> @@ -296,12 +367,12 @@ MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
>  static struct platform_driver spacemit_gpio_driver = {
>  	.probe		= spacemit_gpio_probe,
>  	.driver		= {
> -		.name	= "k1-gpio",
> +		.name	= "spacemit-gpio",
>  		.of_match_table = spacemit_gpio_dt_ids,
>  	},
>  };
>  module_platform_driver(spacemit_gpio_driver);
>
>  MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> -MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
> +MODULE_DESCRIPTION("GPIO driver for SpacemiT K1/K3 SoC");
>  MODULE_LICENSE("GPL");
>
> --
> 2.52.0
>
>

