Return-Path: <linux-gpio+bounces-33384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P6+IPYbtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:15:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29684284B6C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 447D93050C96
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9BF35AC37;
	Fri, 13 Mar 2026 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8thyPr3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB2330330;
	Fri, 13 Mar 2026 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410921; cv=none; b=rzfMuZhX9sX+1C3AY9svNTxsVEHp3V5gQhF2d71eaQsEXLz6gY6erTpB7Xhju+QYwoGhHU9TtXfRG5QbPYgmbNAfUC+N4zZVKzd8Ro/QUnttAgQePSwqBdcRJJZcTA7ALdCI3+r8yTVdtfNiRNRXSruzwNK9HfOWx6+F5DXLAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410921; c=relaxed/simple;
	bh=bsX14uDwqAq1tuVHvovcv5glC+linVe1r2klFkGwZuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDO3HBLL1gmC6v6PhKiO9Y4VTm0x5hjW921REPjKdnY8pMnEE3gzHWykbJgrQU7unDNF/aOWILti5D4/UsBTyKiTzDWMGcV0UxEXwGKlvs6wqd5gGNGKsB/afE4M1f2HbKw/LVDqXsPvYzSVSo+NqBIRx8alRPkS+owNwqxg5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8thyPr3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773410920; x=1804946920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bsX14uDwqAq1tuVHvovcv5glC+linVe1r2klFkGwZuM=;
  b=Y8thyPr3Tp84yaq1utMdUWegTQf5MSfpm+mO1unNB0giTtDMr290lWga
   jbHq2KNcdyxsaFRHFxvP51hylg4oDnGfiznuQsBZf+Yx6JCROx03H6XEe
   fKS1C63MvFVWdNz6WnmNUD0N+5JkhmwhzOw4cqRbv+cIvlYK/g4SL2sdS
   8976jNNDjqH0BJD1Nj/B7uvGRUCfA3nNHsbR09Y81ZBmSe/i4at/ZKjku
   UqLTM+qhaFG7j9fJXXA9C1rPIh9lTQbH7O7jVPUTuq0sKEMOnkiOgh3Uz
   M81wy7G1EZqn/5N7k5n9m2l3eM6eKdJApEzbfVh8YlQci85RWhIWKS/Rn
   Q==;
X-CSE-ConnectionGUID: R7ZzP0s1RQOureP4+0AJkA==
X-CSE-MsgGUID: IBqN/+EkRjO0QaHsh0fsTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74554359"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74554359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 07:08:40 -0700
X-CSE-ConnectionGUID: qDBxMoE7Q3CKSra/16WiaQ==
X-CSE-MsgGUID: z7p95gTgRc6K6MYkpLrasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="216079471"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 07:08:37 -0700
Date: Fri, 13 Mar 2026 16:08:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: timberdale: use device properties
Message-ID: <abQaY7V74Zc80GaE@ashevche-desk.local>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
 <abPlPQMPZyOL_byn@ashevche-desk.local>
 <CAMRc=McJy2Fo4xarGmBtNpDi+7J8mvu_Q3G9wqddUaPhq8rbaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McJy2Fo4xarGmBtNpDi+7J8mvu_Q3G9wqddUaPhq8rbaQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33384-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 29684284B6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:27:36PM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 13, 2026 at 11:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Mar 13, 2026 at 11:04:49AM +0100, Bartosz Golaszewski wrote:

...

> > > +     err = device_property_read_u32(dev, "intel,gpio-base", &gc->base);
> >
> > In drivers/mfd/intel_quark_i2c_gpio.c we use 'gpio-base' and I prefer to have
> > it common since it's Linux only property for now. Alternatively patch that to
> > have a snps prefix.
> 
> So "gpio-base" and "snps,irq-base" for the properties?

Either 'gpio-base' in all drivers that use it only as Linux property
(currently 2 + potentially this one), OR fixing _there_ (in two drivers)
by having 'snps,gpio-base' _there_, not in this driver.

And if you choose the former (dropping the vendor prefix here), the 'irq-base'
with it (vendor prefix) will look inconsistent.

> > > +     if (err)
> > > +             return err;

-- 
With Best Regards,
Andy Shevchenko



