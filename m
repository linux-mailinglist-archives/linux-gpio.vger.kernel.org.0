Return-Path: <linux-gpio+bounces-39159-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eLOjJe+tQmpq/gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39159-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 19:39:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE66DDCDC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 19:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Fm8fW3iU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39159-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39159-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C3AE301C96D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3215382F02;
	Mon, 29 Jun 2026 17:39:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57483283C93;
	Mon, 29 Jun 2026 17:39:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754790; cv=none; b=E2Rkh4arjrTjSEGop9kCF2q3rIw7FKuAaFTZEYkbEjLqMkIBXQfaaT1zU4gy+XiRLY0HtGNKKH4J1ml+Ft4jREyMgES/gdLBZolw6mcFvL79BMh0aHE3NUS0XNsStFmlnw9l+4oMfIfCuN+H97N69uGPCOLqdYJ3UvNWlLAEwro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754790; c=relaxed/simple;
	bh=UR6jWLH7xJZvqZ+7LW3JOJHFIJ5aBB7dgb1k5wzphIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DloOC+rYGvIZvqADFj/BcO3L6sZ4hJzT71svhHnSUJsyPyLRpstFmtkQqsroU7h5NwS0El+eK5x2/IzHMcz0r6K+PkYsGTAeYGZDLXzcIHmfvuSgVf0jfoXvMgWj/yieW/8cPb6K5+WTt5caaazpXMhyLRfHOos+QyMmowQk59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fm8fW3iU; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782754789; x=1814290789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UR6jWLH7xJZvqZ+7LW3JOJHFIJ5aBB7dgb1k5wzphIY=;
  b=Fm8fW3iU3a5iqYSY0ccA09frOFzTxF0y9nnN426DGroHzdCwvw4759+L
   7JzWs7KD9E/r3ze8Wrt43Mq331CniVrCUAi08BHXM+RvtlY0mdoD4ptUe
   qK5LCSgFdi9WTXl1JtOjwKVS8kre72P8V3QW0NuJcdi+kpq5FBIS1FN7h
   Q+n42V+oYykSuUBUa9YoUfjRKXQx3wW5GEvw1mCltj/v4KLB6fAtfx3SJ
   Irwvi/Nk5XwQ4fpHCjJa52dLyZpMnfh/FPqTnMiOFLS2hHV7A8pZjMhma
   zzOJXL/SBGWBG/5TECFpmbRbdvG1dEKrwcphE9jtdLTwlxWUgAS1qs6Yr
   g==;
X-CSE-ConnectionGUID: hQRAdcacRfaTH9E8DjexuQ==
X-CSE-MsgGUID: Tbuzs9TiTn6YiJCOQOyEMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87145438"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87145438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:39:49 -0700
X-CSE-ConnectionGUID: 2xY5WwNiT/mLx8dYdK3kxA==
X-CSE-MsgGUID: kDCSAKzXT62VPYog1qHKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="256940635"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:39:46 -0700
Date: Mon, 29 Jun 2026 20:39:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <akKt4PV5E6lYpEZV@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <ailxCrCYXPkrKqi-@ashevche-desk.local>
 <CAD++jLkRW+wmf_oFVmmn8bN0ZbS=8vZvV8nWJyy9Zb4O3LP-dg@mail.gmail.com>
 <aircdlL323BTioZE@ashevche-desk.local>
 <CANYHO6rUVm=6WQSemJhMoVV5owPAL=4Nw4cFxULaKmq3fG36=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANYHO6rUVm=6WQSemJhMoVV5owPAL=4Nw4cFxULaKmq3fG36=A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39159-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06DE66DDCDC

On Fri, Jun 12, 2026 at 01:05:35AM +0800, GaryWang wrote:
> On Fri, Jun 12, 2026 at 12:04 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Thu, Jun 11, 2026 at 02:30:00PM +0200, Linus Walleij wrote:
> > > On Wed, Jun 10, 2026 at 4:13 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Wed, Jun 10, 2026 at 04:34:22PM +0800, GaryWang wrote:

...

> > > > I can take both via Intel pin control tree, just waiting for Mika's and Linus' acks.
> > > > Then I can send PR to Linus to (try to) include this to v7.2-rc2 as it seems close
> > > > enough to the category of adding new HW support without breaking anything else.
> > >
> > > Excellent, thanks.
> > > Acked-by: Linus Walleij< linusw@kernel.org>
> >
> > Thanks! I consider that for both patches. Gary, please send a v2 with all tags
> > and elaborated commit messages and cover letter to address Mika's questions and
> > concerns.

> yeah, no problem to send patch V2 ASAP.

Did I miss v2? If not, now is a good time for it.

-- 
With Best Regards,
Andy Shevchenko



