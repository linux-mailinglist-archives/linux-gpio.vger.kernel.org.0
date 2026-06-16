Return-Path: <linux-gpio+bounces-38570-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BIenNbwYMWpLbgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38570-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:34:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FEB68D969
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:34:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=DBEOQ9xD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38570-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38570-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1357E306643F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C235642316F;
	Tue, 16 Jun 2026 09:31:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E0423141;
	Tue, 16 Jun 2026 09:31:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602302; cv=none; b=DvYpLoYqUwmZtYs0u+aTKhW7yM1FZdK0PKQi1x7uYvtj28823YzlpPuWtDB0QkzTyyJnOfs1O+VKI/Hq0CxWy9FIPrWn250T9HbOhQTR0ujpP+ccLvKDDRgSK2jbJX/eYLErtVgaPpK+4ecPLPfz1FrbmSsHhBb25zfAqGwDltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602302; c=relaxed/simple;
	bh=py9/2Zt7xQMpoKBn11UstNzWxI/Y0GlDPMChdS5fpsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AT9yHU/1KPZxw4HyFOcSbZzX1mtOCk71CGFigIfg0D4zXGHMmFU2sUfJj+fRjVeLkv1EpswOVPa3kG/1FPy/qLahPK1hygrEudkNfZkuaRfQpfikiZ4scG2Z1pDka+nubxaD0PJzWtAvqG8kue/S0Y5VcYuUWcUeX1SOAIlI+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBEOQ9xD; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781602301; x=1813138301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=py9/2Zt7xQMpoKBn11UstNzWxI/Y0GlDPMChdS5fpsM=;
  b=DBEOQ9xD3hQVoAsENbAh4L8z+IBtavjph6f59S0h27MPVv+W0IBAzmur
   Qs4E7HhvqcmN6eU6EZ2Jal4tmzERdkNv+GJ5QD0OUrI7zSHjx3mzIvDVJ
   hVbNVXTx15RtTtJguc8bSrzkXsDEIUDHugpd+5OJQrV+SO4P7L6lmM5Gv
   n0g5ttDOpgxXM7vESILirovuVXu+OTAMRWMq6aziT12pe8WPod2n3qM8E
   uu9GbqIte3rkBwAKKrhFy02aK2znK+EdCupb6lGo5dJ8dT8iMxi2NPpuD
   iqRwctRvlMBPyhgyybP6uO+XT3dA52oUbXFEqE0QQp3atvLMYMzAMQana
   Q==;
X-CSE-ConnectionGUID: EyPOgSqAT3mkwYeDRTYr3w==
X-CSE-MsgGUID: h4t8i+q5QbO6gvQhhDPo7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84926607"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="84926607"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:31:36 -0700
X-CSE-ConnectionGUID: oc00Q5OST/+TXJv3J8cyrg==
X-CSE-MsgGUID: berIJJJwRh+0Ez0I+zn04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="246606999"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:31:31 -0700
Date: Tue, 16 Jun 2026 12:31:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Mika Westerberg <westeri@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
Message-ID: <ajEX8L63vAhhndv7@ashevche-desk.local>
References: <20260616090824.5967-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616090824.5967-1-scardracs@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38570-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:westeri@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48FEB68D969

On Tue, Jun 16, 2026 at 11:08:24AM +0200, Marco Scardovi wrote:
> The ASUS ROG Strix G16 G614 series laptops experience a long boot delay of
> approximately 36 seconds. This happens because the system firmware triggers
> a slow/hanging ActiveBoth GPIO interrupt handler at boot time.

'slow'? Did you mean 'low'?

> Even though commit 3bb62e3f99a5 ("gpiolib: acpi: Only trigger ActiveBoth
> interrupts on boot") restricted boot-time execution to ActiveBoth edge
> events, the problematic interrupt on these laptops is configured as
> ActiveBoth. Consequently, the handler is still executed at boot and
> the boot process stalls.
> 
> Fix the delay by adding a DMI quirk to disable edge event execution at
> boot for the ASUS ROG Strix G16 G614 family.

What is this interrupt for? Touchpad?

-- 
With Best Regards,
Andy Shevchenko



