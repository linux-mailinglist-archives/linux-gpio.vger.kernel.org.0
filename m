Return-Path: <linux-gpio+bounces-14915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7DA154AC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 17:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0BD3A8D16
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40819DF81;
	Fri, 17 Jan 2025 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpHGS9Nv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F99166F29;
	Fri, 17 Jan 2025 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132484; cv=none; b=iydHWk+B4lg2PqXJNjJZoT+Kr9vOVM531W47eTiTN9dydUuZulFNq1FvZ4VaXh8UzuerxcWt4MpgqzvDmsvCl29A+9An3wSgaAhUqpyKf7NlGRKI1R6pF3WBQaqzB+p+XewY4hDwP4lawGHcv8+YbMt1uCx73kVkE1YaHvkfxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132484; c=relaxed/simple;
	bh=6/7wOBOlKIx7Aw6q1Wdi9reBcqduNru80rB6lPsZ5qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XicYCE6h7Oye5pz1/fVe2Bb+KbWnRfOWghCu+4crAR2/SQdqLSUWuEIZ3SIVndUFwJxlA1EDwMpijxNeWu6zryZfINCDHLSVVcHBNAdJo0bFer+CCuwRUQ8E6j5UvdEff7Izi+rFNEU+nV/G0FiYNH+eXnAaiDqLmcJsmdLNVWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpHGS9Nv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737132482; x=1768668482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6/7wOBOlKIx7Aw6q1Wdi9reBcqduNru80rB6lPsZ5qI=;
  b=GpHGS9Nv68KmkaHBCWjVX4ISCj50zf3KuYVeQxcTBOvlpsnYT09oIOwl
   y0XmnyPmu9hU+RdmD0MdN7K/iTZNM1OyrgTy65bE8LKY7hyBVkxdQb33P
   Cjba2Iw/xSzBPFdcF8KfXfO96oaEa4j2nUfsRZbovF7Brjda2kOu4J3wy
   kS7XkgeB3eoU0j8RzlwAZu7mkj67g0ihq17ccjyXXbyzvFfx31RBfc47N
   RvoW98RO4jnkFe4Nz4IqpV+XnRi5cjNHwhTNrldrlsdbjOQRhI6H3AMNn
   4vYpLP5iuKEVr1ESZK4lMyhj23vIvpvNNUO+3hq1TQHxqDQnRSkT0Jr+X
   g==;
X-CSE-ConnectionGUID: yupcsFc4Qd69qURpY76NZQ==
X-CSE-MsgGUID: 0xnC9ECfT5KCRNKzNh+PXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48232420"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48232420"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:48:02 -0800
X-CSE-ConnectionGUID: /cfuOKI6QHeooPJLcuyF5w==
X-CSE-MsgGUID: jnLzHVH1TWiSex0YJaiIcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="110843128"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:48:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYpVl-0000000294C-3rwP;
	Fri, 17 Jan 2025 18:47:57 +0200
Date: Fri, 17 Jan 2025 18:47:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 05/16] pinctrl: cy8c95x0: Remove incorrectly set
 fields in regmap configuration
Message-ID: <Z4qJvRjR50FweaoV@smile.fi.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
 <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
 <CALNFmy2qGCt8OTb3qx+0PsPivbfY89gWe74Moeeu7r7hCp_UaA@mail.gmail.com>
 <Z4pzoNInabOHWjK5@smile.fi.intel.com>
 <Z4pz-gmfermTjZ77@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pz-gmfermTjZ77@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 05:15:06PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 05:13:36PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 17, 2025 at 04:01:43PM +0100, Patrick Rudolph wrote:
> > > Hi Andy,
> > > On Fri, Jan 17, 2025 at 3:23 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > We don't provide defaults for the regmap, we shouldn't provide
> > > > the number of them either.
> > > The intention is to read back the defaults from HW to initialize the
> > > regmap cache.
> > > The defaults are applied at each POR from the device's internal EEPROM.
> > > See regcache_hw_init() for details.
> > 
> > Yes, I was looking a lot and that code and it doesn't work as intended.
> > I can reproduce the issue, but it's real issue and I don't think we need
> > to read back anything from the HW forcibly. It will be done naturally, no?
> 
> I think I now remember, it has a NULL pointer dereference.

Hmm... I have just tested and no issues found so far. I'm now puzzled what was
that when I tested this the first time a few months ago...

Okay, let's say I will drop this patch in v2. Can you look at the rest of
the series?

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko



