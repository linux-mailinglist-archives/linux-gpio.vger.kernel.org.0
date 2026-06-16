Return-Path: <linux-gpio+bounces-38582-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uLZqFgQ0MWrGdwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38582-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:31:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A141068ECCD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:31:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ARchONdn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38582-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38582-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9BCC30DEF1D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EF83BAD94;
	Tue, 16 Jun 2026 11:28:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BEA1C84D0;
	Tue, 16 Jun 2026 11:28:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609286; cv=none; b=CRko4+QGRjvJ/JjSm2fRLvvJuOyzA4z3wxkjFyedj5jgbAYkNEJHsiZhYf+9zmHhfubBASU3zCWqzKKOKlqLgPIHc+KMyfq5XbsiJ7hjxtpELaNwJuFiA4D8XynZheVB5bjsATeY1f5QiGMECf2wntNQSJFszXgjIsqmoV1OjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609286; c=relaxed/simple;
	bh=BevoRmG45Jkao3FuAuZVdYIz8aGDbap8ww4eZ5bcFlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLYrqzeg8hz/GRh2Fy0cKnHJCx6fR2sSRJNwdpcJ0pO5TsP0M7BXB/pX14EYVUaBUhnrSTeurQGw9zPjNmiDkeWjJ4MNixuXOvFh5Z5IxPRLN5/9J4+m48vYxsT+6kkrXT2VBpOsMRVtHRnENHORjq+T0yGZ6cPmfAk0i+sK6Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARchONdn; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781609285; x=1813145285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BevoRmG45Jkao3FuAuZVdYIz8aGDbap8ww4eZ5bcFlo=;
  b=ARchONdn5fKOlYMypDjLlNKZZFS65sHp1c8x60H9ducOqSmJHdG9Vl1r
   5ibqrJ1hfYcajDRW80nVKJOwrd3TB1ud2QyElVMjnJvVUf+3kxIBMEr40
   kvn/O41mU/64OydmOqsRZggXOgW0j+40YMMi7ei/2or22wZl4v+KepsuG
   MfSrftoym235eG7DlNVxTwJZi4WrH3R3qLOD9WavVINjy5giIVH8l+RlA
   kADfi9yIw3TUR7fyMYQaulITwQjlelxk9oJeXee0bOHQIsrqW8R1LTlp1
   TFMYpnj9HgPslooUzj2SU6q0HGZYxbpIVxkp/q6hwH68Wbns3w7wIJbxO
   Q==;
X-CSE-ConnectionGUID: 33vfrLYeRGeJkf8IuEq1/A==
X-CSE-MsgGUID: yQVa6qqjTIaVXuogRl3V+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82383132"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82383132"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:28:05 -0700
X-CSE-ConnectionGUID: igFuSn7zS72WMLkpA1g5UA==
X-CSE-MsgGUID: g6Ty4ckDRJO6xneLPKSKgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252718911"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:28:03 -0700
Date: Tue, 16 Jun 2026 14:28:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: Re: [PATCH v6 0/2] gpiolib: acpi: Add robust bounds-checking and
 safe address handling
Message-ID: <ajEzQDcuDAG_mHaS@ashevche-desk.local>
References: <20260610154204.110379-1-scardracs@disroot.org>
 <20260612085257.GY2990@black.igk.intel.com>
 <CAMRc=Mcv7SWVYA6rNZo+-tYx_ohOdedkewLZOa=X1Eei=1fTzA@mail.gmail.com>
 <ajEkvstS6RgRTATK@ashevche-desk.local>
 <CAMRc=MeKdP46ohf=hJQRo=afe8WhTQ5yo+Zu3f34h-E4BiuSmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeKdP46ohf=hJQRo=afe8WhTQ5yo+Zu3f34h-E4BiuSmQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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
	TAGGED_FROM(0.00)[bounces-38582-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:mika.westerberg@linux.intel.com,m:westeri@kernel.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:scardracs@disroot.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A141068ECCD

On Tue, Jun 16, 2026 at 06:42:34AM -0400, Bartosz Golaszewski wrote:
> On Tue, 16 Jun 2026 12:26:06 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Tue, Jun 16, 2026 at 02:54:02AM -0700, Bartosz Golaszewski wrote:
> >> On Fri, 12 Jun 2026 10:52:57 +0200, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> said:
> >> > On Wed, Jun 10, 2026 at 05:42:02PM +0200, Marco Scardovi wrote:
> >> >>
> >> >> The series adds explicit bounds checking for GPIO pin accesses and
> >> >> ensures safe handling of ACPI addresses in OperationRegion handlers,
> >> >> without referring to truncation or wrap-around behavior, which does
> >> >> not apply.
> >> >
> >> > I'm fine with these now.
> >> >
> >> > For both,
> >> >
> >> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >>
> >> Andy, Mika: do you want me to queue these directly for v7.2?
> >
> > I believe there is no hurry, but I have no objections if you pull it in.
> 
> Your call, if you thknk these should wait until v7.3, I'll leave them for now.

For the full consensus we need Mika's opinion :-)

-- 
With Best Regards,
Andy Shevchenko



