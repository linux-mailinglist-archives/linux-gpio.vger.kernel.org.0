Return-Path: <linux-gpio+bounces-9777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98E96BA57
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 13:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE54B1F21527
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8577C1DA2F1;
	Wed,  4 Sep 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnOBrwJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65281DB528;
	Wed,  4 Sep 2024 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448744; cv=none; b=mKBi5Jo7gimlnnIHKilzmlJMZvlBuIeig5/VNypbpRg4ochewbO+NCrUvk42xOzJU9L8Ls14NfyKVTolajf21siRKCJX8LK4gFFCKB7+GYWa4H0Q0EUTSNCUOnx2lxdcbuyrIe30LJN6PFOJtx0pcM/RzdVGsJLkxqYLQ3kyep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448744; c=relaxed/simple;
	bh=RMUwUVR0lJdDJR8zKGR3+BJ+1H2LYPRWV6S1aONnPBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpvFOHsTeQeCr4QgCkFUnQUnKTVbtHhHWmybGTJcJY63wWX31BqFVX6VVTv0GFvc91DTMMK/XV6aFow1av7J+nc0MmoMrEKKx6JVMhlVKxuVws3bquIeMvOXTPIjX6uAa1v128HkB19JL5qpVNUqVsRJEHilM5/T1kDaKgaNBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnOBrwJQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725448743; x=1756984743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RMUwUVR0lJdDJR8zKGR3+BJ+1H2LYPRWV6S1aONnPBk=;
  b=SnOBrwJQiPVOqyXblR2GCrplfMPnRrM3zf6est34R71OiwdqGA2i3UmW
   lqgunkk4xXqWClIcDV7cWTNYMU2EB3pBz02MP0iqRsoywc/ThTxg2qAqi
   OcJ/Zrd7PtVdU0YblWL6ydx3P0wuwR/qauv6iA6BQJFkiRAK6fFWNkhyU
   IIHVQPJt0zgkqYfaNQC6sbNHB5WLBlUuOPEVQkldQFAh9+MQFIwP8SoE4
   GGgIG0+zAjugTwZUZxKDnQBgoiJFOmVWlPcciIbAJN3giAUvTxa3JmBDw
   dxvDLPbHWiFbSqTtq8XcJ1TShxxNoehd4bAgeHkne8d+qpTwOJL8jawVj
   g==;
X-CSE-ConnectionGUID: cVuXrQbtQZ69Je8YEdc/bA==
X-CSE-MsgGUID: IgCIRRNfSYiwun2q1EypXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27989112"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27989112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:19:02 -0700
X-CSE-ConnectionGUID: 7p9GPIGdQeuPOTol8JUD5Q==
X-CSE-MsgGUID: 5lGMRJ9xQI+9dxeQNIhjuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69634568"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2024 04:19:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4762FAF3; Wed, 04 Sep 2024 14:18:59 +0300 (EEST)
Date: Wed, 4 Sep 2024 14:18:59 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <20240904111859.GE1532424@black.fi.intel.com>
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
 <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>
 <20240904050551.GB1532424@black.fi.intel.com>
 <CAHp75Veb+ycdEVdSPVF7vOE3dcSNVUfPXdDcR35OCo3NPYJPCQ@mail.gmail.com>
 <CAHp75VdzNBct2N+DgEW9mDUytnoOronn4biDEifcpJvtq9Wzug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdzNBct2N+DgEW9mDUytnoOronn4biDEifcpJvtq9Wzug@mail.gmail.com>

On Wed, Sep 04, 2024 at 10:48:42AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 4, 2024 at 10:47 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Sep 4, 2024 at 8:05 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Tue, Sep 03, 2024 at 08:04:49PM +0300, Andy Shevchenko wrote:
> > > > Explicit ifdeffery is ugly and theoretically might be not synchronised
> > > > with the rest of functions that are assigned via pm_sleep_ptr() macro.
> > > > Replace ifdeffery by pm_sleep_ptr() macro to improve this.
> 
> ...
> 
> > > Can't we make this a stub when !PM_SLEEP?
> > >
> > > #ifdef CONFIG_PM_SLEEP
> > > static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> > > {
> > > ...
> > > }
> > > #else
> > > static inline int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> > > {
> > >         return 0;
> > > }
> > > #endif
> >
> > There is no benefit. It's actually the opposite, i.e. it expands more ifdeffery.
> >
> > ...
> >
> > > > -     ret = intel_pinctrl_pm_init(pctrl);
> > > > +     ret = pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_init(pctrl) : 0;
> > >
> > > Then this still looks like a function call and not like some weird
> > > conditional.
> >
> > I understand that, but the point is to make all PM callbacks use the
> > same approach against kernel configuration. Current state of affairs
> > is simple inconsistency, but it might, however quite unlikely, lead to
> > desynchronization between two pm_sleep_ptr() and ifdeffery approaches.
> >
> > Approach that I have before this one (and I kinda agree that ternary
> > here looks a bit weird) is to typedef the function and do something
> > like
> >
> > pinctrl-intel.h:
> 
> > typedef alloc_fn;
> 
> Actually typedef is not needed as it may be embedded in the below
> inline as it's used only once.
> 
> > static inline int ctx_alloc(pctrl, alloc_fn)
> > {
> >   if (alloc_fn)
> >     return alloc_fn(pctrl);
> >
> >   return 0;
> > }
> >
> > pinctrl-intel.c:
> >
> >   ret = ctx_alloc(pctrl, pm_sleep_ptr(_pm_init))
> >   if (ret)
> >     return ret;

I don't think this makes it any better :( We want the driver to be
readable for anyone, not just for you.

I prefer the stub and ifdeffery.

