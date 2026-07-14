Return-Path: <linux-gpio+bounces-40049-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id apSJE5v2VWoTxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40049-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:43:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F268752875
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:43:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lbBQMKnc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40049-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40049-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 579AE30AAE90
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD08426EC1;
	Tue, 14 Jul 2026 08:41:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C88426693;
	Tue, 14 Jul 2026 08:41:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018511; cv=none; b=U2X6tYtXez8SjOzvZLldGPWlF6NO+LqdTiLmVWR8kv66uB2G+u9YpxGQJrH/QjtplVgusDrW/B4BAS1Z1lnm+X0wfw71Zh3omSSY/HDhm2/wkwjwG4YbEHiK+tlMWhjJ2us4mPlpbrpmgTmhJlaLkGCUtPPqgRjlxLWgZqMincU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018511; c=relaxed/simple;
	bh=12XriuA46Xm1o3Sy3QxMokfAk24n0HbvEzxM1onJtTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+4fZb7KpkZwmyib9T6IuXkRvpqw0TvceNbz5yUqQ2yViTG4ugO7LP5Sm1cyyIPy0xwOryXPM9XCSuukUFlFnZ8GRSZDUl+vO/C9lVJER4pv7g/djim8OGC7/gR8hSeZp5qUayUNZ3o8uUUMFYaNWAGRJGlnYQW1vDKkFD4KQxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbBQMKnc; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784018508; x=1815554508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12XriuA46Xm1o3Sy3QxMokfAk24n0HbvEzxM1onJtTU=;
  b=lbBQMKnc6LeFGGF2OAyj+/v8YftofFpyRzWqPTaRJa5FrvHmvfEbg9CD
   TfI9DjXtaUfYXfRLtSAYEkVkiYXcZwP3sSPiXeX9X9XxtC+AqFHbBuihq
   JpJ/0eX9LcKJyhYFClIZlguj2B/FI8p5lS7PYbUSzYbwXrxd/PwQQMicB
   0eoi5AZl3Ws+gR5RT5cxOMerMzJS83C6MFVerHPdFuEPsVDEGhsu0GcaY
   JlJQgtLeMwgi6C75xLXC78BD/jlwe+HCkeWZULf1eEuSKC+Up0kpRW0Dp
   R53uXfFeE0GU0yMPDSghI2jqF8v358gxbNlZumhThpNZP7MfKN87ktUR8
   w==;
X-CSE-ConnectionGUID: XUmo+uphRUq46NXFnUnZ5g==
X-CSE-MsgGUID: g5kVZDqQRXWPFCZ3X/w9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84599873"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84599873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:41:43 -0700
X-CSE-ConnectionGUID: B/qpMudUS7eefjjjXcVvjQ==
X-CSE-MsgGUID: QrRciFwdQfuTPBRi9J31eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="257767423"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:41:42 -0700
Date: Tue, 14 Jul 2026 11:41:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in
 GPIO_LOOKUP_SINGLE
Message-ID: <alX2Q3OcJHVmamWM@ashevche-desk.local>
References: <alV0wIgZAY_InGYV@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alV0wIgZAY_InGYV@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-40049-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F268752875

On Mon, Jul 13, 2026 at 04:29:16PM -0700, Dmitry Torokhov wrote:
> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry

GPIO_LOOKUP_SINGLE()

> followed by an empty sentinel entry. The sentinel entry has a trailing
> comma which is unnecessary. Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



