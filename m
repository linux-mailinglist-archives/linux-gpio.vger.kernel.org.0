Return-Path: <linux-gpio+bounces-31514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rn/VBwKMiGnzqwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Feb 2026 14:13:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E937108B7C
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Feb 2026 14:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61749300B99A
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Feb 2026 13:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB943280325;
	Sun,  8 Feb 2026 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7tFfBUz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B21FBEB0;
	Sun,  8 Feb 2026 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770556410; cv=none; b=E6/ZEtuKzaaJB7T6WUtPhhuvMtppNImNUYTdDcoNSJNPQT5pzlsi7FEz1MtD5voUrkxEh8bnvo9Ex45kWv8t6WgXF9eY23g+u2RqHNkUzlRFTto/7k7iTP4BqWsMn2wavqOsV2KfORCY2PqWvQ7hSqKQRgbuU/2aLl3HScQsMGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770556410; c=relaxed/simple;
	bh=oO+Q8be8GLa+jo0nT3jaaPZEtFfRABAUfxfamrBqeiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVmrLLP4RZUwMUchF+o3qohmtHRyjgs7tpPDho65POwGQCNGZlSBywPxaXzcCqd2iV0S5OPoN2geJ6c9ezOWJjncz4lqOgvHGPGV18UJddQxBlISPoAQXE/btKn2rJVTpSC7Udg5/7Yu40cL4S/J2bxcsflm0gWlooCkVhL3pgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7tFfBUz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770556410; x=1802092410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oO+Q8be8GLa+jo0nT3jaaPZEtFfRABAUfxfamrBqeiA=;
  b=h7tFfBUzvUX4T8ONJsZTH4gXdo6KUa4lIs9yC8JwGbgGFdtw/dyLreYj
   DIvxRlbbfUJph41LPz9taQXodg0lpFGu3A1WCHC+7Frd9MddUlN0cIMGH
   6wdcf/ghGZkX7kf8+u2oPo6E8zOP0OyVm0n9s6Vl0i6HZst4/EYbVoJWo
   TK8Ryh7iyn+PhMp0mGxw837Rg1kPr/nAaSih+YZgNzhu4lS2qHWMQ1tmI
   le6mKV+On5RfhCQ/hgY8fzlQZG+LJfk2gNKsVChDy8CyWjDYD1I/sWTkP
   rfP9hrkt5PCkpBE4FWRPiOzd6etL07orytkWLXeLXxZGDFChx1lCu2Va7
   w==;
X-CSE-ConnectionGUID: aSpPQEALSLS4qu6Qawj6QQ==
X-CSE-MsgGUID: KHx7WaaBSkyy9ADe+RLUAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71730004"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="71730004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 05:13:29 -0800
X-CSE-ConnectionGUID: G3HWxfq7S9+UcVDRif80mg==
X-CSE-MsgGUID: VTFA5JmRQjOTwz81B9cWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="248963283"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 05:13:25 -0800
Date: Sun, 8 Feb 2026 15:13:23 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: 434779359@qq.com, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	liufulin <frank.liu@faiot.com>,
	Waqar Hameed <waqar.hameed@axis.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
Message-ID: <aYiL89Lx9r8tJT0K@smile.fi.intel.com>
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
 <20260207134950.0f064905@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207134950.0f064905@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[qq.com,baylibre.com,analog.com,kernel.org,gmail.com,faiot.com,axis.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31514-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:dkim,qq.com:email]
X-Rspamd-Queue-Id: 6E937108B7C
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 01:49:50PM +0000, Jonathan Cameron wrote:
> On Sat,  7 Feb 2026 17:42:35 +0800
> 434779359@qq.com wrote:

> > This patch adds support for the vl53l4cx tof ic
> > ICs used in Qualcomm reference designs
> > 
> > Signed-off-by: liufulin <frank.liu@faiot.com>
> Hi Frank and welcome to IIO.
> 
> This is a massive commit.  Normally roughly speaking each commit should
> be an absolute maximum of 500-1000 lines of code because this what
> people can realistically review in one go.
> 
> I'll take a superficial look at what you have here but to make any
> progress towards upstream it will need stripping back to a much more
> minimalist base.  From that we we can then look at adding more features
> in future patch sets.
> 
> Note the largest drivers for what I'd expect to be a lot more complex
> than a time of flight sensor are not as large as this in terms of
> lines of code.

Yeah, this is even barely satisfies requirement to put into staging/iio.
It has so-o-o many style issues and other small things (I just pressed PgDn
several times within 5 seconds). You need to take your time and invest into:
- creating an upstream plan (roadmap)
- as Jonathan said, start with a minimalistic setup (not more than a couple of
  thousands of LoCs
- be sure the style follows the Coding Style and IIO subsystem specifics
- be sure the code uses modern APIs from kernel and not some outdated stuff

...

> For the full series, stay under 2000 lines or in practice it won't get
> reviewed.

Fun fact, I answered above without looking at the rest of the message.


-- 
With Best Regards,
Andy Shevchenko



