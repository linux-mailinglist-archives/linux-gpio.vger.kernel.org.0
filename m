Return-Path: <linux-gpio+bounces-31431-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GliIhk+g2kPkQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31431-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 13:39:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C0E5EB0
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 13:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BB033042988
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 12:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF58E3E8C7D;
	Wed,  4 Feb 2026 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABdtNuiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568CB24DFF3;
	Wed,  4 Feb 2026 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208650; cv=none; b=S5W25ClVcwd0JBBz4SKjzQroEUVk+bJwt4qW4ppUi7toddL4XOWaHuUR/AqccS6hMeIldnsB5VlYQiyfURglW9UYq7hq8fEkr2JJJcJ/fPjlML71wy1r2VDbtSqL0rB5FSdBurXc50eh0K3FR+Ns1Do8IB0IGmwPGwL1rDkiwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208650; c=relaxed/simple;
	bh=pF9IXToY/SoiZ1kOP++xtnBfxElaBzUIHMxra4ivLuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM0/0kG58jBh+efbdWIsFcNg8dfwK8amofS2oY4r+9WzGIhdfgZYIKQOTyDlkmORC+D0WVFLvGCv8vSXShOyK7ZcLWEcOpR3Wo1j5B8BCosrtMi2OPmhQK6cKOMJL5bx5Ry+6py6lcJ2zZDNjOuWsySqAmvOLY4yQnbUqKcDTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABdtNuiZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770208651; x=1801744651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pF9IXToY/SoiZ1kOP++xtnBfxElaBzUIHMxra4ivLuQ=;
  b=ABdtNuiZCNZIY0exyIvVVQBU0KosbVaWpb5UwPYZHDRBbh92m+RXpeyi
   SmorvmJfh7ZKHT7qq7pGXir6SF7pVe5QLYKU7SSSUZJBcCILzAZkjGKEu
   /DPtbjrLboGq64idLAF6EH6LRSNG2Gk+lnU9ubOSBVt6R+3PK4mcz4L/R
   LHiMLuwws5y+eKUakZxdNzqxdtxiCmh3i1l6n3+zKY2z7wLHXVPtorYdP
   UdGBQ9sLTmjxgSpRiyWROtuy1GuMsLMkwr7Y1hQ3nJtisKOV7iX0222Gk
   EUmgs7dDbdWyco+cKq8f08sdXHGfhm7o1l9la/CoeDRQxTJLx+xWayxaQ
   w==;
X-CSE-ConnectionGUID: INhCgFoMQHaQMkiVsTRBQA==
X-CSE-MsgGUID: Nv54brb8Ryul7wCt89h2qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96846117"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="96846117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:37:30 -0800
X-CSE-ConnectionGUID: JUBXw6jIQ4qfVqcCpa6vlg==
X-CSE-MsgGUID: Uu5DewG8SUScMZDHc1UqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214331293"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2026 04:37:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 286F295; Wed, 04 Feb 2026 13:37:27 +0100 (CET)
Date: Wed, 4 Feb 2026 13:37:27 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Align Copyright note with
 corporate guidelines
Message-ID: <20260204123727.GP2275908@black.igk.intel.com>
References: <20260204080122.2300224-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204080122.2300224-1-andriy.shevchenko@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31431-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,black.igk.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 255C0E5EB0
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:01:22AM +0100, Andy Shevchenko wrote:
> The Copyright note must follow the
> 
> 	Copyright (C) <year(s)> Intel Corporation
> 
> template, where (C) is always capitalised and <year(s)> either
> a single year or a range. Update the Intel pin control drivers
> to follow.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

