Return-Path: <linux-gpio+bounces-7315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02CE902418
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3C21B2466B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A0F12F588;
	Mon, 10 Jun 2024 14:30:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7480BE5
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718029813; cv=none; b=pCEfAz641GSKZq2HyRgCij5ATMUsZJ3i3zAeeSChOcbUjTGGQf3QQFxJjbJyNhkMiss2ZjNCPnRQspuYxfwKGEHeVYnw1n02jIvVenHfxKTJkFVPzBbvX2THo80em7x+K358Ufo+CQWfT9qsjyjZYmC9p2GdeRO2WfNg16Oonxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718029813; c=relaxed/simple;
	bh=F6Hr0LKXDLD7XQQtat0dtt69cZCG741R29SjH60XJWc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqaQxwQ2/hCF0XnmfQfrc1umhL/PEML6tYC72Q+NIj2KsmkAuL+ZL61tbbBiNvXhZRuvoQ4q5JE/ixGYUj1qgmWRmLyOPT5e40shFyUmehCY9U7rhwqds5yhfodKe6oHAZc1b8xLLsJOLZcNcBHG4/vN/FdKHuPxWRspMrXjW84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id ec93c9a4-2735-11ef-8d66-005056bd6ce9;
	Mon, 10 Jun 2024 17:30:03 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jun 2024 17:30:02 +0300
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <ZmcN6lJAGVxY3Ok2@surfacebook.localdomain>
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610112700.80819-2-wsa+renesas@sang-engineering.com>

Mon, Jun 10, 2024 at 01:26:59PM +0200, Wolfram Sang kirjoitti:
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.

...

> +#include <linux/ctype.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>

+ device.h
+ err.h

> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/ktime.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +#include <linux/sizes.h>
> +#include <linux/timekeeping.h>

+ types.h

> +#include <linux/vmalloc.h>

...

> +static int fops_capture_set(void *data, u64 val)
> +{
> +	struct gpio_la_poll_priv *priv = data;
> +	u8 *la_buf = priv->blob.data;
> +	unsigned long state = 0; /* zeroed because GPIO arrays are bitfields */
> +	unsigned long delay;
> +	ktime_t start_time;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!val)
> +		return 0;
> +
> +	if (!la_buf)
> +		return -ENOMEM;
> +
> +	if (!priv->delay_ns)
> +		return -EINVAL;

> +	mutex_lock(&priv->blob_lock);

guard() (from cleanup.h)?

> +	if (priv->blob_dent) {
> +		debugfs_remove(priv->blob_dent);
> +		priv->blob_dent = NULL;
> +	}
> +
> +	priv->buf_idx = 0;
> +
> +	local_irq_disable();
> +	preempt_disable_notrace();
> +
> +	/* Measure delay of reading GPIOs */
> +	start_time = ktime_get();
> +	for (i = 0; i < GPIO_LA_NUM_TESTS; i++) {
> +		ret = gpio_la_get_array(priv->descs, &state);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	priv->acq_delay = ktime_sub(ktime_get(), start_time) / GPIO_LA_NUM_TESTS;
> +	if (priv->delay_ns < priv->acq_delay) {
> +		ret = -ERANGE;
> +		goto out;
> +	}
> +
> +	delay = priv->delay_ns - priv->acq_delay;
> +
> +	/* Wait for triggers */
> +	for (i = 0; i < priv->trig_len; i += 2) {
> +		do {
> +			ret = gpio_la_get_array(priv->descs, &state);
> +			if (ret)
> +				goto out;
> +
> +			ndelay(delay);
> +		} while ((state & priv->trig_data[i]) != priv->trig_data[i + 1]);
> +	}
> +
> +	/* With triggers, final state is also the first sample */
> +	if (priv->trig_len)
> +		la_buf[priv->buf_idx++] = state;
> +
> +	/* Sample */
> +	while (priv->buf_idx < priv->blob.size) {
> +		ret = gpio_la_get_array(priv->descs, &state);
> +		if (ret)
> +			goto out;
> +
> +		la_buf[priv->buf_idx++] = state;
> +		ndelay(delay);
> +	}
> +out:
> +	preempt_enable_notrace();
> +	local_irq_enable();
> +	if (ret)
> +		dev_err(priv->dev, "couldn't read GPIOs: %d\n", ret);
> +
> +	kfree(priv->trig_data);
> +	priv->trig_data = NULL;
> +	priv->trig_len = 0;
> +
> +	priv->blob_dent = debugfs_create_blob("sample_data", 0400, priv->debug_dir, &priv->blob);
> +	mutex_unlock(&priv->blob_lock);
> +
> +	return ret;
> +}

...

> +static const struct file_operations fops_trigger = {
> +	.owner = THIS_MODULE,
> +	.open = trigger_open,
> +	.write = trigger_write,
> +	.llseek = no_llseek,
> +	.release = single_release,
> +};

Wondering if you can use DEFINE_SHOW_STORE_ATTRIBUTE(), or if it makes sense.
It might be that it requires to use DEFINE_SHOW_ATTRIBUTE() for the sake of
consistency, but I don't remember if there is a difference WRT debugfs usage.

...

> +static int gpio_la_poll_probe(struct platform_device *pdev)
> +{
> +	struct gpio_la_poll_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	const char *devname = dev_name(dev);
> +	const char *gpio_names[GPIO_LA_MAX_PROBES];
> +	char *meta = NULL;
> +	unsigned int i, meta_len = 0;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

> +	mutex_init(&priv->blob_lock);

devm_mutex_init()

> +	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
> +
> +	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
> +	if (IS_ERR(priv->descs))
> +		return PTR_ERR(priv->descs);
> +
> +	/* artificial limit to keep 1 byte per sample for now */
> +	if (priv->descs->ndescs > GPIO_LA_MAX_PROBES)
> +		return -EFBIG;
> +
> +	ret = device_property_read_string_array(dev, "probe-names", gpio_names,
> +						priv->descs->ndescs);
> +	if (ret >= 0 && ret != priv->descs->ndescs)
> +		ret = -EBADR;
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "error naming the GPIOs");
> +
> +	for (i = 0; i < priv->descs->ndescs; i++) {
> +		unsigned int add_len;
> +		char *new_meta, *consumer_name;
> +
> +		if (gpiod_cansleep(priv->descs->desc[i]))
> +			return -EREMOTE;
> +
> +		consumer_name = kasprintf(GFP_KERNEL, "%s: %s", devname, gpio_names[i]);
> +		if (!consumer_name)
> +			return -ENOMEM;
> +		gpiod_set_consumer_name(priv->descs->desc[i], consumer_name);
> +		kfree(consumer_name);
> +
> +		/* '10' is length of 'probe00=\n\0' */
> +		add_len = strlen(gpio_names[i]) + 10;
> +
> +		new_meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);

Can it be rewritten to use devm_krealloc_array()?

> +		if (!new_meta)
> +			return -ENOMEM;
> +
> +		meta = new_meta;
> +		meta_len += snprintf(meta + meta_len, add_len, "probe%02u=%s\n",
> +				     i + 1, gpio_names[i]);
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->dev = dev;
> +
> +	priv->meta.data = meta;
> +	priv->meta.size = meta_len;
> +	priv->debug_dir = debugfs_create_dir(devname, gpio_la_poll_debug_dir);
> +	debugfs_create_blob("meta_data", 0400, priv->debug_dir, &priv->meta);
> +	debugfs_create_ulong("delay_ns", 0600, priv->debug_dir, &priv->delay_ns);
> +	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->acq_delay);
> +	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
> +	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
> +	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);

> +	dev_info(dev, "initialized");

Do we need this? Existence of folder in debugfs is enough indication of
success, no?

> +	return 0;
> +}

...

> +static const struct of_device_id gpio_la_poll_of_match[] = {
> +	{ .compatible = GPIO_LA_NAME, },

Redundant inner comma.

> +	{ }
> +};

...

> +static int __init gpio_la_poll_init(void)
> +{
> +	gpio_la_poll_debug_dir = debugfs_create_dir(GPIO_LA_NAME, NULL);
> +
> +	return platform_driver_register(&gpio_la_poll_device_driver);
> +}

> +late_initcall(gpio_la_poll_init);

Why? Can we add a comment?

...

Btw, have you tried `shellcheck` against your script?

-- 
With Best Regards,
Andy Shevchenko



