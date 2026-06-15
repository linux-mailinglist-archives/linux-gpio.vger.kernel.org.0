Return-Path: <linux-gpio+bounces-38477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b7yACEbKL2qtGQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 11:47:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D69716852A7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 11:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cmKZM4Ms;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38477-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38477-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A680E3003704
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432693DB339;
	Mon, 15 Jun 2026 09:47:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2510723395F;
	Mon, 15 Jun 2026 09:47:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516864; cv=none; b=F89wsWwoc4XSXyBGX/3RV/pFXxLvWnXO2gzZDjpT4zvJvRxVzLDLc2wQGz8iSclKxHlbku0BGAz1Yv7NhYe9KTenmWq27Cw0gegf9a6OvFYCg9BP5km11HLA/zy8MowGWBQhJtCc7pVPVV+bAI/5r2Yb9C/7XpTzNSUTj1UidTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516864; c=relaxed/simple;
	bh=mE4PuJIymmjeGEqXUP/JEMsaFx5532dilIo4+r9yDzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYAjmDITwP5lnCHrhZQNvH7HEgk/dt4clMS3DvAsWYHA+/JRpAco5v8Ed24Nh7WK5jfAxv4c955gbQoqqlD8ua/c7Rk2Sym4Xf+bybqk4JqIdzD4AvPXJ77LZc3g7aW9iAh4eF/tZrlGw6KHyimI3fXqI21cZtGT2IIHG1gLSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmKZM4Ms; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781516862; x=1813052862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mE4PuJIymmjeGEqXUP/JEMsaFx5532dilIo4+r9yDzk=;
  b=cmKZM4MsoNb1g0vTsgqQsd0hN7gbMaFCNoelFBxWu6d43vcdfLyeE156
   15utEO1Ua9x/tmAiKvVlRAfxq0jmF1jAU1MYEgnPdQQNrYqSOXovwAHas
   EtXiVyn5idv8izer+0GEhE86WCOu4q5pVHdje5fd12+cqKS1eFzn6DROt
   e9Y/uoVtkMtGMGC/p9AIBKv/nT44thsNJBizvarVlEwGNdILyL8UxbMAt
   CHs5B1Au49EMMzoXXH4ZqGmYEnzUkDLIC6DS4P/cZ5OuzO8uI+mRi39tC
   wdE+4xF0XGYh3z7erv6CjkBHnArgRBCdQo3Z6yXVocCoGMUGcaSG/Qw6g
   w==;
X-CSE-ConnectionGUID: Xbj0Gk/pR3anv0mCOcgtVg==
X-CSE-MsgGUID: MY7JX2/KSjOhNenJ2aXDZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82316205"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82316205"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 02:47:42 -0700
X-CSE-ConnectionGUID: obSS9mz8Rq2RRL+/R+qgRA==
X-CSE-MsgGUID: QHR3KKA/QHyOCpL1QvE9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="252382427"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2026 02:47:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 45A7F95; Mon, 15 Jun 2026 11:47:38 +0200 (CEST)
Date: Mon, 15 Jun 2026 11:47:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <20260615094738.GA2990@black.igk.intel.com>
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260615043536.GZ2990@black.igk.intel.com>
 <CANYHO6rT6pPSZAts80YsFmZ8vCNyzmEm94sSheE-0NbUdZ_=OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANYHO6rT6pPSZAts80YsFmZ8vCNyzmEm94sSheE-0NbUdZ_=OA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38477-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,linux.intel.com:from_mime,black.igk.intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D69716852A7

On Mon, Jun 15, 2026 at 03:01:23PM +0800, GaryWang wrote:
> On Mon, 15 Jun 2026 at 12:35, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 12, 2026 at 06:13:31PM +0800, GaryWang wrote:
> > > Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> > > Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.
> > >
> > > The pinctrl-upboard is provide additional driving power & pin mux function
> > >  through native SOC pins -> FPGA/CPLD -> hat  pins for flexable board level
> > >  applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
> > >
> > > Signed-off-by: GaryWang <is0124@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Add brief introduction pinctrl-upboard architecture in cover content.
> > > - Add more detail explaining for pinctrl-tigerlake commit message.
> > > - Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com
> > >
> > > ---
> > > GaryWang (2):
> > >       pinctrl: tigerlake: add some pin groups and functions for INTC1055
> > >       pinctrl: upboard: add device id INTC1055 based UP boards support
> >
> > Both,
> Sorry, I am unclear what Both?

Both patches :)

> >
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

