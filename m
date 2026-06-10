Return-Path: <linux-gpio+bounces-38266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gg4/JKN6KWpDXgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:54:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4666A734
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CmCLflzT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38266-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38266-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BA7A32ABA7E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 14:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CA73EBF04;
	Wed, 10 Jun 2026 14:37:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE64071EB;
	Wed, 10 Jun 2026 14:37:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102268; cv=none; b=H6y9xe46juWPIjVQJd1UMkBitxACZ9v54jGiVDoEP/IQJdNGzVUbP3nYGqUDFvXp7++UktqoJ4Dw3co+eX7KXPA7PFvs5/KeMQwd8ZEZLgQq4MlSazrKNpAPBrJmC1ZtEST786DtexyUDGjhJFBsIvEc8swytRKUmGIk/PBwSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102268; c=relaxed/simple;
	bh=Z4XxNmskXaOi9LNho2I7ZG2okK/xrJ34GLzPUXJDy1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJq+vuBkltTgyFissRU2pRS/UNATBOP7FMTKVcGpefRC4HRjYZiddmKHrKCDxWDKXnVb+4y9sQDPwMIBJ3+Hy38q3ckgI6oZI145rBzEZjT1wi8Zeis8GkMsvveqB1PQYuQzYMaclhrCX5XExKvUsS9bp7w0q8BEfMzrUi7V5Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmCLflzT; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781102267; x=1812638267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4XxNmskXaOi9LNho2I7ZG2okK/xrJ34GLzPUXJDy1M=;
  b=CmCLflzTlEuKmuxXcE1dUzLsR02ap2VjwLAOo80+9yOZFKMq4eWyfjnm
   rNVd9NTk7Rq00ZZk/gfUtWUvTiwlYjWse0RhY7pFtQ9hU7/DhQLMA4R+U
   nQZZHX3fuIdGBSHmyoCk4JMyJt1Cy/H23xJ3h+9BPB5u1YjNy4/nkg5MH
   9hPszwsBXWTSOernHtlxExhheE9oy9pECaxcDQWz1D5lM637t0IgoSVEs
   BZJSBkcCrDe0DKrCmKZ22JZDoHF6Bitk0J1673XRX3pJZ+3LqdMkqBA70
   8H1EjqS/j15ZHWaUwwHaMU5831XjtZb+tRxC5aL5v1mPH5Q7bicldN5fQ
   Q==;
X-CSE-ConnectionGUID: /FArWZ5HTEOZ/QaKqIbW9A==
X-CSE-MsgGUID: 7TGc9yktQdOJ3gHVZyAIfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81026942"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81026942"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:37:46 -0700
X-CSE-ConnectionGUID: 0CCRzmSZQJu7Yhk90OZbgQ==
X-CSE-MsgGUID: k6+N/vKzQrecMlqg2Wbvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251266514"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:37:44 -0700
Date: Wed, 10 Jun 2026 17:37:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: GaryWang <is0124@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Message-ID: <ail2tWow7VwWRkL_@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
 <20260610142409.GT2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610142409.GT2990@black.igk.intel.com>
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38266-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:is0124@gmail.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bootlin.com,aaeon.eu,aaeon.com.tw,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECE4666A734

On Wed, Jun 10, 2026 at 04:24:09PM +0200, Mika Westerberg wrote:
> On Wed, Jun 10, 2026 at 04:34:23PM +0800, GaryWang wrote:
> > Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
> >  for device id INTC1055.
> 
> Okay we can see that from the code but why? Can you explain it here too?

Yeah, good point. I know the why? because I reviewed the pinctrl-upboard
driver, but unprepared reader doesn't know all the details.

-- 
With Best Regards,
Andy Shevchenko



