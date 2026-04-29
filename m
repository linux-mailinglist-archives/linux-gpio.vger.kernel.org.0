Return-Path: <linux-gpio+bounces-35756-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE3PLwiy8WmwjgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35756-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:23:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E949067A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD04A303746B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BEC3A453A;
	Wed, 29 Apr 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Klnvo1KJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F25191F91;
	Wed, 29 Apr 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447194; cv=none; b=NzilS1IPgf27k/4/1KbfnWuBdjzsohHde7HqthM1+U47kqNSxkPEnUZjlk0HUveJYJUtLQq+jycPyXfeOI+qJ0HLIupLuRc/gRWKPpOf6GvwQHdXk5VEYVINPbDTngUGykWzleWDHn22Wr6oJNMofsQYFO1WC1d9nVPj6P6MvS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447194; c=relaxed/simple;
	bh=MGGuJ836ozO0L7P2t7NyxjOwrd4vHvDWNMWMYI7mNn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxEmBaUt+pB5atnX/zc8Rysoh0Zf9msTQm1L8JjmNSuz7PBJgPof1HQ0QykRxz0EklaFcBws8HRI94MbEdNidL74DiaIqAFZ2TWS2ypo6vRQTiITmeZFyPqsLWod8C/r5FrqmJCnBitC0XFgaeJ3akG8EvY8jIECq+5rw/PXqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Klnvo1KJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777447194; x=1808983194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGGuJ836ozO0L7P2t7NyxjOwrd4vHvDWNMWMYI7mNn4=;
  b=Klnvo1KJs1WrP1kUaDeox57P13ByQX4iIlqioma3bMeMbH4u1e7+Suf6
   WZ4+zzBtit8OLKEk45Jv1dduGPyEiL2abB67SYVbyOtXK5PhnXWeRLv82
   ifUAn4W6aPSWlrSDFSQalVOTA4uFFZP0EtJWCxLo9DHBkhXK87pw9IZ/T
   CHhNjDYFzUDMykU74QQEQRKHuBU/IC9tD6oY22j8zmAt9tY+3Djtd3LkY
   C0mhmnyKcqEXg4uF6G4TgbXfKFGjNhiawNG0aoahJTJh+E8EKkf26fVFi
   dKtmssH0mnx20x9G/Bbx3uXQIuCf8B7P3CTMiCZgFU8v6SYCAXCi53D9m
   g==;
X-CSE-ConnectionGUID: py37BOL2Qvqh0eytfwd3yA==
X-CSE-MsgGUID: iQysPTiPQj2qa6GPpD1Ytg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77399789"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="77399789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:19:53 -0700
X-CSE-ConnectionGUID: gfRDYfPuRA+YiYCFgCjWDw==
X-CSE-MsgGUID: 36r9hPD8QT2KgkuMIxdnCg==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:19:50 -0700
Date: Wed, 29 Apr 2026 10:19:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, westeri@kernel.org,
	linusw@kernel.org, brgl@kernel.org, bentiss@kernel.org,
	hansg@kernel.org,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Marco Scardovi <mscardovi95@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
Message-ID: <afGxE1xmeAPFGa2O@ashevche-desk.local>
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
 <20260429053211.GA557136@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429053211.GA557136@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 1E1E949067A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,protonmail.com,gmail.com,gmx.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35756-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email,ashevche-desk.local:mid,protonmail.com:email]

On Wed, Apr 29, 2026 at 07:32:11AM +0200, Mika Westerberg wrote:
> On Tue, Apr 28, 2026 at 09:52:39PM -0500, Mario Limonciello wrote:
> > Commit ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at
> > least once on boot") introduced logic to trigger edge-based GPIO
> > interrupts during initialization to ensure proper initial state setup
> > when firmware doesn't initialize it.
> > 
> > However, according to the Microsoft GPIO documentation, triggering GPIO
> > interrupts during initialization should only happen for interrupts
> > marked as ActiveBoth (both IRQF_TRIGGER_RISING and IRQF_TRIGGER_FALLING)
> > and only when the associated GPIO line is already asserted (logic level
> > low).
> > 
> > The current implementation incorrectly triggers:
> > 1. Any edge-triggered interrupt (RISING-only or FALLING-only)
> > 2. RISING interrupts when value is high and FALLING when value is low
> > 
> > This causes problems at bootup for single-edge interrupts that
> > don't follow the ActiveBoth pattern.
> > 
> > Fix this by:
> > - Only triggering when BOTH rising and falling edges are configured
> > - Only triggering when the GPIO line is asserted (value == 0)
> > 
> > Reported-by: Francesco Lauritano <francesco.lauritano1@protonmail.com>
> > Closes: https://lore.kernel.org/all/6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com/
> > Tested-by: Marco Scardovi <mscardovi95@gmail.com>
> > Fixes: ca876c7483b69 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
> > Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
> > Suggested-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



