Return-Path: <linux-gpio+bounces-31240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kaTdFlcPemnH2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:29:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B5A228D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D248304E0ED
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D350352FBE;
	Wed, 28 Jan 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/Au2KUk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16887352FAE;
	Wed, 28 Jan 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606898; cv=none; b=SOXteHmWuOZSbxqTvr8eA1a8GQr0K2JBsdi0Gslnjo66I9wOdZJxhAmVpLNyEu9dlxxy3V4A2bvZm7l9bO9oVXSCzuIgY++sF0vjDREHhlXJfj+AgrBIGrRJoDY9Dx7e/gksruRILVDRgUhb0VJi1EfEHu3gpQ90ebf+aRR6uzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606898; c=relaxed/simple;
	bh=l257s7R6hKlMn9y16i7Y/uw1WJ9nrrlv+C7Psbg+9I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XW/NCPQho/BhC39W5fJJqFrb+ZV216noz6SmMwvyonCSlFd5npFnGtCUNs5rIat/AZMCCyPOf6s33I/GwTfC3C7w/v1r4/JrQovUnBenEDEstLLT+60vZX5RvQHlKAiaE1AQVwNWm50sN+w3AVjXzEcJ9vnHqIBnCrTpYTl3BgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/Au2KUk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606897; x=1801142897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l257s7R6hKlMn9y16i7Y/uw1WJ9nrrlv+C7Psbg+9I4=;
  b=B/Au2KUkswSCL6ooO+w0SZPhobUjWPe9beFJTQ/b5P8Y9GZ3AzRoCzcT
   WaxqmLyq+9AdaXYVE5FpmP7wSWY0pM3EukHlhbKEbbQZahTM1H9dpa2qq
   u2sHyLvD/aFgSmioph7Aen20W4vEHj864IEtIb9FE5kaIhi+FvmX9+kyx
   sAMDHFeMla5NazSvPzZrDnLdz+ZGBIuqXX8RsikJwcs4++JHTI7JzWwnN
   HhZaFFf4oyIk1NV2/9rcQGfotpnojVeojNEWnUMOje+lkB6HvPyic4JKM
   CBKF8NI9+krTeggjam2atUXnmnYKc0Y6wCfYY4C7e81TDUSD0rb3RzcrC
   w==;
X-CSE-ConnectionGUID: 3qyi5qXCRiq2DAS27XGaXg==
X-CSE-MsgGUID: TN8+q5iKTS2c/+7RBFAdqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82184613"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82184613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:28:17 -0800
X-CSE-ConnectionGUID: 1FgTjjMtQ8SYe1gl+hjPTQ==
X-CSE-MsgGUID: ZDexjfPOQzKCP0uYW8R3Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207400860"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:28:14 -0800
Date: Wed, 28 Jan 2026 15:28:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: cherryview: Remove duplicate error
 messages
Message-ID: <aXoO602fJZL0IqV0@smile.fi.intel.com>
References: <20260128125343.52497-1-andriy.shevchenko@linux.intel.com>
 <20260128132243.GQ2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128132243.GQ2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31240-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C4B5A228D
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:22:43PM +0100, Mika Westerberg wrote:
> On Wed, Jan 28, 2026 at 01:53:43PM +0100, Andy Shevchenko wrote:
> > The pin control core is covered to report any error via message.
> > Since that it's not needed in the callers.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



