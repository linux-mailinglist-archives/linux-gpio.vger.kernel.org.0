Return-Path: <linux-gpio+bounces-9067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51C95D115
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D511289C6A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCC7189905;
	Fri, 23 Aug 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IktRNcdd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB50188A04;
	Fri, 23 Aug 2024 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425659; cv=none; b=u0Oeo4UK+GLK4/ol8PCfWM+dn4AeFkLl5y2SuY0RfOfEuqkWY06Z2wneGsDRKi+Mmh+1adwZRVNfSbNpqb/Gs6QVVB3qxpM5MpdigGA7D2Kn2EIOIIPUdMgI85lec/OIdjZOTSj5l0JbLKTUdu2VEaPE4NMjt0tRIeFW7wMwu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425659; c=relaxed/simple;
	bh=KrxfLjfJjlShOD1C+qxu/A9SxRnr7g1mJqORfWxA6to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0W01dMe7KvVopWDqtgLWz4k79Ao+3CN/exQLBiX+JzqcRPkOcc1EhJu8r2DuHjI53Ecl7w00GdS5oWHF573cgf0qu2be7Q06znwS69fMOG83YfPCRtfaRg4ktNDuhy1s2n/6LxHTNqE5qCXPPmGuBFn5GhV0FvFEV8WHI4flp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IktRNcdd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724425657; x=1755961657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrxfLjfJjlShOD1C+qxu/A9SxRnr7g1mJqORfWxA6to=;
  b=IktRNcddCFOKe97ZnJohs4lc6yGSEOwSSl5960CPab5Z6XkbmE3R5JBF
   YSIF8v2q7QtlOyhVAjvlHUlQgm6WPkOaTkK5e/lblnWouE19eS6YTSnEG
   S/a9a4jUwA0eXoKpR54H8sdmAQFb+jCV/WNU1Vv6gf0Ml3Gm8u2wg+2V5
   BQUB+FcZJGcJsXlxgStIDPfKhN2AqLQIFl8JImuGhirT9TdbEFZP6b74j
   g74T1hJtukMT+U1j457GOfCpUKt9hB0UjA3N6dShEJkLox9EB81cWJSb1
   HM6+//avzvDpVZneg96tT1rc7BMKDCsnnvfOd9H+8jz3ahqz1vZ8oZpk7
   g==;
X-CSE-ConnectionGUID: LrcZxagmRF20Tc4xuH4F+w==
X-CSE-MsgGUID: rgkvTkYbSPiFYOlfrA+zsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25791025"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="25791025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:07:37 -0700
X-CSE-ConnectionGUID: MuScuZy7R22SZNk+9lg/Lw==
X-CSE-MsgGUID: D5EKYwsdRl+laFMjUpiTsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62122231"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:07:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVsw-00000000pXi-1rLR;
	Fri, 23 Aug 2024 18:07:30 +0300
Date: Fri, 23 Aug 2024 18:07:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: Update the GPIO driver
Message-ID: <ZsilskITKomY1gpG@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <1195a341c0206b08318ca90af0b9cb00@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1195a341c0206b08318ca90af0b9cb00@manjaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 09:06:50AM +0200, Dragan Simic wrote:
> Hello Ye,
> 
> On 2024-08-23 05:43, Ye Zhang wrote:
> > GPIO driver support acpi and new version, set input direction in
> > irq_request_resources, fix division error and debounce config error.
> > 
> > Changes since v1:
> > - Split commits with multiple changes into separate commits.
> > - Adjust backportable fix to the forefront.
> > - Modify messages of some commits.
> 
> It seems that you sent a bunch of separate patches, instead of sending
> a patch series.  I believe that wasn't intended or requested, so could
> you, please, resend the v2 patches as a series?

No resend, please!

Rather, address the comments you have got so far and send properly a v3.

-- 
With Best Regards,
Andy Shevchenko



