Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72499195B
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2019 21:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfHRTpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Aug 2019 15:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfHRTpd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 18 Aug 2019 15:45:33 -0400
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31E342146E;
        Sun, 18 Aug 2019 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566157531;
        bh=/UGEiKhwuGT5e4jtY1uNAwfUF8UalZ1KeFMGZAIdK+I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a7kfbReX7Bf89X8j05kG34WnQC4K8BJJ3G921VbJTU1ReF2wK8TBqdGBJfpgyfdBj
         KBIgSJ5Cc57l/WPAgB/DxcZmeqG20+DQfEGojXUaYc9gZrv3tm4+Iub+RZ54jehNuX
         OAJdYvsceh6ejINystn0o2kJ0LEFpzDIhrfa+QMA=
Date:   Sun, 18 Aug 2019 20:45:25 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/2] irq/irq_sim: use irq domain
Message-ID: <20190818204525.1e3d174c@archlinux>
In-Reply-To: <20190812125256.9690-3-brgl@bgdev.pl>
References: <20190812125256.9690-1-brgl@bgdev.pl>
        <20190812125256.9690-3-brgl@bgdev.pl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 12 Aug 2019 14:52:56 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We currently have a dedicated function to map the interrupt simulator
> offsets to global interrupt numbers. This is something that irq_domain
> should handle.
> 
> Create a linear irq_domain when initializing the interrupt simulator
> and modify the irq_sim_fire() function to only take as parameter the
> global interrupt number.
> 
> Convert both users in the same patch to using the new interface.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hmm. Again, in principle looks fine, but what advantages do we get from
using an irq domain?  Pure code wise, it's longer and only a little bit
simpler.

Jonathan

> ---
>  drivers/gpio/gpio-mockup.c          |  11 ++-
>  drivers/iio/dummy/iio_dummy_evgen.c |  22 ++++--
>  include/linux/irq_sim.h             |   5 +-
>  kernel/irq/Kconfig                  |   1 +
>  kernel/irq/irq_sim.c                | 110 +++++++++++++++++-----------
>  5 files changed, 94 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 9b28ffec5826..4cf594f0e7cd 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -186,7 +186,7 @@ static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
>  
> -	return irq_sim_irqnum(chip->irqsim, offset);
> +	return irq_create_mapping(irq_sim_get_domain(chip->irqsim), offset);
>  }
>  
>  static void gpio_mockup_free(struct gpio_chip *gc, unsigned int offset)
> @@ -228,6 +228,7 @@ static ssize_t gpio_mockup_debugfs_write(struct file *file,
>  	struct gpio_mockup_dbgfs_private *priv;
>  	int rv, val, curr, irq, irq_type;
>  	struct gpio_mockup_chip *chip;
> +	struct irq_domain *domain;
>  	struct seq_file *sfile;
>  	struct gpio_desc *desc;
>  	struct gpio_chip *gc;
> @@ -248,6 +249,7 @@ static ssize_t gpio_mockup_debugfs_write(struct file *file,
>  	gc = &chip->gc;
>  	desc = &gc->gpiodev->descs[priv->offset];
>  	sim = chip->irqsim;
> +	domain = irq_sim_get_domain(sim);
>  
>  	mutex_lock(&chip->lock);
>  
> @@ -257,12 +259,15 @@ static ssize_t gpio_mockup_debugfs_write(struct file *file,
>  		if (curr == val)
>  			goto out;
>  
> -		irq = irq_sim_irqnum(sim, priv->offset);
> +		irq = irq_find_mapping(domain, priv->offset);
> +		if (!irq)
> +			return -ENOENT;
> +
>  		irq_type = irq_get_trigger_type(irq);
>  
>  		if ((val == 1 && (irq_type & IRQ_TYPE_EDGE_RISING)) ||
>  		    (val == 0 && (irq_type & IRQ_TYPE_EDGE_FALLING)))
> -			irq_sim_fire(sim, priv->offset);
> +			irq_sim_fire(irq);
>  	}
>  
>  	/* Change the value unless we're actively driving the line. */
> diff --git a/drivers/iio/dummy/iio_dummy_evgen.c b/drivers/iio/dummy/iio_dummy_evgen.c
> index efbcd4a5609e..cc827f60a535 100644
> --- a/drivers/iio/dummy/iio_dummy_evgen.c
> +++ b/drivers/iio/dummy/iio_dummy_evgen.c
> @@ -31,14 +31,13 @@
>   * @lock: protect the evgen state
>   * @inuse: mask of which irqs are connected
>   * @irq_sim: interrupt simulator
> - * @base: base of irq range
>   */
>  struct iio_dummy_eventgen {
>  	struct iio_dummy_regs regs[IIO_EVENTGEN_NO];
>  	struct mutex lock;
>  	bool inuse[IIO_EVENTGEN_NO];
>  	struct irq_sim *irq_sim;
> -	int base;
> +	struct irq_domain *domain;
>  };
>  
>  /* We can only ever have one instance of this 'device' */
> @@ -56,7 +55,7 @@ static int iio_dummy_evgen_create(void)
>  		return PTR_ERR(iio_evgen->irq_sim);
>  	}
>  
> -	iio_evgen->base = irq_sim_irqnum(iio_evgen->irq_sim, 0);
> +	iio_evgen->domain = irq_sim_get_domain(iio_evgen->irq_sim);
>  	mutex_init(&iio_evgen->lock);
>  
>  	return 0;
> @@ -78,7 +77,7 @@ int iio_dummy_evgen_get_irq(void)
>  	mutex_lock(&iio_evgen->lock);
>  	for (i = 0; i < IIO_EVENTGEN_NO; i++) {
>  		if (!iio_evgen->inuse[i]) {
> -			ret = irq_sim_irqnum(iio_evgen->irq_sim, i);
> +			ret = irq_create_mapping(iio_evgen->domain, i);
>  			iio_evgen->inuse[i] = true;
>  			break;
>  		}
> @@ -99,15 +98,21 @@ EXPORT_SYMBOL_GPL(iio_dummy_evgen_get_irq);
>   */
>  void iio_dummy_evgen_release_irq(int irq)
>  {
> +	struct irq_data *irqd;
> +
> +	irqd = irq_get_irq_data(irq);
> +
>  	mutex_lock(&iio_evgen->lock);
> -	iio_evgen->inuse[irq - iio_evgen->base] = false;
> +	iio_evgen->inuse[irqd_to_hwirq(irqd)] = false;
>  	mutex_unlock(&iio_evgen->lock);
>  }
>  EXPORT_SYMBOL_GPL(iio_dummy_evgen_release_irq);
>  
>  struct iio_dummy_regs *iio_dummy_evgen_get_regs(int irq)
>  {
> -	return &iio_evgen->regs[irq - iio_evgen->base];
> +	struct irq_data *irqd = irq_get_irq_data(irq);
> +
> +	return &iio_evgen->regs[irqd_to_hwirq(irqd)];
>  }
>  EXPORT_SYMBOL_GPL(iio_dummy_evgen_get_regs);
>  
> @@ -129,7 +134,7 @@ static ssize_t iio_evgen_poke(struct device *dev,
>  {
>  	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
>  	unsigned long event;
> -	int ret;
> +	int ret, irq;
>  
>  	ret = kstrtoul(buf, 10, &event);
>  	if (ret)
> @@ -138,7 +143,8 @@ static ssize_t iio_evgen_poke(struct device *dev,
>  	iio_evgen->regs[this_attr->address].reg_id   = this_attr->address;
>  	iio_evgen->regs[this_attr->address].reg_data = event;
>  
> -	irq_sim_fire(iio_evgen->irq_sim, this_attr->address);
> +	irq = irq_create_mapping(iio_evgen->domain, this_attr->address);
> +	irq_sim_fire(irq);
>  
>  	return len;
>  }
> diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
> index 4bbf036145e2..4056d0e7f0b4 100644
> --- a/include/linux/irq_sim.h
> +++ b/include/linux/irq_sim.h
> @@ -7,6 +7,7 @@
>  #define _LINUX_IRQ_SIM_H
>  
>  #include <linux/irq_work.h>
> +#include <linux/irqdomain.h>
>  #include <linux/device.h>
>  
>  /*
> @@ -19,7 +20,7 @@ struct irq_sim;
>  struct irq_sim *irq_sim_new(unsigned int num_irqs);
>  struct irq_sim *devm_irq_sim_new(struct device *dev, unsigned int num_irqs);
>  void irq_sim_free(struct irq_sim *sim);
> -void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
> -int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
> +void irq_sim_fire(int virq);
> +struct irq_domain *irq_sim_get_domain(struct irq_sim *sim);
>  
>  #endif /* _LINUX_IRQ_SIM_H */
> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index f92d9a687372..d0890f7729d4 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -68,6 +68,7 @@ config IRQ_DOMAIN
>  config IRQ_SIM
>  	bool
>  	select IRQ_WORK
> +	select IRQ_DOMAIN
>  
>  # Support for hierarchical irq domains
>  config IRQ_DOMAIN_HIERARCHY
> diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> index 79f0a6494b6c..a1c91aefb6cd 100644
> --- a/kernel/irq/irq_sim.c
> +++ b/kernel/irq/irq_sim.c
> @@ -15,13 +15,14 @@ struct irq_sim_work_ctx {
>  struct irq_sim_irq_ctx {
>  	int			irqnum;
>  	bool			enabled;
> +	struct irq_sim_work_ctx	*work_ctx;
>  };
>  
>  struct irq_sim {
>  	struct irq_sim_work_ctx	work_ctx;
>  	int			irq_base;
>  	unsigned int		irq_count;
> -	struct irq_sim_irq_ctx	*irqs;
> +	struct irq_domain	*domain;
>  };
>  
>  struct irq_sim_devres {
> @@ -74,11 +75,46 @@ static void irq_sim_handle_irq(struct irq_work *work)
>  		offset = find_next_bit(work_ctx->pending,
>  				       sim->irq_count, offset);
>  		clear_bit(offset, work_ctx->pending);
> -		irqnum = irq_sim_irqnum(sim, offset);
> +		irqnum = irq_find_mapping(sim->domain, offset);
>  		handle_simple_irq(irq_to_desc(irqnum));
>  	}
>  }
>  
> +static int irq_sim_domain_map(struct irq_domain *domain,
> +			      unsigned int virq, irq_hw_number_t hw)
> +{
> +	struct irq_sim *sim = domain->host_data;
> +	struct irq_sim_irq_ctx *ctx;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	irq_set_chip(virq, &irq_sim_irqchip);
> +	irq_set_chip_data(virq, ctx);
> +	irq_set_handler(virq, handle_simple_irq);
> +	irq_modify_status(virq, IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
> +	ctx->work_ctx = &sim->work_ctx;
> +
> +	return 0;
> +}
> +
> +static void irq_sim_domain_unmap(struct irq_domain *domain, unsigned int virq)
> +{
> +	struct irq_sim_irq_ctx *ctx;
> +	struct irq_data *irqd;
> +
> +	irqd = irq_domain_get_irq_data(domain, virq);
> +	ctx = irq_data_get_irq_chip_data(irqd);
> +
> +	kfree(ctx);
> +}
> +
> +static const struct irq_domain_ops irq_sim_domain_ops = {
> +	.map		= irq_sim_domain_map,
> +	.unmap		= irq_sim_domain_unmap,
> +};
> +
>  /**
>   * irq_sim_new - Create a new interrupt simulator: allocate a range of
>   *               dummy interrupts.
> @@ -91,42 +127,21 @@ static void irq_sim_handle_irq(struct irq_work *work)
>  struct irq_sim *irq_sim_new(unsigned int num_irqs)
>  {
>  	struct irq_sim *sim;
> -	int i;
>  
>  	sim = kmalloc(sizeof(*sim), GFP_KERNEL);
>  	if (!sim)
>  		return ERR_PTR(-ENOMEM);
>  
> -	sim->irqs = kmalloc_array(num_irqs, sizeof(*sim->irqs), GFP_KERNEL);
> -	if (!sim->irqs) {
> -		kfree(sim);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	sim->irq_base = irq_alloc_descs(-1, 0, num_irqs, 0);
> -	if (sim->irq_base < 0) {
> -		kfree(sim->irqs);
> -		kfree(sim);
> -		return ERR_PTR(sim->irq_base);
> -	}
> -
>  	sim->work_ctx.pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
>  	if (!sim->work_ctx.pending) {
> -		kfree(sim->irqs);
>  		kfree(sim);
> -		irq_free_descs(sim->irq_base, num_irqs);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> -	for (i = 0; i < num_irqs; i++) {
> -		sim->irqs[i].irqnum = sim->irq_base + i;
> -		sim->irqs[i].enabled = false;
> -		irq_set_chip(sim->irq_base + i, &irq_sim_irqchip);
> -		irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
> -		irq_set_handler(sim->irq_base + i, &handle_simple_irq);
> -		irq_modify_status(sim->irq_base + i,
> -				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
> -	}
> +	sim->domain = irq_domain_create_linear(NULL, num_irqs,
> +					       &irq_sim_domain_ops, sim);
> +	if (!sim->domain)
> +		return ERR_PTR(-ENOMEM);
>  
>  	init_irq_work(&sim->work_ctx.work, irq_sim_handle_irq);
>  	sim->irq_count = num_irqs;
> @@ -143,10 +158,17 @@ EXPORT_SYMBOL_GPL(irq_sim_new);
>   */
>  void irq_sim_free(struct irq_sim *sim)
>  {
> +	int i, irq;
> +
> +	for (i = 0; i < sim->irq_count; i++) {
> +		irq = irq_find_mapping(sim->domain, i);
> +		if (irq)
> +			irq_dispose_mapping(irq);
> +	}
> +
> +	irq_domain_remove(sim->domain);
>  	irq_work_sync(&sim->work_ctx.work);
>  	bitmap_free(sim->work_ctx.pending);
> -	irq_free_descs(sim->irq_base, sim->irq_count);
> -	kfree(sim->irqs);
>  	kfree(sim);
>  }
>  EXPORT_SYMBOL_GPL(irq_sim_free);
> @@ -189,27 +211,31 @@ EXPORT_SYMBOL_GPL(devm_irq_sim_new);
>  /**
>   * irq_sim_fire - Enqueue an interrupt.
>   *
> - * @sim:        The interrupt simulator object.
> - * @offset:     Offset of the simulated interrupt which should be fired.
> + * @virq:        Virtual interrupt number to fire. It must be associated with
> + *               an existing interrupt simulator.
>   */
> -void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> +void irq_sim_fire(int virq)
>  {
> -	if (sim->irqs[offset].enabled) {
> -		set_bit(offset, sim->work_ctx.pending);
> -		irq_work_queue(&sim->work_ctx.work);
> +	struct irq_sim_irq_ctx *ctx;
> +	struct irq_data *irqd;
> +
> +	irqd = irq_get_irq_data(virq);
> +	ctx = irq_data_get_irq_chip_data(irqd);
> +
> +	if (ctx->enabled) {
> +		set_bit(irqd_to_hwirq(irqd), ctx->work_ctx->pending);
> +		irq_work_queue(&ctx->work_ctx->work);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(irq_sim_fire);
>  
>  /**
> - * irq_sim_irqnum - Get the allocated number of a dummy interrupt.
> + * irq_sim_get_domain - Retrieve the interrupt domain for this simulator.
>   *
> - * @sim:        The interrupt simulator object.
> - * @offset:     Offset of the simulated interrupt for which to retrieve
> - *              the number.
> + * @sim:         The interrupt simulator the domain of which we retrieve.
>   */
> -int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
> +struct irq_domain *irq_sim_get_domain(struct irq_sim *sim)
>  {
> -	return sim->irqs[offset].irqnum;
> +	return sim->domain;
>  }
> -EXPORT_SYMBOL_GPL(irq_sim_irqnum);
> +EXPORT_SYMBOL(irq_sim_get_domain);

