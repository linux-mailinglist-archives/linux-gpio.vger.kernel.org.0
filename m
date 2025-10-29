Return-Path: <linux-gpio+bounces-27785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E48ADC193F1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 09:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B1055A059C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 08:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80321917F1;
	Wed, 29 Oct 2025 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Okkb/e3b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AF314A99;
	Wed, 29 Oct 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727108; cv=none; b=LZ5sTxvzFTnXsVAbA4LOq3AxbM2beKKcI8fdCYQSM5+ra3VG8HGBCgmiORGyKqm+I6vrBRlzj5HNCnGtKHvmqnhpMV53IRbD8ZN5OWITnLYhPCahQM8zZBu5Gr0Us9DL7r4WgN6/0SsB4uMrewn/b86FTer1hqbdz7wFG949sw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727108; c=relaxed/simple;
	bh=wvwdEm0u218gExvhBfmC/icD4ENxVkkXmVu1YZwarMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEMNpvceNV36BAk8p+lDRWz6UmJt1YpsV/m7YRl9Q3AJMHniP3UYyLMR66Jr5LDpOaU8wJCI0LSYG6sT6R7TBS70I5WikyQG533wxTEqWUOwVljVIOFxkaP7+txklAhTcdxiGNpeY2nqrG9Ny0b6L1pEWH+8ru1Tr3GgXdY0yE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Okkb/e3b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761727107; x=1793263107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wvwdEm0u218gExvhBfmC/icD4ENxVkkXmVu1YZwarMw=;
  b=Okkb/e3bmAPz37LJy4wyVwUx7rvDGQqUl6VisMtgmPmpsc+s+iUkOExN
   aukN1lpXGVnsc0MmRNrDweiVDK45rFH/1YmmUYHDdESx0NYmV7J0lCssB
   X6uY/0rtQ5DPJaIPFk6HXpnYvJTvyfhT0OvZtvYjrtRe2ZiHAR1UV/H+F
   iawhN449mtIRbeQZTuOvUORbFdl3raSE77VztF2TJ5/VdG9+YMVVrehwQ
   vY1JptLO700L7LSlYO5at2YGsFDOtLaHRz/JPOXqY6d6iSa8ZsT6tXYaZ
   M1/o15RWJ30t0cZEeCUV4dmyg5JtOemfnoWSLHhlv6K6YdzsgQfLtXq6w
   Q==;
X-CSE-ConnectionGUID: EmSGUsAYSF6SPjkGUtpXoQ==
X-CSE-MsgGUID: e6aL4Mm+RZ+qCaDJ4Rz5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81261038"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="81261038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:38:25 -0700
X-CSE-ConnectionGUID: RT93aQfqRQGKgfZrGGrcvw==
X-CSE-MsgGUID: AoxrVOHRQE6dF9C805fbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185228224"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:38:23 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vE1hE-00000003YYL-14pK;
	Wed, 29 Oct 2025 10:38:20 +0200
Date: Wed, 29 Oct 2025 10:38:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
Message-ID: <aQHSfEV_VvhBcvEt@smile.fi.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-3-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029062050.4160517-3-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 11:50:50AM +0530, Raag Jadav wrote:
> Since PCI device should not be abusing platform device, MFD parent to
> platform child path is no longer being pursued for this driver. Convert
> it to auxiliary driver, which will be used by EHL PSE auxiliary device.

This looks fine,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I believe the idea is to push this via PDx86 tree.

-- 
With Best Regards,
Andy Shevchenko



