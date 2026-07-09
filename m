Return-Path: <linux-gpio+bounces-39732-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jG87GoOAT2oxiQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39732-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 13:05:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0370F730085
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 13:05:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=f3JQneT3;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39732-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39732-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D932230065C8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 11:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BB440D597;
	Thu,  9 Jul 2026 11:05:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BBB3F12C8;
	Thu,  9 Jul 2026 11:05:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595131; cv=none; b=YJf3KhQpJ9e4cxsq58aBeOL/G69ZAz3f0pFGRmKMlEUSxkX/jvSvsT3loaiJ9sS2Q0vY0KtJlG4gb2ha+h3PHdeJxbNrpKebNVRAIrwsJaYoPgG1U2BAI/gb59LRr2Wp+FoUeXsdNSxm3X7w3jF3BbX3qd28m44Ui6DAtELKAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595131; c=relaxed/simple;
	bh=DYI0s2TFb57lFQ0gvywKehEfd0ZgiLrFZltpj0Nyjsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0bIc6fGc7D5oAJPiQepKypSDaJ+gC2QYwXgerLN6I2HcUNhRE1Hv96HPQSj7lBW/iHFMJoRsvssVG26Q7HYsBgC5SosZFu38ru8oDOA7/aovyXWs+GC2C//e9+70uGXe6FrNLHPhZUw0jgU/PC3OO2AXHjjrKHaA725OtaOHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3JQneT3; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783595130; x=1815131130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYI0s2TFb57lFQ0gvywKehEfd0ZgiLrFZltpj0Nyjsc=;
  b=f3JQneT3+SygSj2JW6vbWl3QHp52PM3+1OHuJUVvzJfpCgOa08JkW2d3
   NgZ9IXCLO2cih4x5RdOkS4HOsPj0eJwAgNCcQTQK6pOK7zXc4OFvy8g8m
   vzkokpnkwOarxZ8e0oYwTyjtHYMGllquee7DyUYMyhnx607km1dZbU5vh
   Fa/IEw93UbhUPR/poi9++MxhQRclw85kQvg3tomMBW1IxBaEjM1s1149D
   FF2zjXTbj3j2oyuR0fBnLKTKAFcV6qTHmdo5kCIDF/vtHYcv+fc9p0CxU
   tQFgfkQWuqIOE1Ms2xeR+0VyfdEolAaC4VGnZzOxyHMunOdZ+2csrhAb9
   Q==;
X-CSE-ConnectionGUID: 4sn09S+UQFWdH150ruEY9w==
X-CSE-MsgGUID: JfNi0X31SfKvJy4tlhH39g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84244812"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84244812"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 04:05:29 -0700
X-CSE-ConnectionGUID: sjFSbMCtQF2jzOd04fxeKQ==
X-CSE-MsgGUID: joLmG57JQAqn+CVmznUw3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256477444"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 04:05:23 -0700
Date: Thu, 9 Jul 2026 14:05:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Message-ID: <ak-AcfH-Igsa_ksV@ashevche-desk.local>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39732-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,baylibre.com,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0370F730085

On Thu, Jul 09, 2026 at 10:50:16AM +0200, Janani Sunil wrote:
> The AD7768/AD7768-4 ADC exposes 5 general-purpose I/O pins that can be
> independently configured as inputs or outputs. Add an auxiliary bus driver
> to expose these pins as a GPIO chip, registered by the parent IIO driver.
> 
> The driver uses the parent's regmap for register access and delegates
> runtime power management to the parent device.

...

> +config GPIO_AD7768
> +	tristate "Analog Devices AD7768 GPIO support"
> +	depends on AD7768 && GPIOLIB

Make depend on GPIOLIB on a separate line (it helps a lot when grepping for
the users of GPIOLIB).

> +	help
> +	  Say yes here to expose the AD7768 utility pins as GPIOs when the
> +	  device tree node is marked as a GPIO controller.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called gpio-ad7768.

>  config GPIO_LTC4283

Shouldn't Kconfig entry be aligned by order with Makefile ordering?

...

> +#include <linux/auxiliary_bus.h>

+ bits.h

> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>

Please, IWYU! I believe AD knows this very well and again same mistake from AD!

...

> +struct ad7768_gpio_state {
> +	struct device *parent;
> +	struct regmap *regmap;

As far as I can see these two are dups. One may be derived from the other.
Try both and check (with probably bloat-o-meter) which one is better.

> +	struct mutex lock; /* protects regmap accesses */

This is not fully correct comment. This protects GPIO IO which may require more
than one regmap call in a row.

> +	struct gpio_chip gc;
> +};

...

> +static int ad7768_gpio_direction_input(struct gpio_chip *chip,
> +				       unsigned int offset)
> +{
> +	struct ad7768_gpio_state *st = gpiochip_get_data(chip);
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);

> +	int ret = PM_RUNTIME_ACQUIRE_ERR(&pm);

No, declare it usual way.

> +

And drop this blank line.

> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
> +				  BIT(offset), AD7768_GPIO_INPUT);
> +}

...

So, I briefly looked at the implementation and I don't understand why
gpio-regmap can't be used. Do you need PM runtime there? It can be
done for all (if absent).

...

> +static int ad7768_gpio_probe(struct auxiliary_device *adev,
> +			     const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	const char *label = dev_get_platdata(dev);
> +	struct ad7768_gpio_state *st;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	st->parent = dev->parent;
> +	st->regmap = dev_get_regmap(dev->parent, NULL);
> +
> +	ret = devm_mutex_init(dev, &st->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(st->parent);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
> +				 AD7768_GPIO_UGPIO_ENABLE,
> +				 AD7768_GPIO_UGPIO_ENABLE);
> +

> +	pm_runtime_mark_last_busy(st->parent);

For a few releases this is a dup call.

> +	pm_runtime_put_autosuspend(st->parent);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	gc = &st->gc;
> +	gc->label = label;
> +	gc->base = -1;
> +	gc->ngpio = AD7768_NUM_GPIOS;
> +	gc->parent = dev;
> +	gc->owner = THIS_MODULE;
> +	gc->can_sleep = true;
> +	gc->get_direction = ad7768_gpio_get_direction;
> +	gc->direction_input = ad7768_gpio_direction_input;
> +	gc->direction_output = ad7768_gpio_direction_output;
> +	gc->get = ad7768_gpio_get;
> +	gc->set = ad7768_gpio_set;
> +
> +	return devm_gpiochip_add_data(dev, &st->gc, st);
> +}

-- 
With Best Regards,
Andy Shevchenko



