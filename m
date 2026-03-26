Return-Path: <linux-gpio+bounces-34200-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOBlJ+wPxWkI6AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34200-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:52:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 206B7333C91
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DAA53042D42
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D123CA484;
	Thu, 26 Mar 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkcPGaWS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC75392836;
	Thu, 26 Mar 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521671; cv=none; b=l5HC8MaX3pdvFJdu2vTK0Ahfw+mYiSMTdE5Qapv7TJZKE0mDwntGhib9QjbyqgJrOA0/IyFe9f4HsaBFCV+dkwrsrAPk6ZAqlCTMlyPI3VnFDj6hiOWI90CieMx1c/4Pfd/6e4HgF3OOq0rN1XASFMEH7i9xNGq7J/pydNLqTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521671; c=relaxed/simple;
	bh=QwcRD7lYBB3bVtbVPl0xFodLgyrxXNTDNPu1TEeWvDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohevkyTkDJY+hmDLlWmn3qUnYUGlqeIzVdGdr629tQpMdmkNnI0Xt8KdzqZ91psOPNV8uqZR9PWsgaCi90a9Qxp1Oo1WpQsXZxhpxf8rB9wenn4TTZltfxaNrWVOieKDiyvGgeD91lbIIRSgof3YNclkU99EgGQvbz/94lqU3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkcPGaWS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774521669; x=1806057669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QwcRD7lYBB3bVtbVPl0xFodLgyrxXNTDNPu1TEeWvDo=;
  b=gkcPGaWSrTPcdymTv7F29eI3xgPmCJDkj4D6bvqj8AInzRVlXs8FRfMZ
   3IIhY3Wopfc9rI0/P0K7H0Stq1HovrmpDk2iQ/UEURilTxa+keLfjyf2A
   InBwvOJGotBd/pBlqqD3BctgxOUNHUJ93TWUdUxjg/ogabHTaLUmb/hbE
   Y7133V8Ba6IAKQRjkZLgmGAlqbgwfhbTPY4fqVnSj357/WbMcEziGTs/1
   rq0p4m0r7I/vYsm4hZ5/8rJkuqleArcvIq/QsLVDAMd44abb//+w22PDV
   0KEp5IR0dVh1LgEiTJhEAp9QHVQIyniy1foUR5d3B3Wr+3LWnlBtADEBL
   w==;
X-CSE-ConnectionGUID: Izzb4LYCRLiRiHWIK1EKPw==
X-CSE-MsgGUID: tSMhccCMQ+6I2KbiAVnfaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75770957"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75770957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:41:08 -0700
X-CSE-ConnectionGUID: ly6uU2sqRbWjZOjb1sKkaw==
X-CSE-MsgGUID: 3nuDLsGkRtGNo0cuf7eFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="229907833"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:41:06 -0700
Date: Thu, 26 Mar 2026 12:41:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: intel: use FAM for communities
Message-ID: <acUNP7ZG87rV-LJL@ashevche-desk.local>
References: <20260326023627.54349-1-rosenp@gmail.com>
 <acUMB5OUGCpy73eW@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acUMB5OUGCpy73eW@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34200-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 206B7333C91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:35:57PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 25, 2026 at 07:36:27PM -0700, Rosen Penev wrote:

...

> What I would like to see is rater special devm_kmalloc_and_dup()-like API
> instead of doing this in every driver out of dozens of drivers.

You may start with providing a common API for all Intel pin control drivers.

Patch series of:
- add a new API and new member
- convert driver-by-driver in separate changes.

Actually why can't it be done like this from the start?

-- 
With Best Regards,
Andy Shevchenko



