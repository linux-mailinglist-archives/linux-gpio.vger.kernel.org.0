Return-Path: <linux-gpio+bounces-38583-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4RsIJzI4MWr0eAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38583-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:49:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE168EEA8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:49:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=AsrNqr0p;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38583-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38583-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18DFC30182CE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EE442B75E;
	Tue, 16 Jun 2026 11:49:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390F3BE652;
	Tue, 16 Jun 2026 11:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610541; cv=none; b=Qv3RY1AuPFlNj9H9KDssUw7JqSomheAuldNoIIMyRbN1MMWSQXGrehmvAv1I2O5HVYz0MHVGJCylDvQx1rw3jB8vqE0k+pDyWlp2b78+lS/X9pMsp4pxtvi6IoD02W3crYbqPsBc4FzgZoKGIqV1UU+PZty6f093t6SvPPz/q1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610541; c=relaxed/simple;
	bh=aO45Q+jDcjXxxuMlM8sy4Wk/rgS0vfzneOUX2otqAOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3K9VuSWSw3nDEDe4M6xjxTDDT8jLYiN5AJWXi+WgJbk3iYbn5IdtCVdgfv1pvCZjQAV1YSsoAP15gF4wjOhvoqGSQAj6hquZI3k00UMc0AoPSxjKS1CPNjBp0gIW9sXgtnpTmbaTNoS1RhpKaCYN/qe9Tu6dilPkyJo1dQHAFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsrNqr0p; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781610540; x=1813146540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aO45Q+jDcjXxxuMlM8sy4Wk/rgS0vfzneOUX2otqAOg=;
  b=AsrNqr0pVFnH9a5GgXIdFzuIFMRBUHlyec3DZxYBtIOt72SwYMGxJbEO
   dL3Xrsz3Gh4itAHGUmofxoCLN8Egwgw1rteY3IGG2vv4z7i8cs/RdyqXf
   j9TE5Etq6nRdWXyJlJFR3IF714Y7I3qlRg30qI5Ex258nkmL66eaH+3dR
   woHRWCesTiumvhYYw2AojB/Wh4U44/du+fGr2q5K1XmAjl/B4zAbnfYVa
   DmmjCittcusBaH7BJ4t/6Raw9H43KpnvqcJCYAWPIS6cYYgydniuhJ8ij
   fPYc7GetP/IpFWaHDaYONn9jl+VRYzLZX023j8q2KPxaNIJsWQrRZPvYO
   g==;
X-CSE-ConnectionGUID: mHSSzoNPT+ue5XHsrSB6yg==
X-CSE-MsgGUID: t6DfZr0mTsqR6Qaqg1QQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92933095"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="92933095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:48:59 -0700
X-CSE-ConnectionGUID: /C4kQM+HQdGrxKiAx633CA==
X-CSE-MsgGUID: yJmUAN9uSc6404gneupX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252871137"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jun 2026 04:48:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F217698; Tue, 16 Jun 2026 13:48:55 +0200 (CEST)
Date: Tue, 16 Jun 2026 13:48:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: Re: [PATCH v6 0/2] gpiolib: acpi: Add robust bounds-checking and
 safe address handling
Message-ID: <20260616114855.GD2990@black.igk.intel.com>
References: <20260610154204.110379-1-scardracs@disroot.org>
 <20260612085257.GY2990@black.igk.intel.com>
 <CAMRc=Mcv7SWVYA6rNZo+-tYx_ohOdedkewLZOa=X1Eei=1fTzA@mail.gmail.com>
 <ajEkvstS6RgRTATK@ashevche-desk.local>
 <CAMRc=MeKdP46ohf=hJQRo=afe8WhTQ5yo+Zu3f34h-E4BiuSmQ@mail.gmail.com>
 <ajEzQDcuDAG_mHaS@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajEzQDcuDAG_mHaS@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38583-lists,linux-gpio=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sto.lore.kernel.org:server fail,black.igk.intel.com:server fail,intel.com:server fail,linux.intel.com:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:westeri@kernel.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:scardracs@disroot.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.intel.com:from_mime,black.igk.intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BEE168EEA8

On Tue, Jun 16, 2026 at 02:28:00PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 16, 2026 at 06:42:34AM -0400, Bartosz Golaszewski wrote:
> > On Tue, 16 Jun 2026 12:26:06 +0200, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> > > On Tue, Jun 16, 2026 at 02:54:02AM -0700, Bartosz Golaszewski wrote:
> > >> On Fri, 12 Jun 2026 10:52:57 +0200, Mika Westerberg
> > >> <mika.westerberg@linux.intel.com> said:
> > >> > On Wed, Jun 10, 2026 at 05:42:02PM +0200, Marco Scardovi wrote:
> > >> >>
> > >> >> The series adds explicit bounds checking for GPIO pin accesses and
> > >> >> ensures safe handling of ACPI addresses in OperationRegion handlers,
> > >> >> without referring to truncation or wrap-around behavior, which does
> > >> >> not apply.
> > >> >
> > >> > I'm fine with these now.
> > >> >
> > >> > For both,
> > >> >
> > >> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > >>
> > >> Andy, Mika: do you want me to queue these directly for v7.2?
> > >
> > > I believe there is no hurry, but I have no objections if you pull it in.
> > 
> > Your call, if you thknk these should wait until v7.3, I'll leave them for now.
> 
> For the full consensus we need Mika's opinion :-)

If we can get these for v7.2-rc2+ or so that would be good enough IMHO.

