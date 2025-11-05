Return-Path: <linux-gpio+bounces-28128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D8C36774
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 16:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D3CC2503BEB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 15:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6BC34D3BD;
	Wed,  5 Nov 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIPDW3Zo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7321CFF6;
	Wed,  5 Nov 2025 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762356480; cv=none; b=D7P+lSGqPyvHFgCh2CJ3dANgGrGzVGnnIuuOlMKDi7v7OSyS9fJXC9swE6dOCxp4NmAcO+gIwRy1v9EPmrWoAqCOewZwOgQGXAfBd9QcGGRNVvhL8yUPvqkudO+DRK6Oz1i/ECA1Qw9nHxr7xhQt/qWrY+yXbiHCLUhKYGCd0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762356480; c=relaxed/simple;
	bh=mbTlga28qUCVVj27wEcGJhoz+SMneLpcOnAeAYlxULw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czkC24WLHyxaPRAfUkV5h65ig/JJEve+Elq3IyRoqFQxmt2Xk+WegHBOBmEgJM9zEOv3I1MXBx2f6KRerfGOYmotRKG3UP9hkyEtbmNDP/nizPmRU4rISLWPI+bhjxLoD1RRBzWfnLpooYk+ymhfjfEVSiq3Xjo4ZMnQ7I1h4LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIPDW3Zo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762356478; x=1793892478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mbTlga28qUCVVj27wEcGJhoz+SMneLpcOnAeAYlxULw=;
  b=iIPDW3Zo/4XgCvil5tTe/KhXx8ja1ySdTm+3vO0h1P1XyhJ6B6HYt5lk
   RnzHnIU3iZhvCAb8AuTiOlXZAQTCyaBp03nn7wyyTjoXjRPayihCIxfyP
   zqWCnlTYVuZm8nuujjtnMtB/sMH5oT6lZltey7FIbK/Hs8sgekD8aTgNc
   xJhAbeZqmkaF6j0VQMU2v2r3Qt5xwPUQ28mU3v/TOknBG24iKoeplrvSi
   8y1TScBI8Nt3l0JViVkD0q3n5JdBC3tIjztyCZNdqYYWmR/csxuyFH20y
   5ejYI4AjYrQypTiNJ0Oa9WwstXBjtoHvhT2pWYBieoJSBi87flx5nwXLf
   g==;
X-CSE-ConnectionGUID: ntMz2CpFRCmaA4z7kcbwEg==
X-CSE-MsgGUID: 3rSgGDygQESnMAvABQQ5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67089815"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="67089815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:27:40 -0800
X-CSE-ConnectionGUID: 4Le2k0x6Q9eo1/p65WAbnA==
X-CSE-MsgGUID: KLIgVi9nRPCM8ZRXtz8m/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="192654288"
Received: from ldmartin-desk2.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.135])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:27:39 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGfQ6-00000005pDF-2qdF;
	Wed, 05 Nov 2025 17:27:34 +0200
Date: Wed, 5 Nov 2025 17:27:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <aQts5fqrNaEhHQyp@smile.fi.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com>
 <aQs3ls1rKgMOufOn@smile.fi.intel.com>
 <20251105115041.GM2912318@black.igk.intel.com>
 <CAHp75VcLNs0EWLED_5Mmr0V3nVoiEdKNpdoqPypy5i5jJCSd1g@mail.gmail.com>
 <20251105115535.GN2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105115535.GN2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 05, 2025 at 12:55:35PM +0100, Mika Westerberg wrote:
> On Wed, Nov 05, 2025 at 01:51:58PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 5, 2025 at 1:50 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Wed, Nov 05, 2025 at 01:40:06PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> > > > > On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> > > > > > Replace custom macro with the recently defined INTEL_GPP().

...

> > > > > > -#define ADL_GPP(r, s, e, g)                              \
> > > > > > - {                                               \
> > > > > > -         .reg_num = (r),                         \
> > > > > > -         .base = (s),                            \
> > > > > > -         .size = ((e) - (s) + 1),                \
> > > > > > -         .gpio_base = (g),                       \
> > > > > > - }
> > > > >
> > > > > I wonder if simply doing this:
> > > > >
> > > > > #define ADL_GPP(r, s, e, g) INTEL_GPP(r, s, e, g)
> > > >
> > > > We can, but it will give a couple of lines in each driver still be left.
> > > > Do you think it's better?
> > >
> > > I think that's better because it is less changed lines but I'm fine either
> > > way.
> > 
> > Okay, I will try it and see how it looks like and then I'll either
> > send a v2 or ask for a tag for this one. Sounds good?
> 
> Yes.

After more thinking I guess I want it as is (here in v1). In cases
when we define some parameters differently it will make sense to have
an intermediate definition, but here. Can you give your Ack, please?

-- 
With Best Regards,
Andy Shevchenko



