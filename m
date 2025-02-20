Return-Path: <linux-gpio+bounces-16334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1761A3E0A4
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C78E166602
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4351FECD0;
	Thu, 20 Feb 2025 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC4Cz5et"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40391361;
	Thu, 20 Feb 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068644; cv=none; b=BxPeCr9GiKlyL+MWKnJMVhfNyl1hbFL2Z99qRIOBaU+HC88zzSuPo6xyQPVCPUiV/GL1eUkhJcWedw7e8C3C1W7r6gYPaZVxaCdwxxPtYj8MulcA5rIY/Y3xAdgxXiy8Y5c5zvL5JX05R8yn1Xy1aOcL5jtjc2ubYys+5TaeWRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068644; c=relaxed/simple;
	bh=uOFqaQTmDrXCIj1iofrLWIHxInLGegkKu/z/F5jTj5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGvhxSNywfdfjSEdOcgZp3dwxSd6v/lNiN9t5NRiohSkc65be/kV+Ko/0rmg5LsmoIThyaZ/8LpBvsnJKqThQoDVzVrRYObvMlWtDiCLqxQh8bDK+xmghUncPXliIXEBCoT+KwbhsXu08vn6A6PXu2CVqDxy05R1www+eyFnYBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC4Cz5et; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740068643; x=1771604643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uOFqaQTmDrXCIj1iofrLWIHxInLGegkKu/z/F5jTj5o=;
  b=OC4Cz5etMFzeiGMRSJTi/kPR80DbU6rkARQ8oDRz8xvhNx6BdUrwXHNq
   WmsujXKM6R0Y2MvOcwPQV4vu3/2ybZsfeGPIKVAvYCqfN/PPWDjmEP274
   nQxfzyGHPf7miaJ+3Fn+uYBsBXNDjwxD0iQ5mSTF9LCih3QV6exglHngx
   /69XNVTjnMYvLmGzen0ethLLo8jaT9jbJRLzq9mgpbkCTThc3vkgUwoLa
   XL+IbNoZIpEg7CEyJNt2+702o1B4XLmnB3azXA6zcVvHGm64Eoti0bHpo
   WVOki/7ePL2ietUO86d0CuKSuS47JSLxQGy5HYdXxL4bCgAc8NiAnOk2c
   A==;
X-CSE-ConnectionGUID: k/l3DvvKTSepveD8W/qywQ==
X-CSE-MsgGUID: nvvR14LFR9mRE32SE+fzgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58263732"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="58263732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:24:03 -0800
X-CSE-ConnectionGUID: NF1qba7rR4WTRHMifzp/Ww==
X-CSE-MsgGUID: sWE7DlE+Rweyiins6F18fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120307196"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:24:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl9LA-0000000DO9w-1Unr;
	Thu, 20 Feb 2025 18:23:56 +0200
Date: Thu, 20 Feb 2025 18:23:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1 0/4] gpiolib: finish conversion to devm_*_action*()
 APIs
Message-ID: <Z7dXHNI6GcANkPNL@smile.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 03:44:56PM +0200, Andy Shevchenko wrote:
> GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> calls. This mini-series is for that. The necessary prerequisites are here
> as well, namely:
> 1) moving the respective APIs to the devres.h;
> 2) adding a couple of simple helpers that GPIOLIB will rely on;
> 3) finishing the GPIOLIB conversion to the device managed action APIs.
> 
> The series is based on another series that's available via immutable tag
> devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
> tree (or Intel GPIO for the starter) with an immutable tag for the device
> core and others if needed. Please, review and acknowledge.

Please, don't waste time on this, I have just sent a v2 which is simpler:
https://lore.kernel.org/r/20250220162238.2738038-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko



