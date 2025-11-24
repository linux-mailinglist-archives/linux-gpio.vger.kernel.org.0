Return-Path: <linux-gpio+bounces-29032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AF1C8146F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 16:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FDFE3A63E5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD8D31328E;
	Mon, 24 Nov 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ui+1Jsry"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657527FB1E;
	Mon, 24 Nov 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997453; cv=none; b=SMPzKEhaa0RY1waZwuUuoYMKXpUyQrC160kxR6r9MdDmk2rnLxBg4TbIzJ+hBoLHIm39io9VTUtfNWjMhOXo5uaZH3iXKeQ7eH49js2QuDmg0woMZsQphbAdubMtunnVeZtDAJiMrF60fXI7D3Gjpk2/asNhYvawuKVnqxKCdcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997453; c=relaxed/simple;
	bh=x0uOwhcgX62MgVEbKMaR1GMOYL/hXhDCZZRQClzW0lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsXgL8qjvrVd6F+riupxfJ557czq+TZCmBcACb/DmKoY+sWLMIrJHpbLqGgoYC6+keAG0kb1l1DVVgfTRaJRy53x7tdQ0OX6GRza6se7bBbKQkH3ymNEi4wgauw5KkuBQ95Z9NkU+Qm0JVqt3YKbbqChJx9VucagjLKNPLBbMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ui+1Jsry; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763997452; x=1795533452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x0uOwhcgX62MgVEbKMaR1GMOYL/hXhDCZZRQClzW0lo=;
  b=Ui+1JsryRAhhSP7AdEtiaprPKk9Ko+IIYHEJs6zO+/T/34aUEX2vKQ2X
   xrRII4UYZcv1/3QmY0qxM5GZN2gGD3PuPOUaIYC73ULOE8KjKv6bEw4Mc
   xSguHm4suSOELiy0flskWL6DsE01Jugr51wZ0tOsb7aamCiIZqvoMJ092
   KvZpuZI+FUfV/uEtSZ09I7UOprn8xXP1FLiilv38F45HmJ+GkVDvLEsQ5
   Dw0ceAQCYzFQCCye62ohdvsAcjBsqtSAJ4uSgNY/tZQ0iP8k5mmjvJui4
   FpSLdc/KvEqle93G0dZPTTUjuE43Swh9FLVk6lB9rPuHsEaGV++ymKMvt
   A==;
X-CSE-ConnectionGUID: Po9YqpBuQ2OFZpHihVwokw==
X-CSE-MsgGUID: W0XIf1Y/RQ2pJiy8PuEV4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65948986"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="65948986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:17:32 -0800
X-CSE-ConnectionGUID: QCjIeMmcS0C86okVtibT9w==
X-CSE-MsgGUID: G19QPtMhR6GW1RhWgN4a/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="193147709"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:17:25 -0800
Date: Mon, 24 Nov 2025 17:17:23 +0200
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
Message-ID: <aSR3AwjQnB6EH7Nv@smile.fi.intel.com>
References: <20251124002105.25429-1-jszhang@kernel.org>
 <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
 <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
 <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
 <aSRwXCfG1RimQZxX@smile.fi.intel.com>
 <CAOiHx==4NSMNVdW163nE-vYf_FtDjS5aHfj5chPr3n6D2Mt9Nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx==4NSMNVdW163nE-vYf_FtDjS5aHfj5chPr3n6D2Mt9Nw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 04:05:29PM +0100, Jonas Gorski wrote:
> On Mon, Nov 24, 2025 at 3:49 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Nov 24, 2025 at 03:20:00PM +0100, Jonas Gorski wrote:
> > > On Mon, Nov 24, 2025 at 2:52 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Nov 24, 2025 at 2:40 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> > > > > On Mon, Nov 24, 2025 at 1:39 AM Jisheng Zhang <jszhang@kernel.org> wrote:

...

> > > > > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> > > > > > -       .suspend_noirq  = brcmstb_gpio_suspend,
> > > > > > -       .resume_noirq = brcmstb_gpio_resume,
> > > > > > +       .suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> > > > > > +       .resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> > > > > >  };

...

> > > > > > -               .pm = &brcmstb_gpio_pm_ops,
> > > > > > +               .pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> > > > >
> > > > > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > > > > !CONFIG_PM_SLEEP?
> > > > >
> > > > > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > > > > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > > > > all other *_DEV_PM_OPS() macros do).
> >
> > Do they? I mean the modern ones and not that are deprecated.
> >
> > > > Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functions?
> > >
> > > pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
> > > reference then anymore to brcmstb_gpio_pm_ops. You would need a
> > > wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
> > > avoid the warning, or add __maybe_unused to it to silence it.
> >
> > PTR_IF() magic is exactly to make sure compiler will have a visibility while
> > dropping a dead code. Did I miss anything?
> 
> No, I just was working with old assumptions, so my bad. I faintly
> remember that they used to work that way, but maybe I also
> misremember. TIL. So disregard my comment.

NP. I'm glad everything is clear now about them.

> > > Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
> > > with it (for that reason I assume).
> >
> > Both are deprecated. Not a good orienteer.
> > None of the new approach uses __maybe_unused. (See DEFINE_*() macros in pm.h.)
> 
> Maybe that some were using it was confusing me into thinking it is required.

-- 
With Best Regards,
Andy Shevchenko



