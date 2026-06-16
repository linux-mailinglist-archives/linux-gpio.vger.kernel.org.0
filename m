Return-Path: <linux-gpio+bounces-38576-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G5O2MQ0lMWqgcgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38576-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:27:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C36F68E401
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:27:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EUJLuxFH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38576-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38576-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED5B3035B95
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 10:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54E03B7B6B;
	Tue, 16 Jun 2026 10:25:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7F31F98D
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 10:25:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605510; cv=none; b=sfKOBOWsqH4BNPl0AP9ifayq2fC4r7Io7l0HPGVOnBPiZsgacd6xzRDRMuNMEu7zNS71yaHIvx/dMHeDtyiLcGgIRAg75XqZcxowIWasOg0TEVlSjI6qypUZdN2Sovjh42fJc5yYL3hY2SCqu0qVTmY4prNZU5HJxAhx7SGNgoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605510; c=relaxed/simple;
	bh=vj07sm2h+YzWHhzFZsmOQ6QzTidjtIvuNohK7BH47Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moIHkltsBvxtWgFl8BcttJ89SU13TRovDJsRzGQJksZ3HKkVHvbrpme6GdeKlOk3a2FC7tg4HRhvkN0cYjuMVD0bCRs3hvTLj6JH8cUO9Z57B231UDX0LCvKssmQu/0KpNAKaqy35Ly5kfA2rjVNjCemEMk0wRFAmiwKUv0XPQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUJLuxFH; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781605509; x=1813141509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vj07sm2h+YzWHhzFZsmOQ6QzTidjtIvuNohK7BH47Ig=;
  b=EUJLuxFHFs56Am0+yrPK4jmhJRbB4fiuB0he9t7qIh3gmor/s05M7mac
   whojh59NXO1umyYoTxtMHqQ48VrvMUn1GSkJ3T8/mmW3TTR+wlBUv4tZ4
   NIeQRPzuJCwyjLk6Je8NJx60C6BOH0wsr3Xqf/exQP6iVcrTX1SVSv4PV
   B/qDPt2ZBZCdMk3APBZx+fGF5TVg4wBhM+LD/QlLa53vuSiQiSdY06E5G
   SSOpshjlXZMJL2tIySZceriubTnAs6wMFJp7Bi4q3AXvOqmKHU+1hgrxF
   lWIoOd+3WVkk7ctv4692mHlTOCkSOg++HMJL/i0s+TdTup2dHbPAlLNXh
   g==;
X-CSE-ConnectionGUID: tsie7mLDSailai7A3uY89g==
X-CSE-MsgGUID: 7NPFlemMSKWVQ54QE8UyYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82351707"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82351707"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:25:09 -0700
X-CSE-ConnectionGUID: MzcdbAGaTRiqrNdLFrVCyg==
X-CSE-MsgGUID: KDySHh6JRRGxeiXChwnvVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="241353891"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:25:08 -0700
Date: Tue, 16 Jun 2026 13:25:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [GIT PULL] intel-gpio for 7.1-1
Message-ID: <ajEkgbP6wEoBkpPi@ashevche-desk.local>
References: <af18zdP5HF3_P9Vo@black.igk.intel.com>
 <agOJ0LrqDSbhHPi0@ashevche-desk.local>
 <aiZglQb9hQwNeApB@ashevche-desk.local>
 <CAMRc=MeGFJFs-zL4+Q23HAnW6C+Y5JTvHBntQ9+4+UNNjkU-kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeGFJFs-zL4+Q23HAnW6C+Y5JTvHBntQ9+4+UNNjkU-kg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38576-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:andy@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C36F68E401

On Tue, Jun 16, 2026 at 11:59:02AM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 8, 2026 at 8:26 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, May 12, 2026 at 11:13:04PM +0300, Andy Shevchenko wrote:
> > > On Fri, May 08, 2026 at 08:03:57AM +0200, Andy Shevchenko wrote:
> > > > Hi Linux GPIO  maintainers,
> > > >
> > > > A single fix for ACPI interrupts handling on boot. Have been in Linux Next for
> > > > a while without reported regressions. Please, pull for the current, v7.1 cycle.
> > >
> > > Bart, any issues with this PR?
> >
> > What's going on with this PR, please?
> 
> Hi! Sorry, I have no idea why this didn't trigger my PR filters.
> 
> Now pulled. I'll see about fixing the filter, in the future if I don't
> respond to your PR within a week, send me a direct email to
> brgl@kernel.org.

I will try to remember this, thanks for pulling!

-- 
With Best Regards,
Andy Shevchenko



