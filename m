Return-Path: <linux-gpio+bounces-37852-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMb0CDRtH2pllwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37852-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:54:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4063303E
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 01:54:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Ij+ZvkPd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37852-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37852-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C616304C947
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 23:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710273B3BF0;
	Tue,  2 Jun 2026 23:52:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C32C326D;
	Tue,  2 Jun 2026 23:52:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444347; cv=none; b=c654tf3iMX1uVjemavWLz/Yk2tWghR/qyN9f8EIxEql9zeCb1dYlvI+i95VWWxo4xouWTtABM7eSYwEMz1Z4jJ15K4nH5cSWlYynog1Gf3N3wJZ/JrNC1W73QcaT4e58Q5vSSS3BBz/uYX1wriIPRk3iT/PzOuU/jwXNeZipVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444347; c=relaxed/simple;
	bh=2pM61gANag9UxeUgUTkjFHRngYjQpcHazKMMjoItY3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXY/ExS4mQ9NdWanuexHMjqSIXyPZMnv6LMf5AUkK3vAyPMnMnFJq7WOYngBi59vnSkjNW3XbigtIoa1G32K2PuV3BzvxGqZGy7j30+vmeIuGj7pp0aHgTKIAySxc2Sa0CF1gdLM6rBg4lIYvbhHLxaCh6hiaLFhFEQ8AgRKooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ij+ZvkPd; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780444346; x=1811980346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2pM61gANag9UxeUgUTkjFHRngYjQpcHazKMMjoItY3w=;
  b=Ij+ZvkPdHAWUG3Dk4cVt62+barM3uhWZw+q24WPPuqJ6+WN5oH7Odiaf
   9LZaXD7CrpBpcq64QXn2eK7QvzuaFSh1W+1nUodLJ/JVcPtoRv3ZgTKja
   QzGaE1hdwfGJiVN7r/kOgWqeh5Gj8n5vQo/HJlVeEv8XQk9hnqspzP4bA
   19aAXaARmILUe4iR3NaIYaH/cjIH0NMriApp3Xq3Y+SLEcF0OZL/RggkF
   TVPXCjH+04okffRtIvfURwdCn/NaQjrgdn/Aox/ao77dxnd29UM2ZqSFC
   FkEPQRxDywqkH4jCVuBCk+3Abe+W4omtxZuiE8UyU8rtXef6t3Ewqbdoq
   Q==;
X-CSE-ConnectionGUID: NsEcQSOGQh6URoZ1xWkzXA==
X-CSE-MsgGUID: Hic2+JlJSAGikHaT+6CrIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81370895"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81370895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:52:25 -0700
X-CSE-ConnectionGUID: Iz7V+Vs1Rc6lHE6yo3ifpQ==
X-CSE-MsgGUID: i9d+zh/PTCyMOtMRwX6JjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="241071225"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:52:22 -0700
Date: Wed, 3 Jun 2026 02:52:20 +0300
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
Message-ID: <ah9stBekd0TfMnZX@ashevche-desk.local>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
 <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
 <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
 <ah9TXCcBPNh77Ut5@google.com>
 <ah9rHgAvprCTwEed@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah9rHgAvprCTwEed@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37852-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,linux.intel.com:from_mime,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFB4063303E

On Wed, Jun 03, 2026 at 02:45:39AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 02, 2026 at 03:06:14PM -0700, Dmitry Torokhov wrote:
> > On Wed, Jun 03, 2026 at 01:02:56AM +0300, Andy Shevchenko wrote:
> > > On Wed, May 20, 2026 at 10:13:19PM -0700, Dmitry Torokhov wrote:

...

> > > > +	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> > > 
> > > 	for (unsigned int i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> > > 
> > > ...and drop the above definition of i.
> > 
> > Why? I do not see coding style suggesting this. 
> 
> Linus Torvalds.

https://lore.kernel.org/lkml/CAHk-=wgy8p4is8ApEQCT5NS7XFb+NXeo-TKz7jRRZVksLLBSrQ@mail.gmail.com/

And IIRC it was another discussion (more recent than that) where he again
mentioned nice of use for-loops with local iterators.

-- 
With Best Regards,
Andy Shevchenko



