Return-Path: <linux-gpio+bounces-40134-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qL3MG/+XV2qAXgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40134-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 16:23:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8775F549
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 16:23:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZL82Kqs+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40134-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40134-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5323302B264
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B9326ED41;
	Wed, 15 Jul 2026 14:17:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181A26B973;
	Wed, 15 Jul 2026 14:17:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125049; cv=none; b=GhhVd3c4L/ypZRqTcu9ahAwVngtW8duaVqDnrL3zpTLdww/KOkTnKfNjnFpWXo3MrMJDXYlhDlkUzQBlR0ho1bjva4lPaLVth/6hy+3jpCSd0DEIsN5t+2nJR1Y6VVofxqJTU3wFcxsB0uOJz+EQTgNm2sfZmWQUmgcGANiXARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125049; c=relaxed/simple;
	bh=fL2wfT+ghqhICEnQ6RMsEdgNFeLZvAv5d9buzwKr6+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ni2DjU1F3nxjQaUrEyh5Sh7VW/FggTK9xsLLMC04i9Rjwju9mLLQ6ku9Rp+W2PHUxV+RPekbYQOH5UptZMoAyfCp4YvpmDUYSktV/FoOrLr6xsHNuTRza/g+2ZeqEA0o5CjLRLkOF7G6GNGx3yNSJiT9LBTgyXisudLFZipX9VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZL82Kqs+; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784125048; x=1815661048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fL2wfT+ghqhICEnQ6RMsEdgNFeLZvAv5d9buzwKr6+E=;
  b=ZL82Kqs+D8U9O49cJYv6agT9c4E6rvmY6Wk4TmO6U2N8lHqmVGMJHhvT
   BlyhBiWCy9bDbEtd2KpyW1XgngKwoG9yuLLNfl9v01+BEUptVpn1uU396
   kcwWPnOGnXri8kFPpyknVUBo0iBP0KVSgU563pmnq+C9qGp8Ew8wx1HHx
   rAuiXdg2cXt5qoohn2XzqHQcZF7ll/Bpfo6fAVVkvONXH3QMRN38Q2A+e
   MBfgMkK9SrQCRJwJAGubmeRNg1kJaaXJURzzpfm2lMlNjHOGbg2PU8frX
   /zC0zvQbHo0nKH8OU8qPs0VQvOHA3QOCxONxEZbXVByv5I2rzk5dk2GU5
   A==;
X-CSE-ConnectionGUID: K1zZPmF6RdK2OToiEWCSgQ==
X-CSE-MsgGUID: s4g/snWYSFGTxsJCThAgig==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83884874"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="83884874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:17:27 -0700
X-CSE-ConnectionGUID: 81exf8WRQ+myglM8I48Rpg==
X-CSE-MsgGUID: nkJYvAFMQKyforB6yhzHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="256240280"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:17:25 -0700
Date: Wed, 15 Jul 2026 17:17:22 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v11] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <aleWco-IEiXdOZkp@ashevche-desk.local>
References: <20260715114701.7713-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715114701.7713-1-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40134-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07C8775F549
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 05:17:01PM +0530, Hardik Prakash wrote:
> I2C controllers may have child devices with GpioInt resources that
> depend on GPIO controllers being fully initialized. If the I2C
> controller probes and enumerates children before the referenced GPIO
> controller has completed probe, GPIO interrupts may not be properly
> configured, leading to device failures.
> 
> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> fail with lost arbitration errors:
> 
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
> 
> Add a dependency check that walks ACPI child devices and defers probe
> until any referenced GPIO controller is bound.

...

> v10 -> v11:
> - Replaced custom gpio_controller_ref list with gpio_device_find_by_fwnode(),
>   as suggested by Andy, dropping the linked list and dedup logic (~60 lines)
> - Moved resource-skip explanation from commit message into a code comment
> - Fixed device_is_bound() to check gpio_device_to_device(gdev)->parent
>   rather than the gpio_device's own internal class device, which never
>   has a driver bound to it

Thanks for an update, looks much better!

My comments below. I think v12 will be final if you address everything as
suggested and answer to the Bart's request.

...

> +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> +{

> +	struct gpio_device *gdev __free(gpio_device_put) = NULL;

This style is discouraged. Please, move this below.

> +	struct acpi_resource_gpio *agpio;
> +	struct acpi_device *gpio_adev;
> +	struct device *gpio_dev;
> +	acpi_handle handle;
> +
> +	if (!acpi_gpio_get_irq_resource(ares, &agpio))
> +		return 1; /* not a GpioInt resource, skip */
> +
> +	if (!agpio->resource_source.string_length)
> +		return 1; /* no named controller, skip */

> +	if (ACPI_FAILURE(acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle)))
> +		return 1;

Can be rewritten as

	acpi_status status;
	...

	status = acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle);
	if (ACPI_FAILURE(status))
		return 1;

> +	gpio_adev = acpi_fetch_acpi_dev(handle);
> +	if (!gpio_adev)
> +		return 1;
> +
> +	gdev = gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));

	struct gpio_device *gdev __free(gpio_device_put) =
		gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));

> +	if (!gdev)
> +		return -EPROBE_DEFER; /* controller not registered yet: abort walk */
> +
> +	gpio_dev = gpio_device_to_device(gdev)->parent;

> +	scoped_guard(device, gpio_dev) {

Can we use simple guard()() here?

> +		if (!device_is_bound(gpio_dev))
> +			return -EPROBE_DEFER; /* controller not bound yet: abort walk */
> +	}
> +
> +	return 1; /* bound, skip adding to resource list, continue walk */
> +}

...

> +static int check_child_gpioint(struct acpi_device *adev, void *data)
> +{
> +	struct list_head res_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&res_list);

Instead just define with LIST_HEAD() macro.

	LIST_HEAD(res_list);
	int ret;

> +	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);

> +	acpi_dev_free_resource_list(&res_list);
> +
> +	/*
> +	 * ret is a nonnegative resource count on success, which must not
> +	 * be mistaken for a nonzero "stop iteration" signal by
> +	 * acpi_dev_for_each_child(); only forward genuine errors.
> +	 */
> +	return ret < 0 ? ret : 0;

Check for errors when it's required. I believe you fixed it at some point
and now it's again old version. Please, reduce full rely on AI, it's not
helpful sometimes.

	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
	if (ret < 0)
		return ret;
	...
	return 0;

> +}

...

> +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);

This style is discouraged as it brings an unneeded burden on a maintenance.

> +	if (!adev)
> +		return 0;

	struct acpi_device *adev;

	adev = ACPI_COMPANION(dev);
	if (!adev)
		return 0;

> +	return acpi_dev_for_each_child(adev, check_child_gpioint, NULL);
> +}

-- 
With Best Regards,
Andy Shevchenko



