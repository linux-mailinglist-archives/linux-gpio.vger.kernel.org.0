Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47281D9C39
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 23:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437365AbfJPVGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 17:06:40 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:37326 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437357AbfJPVGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 17:06:40 -0400
Received: by mail-yw1-f68.google.com with SMTP id m7so97667ywe.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z7HSLttiwXh0EFV1761MtZFJzk/nNODl4uUCGX0HoI0=;
        b=c39HAIDoCBcGp9/kk2GSw6Mcxp+HacKiwwPAznJbMSGpJb99bqcufr4Iuxa/zcUFAs
         bAKXh+yEqTXLnKmFVgkzcg+9kRU7ZH2bAIzBfctn60W9A5i60jdzOvS6AoJ4gxZRWWUO
         9LGwh42Fh29XQj6NLy0Ch6xwB3NHzFI0W7hmys1mMtCSuf5IL4G/WdtbljRXmTKb8tpw
         pF+QwSaUvcBAY/3Ka468IVTQPwK009O+gm8ckufG7Ga6PGjQfUXr6NS/1YP+WiD0gK+y
         mPoowy2nfoAdVVy2tSasdzHoNFyxgwr0WFUWGs6efgZSqZ2s0EbugzijLbv65qnZDn2z
         0Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z7HSLttiwXh0EFV1761MtZFJzk/nNODl4uUCGX0HoI0=;
        b=oz9G1WmWEpetr2FhSudIXHyjw4yILxnqH8mFG+63SPFdbIMpRxPMl0mVSZaHKn2t6X
         IONRTgF9Z+uv2TcejwUQ5qUQ5iCg7N24yjY9AhOMciCQT2EDeQ4pa33r/1Hzg+6Dim6R
         JUfUitdguA0ZnZzqhUpF4iRWLgpp4auq4u8QYebXf0Pcr/hn9+zsuG3330YiNNZekHbA
         Q8g99DmNnzezd99pMjFndc1JJFQGirXvlP/gAwL7rrCmxP5G6ks9AHqVPlmA9+D9aLP3
         ACcTK+QC4l/qSqGusYcV7s466zNRRL1ihP5zFf4vg5Og8XfN/mGqWVKGsOl2Ym3/sbV1
         jb+A==
X-Gm-Message-State: APjAAAV7BNHfQk1jkLlMN9Nu66eFsrETXH2eE//7J+x9Kf4+Ikf1TKWB
        uRkkcxBrNLjsrnJ8FTWBaug=
X-Google-Smtp-Source: APXvYqwchOHuoWAUvnth8Qyip9fElIgQm/5f4uVNd2smD78iBS5Vg4jaQ+DeoC35XvkDZpohLILaOA==
X-Received: by 2002:a81:78d8:: with SMTP id t207mr280418ywc.76.1571259999236;
        Wed, 16 Oct 2019 14:06:39 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
        by smtp.gmail.com with ESMTPSA id n85sm7827ywd.17.2019.10.16.14.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 14:06:38 -0700 (PDT)
Date:   Wed, 16 Oct 2019 17:06:35 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: Convert to use bitmap API
Message-ID: <20191016210635.GB513122@icarus>
References: <20191014161148.10543-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014161148.10543-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 07:11:48PM +0300, Andy Shevchenko wrote:
> Instead of customized approach convert the driver to use bitmap API.
> 
> Depends-on: 6e9c6674d1bf ("gpio: pca953x: utilize the for_each_set_clump8 macro")
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

I agree with the concept of this change, but there is one fix I would
like made detailed inline below.

> ---
>  drivers/gpio/gpio-pca953x.c | 170 ++++++++++++++++--------------------
>  1 file changed, 73 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 10b669b8f27d..95c2d6c99f41 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -9,8 +9,7 @@
>   */
>  
>  #include <linux/acpi.h>
> -#include <linux/bits.h>
> -#include <linux/bitops.h>
> +#include <linux/bitmap.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -116,6 +115,7 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
>  
>  #define MAX_BANK 5
>  #define BANK_SZ 8
> +#define MAX_LINE	(MAX_BANK * BANK_SZ)
>  
>  #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
>  
> @@ -147,10 +147,10 @@ struct pca953x_chip {
>  
>  #ifdef CONFIG_GPIO_PCA953X_IRQ
>  	struct mutex irq_lock;
> -	u8 irq_mask[MAX_BANK];
> -	u8 irq_stat[MAX_BANK];
> -	u8 irq_trig_raise[MAX_BANK];
> -	u8 irq_trig_fall[MAX_BANK];
> +	DECLARE_BITMAP(irq_mask, MAX_LINE);
> +	DECLARE_BITMAP(irq_stat, MAX_LINE);
> +	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
> +	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
>  	struct irq_chip irq_chip;
>  #endif
>  	atomic_t wakeup_path;
> @@ -334,12 +334,16 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
>  	return regaddr;
>  }
>  
> -static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
> +static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
>  {
>  	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
> -	int ret;
> +	u8 value[MAX_BANK];
> +	int i, ret;
> +
> +	for (i = 0; i < NBANK(chip); i++)
> +		value[i] = bitmap_get_value8(val, i * BANK_SZ);
>  
> -	ret = regmap_bulk_write(chip->regmap, regaddr, val, NBANK(chip));
> +	ret = regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
>  	if (ret < 0) {
>  		dev_err(&chip->client->dev, "failed writing register\n");
>  		return ret;
> @@ -348,17 +352,21 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
>  	return 0;
>  }
>  
> -static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
> +static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
>  {
>  	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
> -	int ret;
> +	u8 value[MAX_BANK];
> +	int i, ret;
>  
> -	ret = regmap_bulk_read(chip->regmap, regaddr, val, NBANK(chip));
> +	ret = regmap_bulk_read(chip->regmap, regaddr, value, NBANK(chip));
>  	if (ret < 0) {
>  		dev_err(&chip->client->dev, "failed reading register\n");
>  		return ret;
>  	}
>  
> +	for (i = 0; i < NBANK(chip); i++)
> +		bitmap_set_value8(val, value[i], i * BANK_SZ);
> +
>  	return 0;
>  }
>  
> @@ -457,10 +465,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
>  				      unsigned long *mask, unsigned long *bits)
>  {
>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
> -	unsigned long offset;
> -	unsigned long bank_mask;
> -	int bank;
> -	u8 reg_val[MAX_BANK];
> +	DECLARE_BITMAP(reg_val, MAX_LINE);
>  	int ret;
>  
>  	mutex_lock(&chip->i2c_lock);
> @@ -468,11 +473,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
>  	if (ret)
>  		goto exit;
>  
> -	for_each_set_clump8(offset, bank_mask, mask, gc->ngpio) {
> -		bank = offset / 8;
> -		reg_val[bank] &= ~bank_mask;
> -		reg_val[bank] |= bitmap_get_value8(bits, offset) & bank_mask;
> -	}
> +	bitmap_and(reg_val, bits, mask, gc->ngpio);

When using set_multiple, it's expected that only the GPIO lines
requested to be set are actually set -- albeit if the hardware is
capable of that sort of control.

This bitmap_and operation is ignoring the existing state of reg_val and
overwriting it with (bits & mask), so existing GPIO states are lost and
all bits not masked are set to 0.

What you should do instead is something akin to this (but for bitmaps):

        regval &= ~mask;
        regval |= bits & mask;

That should preserve the existing GPIO states in reg_val, while setting
those requested by mask and supplied by bits.

William Breathitt Gray

>  
>  	pca953x_write_regs(chip, chip->regs->output, reg_val);
>  exit:
> @@ -599,10 +600,10 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
> -	u8 new_irqs;
> -	int level, i;
> -	u8 invert_irq_mask[MAX_BANK];
> -	u8 reg_direction[MAX_BANK];
> +	DECLARE_BITMAP(irq_mask, MAX_LINE);
> +	DECLARE_BITMAP(reg_direction, MAX_LINE);
> +	DECLARE_BITMAP(new_irqs, MAX_LINE);
> +	int level;
>  
>  	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
>  
> @@ -610,25 +611,18 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
>  		/* Enable latch on interrupt-enabled inputs */
>  		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
>  
> -		for (i = 0; i < NBANK(chip); i++)
> -			invert_irq_mask[i] = ~chip->irq_mask[i];
> +		bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);
>  
>  		/* Unmask enabled interrupts */
> -		pca953x_write_regs(chip, PCAL953X_INT_MASK, invert_irq_mask);
> +		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
>  	}
>  
> +	bitmap_or(new_irqs, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
> +	bitmap_and(irq_mask, new_irqs, reg_direction, gc->ngpio);
> +
>  	/* Look for any newly setup interrupt */
> -	for (i = 0; i < NBANK(chip); i++) {
> -		new_irqs = chip->irq_trig_fall[i] | chip->irq_trig_raise[i];
> -		new_irqs &= reg_direction[i];
> -
> -		while (new_irqs) {
> -			level = __ffs(new_irqs);
> -			pca953x_gpio_direction_input(&chip->gpio_chip,
> -							level + (BANK_SZ * i));
> -			new_irqs &= ~(1 << level);
> -		}
> -	}
> +	for_each_set_bit(level, irq_mask, gc->ngpio)
> +		pca953x_gpio_direction_input(&chip->gpio_chip, level);
>  
>  	mutex_unlock(&chip->irq_lock);
>  }
> @@ -669,15 +663,15 @@ static void pca953x_irq_shutdown(struct irq_data *d)
>  	chip->irq_trig_fall[d->hwirq / BANK_SZ] &= ~mask;
>  }
>  
> -static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
> +static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pending)
>  {
> -	u8 cur_stat[MAX_BANK];
> -	u8 old_stat[MAX_BANK];
> -	bool pending_seen = false;
> -	bool trigger_seen = false;
> -	u8 trigger[MAX_BANK];
> -	u8 reg_direction[MAX_BANK];
> -	int ret, i;
> +	struct gpio_chip *gc = &chip->gpio_chip;
> +	DECLARE_BITMAP(reg_direction, MAX_LINE);
> +	DECLARE_BITMAP(old_stat, MAX_LINE);
> +	DECLARE_BITMAP(cur_stat, MAX_LINE);
> +	DECLARE_BITMAP(new_stat, MAX_LINE);
> +	DECLARE_BITMAP(trigger, MAX_LINE);
> +	int ret;
>  
>  	if (chip->driver_data & PCA_PCAL) {
>  		/* Read the current interrupt status from the device */
> @@ -690,16 +684,13 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
>  		if (ret)
>  			return false;
>  
> -		for (i = 0; i < NBANK(chip); i++) {
> -			/* Apply filter for rising/falling edge selection */
> -			pending[i] = (~cur_stat[i] & chip->irq_trig_fall[i]) |
> -				(cur_stat[i] & chip->irq_trig_raise[i]);
> -			pending[i] &= trigger[i];
> -			if (pending[i])
> -				pending_seen = true;
> -		}
> +		/* Apply filter for rising/falling edge selection */
> +		bitmap_andnot(new_stat, chip->irq_trig_fall, cur_stat, gc->ngpio);
> +		bitmap_and(old_stat, chip->irq_trig_raise, cur_stat, gc->ngpio);
> +		bitmap_or(cur_stat, old_stat, new_stat, gc->ngpio);
> +		bitmap_and(pending, cur_stat, trigger, gc->ngpio);
>  
> -		return pending_seen;
> +		return !bitmap_empty(pending, gc->ngpio);
>  	}
>  
>  	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
> @@ -708,55 +699,40 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
>  
>  	/* Remove output pins from the equation */
>  	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
> -	for (i = 0; i < NBANK(chip); i++)
> -		cur_stat[i] &= reg_direction[i];
>  
> -	memcpy(old_stat, chip->irq_stat, NBANK(chip));
> +	bitmap_copy(old_stat, chip->irq_stat, gc->ngpio);
>  
> -	for (i = 0; i < NBANK(chip); i++) {
> -		trigger[i] = (cur_stat[i] ^ old_stat[i]) & chip->irq_mask[i];
> -		if (trigger[i])
> -			trigger_seen = true;
> -	}
> +	bitmap_and(new_stat, cur_stat, reg_direction, gc->ngpio);
> +	bitmap_xor(cur_stat, new_stat, old_stat, gc->ngpio);
> +	bitmap_and(trigger, cur_stat, chip->irq_mask, gc->ngpio);
>  
> -	if (!trigger_seen)
> +	if (bitmap_empty(trigger, gc->ngpio))
>  		return false;
>  
> -	memcpy(chip->irq_stat, cur_stat, NBANK(chip));
> +	bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
>  
> -	for (i = 0; i < NBANK(chip); i++) {
> -		pending[i] = (old_stat[i] & chip->irq_trig_fall[i]) |
> -			(cur_stat[i] & chip->irq_trig_raise[i]);
> -		pending[i] &= trigger[i];
> -		if (pending[i])
> -			pending_seen = true;
> -	}
> +	bitmap_and(cur_stat, chip->irq_trig_fall, old_stat, gc->ngpio);
> +	bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
> +	bitmap_or(new_stat, old_stat, cur_stat, gc->ngpio);
> +	bitmap_and(pending, new_stat, trigger, gc->ngpio);
>  
> -	return pending_seen;
> +	return !bitmap_empty(pending, gc->ngpio);
>  }
>  
>  static irqreturn_t pca953x_irq_handler(int irq, void *devid)
>  {
>  	struct pca953x_chip *chip = devid;
> -	u8 pending[MAX_BANK];
> -	u8 level;
> -	unsigned nhandled = 0;
> -	int i;
> +	struct gpio_chip *gc = &chip->gpio_chip;
> +	DECLARE_BITMAP(pending, MAX_LINE);
> +	int level;
>  
>  	if (!pca953x_irq_pending(chip, pending))
>  		return IRQ_NONE;
>  
> -	for (i = 0; i < NBANK(chip); i++) {
> -		while (pending[i]) {
> -			level = __ffs(pending[i]);
> -			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
> -							level + (BANK_SZ * i)));
> -			pending[i] &= ~(1 << level);
> -			nhandled++;
> -		}
> -	}
> +	for_each_set_bit(level, pending, gc->ngpio)
> +		handle_nested_irq(irq_find_mapping(gc->irq.domain, level));
>  
> -	return (nhandled > 0) ? IRQ_HANDLED : IRQ_NONE;
> +	return bitmap_empty(pending, gc->ngpio) ? IRQ_NONE : IRQ_HANDLED;
>  }
>  
>  static int pca953x_irq_setup(struct pca953x_chip *chip,
> @@ -764,8 +740,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>  {
>  	struct i2c_client *client = chip->client;
>  	struct irq_chip *irq_chip = &chip->irq_chip;
> -	u8 reg_direction[MAX_BANK];
> -	int ret, i;
> +	DECLARE_BITMAP(reg_direction, MAX_LINE);
> +	DECLARE_BITMAP(irq_stat, MAX_LINE);
> +	int ret;
>  
>  	if (!client->irq)
>  		return 0;
> @@ -776,7 +753,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>  	if (!(chip->driver_data & PCA_INT))
>  		return 0;
>  
> -	ret = pca953x_read_regs(chip, chip->regs->input, chip->irq_stat);
> +	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
>  	if (ret)
>  		return ret;
>  
> @@ -786,8 +763,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>  	 * this purpose.
>  	 */
>  	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
> -	for (i = 0; i < NBANK(chip); i++)
> -		chip->irq_stat[i] &= reg_direction[i];
> +	bitmap_and(chip->irq_stat, irq_stat, reg_direction, chip->gpio_chip.ngpio);
>  	mutex_init(&chip->irq_lock);
>  
>  	ret = devm_request_threaded_irq(&client->dev, client->irq,
> @@ -839,8 +815,8 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>  
>  static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
>  {
> +	DECLARE_BITMAP(val, MAX_LINE);
>  	int ret;
> -	u8 val[MAX_BANK];
>  
>  	ret = regcache_sync_region(chip->regmap, chip->regs->output,
>  				   chip->regs->output + NBANK(chip));
> @@ -854,9 +830,9 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
>  
>  	/* set platform specific polarity inversion */
>  	if (invert)
> -		memset(val, 0xFF, NBANK(chip));
> +		bitmap_fill(val, MAX_LINE);
>  	else
> -		memset(val, 0, NBANK(chip));
> +		bitmap_zero(val, MAX_LINE);
>  
>  	ret = pca953x_write_regs(chip, chip->regs->invert, val);
>  out:
> @@ -865,8 +841,8 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
>  
>  static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
>  {
> +	DECLARE_BITMAP(val, MAX_LINE);
>  	int ret;
> -	u8 val[MAX_BANK];
>  
>  	ret = device_pca95xx_init(chip, invert);
>  	if (ret)
> -- 
> 2.23.0
> 
