Return-Path: <linux-gpio+bounces-38247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQ+wCX5CKWqhTAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:54:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FCC668782
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Z0rLSJcq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38247-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38247-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB79330E23B4
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30CB3FB05C;
	Wed, 10 Jun 2026 10:48:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C22374A00;
	Wed, 10 Jun 2026 10:48:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088490; cv=none; b=X0rH/aZwVHKA7l/B+keNQmTD47oAuxv7eqKM39lCWOPo0Mz4ryLU+aglLMLh+MkU9lvi4se5LRFyy2Y+OO/v602a44Msn9P2OIs69bRGv+Jwu+cRj1F0nIM5cbZEuP6ao04hJDv9tGerX845WAqjUmkN2eezCHKHuz4f9otgg60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088490; c=relaxed/simple;
	bh=mWiY9VjJPgb0nubsZ0gsX+/ngoAwAIjn6+neW6DgM7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHHVloIyY7V+7XK97G0oydkLvEd6b51uiyCZda3rNSpJlcixswX4WyOpWY5ZMB3FBULEuPTmVTCp+ZRDSLXbRAq99Qi3lSqODUQEGafmPC5PDXHNpS1FmQ0jOXyML//kRtdcvTB9bLqjPHBtSQrQpDEN62RoOqzRb7LP3LNXsuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0rLSJcq; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781088480; x=1812624480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWiY9VjJPgb0nubsZ0gsX+/ngoAwAIjn6+neW6DgM7c=;
  b=Z0rLSJcq7x+Z7PkFSjeLEVncUa8xU74VpLjriYVfuYcQBTKnqanRUR5Q
   PFbC2pVXFG6ZzA7r0WrWocDsfjOovv/QVbEj0y3U+diqV/AMekUCtVtWv
   4ITT8shk3y9t447cGhYXEoSp68uWKyp6b5sz8bCBX6PjE3VHzDtRpvhWB
   QwN3gCTxCb91Fg/aIfV9vGjySxvCF039bvooWXSYdxbV/3w8pW1Lh/BbE
   8uUrKl4lpmPGNMiyaajtLed7ousW8YYcQ2hRPjSulBd3UiQmlmxPvveoE
   B2lozRSFQy6k2zBFm09yzmWwITChcj6sWls2B4FFqYzK5OFQbbBDxh+Zi
   A==;
X-CSE-ConnectionGUID: 5+a72/I3R0Gjice1glb6Lw==
X-CSE-MsgGUID: oK8uCtsXTuKONFzjzLl0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84446667"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84446667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:47:59 -0700
X-CSE-ConnectionGUID: ELYo/XroQqu9tx0aM1i9NQ==
X-CSE-MsgGUID: kWLh+SuGSYuFfDC6ePGTWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246167719"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:47:57 -0700
Date: Wed, 10 Jun 2026 13:47:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
Message-ID: <ailA2izdpOc4nhxN@ashevche-desk.local>
References: <20260610083701.18663-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610083701.18663-1-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38247-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7FCC668782

On Wed, Jun 10, 2026 at 02:07:01PM +0530, Hardik Prakash wrote:
> This reverts commit ef76a3a28c79b628890431aa344af633e892035b.
> 
> The patch causes boot regressions on multiple machines. A NULL pointer
> dereference occurs when agpio->resource_source.string_ptr is NULL (i.e.
> when string_length is 0), and a probe deferral loop causes CPU starvation
> leading to kernel panic on Intel CI machines.
> 
> The patch needs a proper rewrite addressing these issues before resubmission.

Yes, please apply this (whoever is the right maintainer to do so).
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



