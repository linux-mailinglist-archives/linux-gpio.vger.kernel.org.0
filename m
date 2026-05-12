Return-Path: <linux-gpio+bounces-36693-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F/XAWF5A2oY6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36693-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 21:02:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99376528631
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 21:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B60953061C81
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 18:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7A0345757;
	Tue, 12 May 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjvJBClt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7183EDE72;
	Tue, 12 May 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611839; cv=none; b=Mu9xDfsRiSFBTL5cvw9VLD4KTSZYeJrYjs4dl2HbszeIcYoy/IfNWwGccpN78GaxnCTYjLOrgeLHC0gx7LaWKO4usEvedwUQJsgufAp9ds1ijD8HHLs0SDiSaIjIY9k0jLmjepcOauq8E/LCFhei/+mP1ZGc1++Dv7GsPBhJGwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611839; c=relaxed/simple;
	bh=gn2mqCWuO/Bd8Kw7m/1Ds6LVl80q/dEcyqXRuGSpPhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FehArKoDkapSLu0TukHze6MWS2yMHFXl7/YlV15rsHTjUR0TSnWgmiBISOCmua0XTMkBqH+IqVTwc7jIae3WWDUdT6mDbM5taRBEwAuHFh+Vf7GA/0JLMqMfxyjDuspaQqpJgalf5ZHzjWk8X0dgGorMdgFwYwpl+V3tg7+Pup4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjvJBClt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778611837; x=1810147837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gn2mqCWuO/Bd8Kw7m/1Ds6LVl80q/dEcyqXRuGSpPhI=;
  b=BjvJBCltf5rzhKhQ/am1879r1jZrcSTMgsDITCkr+oNkmTiMINdsMpqd
   r5qo1qDL7dcXfLo2SGsaOqI3jwu8lpZbBhI20VBMMYfIbKu2uHM71Z9Pa
   +67ZT/1W/n7Zba8ZAcww/u0Obi1UOdYSPd5Yu6jeTdvvgA9nLnpYeerx2
   5f9sU5KPqdCeDxtkAgbNOdLyGil0FQsCK7ZIEy6TVg59KOuLA6lwF07OI
   0eD8KLww93l5SImM6vA+ofzLqmgzfvJRUFu6QJxQuPcF3R52Prl7aP06j
   fyS58G6UkOEx2CGBiGcKbNAq6DFMv1SAI/vuJYxrrdI0EkydiQJ3zp1Wb
   g==;
X-CSE-ConnectionGUID: h5go8fkNRhWXcLs/lZGGNA==
X-CSE-MsgGUID: 0wsjomd+TdCP29hh+Eratg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79387564"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79387564"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:50:36 -0700
X-CSE-ConnectionGUID: YzjR3+gfToq3htuRrHU5dg==
X-CSE-MsgGUID: wMVzpF3kTCyEUPE6IIa1Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237771313"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:50:30 -0700
Date: Tue, 12 May 2026 21:50:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com, wbg@kernel.org,
	mathieu.dubois-briand@bootlin.com, mwalle@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v3 6/7] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Message-ID: <agN2dGAikxV0bw4M@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-7-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512033317.1602537-7-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 99376528631
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36693-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim,realtek.com:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 11:33:16AM +0800, Yu-Chun Lin wrote:

> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.

The below paragraphs are all the implementation details that are not so
important to be in the commit message. They fit the comment block after
the '---' line below, though...

> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
> 
> The driver leverages the gpio-regmap framework, utilizing the recently
> introduced write-enable and operation-specific mask translation features.
> 
> Additionally, because the controller utilizes multiple independent IRQ
> status registers (assert, de-assert, and level) which cannot be mapped
> via standard regmap_irq_chip, the driver implements a custom irq_domain.
> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---

...somewhere here.

...


> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>

Missing cleanup.h, may be more.

> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqchip.h>

> +#include <linux/irqdomain.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>

If you sort headers alphabetically, you will see the duplication.

> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>

...

> +struct rtd1625_gpio {
> +	struct gpio_chip *gpio_chip;
> +	const struct rtd1625_gpio_info *info;

> +	void __iomem *base;

Is it used? Also naming is confusing with unsigned int base in some functions
below.

> +	struct regmap *regmap;
> +	unsigned int irqs[3];

This 3 is also used when assign num_irqs below, perhaps define it with
meaningful name? (The 2 also might need a definition in the same way.)

> +	raw_spinlock_t lock;
> +	struct irq_domain *domain;
> +	unsigned int *save_regs;
> +};

...

> +static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
> +				  unsigned int base, unsigned int offset, unsigned int *reg,
> +				  unsigned int *mask)

Use logical split.

static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
				  unsigned int base, unsigned int offset,
				  unsigned int *reg, unsigned int *mask)

OR (as suggested earlier)

static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio,
				  enum gpio_regmap_operation op,
				  unsigned int base, unsigned int offset,
				  unsigned int *reg, unsigned int *mask)

...

> +static unsigned int rtd1625_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
> +					      unsigned int debounce)
> +{
> +	struct rtd1625_gpio *data = gpiochip_get_data(chip);
> +	u8 deb_val;
> +	u32 val;
> +
> +	switch (debounce) {
> +	case 1:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_1US;
> +		break;
> +	case 10:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_10US;
> +		break;
> +	case 100:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_100US;
> +		break;
> +	case 1000:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_1MS;
> +		break;
> +	case 10000:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_10MS;
> +		break;
> +	case 20000:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_20MS;
> +		break;
> +	case 30000:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_30MS;
> +		break;
> +	case 50000:
> +		deb_val = RTD1625_GPIO_DEBOUNCE_50MS;
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	val = FIELD_PREP(RTD1625_GPIO_DEBOUNCE, deb_val) | RTD1625_GPIO_DEBOUNCE_WREN;

> +	regmap_write(data->regmap, GPIO_CONTROL(offset), val);

Neither here, nor in some other places the returned value from regmap APIs is
not checked. Is it okay?

> +	return 0;
> +}
> +
> +static int rtd1625_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +				   unsigned long config)
> +{
> +	int debounce;

Can it be negative?

> +	if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
> +		debounce = pinconf_to_config_argument(config);
> +		return rtd1625_gpio_set_debounce(chip, offset, debounce);
> +	}
> +
> +	return gpiochip_generic_config(chip, offset, config);
> +}

...

> +static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
> +{
> +	unsigned int (*get_reg_offset)(struct rtd1625_gpio *gpio, unsigned int offset);
> +	struct rtd1625_gpio *data = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	unsigned int irq = irq_desc_get_irq(desc);
> +	struct irq_domain *domain = data->domain;
> +	unsigned int reg_offset, i, j, val;
> +	irq_hw_number_t hwirq;
> +	unsigned long status;
> +	unsigned int girq;
> +	u32 irq_type;
> +
> +	if (irq == data->irqs[0])
> +		get_reg_offset = &rtd1625_gpio_gpa_offset;
> +	else if (irq == data->irqs[1])
> +		get_reg_offset = &rtd1625_gpio_gpda_offset;
> +	else if (irq == data->irqs[2])
> +		get_reg_offset = &rtd1625_gpio_level_offset;
> +	else
> +		return;
> +
> +	chained_irq_enter(chip, desc);

> +	for (i = 0; i < data->info->num_gpios; i += 32) {

	for (unsigned int i = 0; i < data->info->num_gpios; i += 32) {

> +		reg_offset = get_reg_offset(data, i);
> +		regmap_read(data->regmap, reg_offset, &val);
> +
> +		status = val;
> +
> +		/* Clear edge interrupts; level interrupts are cleared in ->irq_ack() */
> +		if (irq != data->irqs[2])
> +			regmap_write(data->regmap, reg_offset, status);

This is interesting... Can't we rely on IRQ core to take care of this? (And
replay if required.)

> +		for_each_set_bit(j, &status, 32) {
> +			hwirq = i + j;
> +			girq = irq_find_mapping(domain, hwirq);
> +			irq_type = irq_get_trigger_type(girq);

> +			if (irq == data->irqs[1] && irq_type != IRQ_TYPE_EDGE_BOTH)

Why is the IRQ type check here and not in set_type() callback?
I think we should simply reject to even lock such a configuration as IRQ.

> +				continue;
> +
> +			generic_handle_domain_irq(domain, hwirq);
> +		}
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}

> +static void rtd1625_gpio_enable_edge_irq(struct rtd1625_gpio *data, irq_hw_number_t hwirq)
> +{
> +	int gpda_reg_offset = rtd1625_gpio_gpda_offset(data, hwirq);
> +	int gpa_reg_offset = rtd1625_gpio_gpa_offset(data, hwirq);
> +	u32 clr_mask = BIT(hwirq % 32);
> +	u32 val;
> +
> +	guard(raw_spinlock_irqsave)(&data->lock);

+ blank line. Same to other cases when guard()() is being used.

> +	regmap_write(data->regmap, gpa_reg_offset, clr_mask);
> +	regmap_write(data->regmap, gpda_reg_offset, clr_mask);
> +	val = RTD1625_GPIO_EDGE_INT_EN | RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_EN);
> +	regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
> +}

...

> +static void rtd1625_gpio_enable_irq(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	u32 irq_type = irqd_get_trigger_type(d);
> +	struct rtd1625_gpio *data;
> +	struct gpio_regmap *gpio;

> +	gpio = gpiochip_get_data(gc);
> +	data = gpio_regmap_get_drvdata(gpio);

Why not unify these with the above, we don't validate them anyway...
Same Q to other cases like this.

> +	gpiochip_enable_irq(gc, hwirq);
> +
> +	if (irq_type & IRQ_TYPE_EDGE_BOTH)
> +		rtd1625_gpio_enable_edge_irq(data, hwirq);
> +	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
> +		rtd1625_gpio_enable_level_irq(data, hwirq);
> +}

...

> +static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
> +{
> +	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_LEVEL_INT_DP);
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	struct rtd1625_gpio *data;
> +	struct gpio_regmap *gpio;
> +
> +	gpio = gpiochip_get_data(gc);
> +	data = gpio_regmap_get_drvdata(gpio);

+ blank line (and actually see above).

> +	if (!(data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK))
> +		return -EINVAL;

> +	scoped_guard(raw_spinlock_irqsave, &data->lock) {

> +		if (level)
> +			val |= RTD1625_GPIO_LEVEL_INT_DP;

Why this local variable change is under the lock?

> +		regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(hwirq), val);
> +	}
> +
> +	irq_set_handler_locked(d, handle_level_irq);
> +
> +	return 0;
> +}

...

> +static int rtd1625_gpio_irq_set_edge_type(struct irq_data *d, bool polarity)

Similar comments as per above.

...

> +static int rtd1625_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	int ret;

Unneeded, just return directly from each of the cases.

> +
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		ret = rtd1625_gpio_irq_set_edge_type(d, 1);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		ret = rtd1625_gpio_irq_set_edge_type(d, 0);
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		ret = rtd1625_gpio_irq_set_edge_type(d, 1);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		ret = rtd1625_gpio_irq_set_level_type(d, 0);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		ret = rtd1625_gpio_irq_set_level_type(d, 1);
> +		break;
> +	default:
> +		ret = -EINVAL;

Missing break, but rather simply

		return -EINVAL;

as mentioned above. In the similar way for the rest of switch-cases.

> +	}
> +
> +	return ret;
> +}

...

> +static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_gpio *data)
> +{
> +	int num_irqs, irq, i;

Why is 'num_irqs' signed?

> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq == -ENXIO)
> +		return 0;

This is strange. You mean that you are only interested in the first IRQ? What
about the case when the first one is not available, while the second is?

> +	if (irq < 0)
> +		return irq;

This partially duplicates the below.

> +	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;

> +	for (i = 0; i < num_irqs; i++) {

The iterator is local to the loop, hence

	for (unsigned int i = 0; i < num_irqs; i++) {

> +		irq = platform_get_irq(pdev, i);
> +		if (irq < 0)
> +			return irq;
> +
> +		data->irqs[i] = irq;
> +		irq_set_chained_handler_and_data(data->irqs[i], rtd1625_gpio_irq_handle, data);
> +	}
> +
> +	return 0;
> +}

...

> +static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
> +				irq_hw_number_t hwirq)
> +{
> +	struct rtd1625_gpio *data = domain->host_data;
> +
> +	irq_set_chip_data(irq, data->gpio_chip);
> +
> +	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_irq);
> +
> +	irq_set_noprobe(irq);

Shouldn't you assign a lockdep class?

> +	return 0;
> +}

...

> +static const struct regmap_config rtd1625_gpio_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,

> +	.disable_locking = true,

Hmm... This effectively drops the debugfs support, perhaps make it depend on
CONFIG_DEBUG_GPIO?

> +};

...

> +static int rtd1625_gpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_regmap_config config = {0};

'0' is redundant.

> +	struct device *dev = &pdev->dev;
> +	struct gpio_regmap *gpio_reg;
> +	struct rtd1625_gpio *data;
> +	void __iomem *irq_base;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->info = device_get_match_data(dev);
> +	if (!data->info)
> +		return -EINVAL;
> +
> +	irq_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(irq_base))
> +		return PTR_ERR(irq_base);
> +
> +	data->regmap = devm_regmap_init_mmio(dev, irq_base,
> +					     &rtd1625_gpio_regmap_config);

I would go with a single line

	data->regmap = devm_regmap_init_mmio(dev, irq_base, &rtd1625_gpio_regmap_config);

> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	data->save_regs = devm_kzalloc(dev, data->info->num_gpios *
> +				       sizeof(*data->save_regs), GFP_KERNEL);

This is devm_kcalloc().

> +	if (!data->save_regs)
> +		return -ENOMEM;
> +
> +	config.parent = dev;
> +	config.regmap = data->regmap;
> +	config.ngpio = data->info->num_gpios;
> +	config.reg_dat_base = data->info->base_offset;
> +	config.reg_set_base = data->info->base_offset;
> +	config.reg_mask_xlate = rtd1625_reg_mask_xlate;
> +	config.set_config = rtd1625_gpio_set_config;
> +	config.reg_dir_out_base = data->info->base_offset;
> +
> +	data->domain = irq_domain_add_linear(dev->of_node,

No, use fwnode variant from the start.

> +					     data->info->num_gpios,
> +					     &rtd1625_gpio_irq_domain_ops,
> +					     data);
> +	if (!data->domain)
> +		return -ENOMEM;
> +
> +	ret = rtd1625_gpio_setup_irq(pdev, data);
> +	if (ret) {
> +		irq_domain_remove(data->domain);
> +		return ret;
> +	}
> +
> +	config.irq_domain = data->domain;
> +	config.drvdata = data;
> +	platform_set_drvdata(pdev, data);
> +
> +	gpio_reg = devm_gpio_regmap_register(dev, &config);
> +	if (IS_ERR(gpio_reg)) {

> +		irq_domain_remove(data->domain);

This is wrong. The remove will do the opposite order. It means that
irq_domain_create_linear() has to be wrapped to become a managed resource.

> +		return PTR_ERR(gpio_reg);
> +	}
> +
> +	data->gpio_chip = gpio_regmap_get_gpiochip(gpio_reg);
> +
> +	return 0;
> +}
> +
> +static const struct rtd1625_gpio_info rtd1625_iso_gpio_info = {
> +	.num_gpios		= 166,
> +	.irq_type_support	= IRQ_TYPE_EDGE_BOTH,
> +	.base_offset		= 0x100,
> +	.gpa_offset		= 0x0,
> +	.gpda_offset		= 0x20,

Use fixed-width for the register offsets, id est 0x000, 0x020, and so on...

> +	.write_en_all		= RTD1625_ISO_GPIO_WREN_ALL,
> +};
> +
> +static const struct rtd1625_gpio_info rtd1625_isom_gpio_info = {
> +	.num_gpios		= 4,
> +	.irq_type_support	= IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_LOW |
> +				  IRQ_TYPE_LEVEL_HIGH,
> +	.base_offset		= 0x20,
> +	.gpa_offset		= 0x0,
> +	.gpda_offset		= 0x4,
> +	.level_offset		= 0x18,
> +	.write_en_all		= RTD1625_ISOM_GPIO_WREN_ALL,
> +};

...

> +static const struct of_device_id rtd1625_gpio_of_matches[] = {
> +	{ .compatible = "realtek,rtd1625-iso-gpio", .data = &rtd1625_iso_gpio_info },
> +	{ .compatible = "realtek,rtd1625-isom-gpio", .data = &rtd1625_isom_gpio_info },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_gpio_of_matches);

Move the initialiser and respective MODULE_DEVICE_TABLE() closer to its user.

...

> +static int rtd1625_gpio_suspend(struct device *dev)
> +{
> +	struct rtd1625_gpio *data = dev_get_drvdata(dev);
> +	const struct rtd1625_gpio_info *info = data->info;
> +	int i;
> +
> +	for (i = 0; i < info->num_gpios; i++)

	for (unsigned int i = 0; i < info->num_gpios; i++)

> +		regmap_read(data->regmap, data->info->base_offset + GPIO_CONTROL(i),
> +			    &data->save_regs[i]);
> +
> +	return 0;
> +}
> +
> +static int rtd1625_gpio_resume(struct device *dev)
> +{
> +	struct rtd1625_gpio *data = dev_get_drvdata(dev);
> +	const struct rtd1625_gpio_info *info = data->info;
> +	int i;
> +
> +	for (i = 0; i < info->num_gpios; i++)

Ditto.

> +		regmap_write(data->regmap, data->info->base_offset + GPIO_CONTROL(i),
> +			     data->save_regs[i] | info->write_en_all);
> +
> +	return 0;
> +}

...

> +DEFINE_NOIRQ_DEV_PM_OPS(rtd1625_gpio_pm_ops, rtd1625_gpio_suspend, rtd1625_gpio_resume);

Not static? Why?

-- 
With Best Regards,
Andy Shevchenko



