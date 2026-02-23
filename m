Return-Path: <linux-gpio+bounces-32057-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN8/BbiSnGnRJQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32057-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:47:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CF17B08F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC9AF3006389
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CDB33506C;
	Mon, 23 Feb 2026 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGgCuWJY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA853346A0;
	Mon, 23 Feb 2026 17:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868559; cv=none; b=BsbMY9y2jCIMK+QeuMnncCljWESLjRUsurH2pR0RV7Nt3N4WGJHh4TMDg22jTfzXVA9UZLo/A4qW2hNSuIC88YZav/M5bLhER/4F7w5qoC4hDJ3H8JlbYBFAQzibrm8GjJJ+uv8Vhuj8SkLPQTrYfn89+EaZRdgf8Byv6Jtl8Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868559; c=relaxed/simple;
	bh=QM26KjI33ARDzTVvC09/ZdoHgZCuqEnlTp2gYZtrqyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlMoLKsn65wOzHwUjQ9F4UJVBuPacvBpEZyH5AA68YyxbC+5tAIXrWEcaM5p4rktGsMAbu7QuGhcl4IPfB4mWwC//FshG5r1ZhsB86T1lKZhguT+RJK9zsaV0+qsRKNFaJzx6I9WvjfKRgrj+33kM6LZooNTmUW5UFIzOSbwFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGgCuWJY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771868557; x=1803404557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QM26KjI33ARDzTVvC09/ZdoHgZCuqEnlTp2gYZtrqyE=;
  b=oGgCuWJYxUjVVLM5j08heZ2dXCeOrXQMmwZbAfIEVe2/O+DBiqBVCbWF
   yurtr6vEW8vjtAhE5t+qp7olaeT7j1+9boyVwi8OAjOh0ZdSj2lV45vPP
   Q2MfFByb3U1XFavUWdCk+byj4NBMvbbsZRvAVYt/DZsU0MCnZ/mNlhFZh
   1rAGbEna6PXyHJs/huQQTuayAjF93urv84pSq4hvtw2WZutg35bF4hFIN
   RqQywm9E7vHvcKmNlNM2OLLErZhggMxhHDUUBz0kBbhgGENvamIbkbuPL
   5JO4ocquJSOaJVDlxApefWBpCh86cUZDqxF90K4MHQrasB5kKpbidBpg2
   w==;
X-CSE-ConnectionGUID: +9fPUzv7TZ6PM2BxaZ6DZg==
X-CSE-MsgGUID: eqPk7M2DS/+X4yuDseHGIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90454549"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="90454549"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:42:36 -0800
X-CSE-ConnectionGUID: yIC2sSxnTwa7mIbfe/Ra4Q==
X-CSE-MsgGUID: egAhj0klSn2RXg3RZOi6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246222164"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:42:34 -0800
Date: Mon, 23 Feb 2026 19:42:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH 04/37] gpio: merrifield: Replace pci_alloc_irq_vectors()
 with pcim_alloc_irq_vectors()
Message-ID: <aZyRhwEfAai2NuVX@smile.fi.intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771861376-85311-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1771861376-85311-1-git-send-email-shawn.lin@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32057-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:email]
X-Rspamd-Queue-Id: B45CF17B08F
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 11:42:56PM +0800, Shawn Lin wrote:
> pcim_enable_device() no longer automatically manages IRQ vectors via devres.
> Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
> pcim_alloc_irq_vectors() should be used.

> Cc: Andy Shevchenko <andy@kernel.org>
> To: Linus Walleij <linusw@kernel.org>
> To: Bartosz Golaszewski <brgl@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: linux-pci@vger.kernel.org

Please, move the Cc: list in all your patches...

> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---

...to be after the cutter '---' line.

To prevent some questions and doubts read this (patch 18 subthread):
https://lore.kernel.org/all/20260123113708.416727-19-bigeasy@linutronix.de/

-- 
With Best Regards,
Andy Shevchenko



