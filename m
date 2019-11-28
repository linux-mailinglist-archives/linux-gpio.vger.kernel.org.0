Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1987810C30C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 04:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfK1Dqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 22:46:55 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174]:36641 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfK1Dqz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 22:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574912808;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9VZbf0Xs2EGNp4/lQMwBxAcCex+Qmz2/ZTDWaOMFVWE=;
        b=fo2Z93ZeZN572h5GNkFkuXGiBDCo/ET3A8sNZAePdJHKWv8TyGRFmnBlIbGhgnwtMy
        tztiTPpPSjHjifxLVw3vSqvgysJBYbal96ENGpVA0W5wo7lI1p4vaRSyEEa02sO9Aclu
        kSXUyRgEniflAoe/wJ1QBSPtjZHNZZjguf5xUEk9vr9pXJ+GFtQRBztahQjkvUsSCDva
        /Cra05r0f/4Potso733ZpipSqVYmbfJFczp31eSn6KrkUJrjuYOYhJgSZ6f1aZfn1uZT
        UBEBDDe6A3SARPeR/UzIdYm5oVo8o8N3BwmXXCWAmt3OZX8gj4Ty4j/kl0OnTvh9W5hx
        bBWw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.0 AUTH)
        with ESMTPSA id 604beevAS3el2J0
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 04:40:47 +0100 (CET)
Date:   Thu, 28 Nov 2019 04:40:47 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Message-ID: <1945494371.1467708.1574912447486@webmail.strato.com>
In-Reply-To: <20191127084253.16356-6-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you for this series!

> On November 27, 2019 at 9:42 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
> 
> Hence add a GPIO driver to aggregate existing GPIOs, and expose them as
> a new gpiochip.
> 
> This supports the following use cases:
>   1. Aggregating GPIOs using Sysfs
>      This is useful for implementing access control, and assigning a set
>      of GPIOs to a specific user or virtual machine.
> 
>   2. GPIO Repeater in Device Tree
>      This supports modelling e.g. GPIO inverters in DT.
> 
>   3. Generic GPIO Driver
>      This provides userspace access to a simple GPIO-operated device
>      described in DT, cfr. e.g. spidev for SPI-operated devices.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Absorb GPIO forwarder,
>   - Integrate GPIO Repeater and Generic GPIO driver functionality,
>   - Use the aggregator parameters to create a GPIO lookup table instead
>     of an array of GPIO descriptors, which allows to simplify the code:
>       1. This removes the need for calling gpio_name_to_desc(),
>          gpiochip_find(), gpiochip_get_desc(), and gpiod_request(),
>       2. This allows the platform device to always use
>          devm_gpiod_get_index(), regardless of the origin of the GPIOs,
>   - Move parameter parsing from platform device probe to sysfs attribute
>     store, removing the need for platform data passing,
>   - Use more devm_*() functions to simplify cleanup,
>   - Add pr_fmt(),
>   - General refactoring.
> 
> v2:
>   - Add missing initialization of i in gpio_virt_agg_probe(),
>   - Update for removed .need_valid_mask field and changed
>     .init_valid_mask() signature,
>   - Drop "virtual", rename to gpio-aggregator,
>   - Drop bogus FIXME related to gpiod_set_transitory() expectations,
>   - Use new GPIO Forwarder Helper,
>   - Lift limit on the maximum number of GPIOs,
>   - Improve parsing:
>       - add support for specifying GPIOs by line name,
>       - add support for specifying GPIO chips by ID,
>       - add support for GPIO offset ranges,
>       - names and offset specifiers must be separated by whitespace,
>       - GPIO offsets must separated by spaces,
>   - Use str_has_prefix() and kstrtouint().
> ---
>  drivers/gpio/Kconfig           |  13 +
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-aggregator.c | 587 +++++++++++++++++++++++++++++++++
>  3 files changed, 601 insertions(+)
>  create mode 100644 drivers/gpio/gpio-aggregator.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8adffd42f8cb0559..36b6b57a6b05e906 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1507,6 +1507,19 @@ config GPIO_VIPERBOARD
>  
>  endmenu
>  
> +config GPIO_AGGREGATOR
> +	tristate "GPIO Aggregator/Repeater"
> +	help
> +	  Say yes here to enable the GPIO Aggregator and repeater, which

Inconsistent capitalization (Aggregator vs. repeater).

> +	  provides a way to aggregate and/or repeat existing GPIOs into a new
> +	  GPIO device.
> +	  This can serve the following purposes:
> +	    1. Assign a collection of GPIOs to a user, or export them to a
> +	       virtual machine,
> +	    2. Support GPIOs that are connected to a physical inverter,
> +	    3. Provide a generic driver for a GPIO-operated device, to be
> +               controlled from userspace using the GPIO chardev interface.
> +
>  config GPIO_MOCKUP
>  	tristate "GPIO Testing Driver"
>  	select IRQ_SIM
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 34eb8b2b12dd656c..f9971eeb1f32335f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
>  obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
>  obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
>  obj-$(CONFIG_GPIO_ADP5588)		+= gpio-adp5588.o
> +obj-$(CONFIG_GPIO_AGGREGATOR)		+= gpio-aggregator.o
>  obj-$(CONFIG_GPIO_ALTERA_A10SR)		+= gpio-altera-a10sr.o
>  obj-$(CONFIG_GPIO_ALTERA)  		+= gpio-altera.o
>  obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8111.o
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> new file mode 100644
> index 0000000000000000..873578c6f9683db8
> --- /dev/null
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -0,0 +1,587 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// GPIO Aggregator and Repeater
> +//
> +// Copyright (C) 2019 Glider bvba
> +
> +#define DRV_NAME       "gpio-aggregator"
> +#define pr_fmt(fmt)	DRV_NAME ": " fmt
> +
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/ctype.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +
> +#include "gpiolib.h"
> +
> +
> +	/*
> +	 * GPIO Aggregator sysfs interface
> +	 */

Should this comment really be indented?

> +
> +struct gpio_aggregator {
> +	struct gpiod_lookup_table *lookups;
> +	struct platform_device *pdev;
> +	char args[];
> +};
> +
> +static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
> +static DEFINE_IDR(gpio_aggregator_idr);
> +
> +static char *get_arg(char **args)
> +{
> +	char *start = *args, *end;
> +
> +	while (isspace(*start))
> +		start++;

"start = skip_spaces(start);", perhaps. (Looking at a grep through drivers/, I would say usage of while(isspace(...))... vs. skip_spaces() is about 60/40.)

> +
> +	if (!*start)
> +		return NULL;
> +
> +	if (*start == '"') {
> +		/* Quoted arg */
> +		end = strchr(++start, '"');
> +		if (!end)
> +			return ERR_PTR(-EINVAL);
> +	} else {
> +		/* Unquoted arg */
> +		for (end = start; *end && !isspace(*end); end++) ;
> +	}
> +
> +	if (*end)
> +		*end++ = '\0';
> +
> +	*args = end;
> +	return start;
> +}
> +
> +static bool isrange(const char *s)
> +{
> +	size_t n = strlen(s);
> +
> +	if (IS_ERR_OR_NULL(s))
> +		return false;
> +
> +	while (1) {
> +		n = strspn(s, "0123456789");
> +		if (!n)
> +			return false;
> +
> +		s += n;
> +
> +		switch (*s++) {
> +		case '\0':
> +			return true;
> +
> +		case '-':
> +		case ',':
> +			break;
> +
> +		default:
> +			return false;
> +		}
> +	}
> +}
> +
> +static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *label,
> +			 int hwnum, unsigned int *n)
> +{
> +	struct gpiod_lookup_table *lookups;
> +
> +	lookups = krealloc(aggr->lookups, struct_size(lookups, table, *n + 2),
> +			   GFP_KERNEL);
> +	if (!lookups)
> +		return -ENOMEM;
> +
> +	lookups->table[*n].chip_label = label;
> +	lookups->table[*n].chip_hwnum = hwnum;
> +	lookups->table[*n].idx = *n;
> +
> +	(*n)++;
> +	memset(&lookups->table[*n], 0, sizeof(lookups->table[*n]));
> +
> +	aggr->lookups = lookups;
> +	return 0;
> +}
> +
> +static int aggr_parse(struct gpio_aggregator *aggr)
> +{
> +	char *name, *offsets, *first, *last, *next;
> +	unsigned int a, b, i, n = 0;

Too many single-letter variables. "first_index" and "last_index" instead of "a" and "b" would make it easier to understand.

> +	char *args = aggr->args;
> +	int error;
> +
> +	for (name = get_arg(&args), offsets = get_arg(&args); name;
> +	     offsets = get_arg(&args)) {
> +		if (IS_ERR(name)) {
> +			pr_err("Cannot get GPIO specifier: %ld\n",
> +			       PTR_ERR(name));
> +			return PTR_ERR(name);
> +		}
> +
> +		if (!isrange(offsets)) {
> +			/* Named GPIO line */
> +			error = aggr_add_gpio(aggr, name, -1, &n);

The "-1" magic could use a #define, IMO.

> +			if (error)
> +				return error;
> +
> +			name = offsets;
> +			continue;
> +		}
> +
> +		/* GPIO chip + offset(s) */
> +		for (first = offsets; *first; first = next) {
> +			next = strchrnul(first, ',');
> +			if (*next)
> +				*next++ = '\0';
> +
> +			last = strchr(first, '-');
> +			if (last)
> +				*last++ = '\0';
> +
> +			if (kstrtouint(first, 10, &a)) {
> +				pr_err("Cannot parse GPIO index %s\n", first);
> +				return -EINVAL;
> +			}
> +
> +			if (!last) {
> +				b = a;
> +			} else if (kstrtouint(last, 10, &b)) {
> +				pr_err("Cannot parse GPIO index %s\n", last);
> +				return -EINVAL;
> +			}
> +
> +			for (i = a; i <= b; i++) {
> +				error = aggr_add_gpio(aggr, name, i, &n);
> +				if (error)
> +					return error;
> +			}
> +		}
> +
> +		name = get_arg(&args);
> +	}
> +
> +	if (!n) {
> +		pr_err("No GPIOs specified\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t new_device_store(struct device_driver *driver, const char *buf,
> +				size_t count)
> +{
> +	struct gpio_aggregator *aggr;
> +	struct platform_device *pdev;
> +	int res, id;
> +
> +	/* kernfs guarantees string termination, so count + 1 is safe */
> +	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
> +	if (!aggr)
> +		return -ENOMEM;
> +
> +	memcpy(aggr->args, buf, count + 1);
> +
> +	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
> +				GFP_KERNEL);
> +	if (!aggr->lookups) {
> +		res = -ENOMEM;
> +		goto free_ga;
> +	}
> +
> +	mutex_lock(&gpio_aggregator_lock);
> +	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
> +	mutex_unlock(&gpio_aggregator_lock);
> +
> +	if (id < 0) {
> +		res = id;
> +		goto free_table;
> +	}
> +
> +	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
> +	if (!aggr->lookups) {
> +		res = -ENOMEM;
> +		goto remove_idr;
> +	}
> +
> +	res = aggr_parse(aggr);
> +	if (res)
> +		goto free_dev_id;
> +
> +	gpiod_add_lookup_table(aggr->lookups);
> +
> +	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		res = PTR_ERR(pdev);
> +		goto remove_table;
> +	}
> +
> +	aggr->pdev = pdev;
> +	return count;
> +
> +remove_table:
> +	gpiod_remove_lookup_table(aggr->lookups);
> +free_dev_id:
> +	kfree(aggr->lookups->dev_id);
> +remove_idr:
> +	mutex_lock(&gpio_aggregator_lock);
> +	idr_remove(&gpio_aggregator_idr, id);
> +	mutex_unlock(&gpio_aggregator_lock);
> +free_table:
> +	kfree(aggr->lookups);
> +free_ga:
> +	kfree(aggr);
> +	return res;
> +}
> +
> +static DRIVER_ATTR_WO(new_device);
> +
> +static void gpio_aggregator_free(struct gpio_aggregator *aggr)
> +{
> +	platform_device_unregister(aggr->pdev);
> +	gpiod_remove_lookup_table(aggr->lookups);
> +	kfree(aggr->lookups->dev_id);
> +	kfree(aggr->lookups);
> +	kfree(aggr);
> +}
> +
> +static ssize_t delete_device_store(struct device_driver *driver,
> +				   const char *buf, size_t count)
> +{
> +	struct gpio_aggregator *aggr;
> +	unsigned int id;
> +	int error;
> +
> +	if (!str_has_prefix(buf, DRV_NAME "."))
> +		return -EINVAL;
> +
> +	error = kstrtouint(buf + strlen(DRV_NAME "."), 10, &id);
> +	if (error)
> +		return error;
> +
> +	mutex_lock(&gpio_aggregator_lock);
> +	aggr = idr_remove(&gpio_aggregator_idr, id);
> +	mutex_unlock(&gpio_aggregator_lock);
> +	if (!aggr)
> +		return -ENOENT;
> +
> +	gpio_aggregator_free(aggr);
> +	return count;
> +}
> +static DRIVER_ATTR_WO(delete_device);
> +
> +static struct attribute *gpio_aggregator_attrs[] = {
> +	&driver_attr_new_device.attr,
> +	&driver_attr_delete_device.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(gpio_aggregator);
> +
> +static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
> +{
> +	gpio_aggregator_free(p);
> +	return 0;
> +}
> +
> +static void __exit gpio_aggregator_remove_all(void)
> +{
> +	mutex_lock(&gpio_aggregator_lock);
> +	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
> +	idr_destroy(&gpio_aggregator_idr);
> +	mutex_unlock(&gpio_aggregator_lock);
> +}
> +
> +
> +	/*
> +	 *  Common GPIO Forwarder
> +	 */
> +
> +struct gpiochip_fwd {
> +	struct gpio_chip chip;
> +	struct gpio_desc **descs;
> +	union {
> +		struct mutex mlock;	/* protects tmp[] if can_sleep */
> +		spinlock_t slock;	/* protects tmp[] if !can_sleep */
> +	};
> +	unsigned long tmp[];		/* values and descs for multiple ops */
> +};
> +
> +static int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	return gpiod_get_direction(fwd->descs[offset]);
> +}
> +
> +static int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	return gpiod_direction_input(fwd->descs[offset]);
> +}
> +
> +static int gpio_fwd_direction_output(struct gpio_chip *chip,
> +				     unsigned int offset, int value)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	return gpiod_direction_output(fwd->descs[offset], value);
> +}
> +
> +static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	return gpiod_get_value(fwd->descs[offset]);
> +}
> +
> +static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> +				 unsigned long *bits)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +	unsigned long *values, flags;
> +	struct gpio_desc **descs;
> +	unsigned int i, j = 0;
> +	int error;
> +
> +	if (chip->can_sleep)
> +		mutex_lock(&fwd->mlock);
> +	else
> +		spin_lock_irqsave(&fwd->slock, flags);
> +
> +	values = &fwd->tmp[0];
> +	bitmap_clear(values, 0, fwd->chip.ngpio);
> +	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];

This use of the tmp array, which I presume serves to avoid extra memory allocations at the time of device creation, is odd enough to deserve a comment.

> +
> +	for_each_set_bit(i, mask, fwd->chip.ngpio)
> +		descs[j++] = fwd->descs[i];
> +
> +	error = gpiod_get_array_value(j, descs, NULL, values);
> +	if (!error) {
> +		j = 0;
> +		for_each_set_bit(i, mask, fwd->chip.ngpio)
> +			__assign_bit(i, bits, test_bit(j++, values));
> +	}
> +
> +	if (chip->can_sleep)
> +		mutex_unlock(&fwd->mlock);
> +	else
> +		spin_unlock_irqrestore(&fwd->slock, flags);
> +
> +	return error;
> +}
> +
> +static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	gpiod_set_value(fwd->descs[offset], value);
> +}
> +
> +static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +				  unsigned long *bits)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +	unsigned long *values, flags;
> +	struct gpio_desc **descs;
> +	unsigned int i, j = 0;
> +
> +	if (chip->can_sleep)
> +		mutex_lock(&fwd->mlock);
> +	else
> +		spin_lock_irqsave(&fwd->slock, flags);
> +
> +	values = &fwd->tmp[0];
> +	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
> +
> +	for_each_set_bit(i, mask, fwd->chip.ngpio) {
> +		__assign_bit(j, values, test_bit(i, bits));
> +		descs[j++] = fwd->descs[i];
> +	}
> +
> +	gpiod_set_array_value(j, descs, NULL, values);
> +
> +	if (chip->can_sleep)
> +		mutex_unlock(&fwd->mlock);
> +	else
> +		spin_unlock_irqrestore(&fwd->slock, flags);
> +}
> +
> +static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> +			       unsigned long config)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	chip = fwd->descs[offset]->gdev->chip;
> +	if (chip->set_config)
> +		return chip->set_config(chip, offset, config);
> +
> +	return -ENOTSUPP;
> +}
> +
> +static int gpio_fwd_init_valid_mask(struct gpio_chip *chip,
> +				    unsigned long *valid_mask,
> +				    unsigned int ngpios)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +	unsigned int i;
> +
> +	for (i = 0; i < ngpios; i++) {
> +		if (!gpiochip_line_is_valid(fwd->descs[i]->gdev->chip,
> +					    gpio_chip_hwgpio(fwd->descs[i])))
> +			clear_bit(i, valid_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * gpiochip_fwd_create() - Create a new GPIO forwarder
> + * @dev: Parent device pointer
> + * @ngpios: Number of GPIOs in the forwarder.
> + * @descs: Array containing the GPIO descriptors to forward to.
> + *         This array must contain @ngpios entries, and must not be deallocated
> + *         before the forwarder has been destroyed again.
> + *
> + * This function creates a new gpiochip, which forwards all GPIO operations to
> + * the passed GPIO descriptors.
> + *
> + * Return: An opaque object pointer, or an ERR_PTR()-encoded negative error
> + *         code on failure.
> + */
> +static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
> +						unsigned int ngpios,
> +						struct gpio_desc *descs[])
> +{
> +	const char *label = dev_name(dev);
> +	struct gpiochip_fwd *fwd;
> +	struct gpio_chip *chip;
> +	unsigned int i;
> +	int error;
> +
> +	fwd = devm_kzalloc(dev, struct_size(fwd, tmp,
> +			   BITS_TO_LONGS(ngpios) + ngpios), GFP_KERNEL);
> +	if (!fwd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	chip = &fwd->chip;
> +
> +	for (i = 0; i < ngpios; i++) {
> +		dev_dbg(dev, "gpio %u => gpio-%d (%s)\n", i,
> +			desc_to_gpio(descs[i]), descs[i]->label ? : "?");
> +
> +		if (gpiod_cansleep(descs[i]))
> +			chip->can_sleep = true;
> +		if (descs[i]->gdev->chip->set_config)
> +			chip->set_config = gpio_fwd_set_config;
> +		if (descs[i]->gdev->chip->init_valid_mask)
> +			chip->init_valid_mask = gpio_fwd_init_valid_mask;
> +	}
> +
> +	chip->label = label;
> +	chip->parent = dev;
> +	chip->owner = THIS_MODULE;
> +	chip->get_direction = gpio_fwd_get_direction;
> +	chip->direction_input = gpio_fwd_direction_input;
> +	chip->direction_output = gpio_fwd_direction_output;
> +	chip->get = gpio_fwd_get;
> +	chip->get_multiple = gpio_fwd_get_multiple;
> +	chip->set = gpio_fwd_set;
> +	chip->set_multiple = gpio_fwd_set_multiple;
> +	chip->base = -1;
> +	chip->ngpio = ngpios;
> +	fwd->descs = descs;
> +
> +	if (chip->can_sleep)
> +		mutex_init(&fwd->mlock);
> +	else
> +		spin_lock_init(&fwd->slock);
> +
> +	error = devm_gpiochip_add_data(dev, chip, fwd);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	return fwd;
> +}
> +
> +
> +	/*
> +	 *  Common GPIO Aggregator/Repeater platform device
> +	 */
> +
> +static int gpio_aggregator_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_desc **descs;
> +	struct gpiochip_fwd *fwd;
> +	int i, n;
> +
> +	n = gpiod_count(dev, NULL);
> +	if (n < 0)
> +		return n;
> +
> +	descs = devm_kmalloc_array(dev, n, sizeof(*descs), GFP_KERNEL);
> +	if (!descs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n; i++) {
> +		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
> +		if (IS_ERR(descs[i]))
> +			return PTR_ERR(descs[i]);
> +	}
> +
> +	fwd = gpiochip_fwd_create(dev, n, descs);
> +	if (IS_ERR(fwd))
> +		return PTR_ERR(fwd);
> +
> +	platform_set_drvdata(pdev, fwd);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id gpio_aggregator_dt_ids[] = {
> +	{ .compatible = "gpio-repeater" },
> +	/*
> +	 * Add GPIO-operated devices controlled from userspace below,
> +	 * or use "driver_override" in sysfs
> +	 */
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
> +#endif
> +
> +static struct platform_driver gpio_aggregator_driver = {
> +	.probe = gpio_aggregator_probe,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.groups = gpio_aggregator_groups,
> +		.of_match_table = of_match_ptr(gpio_aggregator_dt_ids),
> +	},
> +};
> +
> +static int __init gpio_aggregator_init(void)
> +{
> +	return platform_driver_register(&gpio_aggregator_driver);
> +}
> +module_init(gpio_aggregator_init);
> +
> +static void __exit gpio_aggregator_exit(void)
> +{
> +	gpio_aggregator_remove_all();
> +	platform_driver_unregister(&gpio_aggregator_driver);
> +}
> +module_exit(gpio_aggregator_exit);
> +
> +MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
> +MODULE_DESCRIPTION("GPIO Aggregator/Repeater");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
>

CU
Uli
