Return-Path: <linux-gpio+bounces-40056-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /JfrEXIvVmr60wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40056-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 14:45:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A75ED754B2F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 14:45:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lg5iMJG2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40056-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40056-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C1DA306F217
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 12:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E313449ECA;
	Tue, 14 Jul 2026 12:36:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077444A71E;
	Tue, 14 Jul 2026 12:36:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032617; cv=none; b=TF1xwg3hV8kekkZtvqZArh4PuflG8Jgef6MM8mMxMgZU22uSRBPNVQCcuykAvQPj98UAJOpbwULBeO55vBmDJv6mLwBj2khCoZVeMPPFQ5ol4XNBVELxNjFoP6wiA2zFu56LWWZ6aErSoUVhMZwQvK542ZvmwgeuCoDtqZBUTmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032617; c=relaxed/simple;
	bh=Fd5fmNyY2d1uD11LLJjRX4lxE0AYCcbFlBG5ZBbkn/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCdvnbv03OYvj6m9X/lbs3bECQOueGTCoM8LpZcihQvFPcZVhcBbtx+nGML9NrBeGKic7l9DKx0/tNnHO7UnfrNxNnNqP8WdFh33I67mLkEPu5FrxXS8mB1sA2NdgvehSYOgn8PP35uVv938M6esQyPtH8kxwECHwLVcT8htdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lg5iMJG2; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784032613; x=1815568613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fd5fmNyY2d1uD11LLJjRX4lxE0AYCcbFlBG5ZBbkn/I=;
  b=lg5iMJG2vPOGqBgqJWJwpYYy+WgNKK2ytxt7/c6QZT+pRNlvnyEW3yox
   d3p/dFzJaE2CCCDlnxw/VNF77qNWYew9ZuvtFhXX5knLhxraScB8FVQBB
   BcU8Q1U22+wrJerjKTqdYzAMbMV87MO6yxnGxxICUeAHV2xs8hpgbuxc8
   EnjWPo83d92b3eXGcVbmRLbBsoNwdsQVzE33qe+hz28Bq0sHy4EChF2vx
   Tw0I5KnK6SWzo2OrZfRY69W8jGHFuM5q7u0ZOeVNFTCG+ZZNFMBMrQ9Hx
   8/jRU2Lv4LxSzYENjlTvSVlmJdyNfeGVOkd4NmPTvqCFlVavlbEzIrGET
   Q==;
X-CSE-ConnectionGUID: 26OEFeEfRS6zbkubzqwHfg==
X-CSE-MsgGUID: RgKc22cvRnOQXDOWsKmeXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88473913"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="88473913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 05:36:51 -0700
X-CSE-ConnectionGUID: ruQUspqVQ4CTdcpl0+sJ+w==
X-CSE-MsgGUID: ENlMAvR0T/6ropGLZt8U5w==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 05:36:48 -0700
Date: Tue, 14 Jul 2026 15:36:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v10] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <alYtXlHSbjNnQosZ@ashevche-desk.local>
References: <20260701101218.42529-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701101218.42529-1-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40056-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A75ED754B2F

On Wed, Jul 01, 2026 at 03:42:18PM +0530, Hardik Prakash wrote:

Sorry, it took a bit of a time. I was wondering about something
(see below) and then got distracted and then forgot about this.

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

This paragraph can be deducted from the code, you can move it to the comments
block. No need to explain in the commit message how code works in details.

> The probe ordering race was confirmed via dynamic debug tracing:
> 
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration

...


> +struct gpio_controller_ref {
> +	struct list_head node;
> +	const char *path;
> +};

So, the list of the controllers in the system is already tracked in the GPIOLIB.
I'm wondering if we may reuse that one instead of creating our own. We gave in
particular gpio_device_find() API. There are also wrappers _find_by_*().

-- 
With Best Regards,
Andy Shevchenko



