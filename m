Return-Path: <linux-gpio+bounces-38624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QqLUNnFVMmoUywUAu9opvQ
	(envelope-from <linux-gpio+bounces-38624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:06:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E77436976BD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FgsZesvH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38624-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38624-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D796A30302EA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 08:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818A93CCA12;
	Wed, 17 Jun 2026 08:03:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D33C457F;
	Wed, 17 Jun 2026 08:03:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683428; cv=none; b=OGFSg8PXlio11MCUm1E7VN5HAuj1Djph960mnD0ndQ/YpBwhq+8MR6HApEX32sLvHLOaMejaDKWYNtjuaUUPVBWDlMfekZRPkM8mIoR9HisM7wBX2rmXKZpdp3wXNcCeVg21fms6cKONI4Ay16JKId3Dp/cAWDnNlCqFTEWmmu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683428; c=relaxed/simple;
	bh=vkSrybrCoC1Z0/p1hE/ulrX6YN5Qyk2X83JaMtVXhkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsODyQjFz7Y9oSVOBeQh5v/XE6JjHJmgKetuu1J79udUY38XY51e+m+q5QmtjcdVBYu9PyVDdxSHHH2k2ah4Q+U4TbWnLGYDTkzLD2kxQ79VjhRyxJPmb23zNPHbN3P3nnkOkow0BbOCvqPG7DcLU5PYvmTLVF2k1xLBefVePWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgsZesvH; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781683426; x=1813219426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vkSrybrCoC1Z0/p1hE/ulrX6YN5Qyk2X83JaMtVXhkw=;
  b=FgsZesvHkHiLHgA4C+lNnv/OHM7BuYpx9Zhxk+A5+uT1aEO4Oy3FQUth
   nOXHKfRuzlwwHwTUIgzMmZeCyt3mQ1h8aXczEZswPXe+Rw2Hv22tQABQs
   cLX9r3qkeWoZ/an4fbL4Jl6SIlgiMIUyPeMdzJk27g7yGYoEadeNGUqFR
   Y3whU8bXPY0PgtAGAm3owxzlatDvpSaQ33xuSZWa/Apq/Yg8SGsHdWuKg
   KXdVL2FTfG4SMCNvHAh7Z91OqnbRTCLeAUuzFVx9FFD5wrifEUiQM59JV
   QGV6blI71URSWXx5fdhqSzRIIZlov9+n+b1cHikXvg50r9X+5P+EvHuY4
   A==;
X-CSE-ConnectionGUID: atUI8WNjTfiTVQ9fx4Mm5w==
X-CSE-MsgGUID: eYxWCnvCSiCEVbnmnKKu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92822363"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="92822363"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:03:45 -0700
X-CSE-ConnectionGUID: IztUAf3ZTaeNfkOUnUrTTA==
X-CSE-MsgGUID: WBWjpcbaQryBKOfXsy8wiQ==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:03:42 -0700
Date: Wed, 17 Jun 2026 11:03:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v9 0/2] i2c: designware: fix WACF2200 touchscreen probe
 ordering
Message-ID: <ajJU2wnx5wS7zmJh@ashevche-desk.local>
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617065922.26004-1-hardikprakash.official@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38624-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E77436976BD

On Wed, Jun 17, 2026 at 12:29:20PM +0530, Hardik Prakash wrote:
> Patch 1 reverts the broken v8 patch 2/2 which caused boot regressions
> (NULL pointer dereference and probe deferral loop leading to CPU
> starvation). Patch 2 is a corrected resubmission addressing all issues.

When preparing patches, use existing tools. This series was half received by me
as the second patch has incomplete Cc list. You may use `b4` tool (check in
your Linux distro) or my "smart" script [1] which I use on a daily basis.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



