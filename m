Return-Path: <linux-gpio+bounces-37935-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ex+XFC4+IWoaBwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37935-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 10:58:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6C63E3D6
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 10:58:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=h3bBezlB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37935-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37935-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BF3A30B3F7B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 08:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1984B3F20E5;
	Thu,  4 Jun 2026 08:46:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E393DEFE6;
	Thu,  4 Jun 2026 08:46:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562773; cv=none; b=OjVd2SJv+vV6Eqs/VpvUsy+flgcVSyn5eSCMxq5cIP4OwG6rUhSuD7lXzOXwflhF52eR/wr6HYBUrTd1D105mCTwiyZ5ki0/Og6HlIf+zdURQKhZIbHwxS3ZsAr34nYxQfZZfwXahP2LiMGSHmcOQSXTDa9g7n/kSB7EJFC2uCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562773; c=relaxed/simple;
	bh=D3yXOZsLFkZd6Yb1kaZqF18BGpLMf/dEbn7qXbbD1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXIWvbPxxw/8UY4oQI87rtnQujZFUjNJdBWF3gNiJASrNl5zQd69IVPKi35kDFURojzPzIPxI+C1fCisJBd6rnT69MeG9m6FP9vxjQlEUNylPVAeT7zO/lxve5mpv0nSgmFdY0cqQSxrrtMgT8no3AbAzyZC/kHVRm1Bc93GG4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3bBezlB; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780562772; x=1812098772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D3yXOZsLFkZd6Yb1kaZqF18BGpLMf/dEbn7qXbbD1jw=;
  b=h3bBezlBlhzXj3Apm6hLcBJyRgoh7CxAGRHsLSwwMS+djqUH3/A+Agrt
   9LK/ACFTjrlUTbkjVRdcy/ZFQ+7l+YadNcF9TB0iD7lidSHiM1rNz7vDu
   26HBCMYGkaWfUV6fEF3F7rP1SDFjwVwu5SjgprUr0lGcjAgGEqlA18axy
   flmrVb3vwmdFKiAlmqb5V7mpy7wAT+z6I0hjnZaw6dCI5sWWw6ESinp7V
   uO/HiVA+nD1vP0NckKtKP7ktAlvEGbgV+5bFT+MLm9hoT9adKa0h/BsIA
   7U6ckv+Fm3/G6pxgoo+Ss2otKBFOVZsTNPWAKrORXFRjYOmIIL5pwNjJS
   Q==;
X-CSE-ConnectionGUID: kH1ho8wsQuKFMeJR74djrw==
X-CSE-MsgGUID: YPEqGOwNSge2lpMh8BEUnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81292955"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81292955"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:45:57 -0700
X-CSE-ConnectionGUID: gs8MzL+DS9+KQ5M44YfoaA==
X-CSE-MsgGUID: AOH0UyFwRZ+nCWHnYFpTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="244569971"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:45:53 -0700
Date: Thu, 4 Jun 2026 11:45:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: core: fix const-correctness and remove UAF
 FIXMEs
Message-ID: <aiE7P4Ch9q-3VCIX@ashevche-desk.local>
References: <20260524162708.62949-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524162708.62949-1-scardracs@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37935-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:linusw@kernel.org,m:brgl@kernel.org,m:tzungbi@kernel.org,m:westeri@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FC6C63E3D6

On Sun, May 24, 2026 at 06:27:06PM +0200, Marco Scardovi (scardracs) wrote:
> This series addresses legacy "FIXME Cannot use gpio_chip_guard due to
> const desc" comments and open-coded SRCU locks scattered throughout the
> gpiolib core and backend lookup paths.
> 
> I am aware of the ongoing work to replace the gpio_chip_guard architecture
> entirely (see the "revocable objects" patchset discussion at
> https://lore.kernel.org/linux-gpio/20260513091043.6766-1-tzungbi@kernel.org/).
> While that broader refactoring is being iterated upon, this patch series
> provides a simple, completely type-safe fix utilizing the existing SRCU
> guard infrastructure. It can be merged today to eliminate the FIXMEs
> without conflicting conceptually with future revocable objects.

Sounds reasonable to me and the code looks good, but I haven't deeply checked that.
Hence
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

and personally I very much like the second patch and agree that it's good to
have rather sooner in tree in case the change is correct.

But we anyway need to know Bart's take on this.

> For clarity during review, the series relies on the following guarantees:
> 
> 1. Deep Const-Correctness is Preserved:
> Updating DEFINE_CLASS(gpio_chip_guard, ...) to accept a `const struct
> gpio_desc *desc` does not drop const qualifiers. In C, const-propagation
> does not implicitly const-qualify deep pointers. The `desc->gdev` evaluation
> yields a mutable `struct gpio_device *`, making the internal guard
> assignment perfectly legal and safe for fast-path read operations.
> 
> 2. Identical SRCU Lifetime Scope:
> The DEFINE_CLASS macro's GNU C compound statement `({ ... })` relies
> on strict sequence points. Thus, `srcu_read_lock()` is fully acquired
> prior to executing `srcu_dereference()`. The guard's lifetime remains
> identically bound to the block scope, exactly mirroring the open-coded
> `guard(srcu)(&gdev->srcu)` it replaces.
> 
> 3. Lookup UAF FIXMEs are Architecturally Obsolete:
> The FIXME comments removed in the ACPI and swnode backend lookup paths
> (warning about dropping the device reference) are functionally obsolete.
> By design, `gpiod_find_and_request()` wraps the entire backend lookup
> operation inside the global `gpio_devices_srcu` read lock. The lookup
> functions are entirely safe to drop their temporary references since the
> caller subsequently takes its own permanent references without ever leaving
> the SRCU read-side critical section.
> 
> Please note that while this patch provides a good solution to clean up the
> existing codebase, I fully understand the necessity of deeper and more
> radical modifications to robustly secure the subsystem's future.

-- 
With Best Regards,
Andy Shevchenko



