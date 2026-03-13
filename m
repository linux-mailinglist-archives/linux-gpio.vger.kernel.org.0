Return-Path: <linux-gpio+bounces-33335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHFcDFHls2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:22:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C02815E8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16AAA30097C8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C461D390220;
	Fri, 13 Mar 2026 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFBrA5aj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3B2F83A0;
	Fri, 13 Mar 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397318; cv=none; b=Rfm5jQcEgKyETMJp8IbSqegP7NLpOMUvDq09j4dsLPrCcmL3U/oJuKWLiU7gHlkmySc6oiQpc+RUJaTRHzzE2hbMYFTAzMsXRrvTV073ERQh/skRBCR7qa3Usgq6k+GyEpEtABHAFGYGt7HwuyOrQM3YHI2z+sMM83A2i5vYxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397318; c=relaxed/simple;
	bh=bSf5mgo4fzKu290+DHJqXgVlqVghoCVNR65BSnLOUco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHYd71xB5moHgDDk+zFzsCw4l6atHnCo/KLf5B0xVrnkpiS8YAzHdCdmIFEyamcoYzYOYSXluTEwKdJgebKRMy0qx70R/0JjQTv3ybu3paKXiY0CXJDidkBVmJ6F0xkdAxgBk9XnXaEmomWQChJLXhGelaKVHs6SMHsUiqQJlWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFBrA5aj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773397315; x=1804933315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bSf5mgo4fzKu290+DHJqXgVlqVghoCVNR65BSnLOUco=;
  b=gFBrA5aj+zxxL1xEWMFmh+uUhFmEKlAmfgMu1qbiZzh3MadpNPcG1T+V
   4J/x09TLtYU+O3FXc60smQUImerjf9UJsIYBwJpruJzDrKw5z1n/s5nTE
   k33LAhnaMbxwv1UiW0OKilPkkSBcCienBW0JqZlZN7UpaVWPNb1VkNMrZ
   UJBk6W8SsRDQkBszQKfgENLQ6fkfhwQgrTLLfvCs8Lytc0/VzaMmeR9tu
   62uHxb3uzMheeSFcddvBF25d6ef0285JeC7Ef68bxcoCWmg6u3a0Dy3y4
   mFSwYZ5QGtlZne5Q3UoON84tZtiixSx7JxDtioLLZvx78rP26hChcdVSY
   w==;
X-CSE-ConnectionGUID: kKijko6HTU++YEHi7L7Y9Q==
X-CSE-MsgGUID: n6jVvo5LRW2AQv2ke6Y6Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="73689783"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="73689783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:21:54 -0700
X-CSE-ConnectionGUID: rHgYMli2Q/G+Og/kIdnQWA==
X-CSE-MsgGUID: p/fDPkrhSIaIgXKV4KeGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="225577338"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:21:52 -0700
Date: Fri, 13 Mar 2026 12:21:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: timberdale: use device properties
Message-ID: <abPlPQMPZyOL_byn@ashevche-desk.local>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33335-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F6C02815E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:04:49AM +0100, Bartosz Golaszewski wrote:
> The top-level MFD driver now passes the device properties to the GPIO
> cell via the software node. Use generic device property accessors and
> stop using platform data. We can ignore the "ngpios" property here now
> as it will be retrieved internally by GPIO core.

...

> +	err = device_property_read_u32(dev, "intel,gpio-base", &gc->base);

In drivers/mfd/intel_quark_i2c_gpio.c we use 'gpio-base' and I prefer to have
it common since it's Linux only property for now. Alternatively patch that to
have a snps prefix.

> +	if (err)
> +		return err;

...

>  	err = devm_gpiochip_add_data(&pdev->dev, gc, tgpio);
>  	if (err)
>  		return err;
>  
> +	if (gc->ngpio > 32)
> +		return dev_err_probe(dev, -EINVAL, "Invalid number of pins\n");
> +
>  	/* make sure to disable interrupts */
>  	iowrite32(0x0, tgpio->membase + TGPIO_IER);
>  
>  	if (irq < 0 || tgpio->irq_base <= 0)
>  		return 0;
>  
> -	for (i = 0; i < pdata->nr_pins; i++) {
> +	for (i = 0; i < gc->ngpio; i++) {
>  		irq_set_chip_and_handler(tgpio->irq_base + i,
>  			&timbgpio_irqchip, handle_simple_irq);
>  		irq_set_chip_data(tgpio->irq_base + i, tgpio);

Shouldn't this be done in the respective callbacks before the
devm_gpiochip_add_data() finishes? (Yes, it's not related to this
patch, but it is related to seems racy driver initialisation.

-- 
With Best Regards,
Andy Shevchenko



