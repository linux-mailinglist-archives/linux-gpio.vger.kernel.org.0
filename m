Return-Path: <linux-gpio+bounces-28833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E4C708AB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6D7A6355A30
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7319C366DAD;
	Wed, 19 Nov 2025 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnE9rW8C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0630F539;
	Wed, 19 Nov 2025 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574460; cv=none; b=im7ZZWBk0IPUY2XZLxILd27jSbubh+tYojdQUl1Ns0+NC+pY8BuxkPjJ2a+itVpmdY4cpwdYjnj9O3oVan+pRGoLxH5bYjr/lPlrxH5yQi6BR5tn9bQXL5WYRgN0bYfYKRnd2ny0kmVi623y3gUO5yeO81kjbtOyIDZ6T1YmGaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574460; c=relaxed/simple;
	bh=n5G815o72bSdZKf6R9A00oNCrgUtX6rVv0ZArJPpfoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSajgQVQXCB5kVo5OVG8fZfdDztpjgjwhoXOhNSvKK5UgE1Ajf0njVeQMZZFC8isxblztamj7V9+iJ9cKCxmHDYV+YsiI3LsXf2GzPtq4q5A8pQmINy00wls1lBajV6OLurXVLF6XCKY6qyVdxYHhE3j1BU6IFaAeT0AlQ13Tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnE9rW8C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574459; x=1795110459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5G815o72bSdZKf6R9A00oNCrgUtX6rVv0ZArJPpfoU=;
  b=AnE9rW8CEdhGLH1H3O0bqQjofPgpWinLByx0qXK2ptXJSctjHyDQL4pR
   HIBDf4Ff9aTK9YFxnM2CdbU5A7NioV9tNCCfQ6ZpKGVrJhnpC+3FTSmu2
   UTjBqLleQ5FGlZ0iscgo/Q2D+spdUk6c9WtwqMG7GOWs8rMowl2nxemti
   YqwL2KzqFHbVWvG/bKDoofApcgU5ooAS5SkYk8SkWiDYjZvwU89QAXKf0
   ozC8tUhVwnMxnEz8LimhNR4TZsEbzgTsVgvBSkpqV3m+Tggjf3QqLC7zf
   bXkvw7V0y/C2UhyMpunDwsBTjOoCYekc3867ymqQpbHiwNuE+RlgLp/x3
   w==;
X-CSE-ConnectionGUID: lzqHa2t2TJ2RNW+/LyVLRg==
X-CSE-MsgGUID: oM/2gSHXRkOi93WlyEsNow==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83016957"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="83016957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:47:36 -0800
X-CSE-ConnectionGUID: NkbzTLrqQISEUsW1Zqvg4w==
X-CSE-MsgGUID: D1fHhFKoR6KIL6wtLaWF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="196264383"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:47:31 -0800
Date: Wed, 19 Nov 2025 19:47:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
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
Subject: Re: [PATCH v4 00/15] gpio: Use modern PM macros
Message-ID: <aR4CsO5JGs_vTtBd@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 12:33:12AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
> 
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested only.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
except patches 2, 5, and 11.

-- 
With Best Regards,
Andy Shevchenko



