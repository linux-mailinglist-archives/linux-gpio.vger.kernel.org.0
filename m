Return-Path: <linux-gpio+bounces-34680-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKxOCvAk0mkTTwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34680-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 11:01:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51239DEFB
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 11:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9F4830041C6
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 09:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE59136B06C;
	Sun,  5 Apr 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3YoSkqy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DD24E4C3;
	Sun,  5 Apr 2026 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775379690; cv=none; b=ZMEjEloQ2xQFDlaLHPvEMgZs35XydNf/JiYXuTdpOhOZCjyo8hd/aGxe7QlsWJuOzuIBhpjWmVIkphoMr89vnwbd4DLRbQ+8CZPEhOgKyt7KviPCfOyrNZ6ZMDJovM9wsvGLvnkza07HIaapQ2P+rAT0HKB8NYvgdevrtmhDjlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775379690; c=relaxed/simple;
	bh=3vliQ17qwShGDX6gdqEdG1kTB8ZKtibwy9Eu/jiyVng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iN+mHwx0WPeNCbnkPJSwGu28OK9twJqeVovmRU0v1MLVBrlOpXF4n2who1feJ5FCkynCFdj3ZOokfxaOnzzQbODvzEFF4xdv9dA3d3JfLWeZjj356+u8Q6RMh3KPRpqLrbeIP1djXr8xXpvuL7Je/HmUbeR9oVLp2Mqq6VnHJGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3YoSkqy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775379689; x=1806915689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3vliQ17qwShGDX6gdqEdG1kTB8ZKtibwy9Eu/jiyVng=;
  b=f3YoSkqyO/bNtgBOdMJcj0xBBvXazjBxoHPs7ndcPpK4zivuB+PH/cSz
   zI8r7hRRblU3VYN2/tsqEFCE8oVWQ6TiykaCmly6ywvMa4wFop6AJnQXL
   vGzRJML0SUD9UNVQSEJzVzLJTa+qARTBJmsqXGo1C7Nugd1b389y+oA6K
   kASOCHbAdapits+o89VNYtPq9mxJghVV+spZzoeELcre2B1DLIGZOu7QC
   FMyK6fdvRXfT62JxyoqBs8DOhJkJePOy3E/ldHjIVRlQuTz+ksRR/g7lx
   MvMN6fvmqTpE0PEJfzPLxpnW3D15ut6Ozut+rMjdGzGnB3LtpsHvDz1cN
   Q==;
X-CSE-ConnectionGUID: GrHcENiXSFSuGnltFGDU2g==
X-CSE-MsgGUID: +ehIC8PxSBqJ8Q1n0RBq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="101828790"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="101828790"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 02:01:29 -0700
X-CSE-ConnectionGUID: cM7AsFSHRY2sILQpelW3xw==
X-CSE-MsgGUID: nW44ssMMSESwvf2a8hlEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="227580546"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 02:01:27 -0700
Date: Sun, 5 Apr 2026 12:01:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasu <vasuhansalia05@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, djrscally@gmail.com,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and
 0x12 for Lunar Lake
Message-ID: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
References: <20260405013413.31970-1-vasuhansalia05@gmail.com>
 <20260405013413.31970-2-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405013413.31970-2-vasuhansalia05@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34680-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.952];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C51239DEFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 07:04:13AM +0530, Vasu wrote:

> Thank you for the feedback Andy.
> 
> Could you point me to the series that is adding STROBE support so I
> can avoid duplicating that work?

Sure, you can find it on lore archive:
https://lore.kernel.org/platform-driver-x86/20260401203638.1601661-1-mnencia@kcore.it/
(It took less than a minute to find :-)

> For 0x12, I will add a proper define. Based on the OEM kernel module
> behaviour, would INT3472_GPIO_TYPE_AVDD be an appropriate name, or do
> you have a preferred name for this type?

Better to follow the name in accordance with the specification(s).

-- 
With Best Regards,
Andy Shevchenko



