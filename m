Return-Path: <linux-gpio+bounces-28937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147EC78204
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 10:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 456972D45F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F0B34252C;
	Fri, 21 Nov 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+mo7+UC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5A7342519;
	Fri, 21 Nov 2025 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716817; cv=none; b=UzSwk0N35XseQw6nFUWP8xEHIQfSkGdWQkjZyNMy5eg0XXLiscTIxzi7HdrnkpEn6DGRKaZ+0JT2ZzERgrOs4mQSKbZjfpRXYkWZUEt4s7Kx90bwQt0yNidJxVpVib37m6I70Uy5V8uEPz35KU4Gdv8MEV9tFTzY5kfrVGFhNQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716817; c=relaxed/simple;
	bh=UIAMIZ0sD0LbqFA5wDFNCQuWZ6L0827P8gGkWTNvHMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKQ5IZaZsJGOsUneewDQE0fZbAfO6tMQtIEXAY6zW6qfXLW02nVyDLh4Ktp3bz4cpLiwOhpPoeE9ET4qpK/G3bsuhNzZYfSTjg6VT1GtpQLcMDLXxqJRenS5oDT5VOy2F3RxsmVZU2bvNjuIKugYLtaoD4xpeISUnrtzIT6geuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+mo7+UC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763716816; x=1795252816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIAMIZ0sD0LbqFA5wDFNCQuWZ6L0827P8gGkWTNvHMw=;
  b=F+mo7+UCUqoVXdDFoO7mMpQXdv613x3jC5E64neuv6rHN1CACOsHiKZ8
   5C+7WXSIGq/Zbi09udsgHE/t9L1SWEVSf51cQWGoNL8OE66IQqAKKos65
   UsNK4Z5xMidrgEUmkhRsPXTY+rmsvdfVA/K8dlHuu4sf8IXpoGwlSKaUr
   izKpzz+hdxoZb7QpXbAnLrys/nioWmLOUIecm+oxExlx36XCpKM9PX+al
   ZejASFBzhmoN7j1TN81xz86D85vD9iBcK68tD9db3l9HVG3HsbeTL8hRb
   h5PXqOh5VZEHiAMo7nfvFEyxj12RpSwXU9QRh2Kit9mot/qCqj6+BXbeE
   Q==;
X-CSE-ConnectionGUID: tEWgwM+PRIaYBKg69AE6TQ==
X-CSE-MsgGUID: dcFwOkGvRO6I0F0T5uSlKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65842354"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65842354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 01:20:15 -0800
X-CSE-ConnectionGUID: Q13u732IQoKmAyiDHRVh9w==
X-CSE-MsgGUID: Th/xPFcITrmd6Q892tAdkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="228939278"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 01:20:10 -0800
Date: Fri, 21 Nov 2025 11:20:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
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
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aSAux4n-1hzHfD6L@smile.fi.intel.com>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr>
 <aR22decsE0DYDUnS@xhacker>
 <m28qg0mnvl.fsf@free.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m28qg0mnvl.fsf@free.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 09:48:30PM +0100, Robert Jarzmik wrote:
> Jisheng Zhang <jszhang@kernel.org> writes:
> > On Tue, Nov 18, 2025 at 11:03:41PM +0100, Robert Jarzmik wrote:
> > 
> > hmm, each controller adds 16bytes, then even on 100 controller platforms
> > 1600bytes. 1600 Bytes/64MB ~= 0.238%. it's trival. And is there such
> > platform?
> Yes, actually most of them have around 64MB, at least the pxa25x and pxa27x.
> The pxa3xx might have more (thing 128MB, maybe 256MB).
> There are very old platforms, we're in 2003/2004 there ...
> 
> > From another side, recently UP support is removed from the core sched,
> > that removing adds more .text and .data overhead, so if the users really
> > care about this kind of 16bytes, it means he(she) can't afford even the
> > 16Bytes overhead, then I bet he(she) the always SMP in core sched, so
> > why not stick with the old kernel? What do you think?
> I think I would go with Andy's proposal, decouple the changes :
> - keep your changes in the PM callbaks
> - remove your change (put back the ifdef) in the data structure

It can't be done like this, unfortunately.

Either we need to waste a pointer and kmalloc() overheads at runtime, or keep
these bytes for !PM cases.

Alternatively we can drop this change and simply add a comment explaining
the memory requirements and why we don't want to always waste those bytes.

Ideally would be good to have some kind of struct_group() macro that is
dependent on IS_ENABLED() case. It may help in many cases like this then.

-- 
With Best Regards,
Andy Shevchenko



