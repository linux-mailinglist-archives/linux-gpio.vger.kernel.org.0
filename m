Return-Path: <linux-gpio+bounces-35747-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BLQAEAiY8WmbigEAu9opvQ
	(envelope-from <linux-gpio+bounces-35747-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:32:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93048F6E9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA7C3034287
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506CD38B7D4;
	Wed, 29 Apr 2026 05:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ubthj37M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F1154425;
	Wed, 29 Apr 2026 05:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777440771; cv=none; b=HiTsuO7bj9f4BwWsC32GsHKM+MvxfjBXugxZFNGvl9zK5rdXwMN6sYSMsl2Bh1JXhIlNSCFS2YLzgFFHAPBW4479pUTsFMtS/jinoKToEfcWRfpG3kDCgoSohNIAQzuqT95BwUCIZsgK13qtIR7Np2pnk6+YB2z24FavfNr63QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777440771; c=relaxed/simple;
	bh=imCpF8OHGJq9FBotlmnXuxwdACVRuU6SJcf5BFUg3EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Of8p9bc809vxVY9i6WH/NPFWodwkaPdZvopW76w2fFQU4v063Q+nTgy/JvpUeONZKyN+EYSpu2knMPo3GzHVb7cTJ1EeWl5wU5Pnn1NNUvhfWjKon2X6Cc42K2+znIrW6vq2Yt4o8t0smcJMZZoj2xBv9A9yovnubNkPdwWWNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ubthj37M; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777440769; x=1808976769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=imCpF8OHGJq9FBotlmnXuxwdACVRuU6SJcf5BFUg3EU=;
  b=Ubthj37MaQeyqNJfLrHv/mBSXFj0aIHiTLGvSvAvlKScStNkc0pOyz/1
   QHw8oDPhOp3bnF2PUIqBc4ZA+cFwQ1HaR/rkwbH8g0mLgVOHCCT8ipN1j
   dVi6HvauGvyuMh3PHtPW3Wgc03RIWEKJnr+/oENqcSxsZ26xxwVuo3S8c
   AHWOEqX+EIjPo2dmZ/MVJito5YReO0Sr50vt5Mqr9adOcHsgHCzvgmW2u
   vIJCF2gVi5+XK+dq0Ufx2A6Jw55fQVK3GEqv3Ctd1YoGDb4StK2HWcQ2z
   zkH6GO0cIHIZ4NeZDvmmOBKRwtiWTp6YrOm7YGW9gjR4MJnn1/xWDrMhW
   g==;
X-CSE-ConnectionGUID: Vh2oKDQuQzCLRBQ5Wqeclg==
X-CSE-MsgGUID: W60KA3K5RTK6eKwMjX/vDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77391560"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="77391560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 22:32:49 -0700
X-CSE-ConnectionGUID: 0RIj5XjQR6ub5LAWUwa3gA==
X-CSE-MsgGUID: QD7Xf7pDQcmxrwfQiRL98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="257479037"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 28 Apr 2026 22:32:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7142895; Wed, 29 Apr 2026 07:32:11 +0200 (CEST)
Date: Wed, 29 Apr 2026 07:32:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: westeri@kernel.org, andriy.shevchenko@linux.intel.com,
	linusw@kernel.org, brgl@kernel.org, bentiss@kernel.org,
	hansg@kernel.org,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Marco Scardovi <mscardovi95@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
Message-ID: <20260429053211.GA557136@black.igk.intel.com>
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429025247.1372984-1-mario.limonciello@amd.com>
X-Rspamd-Queue-Id: 7D93048F6E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,protonmail.com,gmail.com,gmx.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35747-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gmx.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,black.igk.intel.com:mid,protonmail.com:email,intel.com:dkim,intel.com:email]

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
> 
> Reported-by: Francesco Lauritano <francesco.lauritano1@protonmail.com>
> Closes: https://lore.kernel.org/all/6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com/
> Tested-by: Marco Scardovi <mscardovi95@gmail.com>
> Fixes: ca876c7483b69 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
> Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

