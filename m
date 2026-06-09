Return-Path: <linux-gpio+bounces-38188-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FH8XMA4qKGpx/QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38188-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:58:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D166616CA
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:58:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JQaECYwG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38188-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38188-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453AA30BC4A6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 14:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB9635E1BA;
	Tue,  9 Jun 2026 14:50:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABF635A93C;
	Tue,  9 Jun 2026 14:50:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016648; cv=none; b=I4f4jWeJkvXJtN/UBKPsQp1vC9GClINWCfB2nJYj15tlymWQPqUJYUOKwgoBhA+0C0+AuHajoiSaNDzhiZ94z5yWKIwaDjWNDU9bBO1AeU/1dCaO3rrMiPezmwoCpEP7Ty3ArwYsEoovnQiSKupURlZjmi65NaNgHQ3kSK54kDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016648; c=relaxed/simple;
	bh=8ZRah/BvDP8vPHrlTm40rI6m9/TLf+ouXW4eK8t2n7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgI8Omg2kKu1ZT64TaMtEBBKR9rr6esuceYiu4LhWIor/U5yuifGZwCb/HVmqy50+K5XBFp0k2OZcFPo/Rai0eyvdUUuOGFxMqcAzTzelTt0V5LyeZdlVWeiE7ph2VNkeagS74xqypHwNvilDnxFnZVmus2O9ikOaJz9mghZkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQaECYwG; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781016645; x=1812552645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8ZRah/BvDP8vPHrlTm40rI6m9/TLf+ouXW4eK8t2n7g=;
  b=JQaECYwGtvpG5Nf2mA6ucuF+TcdUfmCji01yiRwOy7Vn6mZsYszKWgNy
   7OnWA0kHeuN37rPHB1sWpGiPUu2ZFaxxwE1HBkbGMb3iagUiLvo7rs6cK
   CdTol/W3s8exMViZXnzXAC3CdwXjs+1wWBiUmYVCN9Wc4+olFw2MiuWb4
   5xOvy/gApprCiXiKe9BLHhip2H9oC4iIZ8QiXiXH54us8O3VLtKFnUfjr
   NIYsA+bWaT0Vrtn46rffEunHZdz+DZSScEzSqgj4qiw3xb9Kqdg2ui2Y5
   XV2uoteISoNSkb0a/VjUEb1lKb1yXcv+rpD04KN08THKl/M93lx2SPEhk
   Q==;
X-CSE-ConnectionGUID: 1rOKFe/2T/yBN4Azz4Dkfw==
X-CSE-MsgGUID: lpl2lHFLSy2+3ipdjtkcjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81632156"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81632156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:50:44 -0700
X-CSE-ConnectionGUID: g3ru8ai8TEKnIYl+RQ5usw==
X-CSE-MsgGUID: YJhccbKXQTqzE8UsRYAJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245974468"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:50:42 -0700
Date: Tue, 9 Jun 2026 17:50:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: fix cleanup path on hog failure
Message-ID: <aigoP_Of5QturNle@ashevche-desk.local>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
 <20260609-gpio-hogs-fixes-v1-2-b4064f8070e7@oss.qualcomm.com>
 <aigiQ-KR-YHiult_@ashevche-desk.local>
 <CAMRc=Mc3vYpTepkjaPnK11rxveHb24X8O8gX6f=judZW5KGhAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc3vYpTepkjaPnK11rxveHb24X8O8gX6f=judZW5KGhAQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-38188-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,linux.intel.com:from_mime,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35D166616CA

On Tue, Jun 09, 2026 at 04:33:59PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 9, 2026 at 4:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jun 09, 2026 at 02:17:50PM +0200, Bartosz Golaszewski wrote:
> > > If gpiochip_hog_lines() successfully processes some hogs but fails on
> > > a later one, the error handling path in gpiochip_add_data_with_key()
> > > jumps directly to err_remove_of_chip. This leaks resources allocated
> > > earlier for ACPI, interrupts and hogs that were successfully processed.
> > > Use the right label in error path.
> >
> > This seems legit, but there is still a problem with implementation of
> > gpiochip_hog_lines(). Ideally it should clean up the crap it left when it
> > poops. With that, this one will require a brand new label just before
> > acpi_gpiochip_remove().
> 
> Let's get this to stable and then rework it better in v7.2?

Sure. With that idea in mind,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(only patch 2/2).

-- 
With Best Regards,
Andy Shevchenko



