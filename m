Return-Path: <linux-gpio+bounces-37849-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NUnTNNlgH2qflQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37849-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:01:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31400632BD1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HT7KEpWC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37849-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37849-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D000E304EBB5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 22:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E406A3CA49C;
	Tue,  2 Jun 2026 22:55:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A933C8724;
	Tue,  2 Jun 2026 22:55:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440940; cv=none; b=RUpBnLmG7ob3XYuuOQRtc0AX5wBp6Lm+iNRkhcH/GHkWGaG6C5tT9KImniCwSWfIQ5T/o0Cx7DTieiCrhNeGfVV0xHvdLMjC+Tt83EPHcAuZFvcD5tUJ81mD+At6uA9PRj4IVFw3UlPpFGuIwJqM447sHMLPhFm+VfM5kwrBUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440940; c=relaxed/simple;
	bh=kt9vQAID/OBuoZ3U/eQG3RJqXJfreKjfl9TfnvA9XZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBy5Hoh5/pbm16o74h1CWayRk2vvPf4g5AW/wF3p+Z99EIHLYe2WjpJYe4sjfxWttGfMrX5vh4sXbO8xCSqYJFiLwCsmFSq9PRLcTed7B1ic7HRFMDoOdHcuW9YTlz4+/QO1Kx2xhnw9heSkyXbzoX+dAL+Sm4ArA0iQb6uTW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT7KEpWC; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780440940; x=1811976940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kt9vQAID/OBuoZ3U/eQG3RJqXJfreKjfl9TfnvA9XZ8=;
  b=HT7KEpWCAbKrAo+dC59MToF5zg9Bu26IXiF+TJkKN6eEpmv38EkgfqgU
   RPqW51jEvJwK5NQcvq+gzxYDMsJCFeN5MJHQi2S2232ctVFaCOylVcfnm
   jfAqcECLkQc7aZ37mnvgyBYaDjE8xdKVWlPGFVMapQXArCNyPyehN2Fwu
   p2yciAcjgsbznc63/K1xazc+ZhyGyaJb9RdJ47bcinNoRuBFL2EZlISmR
   SsjVK0zYbW6qMAQhWIEeMTGfFktDbsmlkCx4aB3C5EMZ5+t0y27a0g0Tv
   +JsCWmQqjoBXvyXa8QAYw3KCjhkgy6FxRUR8GZUz/dPwtIbQGZOjTRofa
   A==;
X-CSE-ConnectionGUID: +1N1hoctSTiUDURRzfkd1w==
X-CSE-MsgGUID: 76ioosEMSVyqaE+V1A5MUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92723647"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92723647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:55:39 -0700
X-CSE-ConnectionGUID: 4qOsEO3lTwKBFSeRCK93pA==
X-CSE-MsgGUID: QX4X79aFQeyG2ByWEGcfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="242991547"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:55:36 -0700
Date: Wed, 3 Jun 2026 01:55:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ah9fZQ9olJS5qLiL@ashevche-desk.local>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529100838.8896-3-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37849-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ashevche-desk.local:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,intel.com:dkim,intel.com:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31400632BD1

On Fri, May 29, 2026 at 03:38:37PM +0530, Hardik Prakash wrote:
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
> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> 
>   i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> 
> Add a generic dependency check in i2c-designware that walks ACPI child
> devices, identifies any GpioInt resources, resolves the referenced GPIO
> controllers, and defers probe if those controllers are not yet bound.
> 
> This ensures GPIO controllers complete initialization (including IRQ
> setup and quirks) before I2C child enumeration begins, fixing the race
> without device-specific quirks or DMI matching.
> 
> The probe ordering race was confirmed via dynamic debug tracing:
> 
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
> 
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/

These two tags are misused.

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494

...

> +#ifdef CONFIG_ACPI
> +struct gpio_dep_ctx {
> +	struct list_head gpio_controllers;
> +	int ret;
> +};

Useless data type. You can use list_head directly as a context. See below.

> +struct gpio_controller_ref {
> +	struct list_head node;
> +	char *path;

No const?

> +};
> +
> +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> +{
> +	struct gpio_dep_ctx *ctx = data;
> +	struct acpi_resource_gpio *agpio;
> +	struct gpio_controller_ref *ref, *tmp;
> +	bool found = false;

> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
> +		return 1;
> +
> +	agpio = &ares->data.gpio;
> +	if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
> +		return 1;

The idea is not to use the above outside of the (GPIO) core parts.

> +	/* Check if we've already tracked this GPIO controller */
> +	list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
> +		if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +		if (!ref) {
> +			ctx->ret = -ENOMEM;
> +			return 0;
> +		}
> +
> +		ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> +		if (!ref->path) {
> +			kfree(ref);
> +			ctx->ret = -ENOMEM;
> +			return 0;
> +		}
> +
> +		list_add_tail(&ref->node, &ctx->gpio_controllers);
> +	}
> +
> +	return 1;

This is a duplication with gpiolib-acpi-core.c.

> +}
> +
> +static int check_child_gpioint(struct acpi_device *adev, void *data)
> +{
> +	struct gpio_dep_ctx *ctx = data;
> +	struct list_head res_list;
> +
> +	INIT_LIST_HEAD(&res_list);
> +
> +	acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
> +	acpi_dev_free_resource_list(&res_list);

> +	if (ctx->ret < 0)

How do we clear partially filled gpio_controllers list?

> +		return ctx->ret;

Huh?! Use returned value from acpi_dev_get_resources().

> +	return 0;
> +}
> +
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	struct gpio_dep_ctx ctx = { .ret = 0 };

Unneeded assignment, {} will suffice.

> +	struct gpio_controller_ref *ref, *tmp;
> +	int ret = 0;


Split assignment and move it here

	adev = ACPI_COMPANION(...);
> +	if (!adev)
> +		return 0;
> +
> +	INIT_LIST_HEAD(&ctx.gpio_controllers);
> +
> +	/* Walk all child devices and collect GpioInt controller references */
> +	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
> +	if (ret < 0 || ctx.ret < 0) {
> +		ret = ctx.ret ?: ret;
> +		goto cleanup;
> +	}
> +
> +	/* For each GPIO controller, check if its parent device is bound */
> +	list_for_each_entry(ref, &ctx.gpio_controllers, node) {
> +		acpi_handle handle;
> +		acpi_status status;
> +		struct acpi_device *gpio_adev;
> +		struct device *gpio_dev;
> +		bool bound;
> +
> +		status = acpi_get_handle(NULL, ref->path, &handle);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		gpio_adev = acpi_fetch_acpi_dev(handle);
> +		if (!gpio_adev)
> +			continue;

Again, a lot of duplication with gpiolib-acpi-core.c. Please, find a way how to
reuse the code.

> +		gpio_dev = acpi_get_first_physical_node(gpio_adev);
> +		acpi_dev_put(gpio_adev);

> +

Unneeded blank line.

> +		if (!gpio_dev) {
> +			ret = -EPROBE_DEFER;
> +			goto cleanup;
> +		}
> +
> +		/*
> +		 * Check if the GPIO controller's device is bound. If not,
> +		 * defer probe to ensure GPIO initialization (including IRQ
> +		 * setup and quirks) is complete before we enumerate I2C
> +		 * child devices.
> +		 */
> +		scoped_guard(device, gpio_dev) {
> +			bound = device_is_bound(gpio_dev);
> +		}

Redundant parentheses.

> +		if (!bound) {
> +			put_device(gpio_dev);
> +			ret = -EPROBE_DEFER;
> +			goto cleanup;
> +		}
> +
> +		put_device(gpio_dev);
> +	}
> +
> +cleanup:
> +	list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
> +		list_del(&ref->node);
> +		kfree(ref->path);
> +		kfree(ref);
> +	}

Yes, this needs to be present on error path above.

> +	return ret;
> +}
> +#else
> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_ACPI */

-- 
With Best Regards,
Andy Shevchenko



