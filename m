Return-Path: <linux-gpio+bounces-9801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819296BFBF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 16:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B102D1F2169F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 14:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456D61DA10D;
	Wed,  4 Sep 2024 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAUQ3IV9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20171DA311;
	Wed,  4 Sep 2024 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459119; cv=none; b=Q5uJyt/CO+yzG/SWV/nvOXPwlBpFT6LrMHID2k1l3+RQyrRmhg6CaTSap5PVt+4rEFo4NsorJ22EUZNp4NZqLm/WAeyAVeU6EaTWnKH8u/DCwYmRN1rEiaQl8oZa7W+t8EW2HieNfgPGp9NNMQBRZN3Lcz1Y19yMx/UmGQOr1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459119; c=relaxed/simple;
	bh=+3ALZ8n8RZc/Nxa6DpBxhgCos4a+VQLJwizgv7Ks8i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTiJk2rL1bpUxSJYWNNEYkxzr//8BdO0H3VejvCUxlu3LJPmjkSP5PbTPEIaAbvT9ACTmq8824N7MtdD8tuhhZhiVo0CxlpuAvGGZnf6L8sueMrUDWd2EWZd+e65jLWk5XE1jNeOSJ276FIkzFBzl4+4fnmRAZaQx+df24Dlim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAUQ3IV9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725459117; x=1756995117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+3ALZ8n8RZc/Nxa6DpBxhgCos4a+VQLJwizgv7Ks8i0=;
  b=PAUQ3IV9MIBI3PjInOWoR09rPYCbNJUJ5+m3uhtdPnbhGCFKGBAtPvJ9
   2dSxJYYtE39m8n6xt+vVoFbMdHeiPV9LtQ2Hol85lGKH3I6FTlQPAE4Jx
   W1QLtVMOsoEM0+/YSMn0kcvC1Sw7ve4K8zjL/kaWZgL7FJRZ2sN3pqZV5
   rtWbETYFKE7YylI9aGsa1JgUkautJ5VYFOc4FqdLj9WICBsWJ3FYA5H6n
   iO1NsJfDH1etJWkUkx0isTaxjiJyEv8HzxAbROobPV0u4T/jUV/YKDcXb
   ORrRWmoSZ3Mxba6MC03ADDMAQcy+SXqL3VX9NQyge58x8he+tWxomV/lJ
   Q==;
X-CSE-ConnectionGUID: wuMd+mGzQCi/+/GbtNH5Zw==
X-CSE-MsgGUID: HPXVmNGLQ0qO9ncgLFc20A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35283156"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="35283156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:11:57 -0700
X-CSE-ConnectionGUID: EJpDmL5VQwecN7eD9K6LrQ==
X-CSE-MsgGUID: A4WHzv0OQpWJcMIIqwRRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65275568"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:11:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slqjg-000000055LZ-3T9x;
	Wed, 04 Sep 2024 17:11:52 +0300
Date: Wed, 4 Sep 2024 17:11:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Martyn Welch <martyn.welch@collabora.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: mpc8xxx: switch to using
 DEFINE_RUNTIME_DEV_PM_OPS()
Message-ID: <ZthqqEtrKFp7COOw@smile.fi.intel.com>
References: <20240904140706.70359-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904140706.70359-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 04:07:06PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the preferred API for assigning system sleep pm callbacks in drivers.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(and please correct Suggested-by email when applying, thanks!)

-- 
With Best Regards,
Andy Shevchenko



