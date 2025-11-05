Return-Path: <linux-gpio+bounces-28130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A6C367C7
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 16:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58421A427FD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E2E330D30;
	Wed,  5 Nov 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evZxuxqh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363EF329E71;
	Wed,  5 Nov 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357272; cv=none; b=S0PnHkfAxDExrVSffFN2jmoWQJYxDbM5c3yNp/DSvAUZplthRbvxlCJ5pR10T07Hup/kWvTV1Q4yWI3seyMEVAPJ/v736iyiN2qT/zyqtc6Xe/rq4xOtzvatoFYM4OVo8AVZFwFUGzQkuJFdmukbXFzR77LxE90vcMk+DNkfO64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357272; c=relaxed/simple;
	bh=ayVanH2nf5p5ZJVigmu4PMeb54wK2Ew69jyWN6t/oUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LX3httRuj0Nk/lUvRr/6h6U2krm4eWdSOSgA+dktxCaua+sKs7kCLjw4tLsjrj0Tc8vOZsULCYfRFdG0DExlBP7t4wlCDqft9SXn/nhokbl4rEDB4vAlxQ8IS/Re9VpDLw4rSOPMTT1mYMhyN9wjXu3Uir+iHoaH0DILFUY23JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evZxuxqh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762357270; x=1793893270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ayVanH2nf5p5ZJVigmu4PMeb54wK2Ew69jyWN6t/oUA=;
  b=evZxuxqhylIXyGKwaaCIOo1h9uBAIPIHpFuh8C7gdmciYYBAar4Quiml
   nshVgWfNmx/sG7sW87FdtGHkN/xxkBHQMqbha0Utl78z1WcE4RbQ5ONp1
   Ng8VcesnlFxVetQux/QZs1aHCiftk7vTdFYNFpBJ6PPHdz6LDN6+BF6Vl
   2zv9DpAXYeRmW7+VncAslJXiJhhfkE5+1TAU/2lKNV/QZ2V+NqCbpw8TO
   EJhWJW7Uzumme5Oq0DYOrRBWrZSR8KcbXhGqZhGE5hKoxZj1Glos7OBXG
   nY9cZ8W72HNSZ+E8MMvKmDf37wQY0YIRSwcOVjZkAu024AqsUP7ECugdo
   w==;
X-CSE-ConnectionGUID: yEtYWY2nQ+ua1Imt2tFhSA==
X-CSE-MsgGUID: lqHeI26vRHaD3V+duKnmPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64389740"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64389740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:41:08 -0800
X-CSE-ConnectionGUID: hi73EwR1TGGZdBu2Nlr8Gg==
X-CSE-MsgGUID: vx2a1o1FQLSpf4wRdz1gyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="218131339"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2025 07:41:06 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2A1BB95; Wed, 05 Nov 2025 16:41:06 +0100 (CET)
Date: Wed, 5 Nov 2025 16:41:06 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <20251105154106.GO2912318@black.igk.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com>
 <aQs3ls1rKgMOufOn@smile.fi.intel.com>
 <20251105115041.GM2912318@black.igk.intel.com>
 <CAHp75VcLNs0EWLED_5Mmr0V3nVoiEdKNpdoqPypy5i5jJCSd1g@mail.gmail.com>
 <20251105115535.GN2912318@black.igk.intel.com>
 <aQts5fqrNaEhHQyp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQts5fqrNaEhHQyp@smile.fi.intel.com>

On Wed, Nov 05, 2025 at 05:27:33PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 05, 2025 at 12:55:35PM +0100, Mika Westerberg wrote:
> > On Wed, Nov 05, 2025 at 01:51:58PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 5, 2025 at 1:50 PM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > On Wed, Nov 05, 2025 at 01:40:06PM +0200, Andy Shevchenko wrote:
> > > > > On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> > > > > > On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> > > > > > > Replace custom macro with the recently defined INTEL_GPP().
> 
> ...
> 
> > > > > > > -#define ADL_GPP(r, s, e, g)                              \
> > > > > > > - {                                               \
> > > > > > > -         .reg_num = (r),                         \
> > > > > > > -         .base = (s),                            \
> > > > > > > -         .size = ((e) - (s) + 1),                \
> > > > > > > -         .gpio_base = (g),                       \
> > > > > > > - }
> > > > > >
> > > > > > I wonder if simply doing this:
> > > > > >
> > > > > > #define ADL_GPP(r, s, e, g) INTEL_GPP(r, s, e, g)
> > > > >
> > > > > We can, but it will give a couple of lines in each driver still be left.
> > > > > Do you think it's better?
> > > >
> > > > I think that's better because it is less changed lines but I'm fine either
> > > > way.
> > > 
> > > Okay, I will try it and see how it looks like and then I'll either
> > > send a v2 or ask for a tag for this one. Sounds good?
> > 
> > Yes.
> 
> After more thinking I guess I want it as is (here in v1). In cases
> when we define some parameters differently it will make sense to have
> an intermediate definition, but here. Can you give your Ack, please?

Okay sure,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

