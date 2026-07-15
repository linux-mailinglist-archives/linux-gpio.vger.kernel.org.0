Return-Path: <linux-gpio+bounces-40103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CPWyAkBHV2oVIgEAu9opvQ
	(envelope-from <linux-gpio+bounces-40103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:39:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B81275BF60
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:39:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RkGFKicQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40103-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40103-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E384304020C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144A93CD8B0;
	Wed, 15 Jul 2026 08:36:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621A3CB918;
	Wed, 15 Jul 2026 08:36:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104592; cv=none; b=WaGKZUPO67k0amF/pzjvZO32VdTx348lgMCkqQRq149xtU0lg4xaB3Nae4qkSFQvazheQxJe98vtgySz7bYAd/7SeblEmVLOAW6CBhKPsUWEIG5VmEFezBSeTVD1zJswBem/Qjxn+7IRUb8oz/TskgymyVkYk1mgU5gh/5soemg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104592; c=relaxed/simple;
	bh=OXZt351X18XpFF4Kqe9OL3cHjVZSPvqUvDwCYU4v1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL2Iha7yWJNFwD+iDIdRQ2wKFoPC1hdmjGSfi9HRKeHCPNyghWfgUFD97+qclXKeBgHjrCOdID20HqOK4DPFglynOs9CqPeKSDbIfkLmosUbQFea7P9INEj5rkqf33YPexl8z6Rkb1B+Rd+gBqQPoVyMLZ0NTVeZwgsdWdkuHIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkGFKicQ; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784104591; x=1815640591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OXZt351X18XpFF4Kqe9OL3cHjVZSPvqUvDwCYU4v1Lo=;
  b=RkGFKicQXKV2XmH8trACAOxvTR2Km+X9r1je976KK+uA4NkAi8T6zPY4
   W6O5Gsqb1N4yhc2C0DBvTVDA0ipZ8E3c0O6Yxlw+6Qbs9GnBmqZam1C3t
   uqRQweEJJhMEsmV1VsdotmSoMXqGH+Rfb4EvWLtTvH6IGnorgJ0sjIcmX
   Gvuv2H8+rjDxl49Hn83Xyrli1LTNm3PzN0XquZsgWq6N9RSG/Io6Xdkef
   GGdy0uTRpghfi7aQXPOhGdbM34/v/tSpfbm7plbFNlZub2URiXqCYDQ2H
   iJtqLWs2f6bB79iKbZvyEsFpWIcfAGTGqHC/+YREPXyLsmIrxugOaAd35
   w==;
X-CSE-ConnectionGUID: 9/Wm8G85QfGtTl1oKe712A==
X-CSE-MsgGUID: jO2lb2azRXGjiPWjGs3+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95879950"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95879950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:36:27 -0700
X-CSE-ConnectionGUID: 2hvGbn2YRe2kqd8lBpOmoA==
X-CSE-MsgGUID: m0errHZCRpaO4EGo+/tjYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="253495438"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:36:25 -0700
Date: Wed, 15 Jul 2026 11:36:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in
 GPIO_LOOKUP_SINGLE
Message-ID: <aldGhpswOfyjd8vO@ashevche-desk.local>
References: <alV0wIgZAY_InGYV@google.com>
 <alX2Q3OcJHVmamWM@ashevche-desk.local>
 <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MckJVi5bPtBh9p9D3SHaJcyvf19B2J-u7fbDiTA=CLdJA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40103-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B81275BF60

On Wed, Jul 15, 2026 at 08:11:06AM +0000, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 10:41:39 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Mon, Jul 13, 2026 at 04:29:16PM -0700, Dmitry Torokhov wrote:
> >> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry
> >
> > GPIO_LOOKUP_SINGLE()
> 
> I fixed it when applying.

Thanks!

> >> followed by an empty sentinel entry. The sentinel entry has a trailing
> >> comma which is unnecessary. Remove it.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I queued it but I do consider it a bit of a needless churn TBH.

You should really be against Uwe's patches then! :-)

-- 
With Best Regards,
Andy Shevchenko



