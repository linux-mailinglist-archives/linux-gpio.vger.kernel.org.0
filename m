Return-Path: <linux-gpio+bounces-29027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45503C8126D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3563AE3A6
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 14:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F28290D81;
	Mon, 24 Nov 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2U0TgBO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E328C862;
	Mon, 24 Nov 2025 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995750; cv=none; b=tl7RHI8HdfU82//x3dCnl530t5CuBd+aGc+1QtOjA71AQ99sBfdk11oh104KnNlbA1ltTDwcAvIQ+le+t72Uz/VePZxNsYi/3nRARq91C8LbfvKCPSF70GewBDrlFbEs7ueHRriXmyCGXF+3T7b+rT4Ce3lTvr3UAnHH5YK2kf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995750; c=relaxed/simple;
	bh=LNf4WNIHIFdssBgMpM3fnvo7unwtTh5Go5hNJc/SF7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX+DaXvmq765zaTptw5SXyZC7YdyFTqcGhgJkA5883+cL5B56NFcPKgYDRCCrHgYOTH8TQke7ZVLlJYqTgwpuQD2WF51b/kD61lAg1xdd8TQSNTOj+gjQ+3EHUn4UNLUT25m/5DCrbJM8RbDtPXAA1XcN5HoyBPJXedLDMd13HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2U0TgBO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763995749; x=1795531749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LNf4WNIHIFdssBgMpM3fnvo7unwtTh5Go5hNJc/SF7k=;
  b=M2U0TgBOImJCIdtBZwS9GzdLS2cdsVsfgo8gZsnnPIG03AK9QiPfOWTl
   oT3DvRfnsw5I36/IuvSZmk8+CvSMZC0G13j7ZsZfpy1vNWd4CzB2Q/sb6
   BHDiwhW9nqargLeJCvo8lT7UMgB+0nWx3CAFJN2/WDvPQ5fnUBGSKd818
   ywlnSi/MszuDqMuBeE7nTfV5501/qj8/Ua4FxspfT1sqZk7OHLS041t/J
   eBxQY8OemqqNiATvJhHywObu5Cxjwlh7VaCKk5Sy28dqxDJqulq4UDs1F
   QiKnqPpyZL4U7pA3748JG3VCUWyU8sjMx/eTZ/SOmJD78+I3dMpDxUE/+
   w==;
X-CSE-ConnectionGUID: 3Nab82xmSvCoAaUFrLZ1pw==
X-CSE-MsgGUID: kRS3B4RlQjSOrdT7NmMJGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="64996483"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="64996483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:49:08 -0800
X-CSE-ConnectionGUID: GBdErrPpTACXKcxnLzLfgw==
X-CSE-MsgGUID: Mi0Pd/9wRjyTH3ysTkVOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192815282"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 06:49:03 -0800
Date: Mon, 24 Nov 2025 16:49:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
Message-ID: <aSRwXCfG1RimQZxX@smile.fi.intel.com>
References: <20251124002105.25429-1-jszhang@kernel.org>
 <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
 <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
 <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 03:20:00PM +0100, Jonas Gorski wrote:
> On Mon, Nov 24, 2025 at 2:52 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Nov 24, 2025 at 2:40 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> > > On Mon, Nov 24, 2025 at 1:39 AM Jisheng Zhang <jszhang@kernel.org> wrote:

...

> > > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> > > > -       .suspend_noirq  = brcmstb_gpio_suspend,
> > > > -       .resume_noirq = brcmstb_gpio_resume,
> > > > +       .suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> > > > +       .resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> > > >  };

...

> > > > -               .pm = &brcmstb_gpio_pm_ops,
> > > > +               .pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> > >
> > > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > > !CONFIG_PM_SLEEP?
> > >
> > > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > > all other *_DEV_PM_OPS() macros do).

Do they? I mean the modern ones and not that are deprecated.

> > Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functions?
> 
> pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
> reference then anymore to brcmstb_gpio_pm_ops. You would need a
> wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
> avoid the warning, or add __maybe_unused to it to silence it.

PTR_IF() magic is exactly to make sure compiler will have a visibility while
dropping a dead code. Did I miss anything?

> Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
> with it (for that reason I assume).

Both are deprecated. Not a good orienteer.
None of the new approach uses __maybe_unused. (See DEFINE_*() macros in pm.h.)

-- 
With Best Regards,
Andy Shevchenko



