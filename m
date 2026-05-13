Return-Path: <linux-gpio+bounces-36775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M9rNRq3BGplNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:38:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679E538260
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98BBC310DBB2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1314C9575;
	Wed, 13 May 2026 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jzf0SyiO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8864A13A1;
	Wed, 13 May 2026 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692353; cv=none; b=k5uG7w6drsqeglYhUIVlXYVXJzJIRS4SbIQxEF6w8pLLsM7V2Sbf55a7gQZAhKZ4zXkToNxZuqprbwihCCSJNocJH22NPPOH74frJ4Hux5IB9i82biXNPX8owy7QUuovUs/VOfIBWZhzRpr0FOmdfDd/72Oit9JjszaSYwSHUIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692353; c=relaxed/simple;
	bh=BPmxAJY3nmPnm6AOjPjute7ZvmM/IzzUrm+6f0TF72E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKHQDf6W09U34zLQgw0X7Kixr3rfeTnI9Zjw9Ov7uclOoLxm93K+OWDZ+x3RqB4bwvUddh4DNmWB9nL6WPx4RCLLCRkQmb6ChqTLJ7qWesm1i58oRW36IURMmGJmIjQo7oY4vh0XTpdKvtPGdya5rR8wEboJ3g7uByb8knWMuZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jzf0SyiO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778692350; x=1810228350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BPmxAJY3nmPnm6AOjPjute7ZvmM/IzzUrm+6f0TF72E=;
  b=Jzf0SyiO1dsTzMeq196GkJbMVARVzg+6yq4sZNrIRA0XBT/mqJ2LQsVg
   5G/o3d7ITQliVIXSv0LqBg2cc0aiVVoMwgjVS6tt6DZame1w4LsxioEL9
   /mH/N5lA/cV9LIFB0eIAbCZM5pGyl7GyhIiCvTP4s6bDkwVBrpKHu+9zu
   LNyPdPpK5c3U+dq9AbT9Acn0uR9gP/UdUzHkwDdEGBu6ZgURbtKRi1zyC
   uvQWsix85bjmClFvVbZ7RTvdavCKWfE+X0GQDejOYePiLU0M3cyHQCoY0
   szQct0HzqhDk1VcwRiczsCfaJmeGepU4Fbj22/u7wIO+OeEaNRRz69qMY
   w==;
X-CSE-ConnectionGUID: 1aQ2ZHRjSxW5//r77IX2xg==
X-CSE-MsgGUID: OXVn5DfdQrGrTPKqnnN11A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67158326"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="67158326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:12:29 -0700
X-CSE-ConnectionGUID: PcEa5HjPS/a4eDqts8bHkQ==
X-CSE-MsgGUID: +5F6s7z9SE+5TbaVj0QX5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261646587"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:12:27 -0700
Date: Wed, 13 May 2026 20:12:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linus.walleij@linaro.org, wsa@kernel.org
Subject: Re: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on
 Lenovo Yoga 7 14AGP11
Message-ID: <agSw-Y_jjliO1gaE@ashevche-desk.local>
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
 <20260513061338.9348-3-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513061338.9348-3-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4679E538260
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36775-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,kernel.org];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

Please, Cc AMD people on the AMD related stuff.
+Cc: Mario

+Cc: Bart
(the GPIO enumeration and checks, smells like it might be done differently).

On Wed, May 13, 2026 at 11:43:38AM +0530, Hardik Prakash wrote:
> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen fails with
> lost arbitration errors on AMDI0010:02 at boot. The root cause is a
> probe ordering issue: i2c_designware probes AMDI0010:02 before
> pinctrl-amd has finished initialising, so the GPIO 157 interrupt
> needed by the touchscreen is not yet enabled.
> 
> Add a DMI-matched deferral in dw_i2c_plat_probe() that uses
> device_is_bound() under device_lock() to correctly wait until
> pinctrl-amd's probe has fully completed. Use acpi_dev_get_first_match_dev()
> for robust HID/UID-based GPIO controller lookup instead of string
> name matching.

...

> +static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(device);

Split hard-to-maintain definition and assignment that's going to be validated.

> +	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
> +		return false;
> +	if (!adev)
> +		return false;

	struct acpi_device *adev;

	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
		return false;

	adev = ACPI_COMPANION(device);
	if (!adev)
		return false;

> +	return acpi_dev_hid_uid_match(adev, "AMDI0010", "2");
> +}

...

> +static int dw_i2c_defer_for_amd_gpio(struct device *device)
> +{
> +	struct acpi_device *gpio_adev;
> +	struct device *gpio_dev;
> +
> +	if (!dw_i2c_needs_amd_gpio_dep(device))
> +		return 0;
> +
> +	/*
> +	 * Find the AMD GPIO controller by HID/UID and get its physical
> +	 * platform device. We need the platform device (not the ACPI device)
> +	 * because that is what gets bound by the amd_gpio driver.
> +	 */
> +	gpio_adev = acpi_dev_get_first_match_dev("AMDI0030", "0", -1);
> +	if (!gpio_adev)
> +		return -EPROBE_DEFER;

Hmm... This is interesting case, smells like something similar to what we had
with x86 Android quirk driver. Cc'ed to Bart to briefly look at this.

> +	gpio_dev = acpi_get_first_physical_node(gpio_adev);
> +	acpi_dev_put(gpio_adev);
> +	if (!gpio_dev)
> +		return -EPROBE_DEFER;
> +
> +	/*
> +	 * Check that amd_gpio probe has fully completed, not just that the
> +	 * driver pointer is set. The driver pointer is assigned before probe
> +	 * finishes, so checking it would allow i2c_designware to probe before
> +	 * the GPIO IRQ quirk in amd_gpio_probe() has run.
> +	 */
> +	device_lock(gpio_dev);
> +	if (!device_is_bound(gpio_dev)) {
> +		device_unlock(gpio_dev);
> +		return -EPROBE_DEFER;
> +	}
> +	device_unlock(gpio_dev);
> +
> +	/*
> +	 * Create a device link so the driver core enforces probe/remove
> +	 * ordering between this I2C controller and the GPIO controller.
> +	 */
> +	if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSUMER))
> +		dev_warn(device, "failed to add device link to %s\n",
> +			 dev_name(gpio_dev));
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



