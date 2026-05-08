Return-Path: <linux-gpio+bounces-36436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFaJLCWP/WnWfgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 09:22:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43C4F2F17
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 09:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1B1D3012CE4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 07:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4158B37B02A;
	Fri,  8 May 2026 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2UX9Hnk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F387431815D;
	Fri,  8 May 2026 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224877; cv=none; b=OUXw5LjK4LL08eR025XFcLdDbiQDycOVWolNrlJfJQIi5IulGzgtzfWF7gXWGiIqhlGozWHwnPOV6FwfKJxVre/tcdv7eA6V/E80sD69/ykpr5l03FpYLxv1hQZzOH7q/uPEIuAa90KHPEHv65sT1g/XiWotoqzg0Xf6nu//AhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224877; c=relaxed/simple;
	bh=pmsiZCCbehliapzmIuR9X8hlOw8GlijKa9t03p2HSXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkSqiobAZJVm4EVZjZkeh8BAxcUwHq+6CSRKAhrPbBMz8zyzLlLpqHXgI57fOpq0BgwFm0lis/384j2ljPsF5Ha+M2QtcfPd/2Ejd39mgiFMwtVv94W4XwYyn2sQXPVsYIy22/Ks4j6vD/xnfGPYfxy7pkgqhU0U6tij9V6HGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2UX9Hnk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778224875; x=1809760875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pmsiZCCbehliapzmIuR9X8hlOw8GlijKa9t03p2HSXw=;
  b=L2UX9Hnkhfy14efxvOmxnz0MZzUvDIEJcClMONowtEWG+cW5KDQ2vCEK
   fO8jdwR3wbUeA/6Y2THH4EA7oomg0nNrBICTvh9gkaE8vBHZw6AtVTsp/
   h5+Ff4739TqW55lNYGGkB/vMHDb5HubWI6MBLs8kTe14ETS8EiyoQnJyy
   M54sh5K1AXuhuSadPDFv73QHUansuu4ERU71/PPKPZEfRHKwTnHZykgSR
   1T8SyREe8pTnzM0Dc4p6y+HZxMWwqrRaxaJkMe4Z4fk6HW9mXX6h+HtrF
   6a6XGbLM88rNshxw1rWTCoae69NZcom8y3z+0cfvlYKNJuARFnv+XZoWu
   A==;
X-CSE-ConnectionGUID: 2BeaKpsGTIC/xobNTeK+Iw==
X-CSE-MsgGUID: eyaIWhKJTKmjaKuoGMsslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78913173"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78913173"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:21:11 -0700
X-CSE-ConnectionGUID: nccsrATKSTCJ+S5F7z2I1A==
X-CSE-MsgGUID: TiDGtfXQQ/yLf4OIt3QnEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="267072976"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.237])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:21:10 -0700
Date: Fri, 8 May 2026 10:21:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, mathias.nyman@intel.com,
	mika.westerberg@intel.com
Subject: Re: [PATCH v4 0/6] gpio: acpi: modernize resource management using
 cleanup.h
Message-ID: <af2O4wKm01mSCaxr@ashevche-desk.local>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
 <20260508061729.9530-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508061729.9530-1-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4B43C4F2F17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36436-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 08:17:23AM +0200, Marco Scardovi wrote:
> Hi Andy,
> as requested I've added the missing Signed-off-by and related commits' messages.
> Let me know if it's everything alright now.

Note, cover letter is not just for a simple comment like the above, it's mainly
for the overview of the series as a whole, what it doing and why. No need to
resend a series, just try to write down one in a reply to this message.

-- 
With Best Regards,
Andy Shevchenko



