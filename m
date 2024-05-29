Return-Path: <linux-gpio+bounces-6890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369218D3FFA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 23:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E182857BF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 21:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CBA1C8FDD;
	Wed, 29 May 2024 21:00:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF61CD31
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717016446; cv=none; b=OX290wh/C/Fvzbv1+WbhjwQGkKfSD56/Vtzv0Xl3vlXVvyTZBJ+/84lkACS73un8Cxk+FJonCmAJ7c/s0cUDw3umKFSmXsnMJLK0fW4JauajvLAthzY9G0rEZYItRgoe1Tay5FwhqIivieyW9Yn/CAoPQhK6FJQ0Qjftlpg2NP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717016446; c=relaxed/simple;
	bh=O8Ahk0wXb6gkuLSSopcEywFTrHvPk1/FUlRKiJClcAI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/3dUersQ/zVpIRGGFTamd8zbIXwTpBl5B2Q6d2oMeDYynSEwp6dY6ll4mGmoGMUu3aeC5EFMwLqEn48eRwXHdxUxQjHb7YiF+Hvu/Ni8EIc6IsCvxQwcJhN8cwH+zdn6RQJ5eRWyNHXWNqfi+n8IgWu4lQU0HipX6GRGPHS57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 7ed9edfc-1dfe-11ef-80c4-005056bdfda7;
	Thu, 30 May 2024 00:00:36 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 00:00:35 +0300
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7] gpio: virtuser: new virtual driver
Message-ID: <ZleXc6tLbiWQ59i-@surfacebook.localdomain>
References: <20240527144054.155503-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527144054.155503-1-brgl@bgdev.pl>

Mon, May 27, 2024 at 04:40:54PM +0200, Bartosz Golaszewski kirjoitti:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The GPIO subsystem used to have a serious problem with undefined behavior
> and use-after-free bugs on hot-unplug of GPIO chips. This can be
> considered a corner-case by some as most GPIO controllers are enabled
> early in the boot process and live until the system goes down but most
> GPIO drivers do allow unbind over sysfs, many are loadable modules that
> can be (force) unloaded and there are also GPIO devices that can be
> dynamically detached, for instance CP2112 which is a USB GPIO expender.
> 
> Bugs can be triggered both from user-space as well as by in-kernel users.
> We have the means of testing it from user-space via the character device
> but the issues manifest themselves differently in the kernel.
> 
> This is a proposition of adding a new virtual driver - a configurable
> GPIO consumer that can be configured over configfs (similarly to
> gpio-sim) or described on the device-tree.
> 
> This driver is aimed as a helper in spotting any regressions in
> hot-unplug handling in GPIOLIB.

...

> User must pass exactly the number of values that the array contains

Can't we assume non-active values for the rest if less than needed were
provided? For more than that, why do we care?

...

> +#include <linux/atomic.h>
> +#include <linux/bitmap.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/configfs.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>

> +#include <linux/idr.h>

> +#include <linux/interrupt.h>
> +#include <linux/irq_work.h>

> +#include <linux/kernel.h>

Do you need this?

> +#include <linux/limits.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>

> +#include <linux/string.h>

Implied by string_helpers.h

> +#include <linux/string_helpers.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>

...

> +struct gpio_virtuser_line_array_data {
> +	struct gpio_descs *descs;
> +	struct kobject *kobj;
> +	struct attribute_group *attr_group;
> +};
> +
> +struct gpio_virtuser_line_data {
> +	struct gpio_desc *desc;
> +	struct kobject *kobj;
> +	struct attribute_group *attr_group;
> +	char consumer[GPIO_CONSUMER_NAME_MAX_LEN];
> +	struct mutex consumer_lock;
> +	unsigned int debounce;
> +	atomic_t irq;
> +	atomic_t irq_count;
> +};

Maybe

struct gpio_virtuser_sysfs_data {
	union {
		struct gpio_desc *desc;
		struct gpio_descs *descs;
	};
	struct kobject *kobj;
	struct attribute_group *attr_group;
};

struct gpio_virtuser_line_array_data {
	struct gpio_virtuser_sysfs_data sd;
};

struct gpio_virtuser_line_data {
	struct gpio_virtuser_sysfs_data sd;
	char consumer[GPIO_CONSUMER_NAME_MAX_LEN];
	struct mutex consumer_lock;
	unsigned int debounce;
	atomic_t irq;
	atomic_t irq_count;
};

?

...

> +struct gpio_virtuser_attr_ctx {
> +	struct device_attribute dev_attr;
> +	void *data;
> +};

struct dev_ext_attribute ?

...

> +struct gpio_virtuser_attr_descr {
> +	const char *name;
> +	ssize_t (*show)(struct device *, struct device_attribute *, char *);
> +	ssize_t (*store)(struct device *, struct device_attribute *,
> +			 const char *, size_t);
> +};

struct device_attribute ? (Yes, I know that that one is a bit bigger but
benefit is that we have some code that you may reuse)

...

> +static ssize_t gpio_virtuser_sysfs_emit_value_array(char *buf,
> +						    unsigned long *values,
> +						    size_t num_values)
> +{
> +	ssize_t len = 0;
> +	size_t i;
> +
> +	for (i = 0; i < num_values; i++)
> +		len += sysfs_emit_at(buf, len, "%d",
> +				     test_bit(i, values) ? 1 : 0);
> +	return len + sysfs_emit_at(buf, len, "\n");

Why not use %pb?

> +}

...

> +static int gpio_virtuser_sysfs_parse_value_array(const char *buf, size_t len,
> +						 unsigned long *values)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < len; i++) {

Perhaps

		bool val;
		int ret;

		ret = kstrtobool(...);
		if (ret)
			return ret;

		assign_bit(...); // btw, why atomic?

> +		if (buf[i] == '0')
> +			clear_bit(i, values);
> +		else if (buf[i] == '1')
> +			set_bit(i, values);
> +		else
> +			return -EINVAL;

> +	}

BUT, why not bitmap_parse()?

> +	return 0;
> +}

...

> +	unsigned long *values __free(bitmap) = bitmap_alloc(descs->ndescs,
> +							    GFP_KERNEL);

Perhaps

	unsigned long *values __free(bitmap) =
		 bitmap_alloc(descs->ndescs, GFP_KERNEL);

...

> +	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
> +							     GFP_KERNEL);

In the similar way?

...

> +	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
> +							     GFP_KERNEL);

Ditto.

...

> +{
> +	return sysfs_emit(buf, "%s\n",
> +			  dir == GPIO_LINE_DIRECTION_IN ? "input" : "output");

I think this maybe transformed to something like str_input_output() in
string_choices.h (and you don't even need to include that as it's implied by
string_helpers.h)

> +}

...

> +static int gpio_virtuser_parse_direction(const char *buf, int *dir, int *val)
> +{
> +	if (sysfs_streq(buf, "input")) {
> +		*dir = GPIO_LINE_DIRECTION_IN;
> +		return 0;
> +	}
> +
> +	if (sysfs_streq(buf, "output-high"))
> +		*val = 1;
> +	else if (sysfs_streq(buf, "output-low"))
> +		*val = 0;
> +	else
> +		return -EINVAL;
> +
> +	*dir = GPIO_LINE_DIRECTION_OUT;

This can be transformed to use sysfs_match_string() with

static const char * const dirs[] = { "output-low", "output-high", "input" };

	int ret;

	ret = sysfs_match_string(...);
	if (ret < 0)
		return ret;

	*val = ret;
	*dir = ret == 2 ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;

And with this approach it even not clear why do you need dir and val to be
separated here (esp. if we add a enum like

	GPIO_VIRTUSER_OUT_LOW,
	GPIO_VIRTUSER_OUT_HIGH,
	GPIO_VIRTUSER_IN,

(with it the string array can also be indexed).

> +	return 0;
> +}

...

> +static int gpio_virtuser_parse_value(const char *buf)
> +{
> +	int value, ret;
> +
> +	value = sysfs_match_string(gpio_virtuser_sysfs_value_strings, buf);
> +	if (value < 0) {
> +		/* Can be 0 or 1 too. */
> +		ret = kstrtoint(buf, 0, &value);
> +		if (ret)
> +			return ret;

> +		if (value != 0 && value != 1)
> +			return -EINVAL;

Why not kstrtobool()?

> +	}
> +
> +	return value;
> +}

...

> +	ret = kstrtouint(buf, 10, &debounce);

Why restrict to decimal?

> +	if (ret)
> +		return ret;

...

> +static ssize_t
> +gpio_virtuser_sysfs_consumer_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t len)
> +{
> +	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
> +	int ret;

> +	if (strlen(buf) > GPIO_CONSUMER_NAME_MAX_LEN)
> +		return -EINVAL;

You don't need this if you use strscpy() below and check its returned value.

> +	guard(mutex)(&data->consumer_lock);
> +
> +	ret = gpiod_set_consumer_name(data->desc, buf);
> +	if (ret)
> +		return ret;
> +
> +	sprintf(data->consumer, buf);
> +
> +	return len;
> +}

...

> +	data->attr_group->name = devm_kasprintf(dev, GFP_KERNEL,
> +						"gpiod:%s", id);

Why two lines?

> +	if (!data->attr_group->name)
> +		return -ENOMEM;

...

> +	ret = devm_add_action_or_reset(dev, gpio_virtuser_mutex_destroy,
> +				       &data->consumer_lock);

Don't we have devm_mutex_init() (`git tag --contains` shows v6.10-rc1 to me)

> +		return ret;

...

> +static int gpio_virtuser_prop_is_gpio(struct property *prop)
> +{
> +	char *dash = strpbrk(prop->name, "-");

Why not strrchr() ?

> +	return dash && strcmp(dash, "-gpios") == 0;

Can't we reuse the suffix from the array from the gpiolib internal header?
Also I don't like the form of '-' in the line. "gpios" is good and chance
that linker deduplicates the same string if it occurs somewhere else in the
binary (in case this goes with =y in .config).

> +}

...

> +/*
> + * If this is an OF-based system, then we iterate over properties and consider
> + * all whose names end in "-gpios". For configfs we expect an additional string
> + * array property - "gpio-virtuser,ids" - containing the list of all GPIO IDs
> + * to request.

Why not any other system? What's wrong for having this available for ACPI, for
example? Okay, I see that this is probably due to absence of API.

OTOH the last call in the function assumes non-OF cases. Why can't we have the
same approach in both?

> + */
> +static int gpio_virtuser_count_ids(struct device *dev)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);

Why? This function is mostly OF one, make it simpler.

	struct device_node *np = dev_of_node(dev);

> +	struct property *prop;
> +	int ret = 0;

> +	if (is_of_node(fwnode)) {

Instead of this check...

	if (np) {

...can be used.


> +		for_each_property_of_node(to_of_node(fwnode), prop) {

	for_each_property_of_node(np, prop) {

> +			if (gpio_virtuser_prop_is_gpio(prop))
> +				++ret;

Why pre-increment?

> +		}

> +		return ret;
> +	}

> +	return device_property_string_array_count(dev, "gpio-virtuser,ids");
> +}

...

> +static int gpio_virtuser_get_ids(struct device *dev, const char **ids,
> +				 int num_ids)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct property *prop;
> +	size_t pos = 0, diff;
> +	char *dash, *tmp;
> +
> +	if (is_of_node(fwnode)) {
> +		for_each_property_of_node(to_of_node(fwnode), prop) {

As per above function.

> +			if (!gpio_virtuser_prop_is_gpio(prop))
> +				continue;
> +
> +			dash = strpbrk(prop->name, "-");
> +			diff = dash - prop->name;
> +
> +			tmp = devm_kmemdup(dev, prop->name, diff + 1,
> +					   GFP_KERNEL);

devm_kstrndup() is not okay? Okay, we don't have it (yet?), but at least I
would rather expect wrapped kstrndup() than this.

> +			if (!tmp)
> +				return -ENOMEM;
> +
> +			tmp[diff] = '\0';
> +			ids[pos++] = tmp;
> +		}
> +
> +		return 0;
> +	}
> +
> +	return device_property_read_string_array(dev, "gpio-virtuser,ids",
> +						 ids, num_ids);
> +}

...

> +static int gpio_virtuser_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_descs *descs;
> +	int ret, num_ids = 0, i;
> +	const char **ids;
> +	unsigned int j;
> +
> +	num_ids = gpio_virtuser_count_ids(dev);
> +	if (num_ids < 0)
> +		return dev_err_probe(dev, num_ids,
> +				     "Failed to get the number of GPIOs to request\n");
> +
> +	if (num_ids == 0) {
> +		dev_err(dev, "No GPIO IDs specified\n");
> +		return -EINVAL;

It's okay to

		return dev_err_probe(...);

with know error code.

> +	}
> +
> +	ids = devm_kcalloc(dev, num_ids, sizeof(*ids), GFP_KERNEL);
> +	if (!ids)
> +		return -ENOMEM;
> +
> +	ret = gpio_virtuser_get_ids(dev, ids, num_ids);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get the IDs of GPIOs to request\n");
> +
> +	for (i = 0; i < num_ids; i++) {
> +		descs = devm_gpiod_get_array(dev, ids[i], GPIOD_ASIS);
> +		if (IS_ERR(descs))
> +			return dev_err_probe(dev, PTR_ERR(descs),
> +					     "Failed to request the '%s' GPIOs\n",
> +					     ids[i]);
> +
> +		ret = gpio_virtuser_sysfs_init_line_array_attrs(dev, descs,
> +								ids[i]);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to setup the sysfs array interface for the '%s' GPIOs\n",
> +					     ids[i]);
> +
> +		for (j = 0; j < descs->ndescs; j++) {
> +			ret = gpio_virtuser_sysfs_init_line_attrs(dev,
> +							descs->desc[j],
> +							ids[i], j);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to setup the sysfs line interface for the '%s' GPIOs\n",
> +						     ids[i]);
> +		}
> +	}
> +
> +	return 0;
> +}

...

> +static int gpio_virtuser_bus_notifier_call(struct notifier_block *nb,
> +					   unsigned long action, void *data)
> +{
> +	struct gpio_virtuser_device *vdev;
> +	struct device *dev = data;
> +	char devname[32];
> +
> +	vdev = container_of(nb, struct gpio_virtuser_device, bus_notifier);
> +	snprintf(devname, sizeof(devname), "gpio-virtuser.%d", vdev->id);
> +
> +	if (strcmp(dev_name(dev), devname))

	if (!device_match_name(...))

> +		return NOTIFY_DONE;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_BOUND_DRIVER:
> +		vdev->driver_bound = true;
> +		break;
> +	case BUS_NOTIFY_DRIVER_NOT_BOUND:
> +		vdev->driver_bound = false;
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	complete(&vdev->probe_completion);
> +	return NOTIFY_OK;
> +}

...

> +static ssize_t
> +gpio_virtuser_lookup_entry_config_key_store(struct config_item *item,
> +					    const char *page, size_t count)
> +{
> +	struct gpio_virtuser_lookup_entry *entry =
> +					to_gpio_virtuser_lookup_entry(item);
> +	struct gpio_virtuser_device *dev = entry->parent->parent;
> +
> +	char *key = kstrndup(skip_spaces(page), count, GFP_KERNEL);

Missing __free() ?

> +	if (!key)
> +		return -ENOMEM;

> +	strim(key);

> +	guard(mutex)(&dev->lock);
> +
> +	if (gpio_virtuser_device_is_live(dev))
> +		return -EBUSY;
> +
> +	kfree(entry->key);
> +	entry->key = no_free_ptr(key);
> +
> +	return count;
> +}

...

> +	if (sysfs_streq(page, "pull-up")) {
> +		entry->flags &= ~(GPIO_PULL_DOWN | GPIO_PULL_DISABLE);
> +		entry->flags |= GPIO_PULL_UP;
> +	} else if (sysfs_streq(page, "pull-down")) {
> +		entry->flags &= ~(GPIO_PULL_UP | GPIO_PULL_DISABLE);
> +		entry->flags |= GPIO_PULL_DOWN;
> +	} else if (sysfs_streq(page, "pull-disabled")) {
> +		entry->flags &= ~(GPIO_PULL_UP | GPIO_PULL_DOWN);
> +		entry->flags |= GPIO_PULL_DISABLE;
> +	} else if (sysfs_streq(page, "as-is")) {
> +		entry->flags &= ~(GPIO_PULL_UP | GPIO_PULL_DOWN |
> +				  GPIO_PULL_DISABLE);
> +	} else {
> +		count = -EINVAL;

		return -EINVAL won't (ab)use count semantics.
> +	}
> +
> +	return count;

...

> +	return sprintf(page, "%s\n", flags & GPIO_ACTIVE_LOW ? "1" : "0");

Somewhere above you used %d for very similar situation, why %s here?
Or why "5d" there?

...

> +	return sprintf(page, "%s\n", flags & GPIO_TRANSITORY ? "1" : "0");

Ditto.

...

> +	return sprintf(page, "%c\n", live ? '1' : '0');

Wow! Third type of the same.

...

> +	struct gpiod_lookup_table *table __free(kfree) =
> +		kzalloc(struct_size(table, table, num_entries + 1), GFP_KERNEL);
> +	if (!table)
> +		return -ENOMEM;

> +	table->dev_id = kasprintf(GFP_KERNEL, "gpio-virtuser.%d",
> +				  dev->id);

Perfectly one line in comparison with the few lines above).

> +	if (!table->dev_id)
> +		return -ENOMEM;

...

> +			curr->chip_hwnum = entry->offset < 0
> +						? U16_MAX : entry->offset;

Can we leave ? on the previous line?

...

> +			++i;

Why pre-increment?

...

> +static struct fwnode_handle *
> +gpio_virtuser_make_device_swnode(struct gpio_virtuser_device *dev)
> +{
> +	struct property_entry properties[2];
> +	struct gpio_virtuser_lookup *lookup;
> +	size_t num_ids;
> +	int i = 0;

Why signed? And in all this kind of case, I would split assignment...

> +	memset(properties, 0, sizeof(properties));
> +
> +	num_ids = list_count_nodes(&dev->lookup_list);
> +	char **ids __free(kfree) = kcalloc(num_ids + 1, sizeof(*ids),
> +					   GFP_KERNEL);
> +	if (!ids)
> +		return ERR_PTR(-ENOMEM);
> +

To be here, that the reader will see immediately (close enough) what is the
initial values. Moreover this code will be robuse against changes in between
(if i become reusable).

> +	list_for_each_entry(lookup, &dev->lookup_list, siblings)
> +		ids[i++] = lookup->con_id;
> +
> +	properties[0] = PROPERTY_ENTRY_STRING_ARRAY_LEN("gpio-virtuser,ids",
> +							ids, num_ids);
> +
> +	return fwnode_create_software_node(properties, NULL);
> +}

...

> +	guard(mutex)(&dev->lock);
> +
> +	if (live == gpio_virtuser_device_is_live(dev))
> +		ret = -EPERM;

With guard in place, just return directly, ...

> +	else if (live)

...drop 'else'...

> +		ret = gpio_virtuser_device_activate(dev);
> +	else

...ditto...

> +		gpio_virtuser_device_deactivate(dev);
> +
> +	return ret ?: count;

...and simply return count here.


...

> +	struct gpio_virtuser_device *dev __free(kfree) = kzalloc(sizeof(*dev),
> +								 GFP_KERNEL);

	struct gpio_virtuser_device *dev __free(kfree) =
		kzalloc(sizeof(*dev), GFP_KERNEL);

> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);

...

> +	ret = platform_driver_register(&gpio_virtuser_driver);
> +	if (ret) {

> +		pr_err("Failed to register the platform driver: %d\n",
> +		       ret);

I would keep one line.

> +		return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko



