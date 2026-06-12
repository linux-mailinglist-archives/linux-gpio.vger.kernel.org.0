Return-Path: <linux-gpio+bounces-38364-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xgqeIQLJK2rsEwQAu9opvQ
	(envelope-from <linux-gpio+bounces-38364-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 10:53:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEABC677F8A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 10:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=X7xrYzcy;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38364-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38364-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AEDA304EA2F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 08:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4432368277;
	Fri, 12 Jun 2026 08:53:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF27D40D591;
	Fri, 12 Jun 2026 08:53:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254382; cv=none; b=pOeePIXJowcWAhNmRiGjD6SRVAz5xxrN06A0St+50h1Utk93RvM9dW76+6Sq+TcTAECtW0YfQpd7maO9PO8unTgBAgqmIQDFzUBjMMynjnFfD6t3M6FSsNqlEk5qQ1hlyCPEI46SPgoBkb2TNfv5VHh3trfFBJJY5pJdvKtPfeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254382; c=relaxed/simple;
	bh=ZFF4v+7K6GtKETITjAVO2n9TysxCzh5IcUQZXv8A8+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pU2ALxE4mIfcj++yqbfKgox87lS9QSNrU7KPB1MDIjIQOZNyygn0bboc/1fifLWtGsnJHWg56dN49pW1fWbcohTIRWcajVThP+32sCetwTqVzlUVPjZuoFxqGVBlitsF7/K2e7qiCAqSBojTurSh8p82peuFtR0ZAC39luv/QSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7xrYzcy; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781254381; x=1812790381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFF4v+7K6GtKETITjAVO2n9TysxCzh5IcUQZXv8A8+c=;
  b=X7xrYzcyFGa6MzlIHqgZ+OJBegMenYYy90yO0tJaX/JgJzzD+h0sNtEj
   SqguhOr51k5MJ/Wy80HVLE/6zH2r7+bdihvSc3/idp7X3ex/KilzMBvl0
   hJ1KXtrbxZ9sbLOdhEVl1C87OfRMkDXOSZDPdt8EKpcXhMpbwuP4HJyFf
   5qBp42ULznL9ZPlvcNqG5xZRDcVoRIzCmePWRYv/UY3wiJ41SixdxrYGn
   ZyEE7FDTvnLqnTNw3IhCvwQlvNp6XLJ9EUx0ZZbVkMHiF7bxxg0ib8q8D
   k0fhB9WO9vao7cX6VxxuFevbiNiKDrUkvo93dLKlzpqY0hFk0fdo31XkU
   A==;
X-CSE-ConnectionGUID: q4y6FJtYSSSktxQjhrluzg==
X-CSE-MsgGUID: rjywNUtlSzugTExcX1HhSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81823847"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81823847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:53:01 -0700
X-CSE-ConnectionGUID: HwLeyfaMQNW6u2x3t3sC0Q==
X-CSE-MsgGUID: IcPsWayMT22uRAC45NyVwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242387483"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2026 01:52:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2981A95; Fri, 12 Jun 2026 10:52:57 +0200 (CEST)
Date: Fri, 12 Jun 2026 10:52:57 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] gpiolib: acpi: Add robust bounds-checking and
 safe address handling
Message-ID: <20260612085257.GY2990@black.igk.intel.com>
References: <20260610154204.110379-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610154204.110379-1-scardracs@disroot.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38364-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEABC677F8A

Hi,

On Wed, Jun 10, 2026 at 05:42:02PM +0200, Marco Scardovi wrote:
> Hi all,
> 
> The series adds explicit bounds checking for GPIO pin accesses and
> ensures safe handling of ACPI addresses in OperationRegion handlers,
> without referring to truncation or wrap-around behavior, which does
> not apply.

I'm fine with these now.

For both,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

