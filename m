Return-Path: <linux-gpio+bounces-30509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB5D1B49A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 21:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77DC530D4D0D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 20:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A40231ED95;
	Tue, 13 Jan 2026 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnxK+5Fk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF703195FD;
	Tue, 13 Jan 2026 20:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337250; cv=none; b=jfbCPW6E7QZhrmu8FkBFWPPcDdPeCMYti1LfN8U+r3X8aT+Bs7q9JXh3KvO/iUlAf3jYsiWu8SdppLvq8EliocgI/fp59AR6kpS6flRYt6z9tJtuggA37k0STnKtPziSZj2WErAtpM5bPpuAU2ZX2d240CRuthNpeDOLpYWzxCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337250; c=relaxed/simple;
	bh=nWsgwDIF1LNB1TTd8lyQWBChdSt8GHq91aMoi3vo2Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNWYaU44YJGwUN/WLl1lyHh1wvrjAIKqtplmQ2d4BLFkKxa7LGqf07GBVVk2CyiBwXyi1kZu/E6sJtAp8UtdUhDo4W/YVlhVqfiORH1InM+XKZIn7ivHVUCDyJVRWJn85ukFhYvFZLmvR2tsvQg1+jAGrVj3SS+l6ilKrhLYijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnxK+5Fk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768337249; x=1799873249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nWsgwDIF1LNB1TTd8lyQWBChdSt8GHq91aMoi3vo2Zw=;
  b=cnxK+5FkfH6SBF126PCYKRhAaWb+ZS3vUhQnJ71h8p8BHeMqGqE4c1tb
   MFO708KAl3D7HkTEM7cwRAjxFUxsOSHWa8/ClQqx33g64T3TvNz+21iO8
   m+jzOkfBn3i9NRwmbO5DeUgQL6dlCiiP64rb/41wBTWKBxs4CwbuiUh2J
   EfyDdBVwxlRaa7eKWuaGpmOpT5TVEXe1L2oNZCV+3nQQfF8rG4igu0gir
   z8+PI9GJM+ca/eYtQEN31QF6/nAVp3VTzvHnnh1+Q39B26NYrBDki8Oj+
   4eZZ0PKfw0dtPFHJBbO3ZBfmqBFnKn6He/PjR3DkcYfMMDieMeiiBArGF
   Q==;
X-CSE-ConnectionGUID: 41AT/C9SSFGB+P83hO4WCA==
X-CSE-MsgGUID: 4wjF5ERBSXq7YT+RpgM9uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80280006"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80280006"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:47:28 -0800
X-CSE-ConnectionGUID: HJHvKOGyS6O0MSU2AF2Tnw==
X-CSE-MsgGUID: o82OLJifSK2b2DPZFUjcww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204554263"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:47:27 -0800
Date: Tue, 13 Jan 2026 22:47:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Convert to use
 intel_gpio_add_pin_ranges()
Message-ID: <aWavXOqlIZpXhfHt@smile.fi.intel.com>
References: <20260113100726.136695-1-andriy.shevchenko@linux.intel.com>
 <20260113115558.GY2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113115558.GY2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 12:55:58PM +0100, Mika Westerberg wrote:
> On Tue, Jan 13, 2026 at 11:07:26AM +0100, Andy Shevchenko wrote:
> > Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
> > custom approach. Convert it now.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



