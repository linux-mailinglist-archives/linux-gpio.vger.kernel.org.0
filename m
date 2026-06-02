Return-Path: <linux-gpio+bounces-37851-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y3XxHHlrH2ozlwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37851-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:47:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABF632FC2
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:47:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=VIA9IpqC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37851-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37851-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C3D33012C56
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 23:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FAF3537F9;
	Tue,  2 Jun 2026 23:45:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B648248B;
	Tue,  2 Jun 2026 23:45:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443941; cv=none; b=C0cTWoPocSYcuzlNAN25l9yiRo9+7gPqw7Bwcc2yEVUOmQGJyduP9GPv1X2nL1GZYrLpLmvNGQ6Ef+SuBFiXdgQaqFwG/xg12c/vNok2SCYLk1DMw60on6/HUFJdlKRyvXvxwnKWlGhspW/o9vNTv+dIvchSLJfLuhi+RIyzKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443941; c=relaxed/simple;
	bh=zCa9Qm1ug0niXbcQ6E3qO9dTYu5hflt0F0ENXLvZVpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/6TdOf1Ojlls8au2c199x4gbfjvNfWKUKLCXIUgYPfDzjkXhxyyoYiAzL9r68VWbvqz6bPWXyA9olZ6FYcwqweqJ2TPTY4z3hCieHu2pS0I8E3qWLo/20lWey9BZ+YZrDPLaAnPc/2KOaMNgU9zd5Lg7I+MziZkCAYBAASRYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIA9IpqC; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780443941; x=1811979941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zCa9Qm1ug0niXbcQ6E3qO9dTYu5hflt0F0ENXLvZVpE=;
  b=VIA9IpqCWPQK2OIFU0yzs4cFh6DNF98f118bdqMH7/PJgEU5kKZQfyXz
   od+za2JG8aW5srKpF1S9tN61E3gd9OqBMd9WyTHsMzhIDzvj12CR/6lvU
   Dgpqa1m8Fr82rQZKtp2l9S8hHTSx6LL76QOWVNtARGoGFMkBKzK9YEN7j
   pOXhoS0LfoKaDDIIr4OOJBaBA1w+FGR0khp7A0dNYlEHtQMRjGBJGq/6G
   gB/FzMZYIobkuLnlMNEiGlNQlYz89EJmOosqhgmVLbTogZPaovYSknD3U
   53xaxZMU/JE4ypbxcsXrQUndNEIvm69Z0tlx8iF23dP8ZAfIAr1prUjFb
   g==;
X-CSE-ConnectionGUID: 57XsTLrkS+CdHpzLXb5Pgw==
X-CSE-MsgGUID: vHOQrcVnQgW/aB4Szvc7XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80273063"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="80273063"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:45:39 -0700
X-CSE-ConnectionGUID: js/U7m6lQUCir7ICMqE5Vw==
X-CSE-MsgGUID: rpP4asLdS5ifxlq7b0Hy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="267684643"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:45:36 -0700
Date: Wed, 3 Jun 2026 02:45:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device
 properties for LEDs and GPIO buttons
Message-ID: <ah9rHgAvprCTwEed@ashevche-desk.local>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
 <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
 <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
 <ah9TXCcBPNh77Ut5@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah9TXCcBPNh77Ut5@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37851-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CABF632FC2

On Tue, Jun 02, 2026 at 03:06:14PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 03, 2026 at 01:02:56AM +0300, Andy Shevchenko wrote:
> > On Wed, May 20, 2026 at 10:13:19PM -0700, Dmitry Torokhov wrote:

...

> > > +	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> > 
> > 	for (unsigned int i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> > 
> > ...and drop the above definition of i.
> 
> Why? I do not see coding style suggesting this. 

Linus Torvalds.

-- 
With Best Regards,
Andy Shevchenko



