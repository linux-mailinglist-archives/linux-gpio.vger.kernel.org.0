Return-Path: <linux-gpio+bounces-38478-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lvWkNPfPL2q6HAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38478-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:12:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41C685490
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:12:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GiXflqdq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38478-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38478-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE9C73028E9C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84BE3DDDAA;
	Mon, 15 Jun 2026 10:11:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BB3DDDBD;
	Mon, 15 Jun 2026 10:11:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518287; cv=none; b=Mya0t+QP0z/KNJ8J/Y6O5spqk67SUdQi44kcOvc88wA59wkro0maegKJ+DQGTh8Lj0fn5gSrE5fd55HIJhjBVfVucbrvuJDcrmHphwKbvZLEMUHa5PC/ycGxU/j1Qu3AyraHalcXrrQ6RHK1tsfK0uDR5ca8c+lipAvK6HaRIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518287; c=relaxed/simple;
	bh=+pe7I+pGcuEyQuV3pMocPIz86SRmDdG4odXqqYhA4Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEmwna8tFpVKJAMyaLe6IzkwT0OLEyP+2c5hU+NbCDcqwBJNXZBiinrqE/Pceh40CnLUOkZw4LS0G7yjAj3Wnj4h1goYlrTR7tmS1simLjQmq80aMPhtGh/FOej5O+PXLcwpflpYk8v2LrkKuo4qWw/lwwYIUsqxNsaK9yPEGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiXflqdq; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781518279; x=1813054279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+pe7I+pGcuEyQuV3pMocPIz86SRmDdG4odXqqYhA4Co=;
  b=GiXflqdqVuaaN3mIhxIut3WtlbeT4/35tT4m3GbsATV8ov6fI/QJu1gF
   0ZKOAeBg236c7EW5QGZTf/+JX3lrLYEat0YuzW8sFpS7QFxAe/GZSyvJ6
   NZq0MRtBN4I/py9RnOXtydVR/00Z1Z3OwTH7i+Jo2a6TBoH56UBytMBBx
   exS8+S1A73P/Tt6AAdwNMKmsVwNhSnA7+C0o17H+smFsl7z2CPZF6VV3z
   qIAhEUBwE/Ob+yT6PPNpjybXc93OyZPKwyeFkU7hAgc9d+fyW9OA2Sfj/
   XpjYTEJxRhXh03Qiz7qFPpJJbrN2ajC2VAlvxpT9sd7j92/3SyUk7Q5Sx
   Q==;
X-CSE-ConnectionGUID: tdQ8d960S2yYCLX/CslZag==
X-CSE-MsgGUID: iVCY9xikQUy+acjqC5KDXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82101607"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82101607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 03:11:18 -0700
X-CSE-ConnectionGUID: 3tky9ysbQXa3ipU940FJuQ==
X-CSE-MsgGUID: ASWpRmhqQfCA+w1mjafYDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="246542293"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 03:11:15 -0700
Date: Mon, 15 Jun 2026 13:11:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	wsa@kernel.org, mario.limonciello@amd.com, brgl@bgdev.pl,
	basavaraj.natikar@amd.com, linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
Message-ID: <ai_PwNWnMZB01AYU@ashevche-desk.local>
References: <20260610083701.18663-1-hardikprakash.official@gmail.com>
 <ai8jhK9hUGHpojB5@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai8jhK9hUGHpojB5@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38478-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,amd.com,bgdev.pl,intel.com];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B41C685490

On Sun, Jun 14, 2026 at 11:56:55PM +0200, Andi Shyti wrote:
> Hi Linus,
> 
> On Wed, Jun 10, 2026 at 02:07:01PM +0530, Hardik Prakash wrote:
> > This reverts commit ef76a3a28c79b628890431aa344af633e892035b.
> 
> Is this in your branch?

$ git tag --contains ef76a3a28c79b6288
next-20260601
next-20260602
next-20260603
next-20260604
next-20260605
next-20260608
next-20260609
next-20260610
next-20260611

> > The patch causes boot regressions on multiple machines. A NULL pointer
> > dereference occurs when agpio->resource_source.string_ptr is NULL (i.e.
> > when string_length is 0), and a probe deferral loop causes CPU starvation
> > leading to kernel panic on Intel CI machines.
> > 
> > The patch needs a proper rewrite addressing these issues before resubmission.

-- 
With Best Regards,
Andy Shevchenko



