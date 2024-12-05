Return-Path: <linux-gpio+bounces-13549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B78ED9E567A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F232834AF
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B48821323B;
	Thu,  5 Dec 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVyuTB9O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B7C13D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404855; cv=none; b=kjZeSndkqH1nHCtfMoa8yYRs7UXDvEsnOscmjLgzTLBBzo9H2l7ve6ZcbaHnMpEKxGCHwnUGUOHgFR+hFkGvV0Ve4JGaVkb14GfDJyFMKuLIjAYaNkXSBzmOKLJhFWdja+ialzDyIFuvCQsMeDxJw23PDv/AohsKAidtWzC8lD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404855; c=relaxed/simple;
	bh=4wQg33KHlBFl/ICiryUfjIUKGePzRjhb7WMsT0wPKqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkyv5toZSPeh7Vx7wMeY0A+/etB2o+p+8Wv57fA0MKuE428lMhf3Ck9gJaqVSsxkKKfHg9QEP+A/e6jPmCj23pIfo33Y2Qa3EKIT2qBjAabjSZrK9Fe9VM/81b3HomKTWpWPsh9Q7Z/tyHbzxoUlIWicuqeDiehg+uzGEPHJfJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVyuTB9O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733404854; x=1764940854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wQg33KHlBFl/ICiryUfjIUKGePzRjhb7WMsT0wPKqY=;
  b=jVyuTB9OBdF8DHEv9Vd/NtWzRog4xQ9BxPBo5TsE3Txo9T/3JyXYISPa
   wkjBeFC80+bxicDI8MOcbo1yCBOSpS01N9PGUD0p6D1UAUl7IklPqTEx7
   mPQEIHNJxDChpuH2Jq2NF4hprW6G8gKDSvH3s0gWMNj8rN7v47BBcsXp/
   /+vvK5I3oIVYtalh20LIgfAS3oxFNjEjWhWRc3l3MVJQZpVkxqz2CwIRl
   DANP2wgDer8qPJBdTCcjmjWQcu4UxmPgWE6iVQD47i0T364AgCRRf/wMf
   qhER2kWw/T6s/auimGKEL4mRvxXh7EH4HD9lyojwjxVIE13FrVzAbdgpz
   A==;
X-CSE-ConnectionGUID: 8SGIh+xDQ3ewV68Cjc2dSw==
X-CSE-MsgGUID: UeytgR5zRmm5G3y4vSpqeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37650556"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="37650556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 05:20:53 -0800
X-CSE-ConnectionGUID: FewPbKxzRNKz8EqKopnWTg==
X-CSE-MsgGUID: kR0cGUiZR3uClJtAKiFfcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="125004484"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2024 05:20:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3001242D; Thu, 05 Dec 2024 15:20:50 +0200 (EET)
Date: Thu, 5 Dec 2024 15:20:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in
 gpiochip_setup_dev()
Message-ID: <Z1GoskmQH0_FhxID@black.fi.intel.com>
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 09:21:52PM +0900, Joe Hattori wrote:
> In gpiochip_setup_dev(), the refcount incremented in device_initialize()
> is not decremented in the error path. Fix it by calling put_device().

First of all, we have gpio_put_device().
Second, what the problem do you have in practice? Can you show any backtrace?
Third, how had this change been tested?

Looking at the current code I noticed the following:
1) gpiochip_add_data_with_key() has already that call;
2) gpiochip_setup_devs() misses that call.

This effectively means that you inroduce a regression while fixing a bug.

The GPIO device initialisation is non-trivial, please pay more attention to the
code.

Bart, can this be removed or reverted before it poisons stable?

-- 
With Best Regards,
Andy Shevchenko



