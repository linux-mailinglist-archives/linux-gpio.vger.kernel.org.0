Return-Path: <linux-gpio+bounces-38630-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LqKBL6RoMmo/zgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38630-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 11:28:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB1697E78
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 11:28:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mw2ycwaI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38630-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38630-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CE02300288C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B82B3B3C0D;
	Wed, 17 Jun 2026 09:27:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA939B94F;
	Wed, 17 Jun 2026 09:27:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688438; cv=none; b=SjjTe4iaiDwInv8xWAJp2QHWz+5hj6glbOREvLYE7N8sHy4Jrcq5azK0QMYZsSDNlQHDpgq+060VB6RuDDw1qSEGFToYcnnleOkiPFeVMdSai3h8dvckE3n/WL1q7SxHZKIMvH3XebSm13e5AdNkvbh5SSJz9/qW1G0ryeGQ36g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688438; c=relaxed/simple;
	bh=T3Lp3YNULabHqplHcZlMQc3WXWf+KjkB95K3YQHpBck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2+68rSxcG+7jEAIet5zI21ymOj7j6J7nR+9TWqSOGRbu9/WqJ56G3gbqRaFd2CNt7xU92YRNxwflid6MOK7rRMZSdRu6BDpHeJGvR/UYERKI7fXOOKsbyiwuiS9yTL/fgAaocp+QPp/iDN/EufN1/uxxL0SlZ+WK5nEtrKFxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw2ycwaI; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781688437; x=1813224437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T3Lp3YNULabHqplHcZlMQc3WXWf+KjkB95K3YQHpBck=;
  b=mw2ycwaIKI4O/xBcudKgR6suIt+UYMZYkO2bFhjN6UdwRUcSEcn0HK//
   Hne0XfUcagg4pCegTsdhxH+LYNDnr0aNqjxDGUj3hwn2yv59CuBZbFVni
   XRW80hS3+GjI9Pt902jyLE9Nm1Mx5bVVxAVj5Gazwz57EKuIIYJOeVheV
   TS5uzmUrPJjgh25IKnYZuQ81i7WhhFc7TqUD6iv7WMqnkRpY0QKGCHNtS
   lbk+RAc4VXJ8WgiNgNDjN/xpUsUD8whQvma9kcdtQP0Jgq8420g066w18
   yGWZd0EPTVMARXcVyk/1opzGysGfUju5q58gcLcLrC8QH44ddZ8ie5EED
   g==;
X-CSE-ConnectionGUID: Wfmzm56QRNSWdUM4JTXeQg==
X-CSE-MsgGUID: cFt6Tdq2SfihQLFpSu33yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86315588"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="86315588"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:27:16 -0700
X-CSE-ConnectionGUID: 3FGDRaZfRg2Ey4UFBi5lzQ==
X-CSE-MsgGUID: X2+LnDp1QFuD7L/al7IlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="248080418"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:27:13 -0700
Date: Wed, 17 Jun 2026 12:27:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v9 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ajJobvY67HKufaTs@ashevche-desk.local>
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
 <20260617065922.26004-3-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617065922.26004-3-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38630-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59AB1697E78

On Wed, Jun 17, 2026 at 12:29:22PM +0530, Hardik Prakash wrote:
> I2C controllers may have child devices with GpioInt resources that
> depend on GPIO controllers to be fully initialized. If the I2C
> controller probes and enumerates children before the referenced GPIO
> controller has completed probe, GPIO interrupts may not be properly
> configured, leading to device failures.
> 
> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> fail with lost arbitration errors.
> 
> Add a generic dependency check in i2c-designware that walks ACPI child
> devices, identifies any GpioInt resources, resolves the referenced GPIO
> controllers, and defers probe if those controllers are not yet bound.
> Uses acpi_gpio_get_irq_resource() to avoid duplicating GPIO resource
> parsing logic from gpiolib-acpi. Skips resources with no resource
> source string (string_length == 0 or string_ptr == NULL) to avoid
> crashes on hardware where GPIO resources have no named controller.
> 
> The probe ordering race was confirmed via dynamic debug tracing:
> 
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration

...

> +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> +{
> +	struct list_head *gpio_controllers = data;
> +	struct acpi_resource_gpio *agpio;
> +	struct gpio_controller_ref *ref;
> +
> +	if (!acpi_gpio_get_irq_resource(ares, &agpio))
> +		return 1;

> +	if (!agpio->resource_source.string_length ||
> +	    !agpio->resource_source.string_ptr)
> +		return 1;

I'm wondering if we simply can move to strncmp() instead of this check

> +	/* Skip if we've already tracked this GPIO controller */
> +	list_for_each_entry(ref, gpio_controllers, node) {
> +		if (!strcmp(ref->path, agpio->resource_source.string_ptr))

		if (!strncmp(ref->path, agpio->resource_source.string_ptr))


> +			return 1;
> +	}
> +
> +	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +	if (!ref)
> +		return -ENOMEM;
> +
> +	ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> +	if (!ref->path) {
> +		kfree(ref);
> +		return -ENOMEM;
> +	}
> +
> +	list_add_tail(&ref->node, gpio_controllers);
> +	return 1;
> +}
> +
> +static int check_child_gpioint(struct acpi_device *adev, void *data)
> +{
> +	struct list_head res_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&res_list);

> +	ret = acpi_dev_get_resources(adev, &res_list,
> +				     check_gpioint_resource, data);

Make it a single line.

> +	acpi_dev_free_resource_list(&res_list);

It's not critical double free (it will try to free an empty list) on error.

> +	return ret < 0 ? ret : 0;

	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, data);
	if (ret < 0)
		return ret;

	acpi_dev_free_resource_list(&res_list);
	return 0;

> +}
> +
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	struct acpi_device *adev;
> +	LIST_HEAD(gpio_controllers);
> +	struct gpio_controller_ref *ref;

Reversed xmas tree order.

> +	int ret = 0;

Useless assignment.

> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return 0;
> +
> +	/* Walk all child devices and collect GpioInt controller references */

> +	ret = acpi_dev_for_each_child(adev, check_child_gpioint,
> +				      &gpio_controllers);

Make it a single line.

> +	if (ret < 0)
> +		goto cleanup;
> +
> +	/* For each GPIO controller, check if its platform device is bound */
> +	list_for_each_entry(ref, &gpio_controllers, node) {
> +		acpi_handle handle;
> +		acpi_status status;
> +		struct acpi_device *gpio_adev;
> +		struct device *gpio_dev;

Reversed xmas tree order.

> +		bool bound;
> +
> +		status = acpi_get_handle(NULL, ref->path, &handle);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		gpio_adev = acpi_fetch_acpi_dev(handle);
> +		if (!gpio_adev)
> +			continue;

> +		gpio_dev = acpi_get_first_physical_node(gpio_adev);
> +		acpi_dev_put(gpio_adev);
> +		if (!gpio_dev) {
> +			ret = -EPROBE_DEFER;
> +			goto cleanup;
> +		}

> +		/*
> +		 * Defer probe until the GPIO controller is fully bound,
> +		 * ensuring its IRQ setup is complete before we enumerate
> +		 * I2C child devices.
> +		 */
> +		scoped_guard(device, gpio_dev)
> +			bound = device_is_bound(gpio_dev);

> +		if (!bound) {

Some of the compilers might complain the use of uninitialised variable (they
might not parse properly scoped_guard() case).

> +			ret = -EPROBE_DEFER;
> +			goto cleanup;
> +		}

To make it sure and deduplicate above the whole stuff can be written as

		gpio_dev = acpi_get_first_physical_node(gpio_adev);
		acpi_dev_put(gpio_adev);
		if (gpio_dev) {
			guard(device)(gpio_dev);

			bound = device_is_bound(gpio_dev);
		} else {
			bound = false;
		}
		/*
		 * Defer probe until the GPIO controller is fully bound,
		 * ensuring its IRQ setup is complete before we enumerate
		 * I2C child devices.
		 */
		if (!bound) {
			ret = -EPROBE_DEFER;
			goto cleanup;
		}

> +	}
> +
> +cleanup:
> +	free_gpio_controller_list(&gpio_controllers);
> +	return ret;
> +}
> +#else
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_ACPI && CONFIG_GPIOLIB */

I'm not sure if it's good to have all this quirk here or simply start
a i2c-designware-quirks.c. Theoretically the PCI counterpart might,
but I think quite unlikely, want to have something similar in the future.

-- 
With Best Regards,
Andy Shevchenko



