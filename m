Return-Path: <linux-gpio+bounces-38504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EU24M5oTMGrkMwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 17:00:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7D6876F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 17:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LV1DX8Kd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38504-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38504-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7AF3071C54
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 15:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186B83FF8AD;
	Mon, 15 Jun 2026 15:00:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC15248896;
	Mon, 15 Jun 2026 15:00:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535613; cv=none; b=E5ehJb4hD+XxcOxPNyQV4VO0X+qPECl6VX35/DMVDXMKo+C0dMrTcQAQM/+Tjjj9xOVPtrk2nIfFg4dLxGwJJD32V6I6CwIkQr30lclgez/PUsFuM/+X84siByf42QRh2Yr2/YPkpHc45zKnkJzsBWk/qcxKKet0qvCig1ZwVo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535613; c=relaxed/simple;
	bh=9pYLCBc/jTF18twv2hwTxbQz8ZOTTZCBw7XUurTi4so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZH/uJDDsvSdc+rWCC+tL6Cd/Gq4vKgKYt9cVSCftq4yWDKwa1HSiDR3M9Lh/cM59w5PtWoetm+Ry+3xWAZN/2jJIKbPsLDdE82Sef7AfnAZN/1xGiuPt/xF7fhWVsCIdIhORCq8/FKqmVPsgnPS1+Bexfm2ukqEcIg2DcgCMXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV1DX8Kd; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781535613; x=1813071613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9pYLCBc/jTF18twv2hwTxbQz8ZOTTZCBw7XUurTi4so=;
  b=LV1DX8KdyUAeiJqdmLh30PSF4O3W50aCA29KB1pOQM3Pc2SBWna2brZn
   qxs8rySsN9eOg8pnGn+LsE7fgUbGedPssxyOII3e4UTzsFAXdmXVFqR1J
   grLyoRds+aHThKL/xRWzleIW7SbUVg3QdWi7/XljBmhY09aIyroVUKKz0
   2S92PfH+k/xgzNeUecd7aLe1PsGYI8PL7aQqeCXpqpx7VXYj8dHfWox7v
   ZxrIPZczmXPK1FvCqejv2gV8HBOmNLuekVwp2LtaSnc1hr6vs1R3iWXWm
   mY7v+INChK3HCoNu77CCru+D6B5/5OWDBQAFR8XfXqVBrPHYxRxgCN5hG
   g==;
X-CSE-ConnectionGUID: 1UlM6lDtSk+ayDPXLNwC7Q==
X-CSE-MsgGUID: 7BqyaSk3Tk+qFm6KUx7gZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86178214"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="86178214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 08:00:12 -0700
X-CSE-ConnectionGUID: lkCjPdFDSfiwFjCfTK78MQ==
X-CSE-MsgGUID: VVjYwo2BQLCl+Ej8Sy+kzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="277701033"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 08:00:09 -0700
Date: Mon, 15 Jun 2026 18:00:06 +0300
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
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <ajATdk_OlOKoXEXa@ashevche-desk.local>
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <CAD++jLmFKz19CRp-E=JcUnNkxNzKtSow6T8_9jDpR-wTrs9Ptw@mail.gmail.com>
 <ajAHE29I3IWQNVsV@ashevche-desk.local>
 <CANYHO6pmq+YE3M3kUOegsYwxjfV3qBasX56RSTtwRvVMaFCgPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANYHO6pmq+YE3M3kUOegsYwxjfV3qBasX56RSTtwRvVMaFCgPg@mail.gmail.com>
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38504-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8A7D6876F2

On Mon, Jun 15, 2026 at 10:25:32PM +0800, GaryWang wrote:
> On Mon, 15 Jun 2026 at 22:07, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Jun 15, 2026 at 02:32:51PM +0200, Linus Walleij wrote:
> > > On Fri, Jun 12, 2026 at 12:13 PM GaryWang <is0124@gmail.com> wrote:
> > >
> > > > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > > > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> > > >
> > > > The pinctrl-upboard is provide additional driving power & pin mux function
> > > >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
> > > >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> > > >
> > > > Signed-off-by: GaryWang <is0124@gmail.com>
> > >
> > > LGTM
> > > Acked-by: Linus Walleij <linusw@kernel.org>
> > >
> > > Since these touch Tigerlake, I expect Andy to queue and send me
> > > the patches from his tree.
> >
> > Yes, this is the idea, but first I want to hear form Gary about Up 7000, which
> > seems doesn't work with this.
> >
> It's my bad, the up squared pro has p & n series processor, I only checked the
>  p series.
> The p series is used INTC1055 and  n series is using INTC1057 has confirmed.
> I need remove n series boards, until we finished testing, thanks.

Okay, please finish testing, update commit messages (and code if necessary),
collected tags, and send a v3. Take your time as it won't be proceeded within
two weeks (merge window is ongoing).

-- 
With Best Regards,
Andy Shevchenko



