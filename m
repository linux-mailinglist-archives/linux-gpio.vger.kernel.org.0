Return-Path: <linux-gpio+bounces-28109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121FC35895
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 656BE4F3073
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7BF3126A9;
	Wed,  5 Nov 2025 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCpE1+Bx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002D305056;
	Wed,  5 Nov 2025 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762343739; cv=none; b=pVjkAW377OwG07kR5xdcgjqJy6Rqb3ZRIUGpeuLqEFyi7JBUgvFkHrLGSDFhNHme8JSNaRwD8vv1ZyJMHXypSerH5EJzBHJAlp4AZtroe9w0HXDXVim2zmsAAmRMrf4xeRdlvRtq8d6dwGK63Tj6fb8X6gPxknDiyLxXDDmwsEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762343739; c=relaxed/simple;
	bh=xleMpf9eLjAIINZmqYv0qCRdyeKHgj00vprlXbZ8yXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iymhoqybl0GoxKHHSQUd4HcK75cUFpcV6PxCGMURM2ey5utWA5qDU5jippM5707pR9/nkVWwJvKVfmlAX9Wju3vKDz7ubYUDOdQqGizht2E3N3TjUOT1LcJjRIMWIalrZFgqyF6IdFTOn8hqF57A4oHCLwkjvOZrf5lTgRiMA5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCpE1+Bx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762343738; x=1793879738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xleMpf9eLjAIINZmqYv0qCRdyeKHgj00vprlXbZ8yXk=;
  b=QCpE1+BxDnP7el3X5fHLcY/AeXc4tXY3LVKCRhdUzT3o0lPUOUa21Dmv
   FeTdE23oZb1DoXWXzGCN6E3i7AwkF6Mfe7iBPgRR1kcQhrs20vti5A1b+
   JJn8JHujK4soM/glAqnm4r1gkQqkfvhLLmEjK8ixBMKkntbhWN9EkAey1
   b74JcFAJT49iO9ELFI2Xfodh/LTozaxbAH424ZqkJPEqmNfKan6ddUi5a
   JklidMmksmn36Vw/+m2ZiVcAn6OkDdn6sNnsxSxZujDi8ofXSvALnzN7O
   C42bzu674YSQYmAaX6tjdmii8TMaZxb5tImJgOFcxzX5eRC2NCF9XeEyT
   A==;
X-CSE-ConnectionGUID: JF3h8zykRxOkQ7rgHK4d+w==
X-CSE-MsgGUID: MbUc6YiRQHWrVucvbUC3jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64371513"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64371513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 03:55:37 -0800
X-CSE-ConnectionGUID: 0SvE+Wc2TtK0+ia7GDkdxg==
X-CSE-MsgGUID: j2ElpzjyQyK+vtQHtSkFdg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2025 03:55:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0B2F696; Wed, 05 Nov 2025 12:55:35 +0100 (CET)
Date: Wed, 5 Nov 2025 12:55:35 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <20251105115535.GN2912318@black.igk.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com>
 <aQs3ls1rKgMOufOn@smile.fi.intel.com>
 <20251105115041.GM2912318@black.igk.intel.com>
 <CAHp75VcLNs0EWLED_5Mmr0V3nVoiEdKNpdoqPypy5i5jJCSd1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcLNs0EWLED_5Mmr0V3nVoiEdKNpdoqPypy5i5jJCSd1g@mail.gmail.com>

On Wed, Nov 05, 2025 at 01:51:58PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 5, 2025 at 1:50 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Wed, Nov 05, 2025 at 01:40:06PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> > > > On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> > > > > Replace custom macro with the recently defined INTEL_GPP().
> 
> ...
> 
> > > > > -#define ADL_GPP(r, s, e, g)                              \
> > > > > - {                                               \
> > > > > -         .reg_num = (r),                         \
> > > > > -         .base = (s),                            \
> > > > > -         .size = ((e) - (s) + 1),                \
> > > > > -         .gpio_base = (g),                       \
> > > > > - }
> > > >
> > > > I wonder if simply doing this:
> > > >
> > > > #define ADL_GPP(r, s, e, g) INTEL_GPP(r, s, e, g)
> > >
> > > We can, but it will give a couple of lines in each driver still be left.
> > > Do you think it's better?
> >
> > I think that's better because it is less changed lines but I'm fine either
> > way.
> 
> Okay, I will try it and see how it looks like and then I'll either
> send a v2 or ask for a tag for this one. Sounds good?

Yes.

