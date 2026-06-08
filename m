Return-Path: <linux-gpio+bounces-38064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kYcuNuZgJmqWVgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 08:27:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC26531F8
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 08:27:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="XK/ugaTT";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38064-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38064-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BD5D3022DFD
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 06:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA15386C20;
	Mon,  8 Jun 2026 06:26:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A502E718F
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 06:26:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899994; cv=none; b=Yu8ql9u2QYmWbPf4pxap6l8ju8uUrPX6NVIcKvLyu28h4OBcjuEdrbp4zxCZV8pnif44vMpXM3uEBtjfzJofwZCQ8t+766VBebYZZ8CXEYpiheGMCRC4igOdDtsfo62W384iATj7+vpbPRj8J5lNR7WPdqhs98lrqgf1Rq+uVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899994; c=relaxed/simple;
	bh=2+V9mN677mBIEM6fBLbPRMInenldRG29PNzJcoNX2Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q36DFGPohL6oyV77RnISeetCwO+0Bcc2jLWn1MbtDgvV74zHLBYqxCLq8Ca2VxacX93mAarBnyiugxRhGinQUzW3WIHDSDbzWy4q8jpCIguBSj70jUzzVa8eJugNuxRKOMfhKSQwc+nHlZANaEFsZeqkNIrFJc4By2mWZEbKQHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XK/ugaTT; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780899993; x=1812435993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+V9mN677mBIEM6fBLbPRMInenldRG29PNzJcoNX2Wk=;
  b=XK/ugaTTh3Thaz5sesZk/nPM7rjQJ83aJL56VQzFxoAqDCw8ze7Herfd
   idzD4Wc1EF5lASTqj72ftRgdhCl2Dljj294vDQBKS/Wo+85gwHD9xPuzA
   ExFrThnP3lxwFiI5uCBpKkkczvAG8/5jW/vu6e2LjLkjz81l9++VOBmXc
   gdYvftf/juuNxyCBz8Wpck7/vbEVCFHopF0zufysW2Rarx9O0vBCV52PN
   keM2UhuECOKpjHjZjaSKvJbGxiq8SdJcVtjszOgIF8IIMykR9FR7qbbnQ
   rIFBphy8YI71wfxlhvnk3MpR6g3Nm0dfOqHsoiufPhqKdZRARz8rkC8f9
   Q==;
X-CSE-ConnectionGUID: QsMMAiMARQWSdeYZm8NZcg==
X-CSE-MsgGUID: wZe5CKryTQOfixXdHcbUgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81539016"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81539016"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 23:26:33 -0700
X-CSE-ConnectionGUID: hpvW436VRcyZrA0M2iXsFg==
X-CSE-MsgGUID: DDvq1EQ9Qg2+V14YtdZxCg==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 23:26:31 -0700
Date: Mon, 8 Jun 2026 09:26:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [GIT PULL] intel-gpio for 7.1-1
Message-ID: <aiZglQb9hQwNeApB@ashevche-desk.local>
References: <af18zdP5HF3_P9Vo@black.igk.intel.com>
 <agOJ0LrqDSbhHPi0@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agOJ0LrqDSbhHPi0@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-38064-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:andy@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3FC26531F8

On Tue, May 12, 2026 at 11:13:04PM +0300, Andy Shevchenko wrote:
> On Fri, May 08, 2026 at 08:03:57AM +0200, Andy Shevchenko wrote:
> > Hi Linux GPIO  maintainers,
> > 
> > A single fix for ACPI interrupts handling on boot. Have been in Linux Next for
> > a while without reported regressions. Please, pull for the current, v7.1 cycle.
> 
> Bart, any issues with this PR?

What's going on with this PR, please?

-- 
With Best Regards,
Andy Shevchenko



