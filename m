Return-Path: <linux-gpio+bounces-35754-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KIZIE2w8WkRjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35754-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:16:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E7490514
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0078730AD2ED
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC753A380F;
	Wed, 29 Apr 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kISnpD83"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959139D6DB;
	Wed, 29 Apr 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446602; cv=none; b=C6x26nWunZ3Ej2jbHwiZmiejWnSUmAbaP6lY8qqUm3hYgzaHkjvErkb7i98IW5JXEgPbXyG36T6LGGGPujnnPOnH4BUWDBQ3bDQphGVkjT6By6qQM2+FKNIEw07DUczP00y3dBzbh+gYFGtUsiy6mKzdIBmHnuy8QjmwIlR/SQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446602; c=relaxed/simple;
	bh=4Zy0uAMx48BrgJFZV9aSEkf8HlXY7+fqMe6l8NPxS0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIemqhATRQapu/q5WWvjbXsUN/TOKkTgpWBCpSXf0Zx8MvZoDeUrlcstqpR3NrcllLzdJaADVv6Gy9ADsgNMqvleKz9mZYIk2uFYl+jW720aGJqnqrnZiezvKhwJ+bGm4VPthn4I+98/2qssbx4BWCZBgMictMCcX4j0nAyEjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kISnpD83; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777446601; x=1808982601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Zy0uAMx48BrgJFZV9aSEkf8HlXY7+fqMe6l8NPxS0c=;
  b=kISnpD83JAnq6qIGq3LCIUZiEWHgfMHxcRVXPTI8QKLSiY43Rd9w55Yv
   ntCP+oI6NZmBZnI3HiC+am4TLXFGjG0j9M9CGB3KUH8vSocDURyf50rz6
   YvgluPM6Wfj2U78UbynAaAPaF5mScg/EmOrFlAXZ9v61+n4IpnnL7wQQ4
   nOIJXQbaNMujbLBhFs5lLIUv/+ho/lq4l7xr41UsUZfFpCpg6EhhiCFzm
   vK4IAI0DENsw6DoXZIksk5xj57VKoTI3jRqe0KBUG6HMDr/ON9QzXXJFV
   YxKUQYLvt61usapTuzVDlQi5ATPSzb22fbPPtS5SSEPx33onO+8gVkbU7
   g==;
X-CSE-ConnectionGUID: Jgwxn9fWRk+mz2EgPKvMIg==
X-CSE-MsgGUID: GsxxrYFcTTakRPLXlJn8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="101030814"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="101030814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:10:00 -0700
X-CSE-ConnectionGUID: DQYx6t+QR3SDFVd1q3NErQ==
X-CSE-MsgGUID: G/VvZE3LTr+stC8gBLUahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="257739654"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:09:57 -0700
Date: Wed, 29 Apr 2026 10:09:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: westeri@kernel.org, linusw@kernel.org, brgl@kernel.org,
	bentiss@kernel.org, hansg@kernel.org,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Marco Scardovi <mscardovi95@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
Message-ID: <afGuw9VbvnGTQW0F@ashevche-desk.local>
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429025247.1372984-1-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 3B5E7490514
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,gmail.com,gmx.de,linux.intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35754-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 09:52:39PM -0500, Mario Limonciello wrote:
> Commit ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at
> least once on boot") introduced logic to trigger edge-based GPIO
> interrupts during initialization to ensure proper initial state setup
> when firmware doesn't initialize it.
> 
> However, according to the Microsoft GPIO documentation, triggering GPIO
> interrupts during initialization should only happen for interrupts
> marked as ActiveBoth (both IRQF_TRIGGER_RISING and IRQF_TRIGGER_FALLING)
> and only when the associated GPIO line is already asserted (logic level
> low).
> 
> The current implementation incorrectly triggers:
> 1. Any edge-triggered interrupt (RISING-only or FALLING-only)
> 2. RISING interrupts when value is high and FALLING when value is low
> 
> This causes problems at bootup for single-edge interrupts that
> don't follow the ActiveBoth pattern.
> 
> Fix this by:
> - Only triggering when BOTH rising and falling edges are configured
> - Only triggering when the GPIO line is asserted (value == 0)

Good catch!

...

>  	if (acpi_gpio_need_run_edge_events_on_boot() &&
> -	    (event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
> +	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
> +	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {

Use _MASK in both cases.

	    ((event->irqflags & IRQF_TRIGGER_MASK) == IRQF_TRIGGER_MASK)) {

>  		value = gpiod_get_raw_value_cansleep(event->desc);
> -		if (((event->irqflags & IRQF_TRIGGER_RISING) && value == 1) ||
> -		    ((event->irqflags & IRQF_TRIGGER_FALLING) && value == 0))
> +		if (value == 0)
>  			event->handler(event->irq, event);
>  	}

-- 
With Best Regards,
Andy Shevchenko



