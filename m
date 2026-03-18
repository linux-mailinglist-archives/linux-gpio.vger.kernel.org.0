Return-Path: <linux-gpio+bounces-33758-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH0yM8+5umlWawIAu9opvQ
	(envelope-from <linux-gpio+bounces-33758-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:42:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714032BD5F1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 15:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0850308F138
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E423DBD6F;
	Wed, 18 Mar 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl4uH0rv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F53DBD46
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844625; cv=none; b=hVbhkbGTewY6e6Nm5JaNashm97WEN9FSkCQI85NSAuLR7LGsHP4Zh0KoIntVZ0tGCaT/91Lax0cTL9Bu6UzFnlInZnOS1/LxobxIUGVQ/qLD3i/vZm35PpOqesQC7ATBtLiwoYapGTme2rvVqabFuqCh3lYEOgh3otlOIVfRydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844625; c=relaxed/simple;
	bh=nzM5rsog/BPN55jXu8KqFKLiphFyEv9EsonRFYnRiOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnIxVzcqzZPoY6pJAkEyzR5ZogTiJ0bCiiwDoHQwUr5f7ZvV3uQGgKl0aHS8cb4lDhu6GHEOnod/7Izz3MhwwLl3ei3jMsOfjoyOF/FfEXgwefXDFGMDvdR0fSFxe5vKYyrDqgNodkTHT/E50VUzjwUM8I0xfpSAtdtHumpFEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl4uH0rv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773844624; x=1805380624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nzM5rsog/BPN55jXu8KqFKLiphFyEv9EsonRFYnRiOA=;
  b=Hl4uH0rvNhSNcOqfaKLoMC5jn7eDzIvon8ktkuhOF3HjPqgPdDlZMovg
   9+plL4ENpwAFIp8cgg+ZOA2kf2697o4ZVApKVXFxDnUS1h7fONzT3GEWc
   Kdl4U4ZHq40KBbdzaH4+KU0+mOlh2Y5HIfZnExpLO3+WLZeEZ4zGIco2R
   tcL0cXtZK9UBnbg71CpUALtI6e7BxiI/leBoz8bkRMydetPa+j2344rQk
   PnGmnQlDF/gg5zDi/kchlwCNxwcOtGsAE7sHzJlDOZoF0uZ2D2ICBkgDz
   cJf9Ka0VGATtOHNa3Xux0YfGIAXf2xJqxq60vUOdEhnPIWiNNVO1l2a47
   g==;
X-CSE-ConnectionGUID: 0HlYqcBoQnuewM0xFjbRlA==
X-CSE-MsgGUID: dhmnzNC5Q8yTXXvgMzKiNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74930729"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74930729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:37:03 -0700
X-CSE-ConnectionGUID: 7sHXO73sRRO0grbPodVW7Q==
X-CSE-MsgGUID: lp7c8KT+TJKK0cSCNT3hqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="260548428"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.240])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:37:02 -0700
Date: Wed, 18 Mar 2026 16:36:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH] gpio: Add Intel Nova Lake ACPI GPIO events driver
Message-ID: <abq4i4Kt0azQcYtq@ashevche-desk.local>
References: <20260318142418.48574-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318142418.48574-1-alan.borzeszkowski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33758-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 714032BD5F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:24:18PM +0100, Alan Borzeszkowski wrote:
> This driver provides support for new way of handling platform events,
> through the use of GPIO-signaled ACPI events. This mechanism is used on
> Intel client platforms released in 2026 and later, starting with Intel
> Nova Lake.

...

> +static void nvl_gpio_irq_mask_unmask(struct gpio_chip *gc, unsigned long hwirq,
> +				     bool mask)

> +	addr = nvl_gpio_get_byte_addr(priv, GPE_EN_REG_OFFSET(priv->blk_size),
> +				      byte_idx);

These are only two cases where we go a bit further than 80, so I would just
make them a single line each.


...

> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	raw_spin_lock_init(&priv->lock);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!res)
> +		return -ENXIO;
> +	/*
> +	 * GPE block length should be non-negative multiple of two and allow up
> +	 * to 128 pins. ACPI v6.6 section 5.2.9 and 5.6.4.
> +	 */
> +	ioresource_size = resource_size(res);
> +	if (!ioresource_size || ioresource_size % 2 || ioresource_size > 0x20)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid GPE block length, resource: %pR\n",
> +				     res);

There is no point to even allocate memory if the resource is not available or
invalid.

	..._get_resource()
	...validate...
	...map, as we still have local variable for that...

	priv = devm_kzalloc(...);
	...
	_init_lock(...);


> +	regs = devm_ioport_map(dev, res->start, ioresource_size);
> +	if (!regs)
> +		return -ENOMEM;
> +	priv->reg_base = regs;
> +	priv->blk_size = ioresource_size;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, nvl_gpio_irq, IRQF_SHARED,
> +			       dev_name(dev), priv);

I would also go with a single line here:

	ret = devm_request_irq(dev, irq, nvl_gpio_irq, IRQF_SHARED, dev_name(dev), priv);

One Q though, is it indeed shared? Or can it be shared?

> +	if (ret)
> +		return ret;

-- 
With Best Regards,
Andy Shevchenko



